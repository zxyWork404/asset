package com.messages.receive.mapper;


import com.messages.receive.entiy.AppWechat;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WorkMqMapper {

     boolean insert(AppWechat workMq);
}
