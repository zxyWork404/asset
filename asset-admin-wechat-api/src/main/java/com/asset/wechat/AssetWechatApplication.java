package com.asset.wechat;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(value = "com.asset.wechat.*.mapper")
public class AssetWechatApplication {

    public static void main(String[] args) {
        SpringApplication.run(AssetWechatApplication.class, args);
    }
}
