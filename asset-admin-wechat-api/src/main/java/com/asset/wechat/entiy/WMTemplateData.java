package com.asset.wechat.entiy;

import java.io.Serializable;

/**
 * 微信小程序模板消息
 *
 */
public class WMTemplateData implements Serializable {

    /**
     * 模板字段对应的值
     */
    private String value;


    public WMTemplateData(String value) {
        this.value = value;
    }

    public WMTemplateData() {
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
