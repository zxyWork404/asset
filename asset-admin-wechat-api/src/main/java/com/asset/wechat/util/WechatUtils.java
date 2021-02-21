package com.asset.wechat.util;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.spec.AlgorithmParameterSpec;
import java.util.Map;

import javax.annotation.Resource;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import com.asset.wechat.config.WechatConfig;
import com.asset.wechat.login.entiy.WxAuthPhone;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSONObject;
import org.springframework.web.client.RestTemplate;

/**
 * 小程序工具类
 * @author personal
 *
 */
@Slf4j
public class WechatUtils {
	
	private static final Logger logger = LoggerFactory.getLogger(WechatUtils.class);

	@Resource
	private WechatConfig wechatConfig;

	/**
	 * 解密并且获取用户手机号码
	 * @param wxAuthPhone
	 * @return
	 */
	public static String deciphering(WxAuthPhone wxAuthPhone) throws Exception {
		return decryptPhone(wxAuthPhone.getEncrypdata(),wxAuthPhone.getSessionkey(),wxAuthPhone.getIvdata());
	}


	public static String decryptPhone( String encryptedData, String sessionKey, String ivStr) throws Exception {
		Base64 base64 = new Base64();
		byte[] encData = base64.decode(encryptedData);
		byte[] iv = base64.decode(ivStr);
		byte[] key = base64.decode(sessionKey);
		AlgorithmParameterSpec ivSpec = new IvParameterSpec(iv);
		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		SecretKeySpec keySpec = new SecretKeySpec(key, "AES");
		cipher.init(Cipher.DECRYPT_MODE, keySpec, ivSpec);
		String mapStr = new String(cipher.doFinal(encData),"UTF-8");
		JSONObject json = JSONObject.parseObject(mapStr);
		return json.getString("phoneNumber");
	}

	public static String getCode2Session(String jscode2sessionUrl, String appid, String appsecret, String code) {
		String url = jscode2sessionUrl.replace("APPID",appid).replace("SECRET",appsecret).replace("JSCODE",code);
		RestTemplate restTemplate = new RestTemplate();
		log.info("请求地址："+url);
		String result = getWeiXin(url);
		log.info("请求返回数据："+result);
		return result;
	}

	/**
	 * 与微信交互，get请求
	 **/
	public static String getWeiXin(String urlNameString) {
		String result = "";
		BufferedReader in = null;
		try {
			// 打开和URL之间的连接
			URL console = new URL(urlNameString);
			HttpURLConnection connection = (HttpURLConnection) console.openConnection();
			connection.setRequestMethod("GET");
			connection.setDoInput(true);
			connection.setDoOutput(true);
			connection.setUseCaches(false);
			connection.setConnectTimeout(65 * 1000);
			connection.setReadTimeout(65 * 1000);
			connection.setRequestProperty("Charset", "UTF-8");
			// 设置通用的请求属性
			connection.setRequestProperty("accept", "*/*");
			connection.setRequestProperty("connection", "Keep-Alive");
			connection.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
			// 建立实际的连接
			connection.connect();
			// 获取所有响应头字段
			// 定义 BufferedReader输入流来读取URL的响应
			in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
			String line;
			while ((line = in.readLine()) != null) {
				result += line;
			}
		} catch (Exception e) {
			return result;
		}
		// 使用finally块来关闭输入流
		finally {
			try {
				if (in != null) {
					in.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}


	/**
	 * 与微信交互，post请求
	 * @param url
	 * @param filePath
	 * @param fileName
	 * @return
	 * @throws Exception
	 */
	public static String uploadFodderAndImg(String url, String filePath, String fileName) throws Exception {
		File file = new File(filePath);
		if ((!file.exists()) || (!file.isFile()))
			throw new IOException("文件不存在");
		URL console = new URL(url);
		HttpURLConnection conn = (HttpURLConnection) console.openConnection();
		conn.setRequestMethod("POST");
		conn.setDoInput(true);
		conn.setDoOutput(true);
		conn.setUseCaches(false);
		conn.setConnectTimeout(65 * 1000);
		conn.setReadTimeout(65 * 1000);
		conn.setRequestProperty("Connection", "Keep-Alive");
		conn.setRequestProperty("Charset", "UTF-8");
		String BOUNDARY = "----------" + System.currentTimeMillis();
		conn.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + BOUNDARY);
		StringBuilder sb = new StringBuilder();
		sb.append("--");
		sb.append(BOUNDARY);
		sb.append("\r\n");
		sb.append("Content-Disposition: form-data;name=\"file\";filename=\"" + fileName + "\"\r\n");
		sb.append("Content-Type:application/octet-stream\r\n\r\n");
		byte[] head = sb.toString().getBytes("utf-8");
		OutputStream out = new DataOutputStream(conn.getOutputStream());
		out.write(head);
		DataInputStream in = new DataInputStream(new FileInputStream(file));
		int bytes = 0;
		byte[] bufferOut = new byte[1024];
		while ((bytes = in.read(bufferOut)) != -1) {
			out.write(bufferOut, 0, bytes);
		}
		in.close();
		byte[] foot = ("\r\n--" + BOUNDARY + "--\r\n").getBytes("utf-8");
		out.write(foot);
		out.flush();
		out.close();
		StringBuffer buffer = new StringBuffer();
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = null;
			while ((line = reader.readLine()) != null) {
				buffer.append(line);
			}
			return buffer.toString();
		} catch (IOException e) {
			logger.error("上传素材POST请求出现异常,返回null", e);
		} finally {
			IOUtils.closeQuietly(reader);
			if (conn != null)
				conn.disconnect();
		}
		return null;
	}
}
