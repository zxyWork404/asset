package com.asset.wechat.login.service;

import com.asset.wechat.login.entiy.Login;

public interface LoginService {

    public int insertLogin(Login login);

    Login selectLogin(String openid);
}
