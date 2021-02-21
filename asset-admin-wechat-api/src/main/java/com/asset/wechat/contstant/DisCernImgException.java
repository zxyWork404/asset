package com.asset.wechat.contstant;

/**
 * @description: 图片识别异常
 * @author: zhucj
 * @date: 2019-10-17 10:16
 */
public class DisCernImgException extends RuntimeException  {


    private Integer errcode;

    private String errmsg;


    public DisCernImgException(Integer errcode, String errmsg) {
        this.errcode = errcode;
        this.errmsg = errmsg;
    }

    public Integer getErrcode() {
        return errcode;
    }

    public void setErrcode(Integer errcode) {
        this.errcode = errcode;
    }

    public String getErrmsg() {
        return errmsg;
    }

    public void setErrmsg(String errmsg) {
        this.errmsg = errmsg;
    }
}
