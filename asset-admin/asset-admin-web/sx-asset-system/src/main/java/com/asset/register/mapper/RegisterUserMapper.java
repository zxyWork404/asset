package com.asset.register.mapper;

import com.asset.register.domain.RegisterUser;

import java.util.List;

/**
 * 注册用户查询
 * 
 * @author zxy
 */
public interface RegisterUserMapper
{

    /**
     * 查询注册用户查询列表
     * 
     * @param registerUser 操作用户对象
     * @return 操作用户集合
     */
    public List<RegisterUser> selectRegisterUserList(RegisterUser registerUser);
    /**
     * 查询注册用户入会查询列表
     *
     * @param registerUser 操作用户对象
     * @return 操作用户集合
     */
    List<RegisterUser> selectMemberUserList(RegisterUser registerUser);
}
