package com.asset.common.exception.user;

import com.asset.common.exception.BaseException;

/**
 * 用户信息异常类
 * 
 * @author zxy
 */
public class UserException extends BaseException
{
    private static final long serialVersionUID = 1L;

    public UserException(String code, Object[] args)
    {
        super("user", code, args, null);
    }
}
