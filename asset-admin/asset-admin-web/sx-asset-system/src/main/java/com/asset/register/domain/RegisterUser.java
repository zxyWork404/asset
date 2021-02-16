package com.asset.register.domain;

import com.asset.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class RegisterUser extends BaseEntity {
    private static final long serialVersionUID = 1L;

    private String id;
    private String codeCard;
    private String name;
    private String contacts;
    private String phone;
    private String qualifications;
    private String openid;
    private String appid;
    private int resultType;
    private int registerType;
    private int isNoCancellation;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date registerCreateTime;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date memberCreateTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCodeCard() {
        return codeCard;
    }

    public void setCodeCard(String codeCard) {
        this.codeCard = codeCard;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getQualifications() {
        return qualifications;
    }

    public void setQualifications(String qualifications) {
        this.qualifications = qualifications;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public int getResultType() {
        return resultType;
    }

    public void setResultType(int resultType) {
        this.resultType = resultType;
    }

    public int getRegisterType() {
        return registerType;
    }

    public void setRegisterType(int registerType) {
        this.registerType = registerType;
    }

    public int getIsNoCancellation() {
        return isNoCancellation;
    }

    public void setIsNoCancellation(int isNoCancellation) {
        this.isNoCancellation = isNoCancellation;
    }

    public Date getRegisterCreateTime() {
        return registerCreateTime;
    }

    public void setRegisterCreateTime(Date registerCreateTime) {
        this.registerCreateTime = registerCreateTime;
    }

    public Date getMemberCreateTime() {
        return memberCreateTime;
    }

    public void setMemberCreateTime(Date memberCreateTime) {
        this.memberCreateTime = memberCreateTime;
    }
}
