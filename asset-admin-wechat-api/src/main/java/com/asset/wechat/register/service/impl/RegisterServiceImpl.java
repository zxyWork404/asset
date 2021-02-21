package com.asset.wechat.register.service.impl;

import com.asset.wechat.register.mapper.RegisterMapper;
import com.asset.wechat.register.entity.SxRegister;
import com.asset.wechat.register.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    private RegisterMapper registerDao;

    @Override
    public int insertRegister(SxRegister sxRegister) {
        SxRegister sxRegister1 = registerDao.selectRegister(sxRegister);
        int result = 0;
        if(sxRegister1!=null){
            result = registerDao.insertRegister(sxRegister);
        }
        return result;
    }

    public SxRegister selectRegister(String openid) {
        SxRegister sxRegister = new SxRegister();
        sxRegister.setOpenid(openid);
        SxRegister sxRegister1 = registerDao.selectRegister(sxRegister);
        return sxRegister1;
    }

}
