package com.asset.wechat.register.service.impl;

import com.asset.wechat.register.dao.RegisterDao;
import com.asset.wechat.register.entity.SxRegister;
import com.asset.wechat.register.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    private RegisterDao registerDao;

    @Override
    public void insertRegister(SxRegister sxRegister) {
        registerDao.insert(sxRegister);
        //return ResponseDTO.succ();
    }

}
