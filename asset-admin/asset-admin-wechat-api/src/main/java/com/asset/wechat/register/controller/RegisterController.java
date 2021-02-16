package com.asset.wechat.register.controller;

import com.asset.wechat.register.entity.SxRegister;
import com.asset.wechat.register.service.RegisterService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RegisterController {

    @Autowired
    private RegisterService registerService;

    @ApiOperation(value = "用户注册信息", notes = "@author zhangxiangyu")
    @PostMapping("/register/page/query")
    public void register(@RequestBody SxRegister sxRegister) {
        registerService.insertRegister(sxRegister);
    }
}
