package com.asset.wechat.register.service;

import com.asset.wechat.register.entity.SxRegister;

/**
 * 用户注册信息
 */
public interface RegisterService {

    /**
     * 用户测试表记录
     * @param sxRegisterEntity
     * @return
     */
    public void insertRegister(SxRegister sxRegisterEntity);
}
