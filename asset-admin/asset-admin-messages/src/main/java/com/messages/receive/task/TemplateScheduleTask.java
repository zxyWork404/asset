package com.messages.receive.task;

import com.admin.utils.JedisUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.client.RestTemplate;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

//import JedisUtils;
//import utils.KafkaSenderUtil;

@Configuration      //1.主要用于标记配置类，兼备Component的效果。
@EnableScheduling   // 2.开启定时任务
@Slf4j
public class TemplateScheduleTask {

    @Value("${spring.template.appid}")
    private  String templateAppid;
    @Value("${spring.template.appsecret}")
    private  String templateAppSecRet;

    //3.添加定时任务
    @Scheduled(cron = "0 */55 * * * ?")
    //或直接指定时间间隔，例如：5秒
    //@Scheduled(fixedRate=5000)
    private void configureTasks() {
        log.info("执行静态定时任务时间: " + LocalDateTime.now());
        getAccessToken();
    }

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
        JSONObject object = JSON.parseObject(body);
        log.info("定时任务发送TOKEN返回报文==========="+object);
        String Access_Token = object.getString("access_token");
        String expires_in = object.getString("expires_in");
        JedisUtils.set(templateAppid,Access_Token,0);
        log.info("有效时长expires_in：" + expires_in);
        return Access_Token;
    }

}
