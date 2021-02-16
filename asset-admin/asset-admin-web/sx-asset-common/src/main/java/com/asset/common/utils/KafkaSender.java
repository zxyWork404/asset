package com.asset.common.utils;

import com.alibaba.fastjson.JSON;
import com.asset.common.entiy.Message;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.stereotype.Component;
import org.springframework.util.concurrent.FailureCallback;
import org.springframework.util.concurrent.ListenableFuture;
import org.springframework.util.concurrent.SuccessCallback;

import javax.annotation.Resource;
import java.util.Date;
import java.util.UUID;

@Slf4j
@Component
public class KafkaSender {

    @Resource
    private KafkaTemplate<String, String> kafkaTemplate;

    /**
     * 发送消息方法
     * @param msg
     */
    public ResponseEntity send(String msg,String topic) {
        log.info("发送消息,消息内容 : {}", msg);
        try {
            String uuid = UUID.randomUUID().toString();
            Message message = new Message();
            message.setId(uuid);
            message.setMsg(msg);
            message.setSendTime(new Date());

            ListenableFuture listenableFuture = kafkaTemplate.send(topic, uuid, JSON.toJSONString(message));

            //发送成功后回调
            SuccessCallback<SendResult<String,String>> successCallback = new SuccessCallback<SendResult<String,String>>() {
                @Override
                public void onSuccess(SendResult<String,String> result) {
                    log.info("发送消息成功");
                }
            };
            //发送失败回调
            FailureCallback failureCallback = new FailureCallback() {
                @Override
                public void onFailure(Throwable ex) {
                    log.error("发送消息失败", ex);
                }
            };

            listenableFuture.addCallback(successCallback,failureCallback);
        }catch (Exception e){
            log.error("发送消息异常", e);
        }
        return new ResponseEntity("", HttpStatus.OK);
    }
}