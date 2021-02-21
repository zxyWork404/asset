package com.asset.wechat.contstant;

/**
 * @description: 小程序API常量
 * @author: zhucj
 * @date: 2019-09-17 18:25
 */
public class AppletDiscernConstant {


    /**
     * 小程序登录API
     */
    public static final String AUTH_CODE_API = "https://api.weixin.qq.com/sns/jscode2session";

    /**
     * accessToken授权API
     */
    public static final String ACCESS_TOKEN_API = "https://api.weixin.qq.com/cgi-bin/token";
    /**
     * 客服消息API
     */
    public static final String  MESSAGE_SEND_API = "https://api.weixin.qq.com/cgi-bin/message/custom/send";


    /**
     * accessToken缓存key
     */
    public static final String ACCESS_TOKEN = "ACCESS_TOKEN";

    public static final Integer EXPIRES_IN  = 7000;


    //TODO: 异常信息状态


    public static final String ACCESS_TOKRN_ERROR = "小程序授权获取accessToken失败";
    public static final String DIECERN_TYPE_ERROR = "diecernType传参格式不支持";
    public static final String IMG_TYPE_ERROR = "imgType传参格式不支持";

    public static final String SUCCESS = "0";
}
