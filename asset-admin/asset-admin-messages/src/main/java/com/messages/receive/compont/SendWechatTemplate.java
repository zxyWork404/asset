package com.messages.receive.compont;

import com.admin.utils.JedisUtils;
import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

/**
 * 小程序发送模版
 */
@Slf4j
@Component
public class SendWechatTemplate {

    @Value("${spring.template.url}")
    private String templateUrl;
    @Value("${spring.template.id}")
    public String tpl_id;
    @Value("${spring.template.appid}")
    private  String templateAppid;
    @Value("${spring.template.appsecret}")
    private  String templateAppSecRet;
    /**
     * 发送模版消息
     * @param obj
     * @return
     */
    public  String push(String appid,Object obj) {
        RestTemplate restTemplate = new RestTemplate();
        //这里简单起见我们每次都获取最新的access_token（时间开发中，应该在access_token快过期时再重新获取）
        String token = JedisUtils.get(appid);
        //String token = this.getAccessToken();
        String url = templateUrl + token;
        log.info("发送模版消息请求地址==========="+url);
        ResponseEntity<String> responseEntity = restTemplate.postForEntity(url, obj, String.class);
        log.info("发送模版消息请求返回报文信息==========="+responseEntity.getBody());
        return responseEntity.getBody();
    }

    /**
     * 获取token
     * @return
     */
    public  String getAccessToken() {
        RestTemplate restTemplate = new RestTemplate();
        Map<String, String> params = new HashMap<>();
        /*params.put("APPID", "wx7c54942dfc87f4d8");  //
        params.put("APPSECRET", "5873a729c365b65ab42bb5fc82d2ed49");  //*/
        params.put("APPID", templateAppid);  //
        params.put("APPSECRET", templateAppSecRet);
        log.info("定时任务发送TOKEN请求报文==========="+params);
        ResponseEntity<String> responseEntity = restTemplate.getForEntity(
                "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={APPID}&secret={APPSECRET}", String.class, params);
        String body = responseEntity.getBody();
        com.alibaba.fastjson.JSONObject object = JSON.parseObject(body);
        log.info("定时任务发送TOKEN返回报文==========="+object);
        String Access_Token = object.getString("access_token");
        String expires_in = object.getString("expires_in");
        JedisUtils.set(templateAppid,Access_Token,0);
        //log.info("有效时长expires_in：" + expires_in);
        return Access_Token;
    }
}
