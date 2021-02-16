package com.asset.wechat;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.kafka.annotation.EnableKafka;
import org.springframework.scheduling.annotation.EnableScheduling;


@SpringBootApplication
@EnableCaching
@EnableScheduling
//@EnableAspectJAutoProxy(proxyTargetClass = true, exposeProxy = true)
@EnableKafka
public class AssetWechatApplication {

    public static void main(String[] args) {
        SpringApplication.run(AssetWechatApplication.class, args);
    }
}
