package com.messages.receive.listen;

import com.messages.receive.compont.SendWechatTemplate;
import com.messages.receive.entiy.AppWechat;
import com.messages.receive.service.impl.WorkMqServiceImpl;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.annotation.TopicPartition;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Date;


@Slf4j
@Component
public class MsgReceiver {

    @Autowired
    private WorkMqServiceImpl workMqService;
    @Resource
    private SendWechatTemplate sendWechatTemplate;

    @Value("${spring.template.id}")
    public String tpl_id;
    @Value("${spring.template.appid}")
    private String templateAppid;

    @KafkaListener(topicPartitions = {@TopicPartition(topic = "${spring.kafka.template.default-topic}", partitions = {"0", "1", "2"})})
    public void listen(ConsumerRecord<String, byte[]> record){
        try {
            log.info("监听接收消息"+record.value());
            sendMessage(String.valueOf(record.value()));
        } catch (Exception e) {
            log.error("kafka接收消息异常",e);
        }
    }

    /**
     * 发送审核消息
     * @param messages
     * @return
     */
    public boolean sendMessage(String messages){
        try {
            /*String openid = "o6oRH4xPcsCPf3ZMl6jo06Ej2iBE";
            //拼接推送的模版
            WxMssVo wxMssVo = new WxMssVo();


            //Map<String, TemplateData> templateDataMap = new HashMap<>(3);
            Map<String, Object> templateDataMap = new HashMap<>(5);
            templateDataMap.put("form_id",templateAppid);
            templateDataMap.put("page", "pages/index/index");
            templateDataMap.put("template_id", tpl_id);
            templateDataMap.put("touser",openid);
            templateDataMap.put("lang","zh_CN");

            //TemplateData templateData = new TemplateData;
            Map<String, Object> templateDataMap2 = new HashMap<>(5);
            templateDataMap2.put("phrase1", "第一章第一节");
            templateDataMap2.put("time2", "第一章第一节");
            templateDataMap2.put("thing3", "第一章第一节");
            templateDataMap2.put("thing4", "第一章第一节");
            templateDataMap2.put("name5", "第一章第一节");

            templateDataMap.put("data",templateDataMap2);
            log.info("发送模版消息请求报文==========="+templateDataMap);

            JSONObject obj = JSONObject.fromObject(templateDataMap);
            log.info("发送模版消息请求报文==========="+obj);
            String result = sendWechatTemplate.push(templateAppid,obj);*/

            String result = sendWechatTemplate.push(templateAppid,messages);

            JSONObject jsonObject = JSONObject.fromObject(result);
            int errcode = jsonObject.getInt("errcode");
            String errmsg = (String) jsonObject.get("errmsg");
            JSONObject jsonObject1 = JSONObject.fromObject(messages);
            executeAsyncTaskSavesg(messages.toString(),templateAppid, (String) jsonObject1.get("touser"),errcode,errmsg);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 推送微信模版消息
     * @param messages
     * @return
     */
    public boolean sendWxTemplate(String messages){
        return true;
    }

    @Async("asyncExecutor")
    public void executeAsyncTaskSavesg(String content,String templateAppid,String openid,int errcode,String errmsg){
        AppWechat appWechat = new AppWechat();
        appWechat.setAppid(templateAppid);
        appWechat.setOpenid(openid);
        appWechat.setMsg(content);
        appWechat.setErrcode(errcode);
        appWechat.setErrmsg(errmsg);
        appWechat.setCreateTime(new Date());
        workMqService.insertWork(appWechat);
    }
}
