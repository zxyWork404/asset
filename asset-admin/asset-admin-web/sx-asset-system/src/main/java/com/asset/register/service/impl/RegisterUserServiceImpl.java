package com.asset.register.service.impl;

import com.asset.register.domain.RegisterUser;
import com.asset.register.mapper.RegisterUserMapper;
import com.asset.register.service.RegisterUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RegisterUserServiceImpl implements RegisterUserService {

    @Resource
    private RegisterUserMapper registerUserMapper;
    @Override
    public List<RegisterUser> selectRegisterUserList(RegisterUser registerUser) {
        return registerUserMapper.selectRegisterUserList(registerUser);
    }

    @Override
    public List<RegisterUser> selectMemberUserList(RegisterUser registerUser) {
        return registerUserMapper.selectMemberUserList(registerUser);
    }
}
