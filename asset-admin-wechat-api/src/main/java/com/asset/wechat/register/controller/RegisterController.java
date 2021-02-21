package com.asset.wechat.register.controller;

import com.asset.wechat.config.WechatConfig;
import com.asset.wechat.core.BaseController;
import com.asset.wechat.register.entity.SxRegister;
import com.asset.wechat.register.service.RegisterService;
import com.asset.wechat.util.AjaxResult;
import com.asset.wechat.util.JedisUtils;
import com.google.common.collect.Maps;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import sun.util.calendar.BaseCalendar;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Api(value = "注册管理",description = "注册接口 API", position = 100, protocols = "http")
@RestController
@RequestMapping(value = "/register")
@Slf4j
public class RegisterController extends BaseController {

    @Autowired
    private RegisterService registerService;


    @ApiOperation(value = "用户注册信息", notes = "@author zhangxiangyu")
    @PostMapping("/insertRegister")
    public AjaxResult insertRegister(@RequestBody SxRegister sxRegister) {
        return toAjax(registerService.insertRegister(sxRegister));
    }

    @ApiOperation(value = "查询用户注册信息", notes = "@author zhangxiangyu")
    @PostMapping("/selectRegister")
    public AjaxResult selectRoleList(@RequestParam("openid") String openid) {
        return AjaxResult.success(registerService.selectRegister(openid));
    }
}
