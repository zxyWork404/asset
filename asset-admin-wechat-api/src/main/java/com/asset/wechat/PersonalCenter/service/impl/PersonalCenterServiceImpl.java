package com.asset.wechat.PersonalCenter.service.impl;

import com.asset.wechat.PersonalCenter.entiy.ExamineLog;
import com.asset.wechat.PersonalCenter.mapper.PersonalCenterMapper;
import com.asset.wechat.PersonalCenter.service.PersonalCenterService;
import com.asset.wechat.register.entity.SxRegister;
import com.asset.wechat.register.mapper.RegisterMapper;
import org.springframework.stereotype.Service;
import sun.jvm.hotspot.asm.Register;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PersonalCenterServiceImpl implements PersonalCenterService {

    @Resource
    private PersonalCenterMapper personalCenterMapper;
    @Resource
    private RegisterMapper registerMapper;

    @Override
    public List<ExamineLog> selectExamineInfo(String openid) {
        List<ExamineLog> list = personalCenterMapper.selectExamineInfo(openid);
        return list;
    }

    @Override
    public List<Integer> selectRoleList(String openid) {
        SxRegister register = new SxRegister();
        register.setOpenid(openid);
        System.out.println(register.toString());
        SxRegister register2 = registerMapper.selectRegister(register);
        System.out.println(register2.toString());
        Long registerType = register2.getRegisterType();
        List<Integer> list = new ArrayList<>();
        // 1:备案机构,2管理人,3发行人，4担保人，5承销商，6投资人 7个人 8机构
        // 1:注册，2:入会，3:注销 4项目发起申请，5承销流程,
        /*if(registerType == 1){
            list.add(1);
            list.add(21);//入会和注销
        }else if(registerType == 2 || registerType == 3 || registerType == 4 || registerType == 5){
            list.add(1);
            list.add(2);
            list.add(3);
            list.add(4);
            list.add(5);
        }else if(registerType == 6 || registerType == 7 || registerType == 8){
            list.add(1);
        }*/
        list.add(Integer.valueOf(String.valueOf(registerType)));
        return list;
    }

}
