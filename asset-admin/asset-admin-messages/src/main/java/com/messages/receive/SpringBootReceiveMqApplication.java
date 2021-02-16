package com.messages.receive;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
//@ComponentScan(basePackages = {"com.messages.receive"})
public class SpringBootReceiveMqApplication {

    public static void main(String[] args) throws Exception {
        SpringApplication.run(SpringBootReceiveMqApplication.class, args);
    }
}
