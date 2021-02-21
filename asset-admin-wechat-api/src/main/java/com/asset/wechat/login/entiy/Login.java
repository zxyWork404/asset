package com.asset.wechat.login.entiy;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Login implements Serializable {

    private int id;
    
    private String openid;

    private String appid;

    private String phone;

    private int isDelete;

    private String code;

    private Date createTime;

}
