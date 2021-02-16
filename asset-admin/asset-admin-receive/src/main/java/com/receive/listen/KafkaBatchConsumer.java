package com.receive.listen;

import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.annotation.TopicPartition;
import org.springframework.kafka.support.Acknowledgment;
import org.springframework.stereotype.Component;

import java.util.List;

@Slf4j
@Component
public class KafkaBatchConsumer {

    @KafkaListener(topicPartitions = {@TopicPartition(topic = "${spring.kafka.template.default-topic}", partitions = {"0", "1", "2"})})
    public void listen(ConsumerRecord<String, byte[]> record){
        try {
            System.out.println("接收消息"+record.value());
        } catch (Exception e) {
            log.error("kafka接收消息异常",e);
        }
    }
}
