package com.asset.wechat.upload.controller;

import com.asset.wechat.config.WechatConfig;
import com.asset.wechat.contstant.DisCernImgException;
import com.asset.wechat.contstant.SystemConstants;
import com.asset.wechat.upload.domain.UoloadEntiy;
import com.asset.wechat.util.AjaxResult;
import com.asset.wechat.util.FileUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.Random;

@Api(value = "上传文件接口管理",description = "文件中心 API", position = 100, protocols = "http")
@RestController
@RequestMapping(value = "/upload")
@Slf4j
public class UploadController {

    @Resource
    private WechatConfig wechatConfig;

    @ApiOperation(value = "上传文件接口")
    @PostMapping("/uploadFile")
    public AjaxResult uploadFile(
            MultipartFile file,
            @RequestParam(value = "discernType", required = true) String discernType,
            @RequestParam(value = "fileType", required = true) String fileType,
            @RequestParam(value = "openid", required = true) String openid,
            @RequestParam(value = "appid", required = true) String appid) {
        System.out.println(appid);
        String originalFileName = file.getOriginalFilename();
        String savePath = wechatConfig.getDiscernPath() + originalFileName;
        FileUtils.uploadFile(savePath,file);
        return AjaxResult.success("uploadFile");

    }



}