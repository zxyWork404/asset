package com.asset.common.utils.uuid;

import com.asset.common.entiy.TemplateData;
import com.asset.common.entiy.WxMssVo;
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
    public static String getMessageMsg(String openid,String templateAppid,String path,String tpl_id,Map<String, TemplateData> templateDataMaps){
        //拼接推送的模版
        WxMssVo wxMssVo = new WxMssVo();


        //Map<String, TemplateData> templateDataMap = new HashMap<>(3);
        Map<String, Object> templateDataMap = new HashMap<>(5);
        templateDataMap.put("form_id",templateAppid);
        templateDataMap.put("page", path);
        templateDataMap.put("template_id", tpl_id);


        //TemplateData templateData = new TemplateData;
        Map<String, TemplateData> templateDataMap2 = new HashMap<>(5);
        templateDataMap2.put("keyword1", new TemplateData("第一章第一节"));
        templateDataMap2.put("keyword2", new TemplateData("第一章第一节"));
        templateDataMap2.put("keyword3", new TemplateData("第一章第一节"));
        templateDataMap2.put("keyword4", new TemplateData("第一章第一节"));

        templateDataMap.put("data",templateDataMap2);

        wxMssVo.setTouser(openid);//用户的openid（要发送给那个用户，通常这里应该动态传进来的）
        wxMssVo.setEmphasis_keyword("测试");
        wxMssVo.setWeapp_template_msg(templateDataMap);

        JSONObject obj = JSONObject.fromObject(wxMssVo);
        log.info("发送模版消息请求报文==========="+obj);
        return obj.toString();
    }

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
