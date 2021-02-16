package com.admin.utils;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.collect.Sets;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import java.util.List;
import java.util.Map;
import java.util.Set;

public class JedisUtils {

	private static Logger logger = LoggerFactory.getLogger(JedisUtils.class);

	private static JedisPool jedisPool = null;

	static {
		try {
			JedisPoolConfig config = new JedisPoolConfig();
			// 连接耗尽时是否阻塞, false报异常,ture阻塞直到超时, 默认true
			config.setBlockWhenExhausted(true);
			// 设置的逐出策略类名, 默认DefaultEvictionPolicy(当连接超过最大空闲时间,或连接数超过最大空闲连接数)
			config.setEvictionPolicyClassName("org.apache.commons.pool2.impl.DefaultEvictionPolicy");
			// 是否启用pool的jmx管理功能, 默认true
			config.setJmxEnabled(true);
			config.setJmxNamePrefix("pool");
			// 是否启用后进先出, 默认true
			config.setLifo(true);
			// 最大空闲连接数, 默认8个
			config.setMaxIdle(100);
			// 最大连接数, 默认8个
			config.setMaxTotal(5000);
			// 获取连接时的最大等待毫秒数(如果设置为阻塞时BlockWhenExhausted),如果超时就抛异常, 小于零:阻塞不确定的时间,
			// 默认-1
			config.setMaxWaitMillis(-1);
			// 逐出连接的最小空闲时间 默认1800000毫秒(30分钟)
			config.setMinEvictableIdleTimeMillis(1800000);
			// 最小空闲连接数, 默认0
			config.setMinIdle(0);
			// 每次逐出检查时 逐出的最大数目 如果为负数就是 : 1/abs(n), 默认3
			config.setNumTestsPerEvictionRun(3);
			// 对象空闲多久后逐出, 当空闲时间>该值 且 空闲连接>最大空闲数
			// 时直接逐出,不再根据MinEvictableIdleTimeMillis判断 (默认逐出策略)
			config.setSoftMinEvictableIdleTimeMillis(1800000);
			// 在获取连接的时候检查有效性, 默认false
			config.setTestOnBorrow(false);
			// 在空闲时检查有效性, 默认false
			config.setTestWhileIdle(false);
			// 逐出扫描的时间间隔(毫秒) 如果为负数,则不运行逐出线程, 默认-1
			config.setTimeBetweenEvictionRunsMillis(-1);
			jedisPool = new JedisPool(config, "127.0.0.1", 6379, 3000);
		} catch (Exception e) {
			logger.error("REDIS连接池异常",e);
		}
	}

	public synchronized static Jedis getResource() {
		try {
			if (jedisPool != null) {
				Jedis resource = jedisPool.getResource();
				return resource;
			} else
				return getResource();
		} catch (Exception e) {
			logger.error("获取REDIS资源异常",e);
			return getResource();
		}
	}

	public static void returnResource(final Jedis jedis) {
		if (jedis != null) {
			jedis.close();
		}
	}

	/**
	 * 获取缓存
	 *
	 * @param key
	 *            键
	 * @return 值
	 */
	public static String get(String key) {
		String value = null;
		Jedis jedis = null;
		try {
			jedis = getResource();
			if (jedis.exists(key)) {
				value = jedis.get(key);
				value = StringUtils.isNotBlank(value) && !"nil".equalsIgnoreCase(value) ? value : null;
				logger.debug("get {} = {}", key, value);
			}
		} catch (Exception e) {
			logger.warn("get {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return value;
	}

	/**
	 * 获取缓存
	 *
	 * @param key
	 *            键
	 * @return 值
	 */
	public static Object getObject(String key) {
		Object value = null;
		Jedis jedis = null;
		try {
			jedis = getResource();
			if (jedis.exists(getBytesKey(key))) {
				value = toObject(jedis.get(getBytesKey(key)));
				logger.debug("getObject {} = {}", key, value);
			}
		} catch (Exception e) {
			logger.warn("getObject {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return value;
	}

	/**
	 * 设置缓存
	 *
	 * @param key
	 *            键
	 * @param value
	 *            值
	 * @param cacheSeconds
	 *            超时时间，0为不超时
	 * @return
	 */
	public static String set(String key, String value, int cacheSeconds) {
		String result = null;
		Jedis jedis = null;
		try {
			jedis = getResource();
			result = jedis.set(key, value);
			if (cacheSeconds != 0) {
				jedis.expire(key, cacheSeconds);
			}
			logger.debug("set {} = {}", key, value);
		} catch (Exception e) {
			logger.warn("set {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 设置缓存
	 *
	 * @param key
	 *            键
	 * @param value
	 *            值
	 * @param cacheSeconds
	 *            超时时间，0为不超时
	 * @return
	 */
	public static String setObject(String key, Object value, int cacheSeconds) {
		String result = null;
		Jedis jedis = null;
		try {
			jedis = getResource();
			result = jedis.set(getBytesKey(key), toBytes(value));
			if (cacheSeconds != 0) {
				jedis.expire(key, cacheSeconds);
			}
			logger.debug("setObject {} = {}", key, value);
		} catch (Exception e) {
			logger.warn("setObject {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 获取List缓存
	 *
	 * @param key
	 *            键
	 * @return 值
	 */
	public static List<String> getList(String key) {
		List<String> value = null;
		Jedis jedis = null;
		try {
			jedis = getResource();
			if (jedis.exists(key)) {
				value = jedis.lrange(key, 0, -1);
				logger.debug("getList {} = {}", key, value);
			}
		} catch (Exception e) {
			logger.warn("getList {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return value;
	}

	/**
	 * 获取List缓存
	 *
	 * @param key
	 *            键
	 * @return 值
	 */
	public static List<Object> getObjectList(String key) {
		List<Object> value = null;
		Jedis jedis = null;
		try {
			jedis = getResource();
			if (jedis.exists(getBytesKey(key))) {
				List<byte[]> list = jedis.lrange(getBytesKey(key), 0, -1);
				value = Lists.newArrayList();
				for (byte[] bs : list) {
					value.add(toObject(bs));
				}
				logger.debug("getObjectList {} = {}", key, value);
			}
		} catch (Exception e) {
			logger.warn("getObjectList {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return value;
	}

	/**
	 * 设置List缓存
	 *
	 * @param key
	 *            键
	 * @param value
	 *            值
	 * @param cacheSeconds
	 *            超时时间，0为不超时
	 * @return
	 */
	public static long setList(String key, List<String> value, int cacheSeconds) {
		long result = 0;
		Jedis jedis = null;
		try {
			jedis = getResource();
			if (jedis.exists(key)) {
				jedis.del(key);
			}
			result = jedis.rpush(key, (String[]) value.toArray());
			if (cacheSeconds != 0) {
				jedis.expire(key, cacheSeconds);
			}
			logger.debug("setList {} = {}", key, value);
		} catch (Exception e) {
			logger.warn("setList {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 设置List缓存
	 *
	 * @param key
	 *            键
	 * @param value
	 *            值
	 * @param cacheSeconds
	 *            超时时间，0为不超时
	 * @return
	 */
	public static long setObjectList(String key, List<Object> value, int cacheSeconds) {
		long result = 0;
		Jedis jedis = null;
		try {
			jedis = getResource();
			if (jedis.exists(getBytesKey(key))) {
				jedis.del(key);
			}
			List<byte[]> list = Lists.newArrayList();
			for (Object o : value) {
				list.add(toBytes(o));
			}
			result = jedis.rpush(getBytesKey(key), (byte[][]) list.toArray());
			if (cacheSeconds != 0) {
				jedis.expire(key, cacheSeconds);
			}
			logger.debug("setObjectList {} = {}", key, value);
		} catch (Exception e) {
			logger.warn("setObjectList {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 向List缓存中添加值
	 *
	 * @param key
	 *            键
	 * @param value
	 *            值
	 * @return
	 */
	public static long listAdd(String key, String... value) {
		long result = 0;
		Jedis jedis = null;
		try {
			jedis = getResource();
			result = jedis.rpush(key, value);
			logger.debug("listAdd {} = {}", key, value);
		} catch (Exception e) {
			logger.warn("listAdd {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 向List缓存中添加值
	 *
	 * @param key
	 *            键
	 * @param value
	 *            值
	 * @return
	 */
	public static long listObjectAdd(String key, Object... value) {
		long result = 0;
		Jedis jedis = null;
		try {
			jedis = getResource();
			List<byte[]> list = Lists.newArrayList();
			for (Object o : value) {
				list.add(toBytes(o));
			}
			result = jedis.rpush(getBytesKey(key), (byte[][]) list.toArray());
			logger.debug("listObjectAdd {} = {}", key, value);
		} catch (Exception e) {
			logger.warn("listObjectAdd {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 获取缓存
	 *
	 * @param key
	 *            键
	 * @return 值
	 */
	public static Set<String> getSet(String key) {
		Set<String> value = null;
		Jedis jedis = null;
		try {
			jedis = getResource();
			if (jedis.exists(key)) {
				value = jedis.smembers(key);
				logger.debug("getSet {} = {}", key, value);
			}
		} catch (Exception e) {
			logger.warn("getSet {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return value;
	}

	/**
	 * 获取缓存
	 *
	 * @param key
	 *            键
	 * @return 值
	 */
	public static Set<Object> getObjectSet(String key) {
		Set<Object> value = null;
		Jedis jedis = null;
		try {
			jedis = getResource();
			if (jedis.exists(getBytesKey(key))) {
				value = Sets.newHashSet();
				Set<byte[]> set = jedis.smembers(getBytesKey(key));
				for (byte[] bs : set) {
					value.add(toObject(bs));
				}
				logger.debug("getObjectSet {} = {}", key, value);
			}
		} catch (Exception e) {
			logger.warn("getObjectSet {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return value;
	}

	/**
	 * 设置Set缓存
	 *
	 * @param key
	 *            键
	 * @param value
	 *            值
	 * @param cacheSeconds
	 *            超时时间，0为不超时
	 * @return
	 */
	public static long setSet(String key, Set<String> value, int cacheSeconds) {
		long result = 0;
		Jedis jedis = null;
		try {
			jedis = getResource();
			if (jedis.exists(key)) {
				jedis.del(key);
			}
			result = jedis.sadd(key, (String[]) value.toArray());
			if (cacheSeconds != 0) {
				jedis.expire(key, cacheSeconds);
			}
			logger.debug("setSet {} = {}", key, value);
		} catch (Exception e) {
			logger.warn("setSet {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 设置Set缓存
	 *
	 * @param key
	 *            键
	 * @param value
	 *            值
	 * @param cacheSeconds
	 *            超时时间，0为不超时
	 * @return
	 */
	public static long setObjectSet(String key, Set<Object> value, int cacheSeconds) {
		long result = 0;
		Jedis jedis = null;
		try {
			jedis = getResource();
			if (jedis.exists(getBytesKey(key))) {
				jedis.del(key);
			}
			Set<byte[]> set = Sets.newHashSet();
			for (Object o : value) {
				set.add(toBytes(o));
			}
			result = jedis.sadd(getBytesKey(key), (byte[][]) set.toArray());
			if (cacheSeconds != 0) {
				jedis.expire(key, cacheSeconds);
			}
			logger.debug("setObjectSet {} = {}", key, value);
		} catch (Exception e) {
			logger.warn("setObjectSet {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 向Set缓存中添加值
	 *
	 * @param key
	 *            键
	 * @param value
	 *            值
	 * @return
	 */
	public static long setSetAdd(String key, String... value) {
		long result = 0;
		Jedis jedis = null;
		try {
			jedis = getResource();
			result = jedis.sadd(key, value);
			logger.debug("setSetAdd {} = {}", key, value);
		} catch (Exception e) {
			logger.warn("setSetAdd {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 向Set缓存中添加值
	 *
	 * @param key
	 *            键
	 * @param value
	 *            值
	 * @return
	 */
	public static long setSetObjectAdd(String key, Object... value) {
		long result = 0;
		Jedis jedis = null;
		try {
			jedis = getResource();
			Set<byte[]> set = Sets.newHashSet();
			for (Object o : value) {
				set.add(toBytes(o));
			}
			result = jedis.rpush(getBytesKey(key), (byte[][]) set.toArray());
			logger.debug("setSetObjectAdd {} = {}", key, value);
		} catch (Exception e) {
			logger.warn("setSetObjectAdd {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 获取Map缓存
	 *
	 * @param key
	 *            键
	 * @return 值
	 */
	public static Map<String, String> getMap(String key) {
		Map<String, String> value = null;
		Jedis jedis = null;
		try {
			jedis = getResource();
			if (jedis.exists(key)) {
				value = jedis.hgetAll(key);
				logger.debug("getMap {} = {}", key, value);
			}
		} catch (Exception e) {
			logger.warn("getMap {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return value;
	}

	/**
	 * 获取Map缓存
	 *
	 * @param key
	 *            键
	 * @return 值
	 */
	public static Map<String, Object> getObjectMap(String key) {
		Map<String, Object> value = null;
		Jedis jedis = null;
		try {
			jedis = getResource();
			if (jedis.exists(getBytesKey(key))) {
				value = Maps.newHashMap();
				Map<byte[], byte[]> map = jedis.hgetAll(getBytesKey(key));
				for (Map.Entry<byte[], byte[]> e : map.entrySet()) {
					value.put(StringUtils.toString(e.getKey()), toObject(e.getValue()));
				}
				logger.debug("getObjectMap {} = {}", key, value);
			}
		} catch (Exception e) {
			logger.warn("getObjectMap {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return value;
	}

	/**
	 * 设置Map缓存
	 *
	 * @param key
	 *            键
	 * @param value
	 *            值
	 * @param cacheSeconds
	 *            超时时间，0为不超时
	 * @return
	 */
	public static String setMap(String key, Map<String, String> value, int cacheSeconds) {
		String result = null;
		Jedis jedis = null;
		try {
			jedis = getResource();
			if (jedis.exists(key)) {
				jedis.del(key);
			}
			result = jedis.hmset(key, value);
			if (cacheSeconds != 0) {
				jedis.expire(key, cacheSeconds);
			}
			logger.debug("setMap {} = {}", key, value);
		} catch (Exception e) {
			logger.warn("setMap {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 设置Map缓存
	 *
	 * @param key
	 *            键
	 * @param value
	 *            值
	 * @param cacheSeconds
	 *            超时时间，0为不超时
	 * @return
	 */
	public static String setObjectMap(String key, Map<String, Object> value, int cacheSeconds) {
		String result = null;
		Jedis jedis = null;
		try {
			jedis = getResource();
			if (jedis.exists(getBytesKey(key))) {
				jedis.del(key);
			}
			Map<byte[], byte[]> map = Maps.newHashMap();
			for (Map.Entry<String, Object> e : value.entrySet()) {
				map.put(getBytesKey(e.getKey()), toBytes(e.getValue()));
			}
			result = jedis.hmset(getBytesKey(key), (Map<byte[], byte[]>) map);
			if (cacheSeconds != 0) {
				jedis.expire(key, cacheSeconds);
			}
			logger.debug("setObjectMap {} = {}", key, value);
		} catch (Exception e) {
			logger.warn("setObjectMap {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 向Map缓存中添加值
	 *
	 * @param key
	 *            键
	 * @param value
	 *            值
	 * @return
	 */
	public static String mapPut(String key, Map<String, String> value, int cacheSeconds) {
		String result = null;
		Jedis jedis = null;
		try {
			jedis = getResource();
			result = jedis.hmset(key, value);
			if (cacheSeconds != 0) {
				jedis.expire(key, cacheSeconds);
			}
			logger.debug("mapPut {} = {}", key, value);
		} catch (Exception e) {
			logger.warn("mapPut {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 向Map缓存中添加值
	 *
	 * @param key
	 *            键
	 * @param value
	 *            值
	 * @return
	 */
	public static String mapPut(String key, Map<String, String> value) {
		String result = null;
		Jedis jedis = null;
		try {
			jedis = getResource();
			result = jedis.hmset(key, value);
			logger.debug("mapPut {} = {}", key, value);
		} catch (Exception e) {
			logger.warn("mapPut {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 向Map缓存中添加值
	 *
	 * @param key
	 *            键
	 * @param value
	 *            值
	 * @return
	 */
	public static String mapObjectPut(String key, Map<String, Object> value) {
		String result = null;
		Jedis jedis = null;
		try {
			jedis = getResource();
			Map<byte[], byte[]> map = Maps.newHashMap();
			for (Map.Entry<String, Object> e : value.entrySet()) {
				map.put(getBytesKey(e.getKey()), toBytes(e.getValue()));
			}
			result = jedis.hmset(getBytesKey(key), (Map<byte[], byte[]>) map);
			logger.debug("mapObjectPut {} = {}", key, value);
		} catch (Exception e) {
			logger.warn("mapObjectPut {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 移除Map缓存中的值
	 *
	 * @param key
	 *            键
	 * @param mapKey
	 *            Map的Key
	 * @return
	 */
	public static long mapRemove(String key, String mapKey) {
		long result = 0;
		Jedis jedis = null;
		try {
			jedis = getResource();
			result = jedis.hdel(key, mapKey);
			logger.debug("mapRemove {}  {}", key, mapKey);
		} catch (Exception e) {
			logger.warn("mapRemove {}  {}", key, mapKey, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 移除Map缓存中的值
	 *
	 * @param key
	 *            键
	 * @param mapKey
	 *            Map的Key
	 * @return
	 */
	public static long mapObjectRemove(String key, String mapKey) {
		long result = 0;
		Jedis jedis = null;
		try {
			jedis = getResource();
			result = jedis.hdel(getBytesKey(key), getBytesKey(mapKey));
			logger.debug("mapObjectRemove {}  {}", key, mapKey);
		} catch (Exception e) {
			logger.warn("mapObjectRemove {}  {}", key, mapKey, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 判断Map缓存中的Key是否存在
	 *
	 * @param key
	 *            键
	 * @param mapKey
	 *            Map的Key
	 * @return
	 */
	public static boolean mapExists(String key, String mapKey) {
		boolean result = false;
		Jedis jedis = null;
		try {
			jedis = getResource();
			result = jedis.hexists(key, mapKey);
			logger.debug("mapExists {}  {}", key, mapKey);
		} catch (Exception e) {
			logger.warn("mapExists {}  {}", key, mapKey, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 判断Map缓存中的Key是否存在
	 *
	 * @param key
	 *            键
	 * @param mapKey
	 *            Map的Key
	 * @return
	 */
	public static boolean mapObjectExists(String key, String mapKey) {
		boolean result = false;
		Jedis jedis = null;
		try {
			jedis = getResource();
			result = jedis.hexists(getBytesKey(key), getBytesKey(mapKey));
			logger.debug("mapObjectExists {}  {}", key, mapKey);
		} catch (Exception e) {
			logger.warn("mapObjectExists {}  {}", key, mapKey, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 删除缓存
	 *
	 * @param key
	 *            键
	 * @return
	 */
	public static long del(String key) {
		long result = 0;
		Jedis jedis = null;
		try {
			jedis = getResource();
			if (jedis.exists(key)) {
				result = jedis.del(key);
				logger.debug("del {}", key);
			} else {
				logger.debug("del {} not exists", key);
			}
		} catch (Exception e) {
			logger.warn("del {}", key, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 删除缓存
	 *
	 * @param key
	 *            键
	 * @return
	 */
	public static long delObject(String key) {
		long result = 0;
		Jedis jedis = null;
		try {
			jedis = getResource();
			if (jedis.exists(getBytesKey(key))) {
				result = jedis.del(getBytesKey(key));
				logger.debug("delObject {}", key);
			} else {
				logger.debug("delObject {} not exists", key);
			}
		} catch (Exception e) {
			logger.warn("delObject {}", key, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 缓存是否存在
	 *
	 * @param key
	 *            键
	 * @return
	 */
	public static boolean exists(String key) {
		boolean result = false;
		Jedis jedis = null;
		try {
			jedis = getResource();
			result = jedis.exists(key);
			logger.debug("exists {}", key);
		} catch (Exception e) {
			logger.warn("exists {}", key, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 缓存是否存在
	 *
	 * @param key
	 *            键
	 * @return
	 */
	public static boolean existsObject(String key) {
		boolean result = false;
		Jedis jedis = null;
		try {
			jedis = getResource();
			result = jedis.exists(getBytesKey(key));
			logger.debug("existsObject {}", key);
		} catch (Exception e) {
			logger.warn("existsObject {}", key, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 获取object对象的字节数组Key
	 *
	 * @param object
	 * @return
	 */
	public static byte[] getBytesKey(Object object) {
		if (object instanceof String) {
			return StringUtils.getBytes((String) object);
		} else {
			return ObjectUtils.serialize(object);
		}
	}

	/**
	 * Object转换byte[]类型
	 *
	 * @param object
	 * @return
	 */
	public static byte[] toBytes(Object object) {
		return ObjectUtils.serialize(object);
	}

	/**
	 * byte[]型转换Object
	 *
	 * @param bytes
	 * @return
	 */
	public static Object toObject(byte[] bytes) {
		return ObjectUtils.unserialize(bytes);
	}

	/**
	 * 设置List缓存 从左开始设置
	 *
	 * @param key
	 *            键
	 * @param value
	 *            值
	 * @param cacheSeconds
	 *            超时时间，0为不超时
	 * @return
	 */
	public static long setLList(String key, List<String> value, int cacheSeconds) {
		long result = 0;
		Jedis jedis = null;
		try {
			jedis = getResource();
			if (jedis.exists(key)) {
				jedis.del(key);
			}
			result = jedis.lpush(key, (String[]) value.toArray(new String[value.size()]));
			if (cacheSeconds != 0) {
				jedis.expire(key, cacheSeconds);
			}
			logger.debug("setList {} = {}", key, value);
		} catch (Exception e) {
			logger.warn("setList {} = {}", key, value, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 移除并获取列表最后一个元素 add by gaopeng
	 *
	 * @param key
	 * @return
	 */
	public static String getRPop(String key) {
		String result = "";
		Jedis jedis = null;
		try {
			jedis = getResource();
			result = jedis.rpop(key);
			logger.debug("getRPop {} = {}", key, result);
		} catch (Exception e) {
			logger.warn("getRPop {} = {}", key, result, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 将一个值插入到已存在的列表头部，列表不存在时操作无效
	 *
	 * @param key
	 *            列表Key
	 * @param value
	 *            值
	 * @return
	 */
	public static long setLPushX(String key, String value) {
		long result = 0;
		Jedis jedis = null;
		try {
			jedis = getResource();
			result = jedis.lpushx(key, value);
			logger.debug("getLLen {} = {}", key, result);
		} catch (Exception e) {
			logger.warn("getLLen {} = {}", key, result, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 获取List列表长度
	 *
	 * @param key
	 * @return
	 */
	public static long getListSize(String key) {
		long result = 0;
		Jedis jedis = null;
		try {
			jedis = getResource();
			result = jedis.llen(key);
			logger.debug("getLLen {} = {}", key, result);
		} catch (Exception e) {
			logger.warn("getLLen {} = {}", key, result, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 执行LPUSH命令，将一个或多个值value插入到列表key的表头。<br>
	 * 若为多个value，则从左到右顺序一次插入到表头。<br>
	 * 若key不存在，则会创建一个新的空的列并执行lpush操作
	 *
	 * @param key
	 * @param value
	 * @return
	 */
	public static long setLpush(String key, String... value) {
		long result = 0;
		Jedis jedis = null;
		try {
			jedis = getResource();
			result = jedis.lpush(key, value);
			logger.debug("setLpush {} = {}", key, result);
		} catch (Exception e) {
			logger.warn("setLpush {} = {}", key, result, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 执行RPUSH命令，将一个或多个值value插入到列表key的表尾。<br>
	 * 若为多个value，则从左到右顺序一次插入到表尾。<br>
	 * 若key不存在，则会创建一个新的空的列并执行rpush操作
	 *
	 * @param key
	 * @param value
	 * @return
	 */
	public static long setRpush(String key, String... value) {
		long result = 0;
		Jedis jedis = null;
		try {
			jedis = getResource();
			result = jedis.rpush(key, value);
			logger.debug("setRpush {} = {}", key, result);
		} catch (Exception e) {
			logger.warn("setRpush {} = {}", key, result, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 移出并返回key的头元素
	 *
	 * @param key
	 * @return
	 */
	public static String lpop(String key) {
		String result = null;
		Jedis jedis = null;
		try {
			jedis = getResource();
			result = jedis.lpop(key);
			logger.debug("lpop {} = {}", key, result);
		} catch (Exception e) {
			logger.warn("lpop {} = {}", key, result, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 将多个或一个值插入到列表Key的表头
	 *
	 * @param key
	 * @param value
	 * @return
	 */
	public static long lpush(String key, String value) {
		long result = 0L;
		Jedis jedis = null;
		try {
			jedis = getResource();
			result = jedis.lpush(key, value);
			logger.debug("lpush {} = {}", key, result);
		} catch (Exception e) {
			logger.warn("lpush {} = {}", key, result, e);
		} finally {
			returnResource(jedis);
		}
		return result;
	}

	/**
	 * 根据MapKey获取值
	 *
	 * @param key
	 * @param mapKey
	 * @return
	 */
	public static String getMapKeyValue(String key, String mapKey) {
		String value = null;
		Jedis jedis = null;
		try {
			jedis = getResource();
			if (jedis.exists(key)) {
				value = jedis.hget(key, mapKey);
				logger.debug("getMapKeyValue {},{} = {}", key, mapKey, value);
			}
		} catch (Exception e) {
			logger.warn("getMapKeyValue {},{} = {}", key, mapKey, value, e);
		} finally {
			returnResource(jedis);
		}
		return value;
	}
}
