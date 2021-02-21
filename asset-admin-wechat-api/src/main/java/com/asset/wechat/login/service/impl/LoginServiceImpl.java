package com.asset.wechat.login.service.impl;

import com.asset.wechat.login.mapper.LoginMapper;
import com.asset.wechat.login.service.LoginService;
import com.asset.wechat.login.entiy.Login;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class LoginServiceImpl implements LoginService {

    @Resource
    private LoginMapper loginMapper;

    public int insertLogin(Login login){
        Login logins = loginMapper.selectLogin(login);
        int result = -1;
        if(logins!=null){
            result = loginMapper.insertLogin(login);
        }
        return result;
    }

    public Login selectLogin(String openid){
        Login login = new Login();
        login.setOpenid(openid);
        Login logins = loginMapper.selectLogin(login);
        return logins;
    }
}
