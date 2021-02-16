package com.asset.common.exception.file;

import com.asset.common.exception.BaseException;

/**
 * 文件信息异常类
 * 
 * @author zxy
 */
public class FileException extends BaseException
{
    private static final long serialVersionUID = 1L;

    public FileException(String code, Object[] args)
    {
        super("file", code, args, null);
    }

}
