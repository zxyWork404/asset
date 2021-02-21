package com.asset.wechat.PersonalCenter.controller;

import com.asset.wechat.PersonalCenter.service.PersonalCenterService;
import com.asset.wechat.register.entity.SxRegister;
import com.asset.wechat.util.AjaxResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@Api(value = "个人中心接口管理",description = "个人中心 API", position = 100, protocols = "http")
@RestController
@RequestMapping(value = "/PersonalCenter")
@Slf4j
public class PersonalCenterController {

    @Resource
    private PersonalCenterService personalCenterService;

    @ApiOperation(value = "审核信息（注册，入会，销会，产品，承销）", notes = "@author zhangxiangyu")
    @PostMapping("/selectExamineInfo")
    public AjaxResult selectExamineInfo(@RequestParam("openid") String openid) {
        return AjaxResult.success(personalCenterService.selectExamineInfo(openid));
    }

    @ApiOperation(value = "查询角色管理的菜单", notes = "@author zhangxiangyu")
    @PostMapping("/selectRoleList")
    public AjaxResult selectRoleList(@RequestParam("openid") String openid) {
        return AjaxResult.success(personalCenterService.selectRoleList(openid));
    }
}
