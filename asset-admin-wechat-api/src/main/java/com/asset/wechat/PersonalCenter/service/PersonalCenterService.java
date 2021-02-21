package com.asset.wechat.PersonalCenter.service;

import com.asset.wechat.PersonalCenter.entiy.ExamineLog;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface PersonalCenterService {
    List<ExamineLog> selectExamineInfo(String openid);

    List<Integer> selectRoleList(String openid);
}
