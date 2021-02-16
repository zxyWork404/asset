package com.admin.entiy;

import java.util.Map;

/*
 * 小程序推送所需数据
 * */
public class WxMssVo {

    private String touser;//用户openid

    private Object weapp_template_msg;//小程序模板消息相关的信息，可以参考小程序模板消息接口; 有此节点则优先发送小程序模板消息

    private  String emphasis_keyword;

    public String getTouser() {
        return touser;
    }

    public void setTouser(String touser) {
        this.touser = touser;
    }

    public Object getWeapp_template_msg() {
        return weapp_template_msg;
    }

    public void setWeapp_template_msg(Object weapp_template_msg) {
        this.weapp_template_msg = weapp_template_msg;
    }

    public String getEmphasis_keyword() {
        return emphasis_keyword;
    }

    public void setEmphasis_keyword(String emphasis_keyword) {
        this.emphasis_keyword = emphasis_keyword;
    }
}
