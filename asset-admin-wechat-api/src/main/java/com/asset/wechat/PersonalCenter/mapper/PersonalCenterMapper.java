package com.asset.wechat.PersonalCenter.mapper;

import com.asset.wechat.PersonalCenter.entiy.ExamineLog;
import org.mapstruct.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface PersonalCenterMapper {
    List<ExamineLog> selectExamineInfo(String openid);
}
