package com.asset.wechat.config;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

@Component
@Data
public class WechatConfig {

    @Value("${spring.url.jscode2session}")
    private String jscode2sessionUrl;

    @Value("${spring.template.appid}")
    private String appid;

    @Value("${spring.template.appsecret}")
    private String appsecret;

    @Value("${spring.template.path}")
    private String path;

    @Value("${spring.template.id}")
    private String templateId;

    @Value("${spring.template.url}")
    private String templateUrl;

    @Value("${code.host}")
    private String host;

    @Value("${code.path}")
    private String codePath;

    @Value("${code.appcode}")
    private String appcode;

    @Value("${code.tpl_id}")
    private String tpl_id;

    @Value("${market.host}")
    private String marketHost;

    @Value("${market.path}")
    private String marketPath;

    @Value("${secret.discern.file}")
    private String discernPath;

}
