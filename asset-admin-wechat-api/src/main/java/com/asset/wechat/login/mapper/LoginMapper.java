package com.asset.wechat.login.mapper;

import com.asset.wechat.login.entiy.Login;
import org.mapstruct.Mapper;

@Mapper
public interface LoginMapper {

    int insertLogin(Login login);

    Login selectLogin(Login login);
}
