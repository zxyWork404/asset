package com.asset.register.service;


import com.asset.register.domain.RegisterUser;

import java.util.List;

public interface RegisterUserService {


    /**
     * 查询注册用户列表
     * @param registerUser
     * @return
     */
    public List<RegisterUser> selectRegisterUserList(RegisterUser registerUser);
    /**
     * 查询注册入会用户列表
     * @param registerUser
     * @return
     */
    List<RegisterUser> selectMemberUserList(RegisterUser registerUser);
}
