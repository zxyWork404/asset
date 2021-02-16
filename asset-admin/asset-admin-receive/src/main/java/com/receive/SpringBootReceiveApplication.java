package com.receive;

//import com.receive.config.KafkaConsumerConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;
import org.springframework.kafka.annotation.EnableKafka;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@EnableKafka
//@EnableEurekaClient
//@Import({KafkaConsumerConfig.class})
public class SpringBootReceiveApplication {

    public static void main(String[] args) throws Exception {
        SpringApplication.run(SpringBootReceiveApplication.class, args);
    }
}
