package com.messages.receive.service.impl;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.messages.receive.entiy.AppWechat;
import com.messages.receive.mapper.WorkMqMapper;
import com.messages.receive.service.WorkMqService;

import javax.annotation.Resource;

@Service
public class WorkMqServiceImpl implements WorkMqService {

    @Resource
    private WorkMqMapper workMqMapper;

    @Transactional
    public void insertWork(AppWechat workMq){
        workMqMapper.insert(workMq);
    }
}
