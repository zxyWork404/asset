package com.admin.entiy;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by liulanhua on 2018/9/4.
 */
@Data
public class Message implements Serializable{

    private String id;    //id

    private String msg; //消息

    private Date sendTime;  //时间戳

}

