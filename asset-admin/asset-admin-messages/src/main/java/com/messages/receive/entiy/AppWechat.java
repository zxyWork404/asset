package com.messages.receive.entiy;


import lombok.Data;

import java.util.Date;

@Data
public class AppWechat {

    private static final long serialVersionUID = 1L;

    private String appid;
    private String  openid;
    private String  msg;
    private int  errcode;
    private String  errmsg;
    private Date createTime;



}
