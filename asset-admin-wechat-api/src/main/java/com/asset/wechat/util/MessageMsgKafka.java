package com.asset.wechat.util;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@Component
public class MessageMsgKafka {

    /**
     * 组装推送信息
     * @param openid
     * @param templateAppid
     * @param path
     * @param tpl_id
     * @param templateDataMaps
     * @return
     */
    public static String getMessageSmallWechatMsg(String openid,String templateAppid,String path,String tpl_id,Map<String, Object> templateDataMaps){
        //拼接推送的模版
        Map<String, Object> templateDataMap = new HashMap<>(5);
        templateDataMap.put("form_id",templateAppid);
        templateDataMap.put("page", path);
        templateDataMap.put("template_id", tpl_id);
        templateDataMap.put("touser",openid);
        templateDataMap.put("lang","zh_CN");

        templateDataMap.put("data",templateDataMaps);

        JSONObject obj = JSONObject.fromObject(templateDataMap);
        log.info("发送模版消息请求报文==========="+obj);
        return obj.toString();
    }
}
