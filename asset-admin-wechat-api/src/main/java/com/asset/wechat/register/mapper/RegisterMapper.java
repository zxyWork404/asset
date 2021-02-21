package com.asset.wechat.register.mapper;

import com.asset.wechat.register.entity.SxRegister;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RegisterMapper {

    int insertRegister(SxRegister sxRegister);

    SxRegister selectRegister(SxRegister sxRegister);
}
