package com.asset.wechat.contstant;

/**
 * @ClassName SystemConstants
 * @Description 常量字段
 * @Author zhucj
 * @Date 2019/5/7 11:13
 * @Version 1.0
 **/
public class SystemConstants {


    /** 传参不规范,code：400*/
    public static final Integer PARAM_INCORRECT_CODE = 400;

    /** 成功,code：200*/
    public static final Integer SUCCESS_CODE = 200;

    /** 服务内部调用失败,code：500*/
    public static final Integer SERVER_ERROR_CODE = 500;

    /** 登录失效,code：401*/
    public static final Integer AUTH_FAIL_CODE = 401;

    /** 无对应接口权限,code：402*/
    public static final Integer HAVE_NOT_PERMISSION_CODE = 402;

    /** 操作无记录,code：403*/
    public static final Integer NO_RECORD_OPERATION = 403;


}
