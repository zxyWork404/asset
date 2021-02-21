package com.asset.wechat.login.entiy;

import lombok.Data;

@Data
public class WxAuthPhone {
    String encrypdata;
    String sessionkey;
    String ivdata;
    String openid;
    String appid;
}
