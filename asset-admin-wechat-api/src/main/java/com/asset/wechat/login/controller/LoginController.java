package com.asset.wechat.login.controller;

import com.alibaba.fastjson.JSONObject;
import com.asset.wechat.config.WechatConfig;
import com.asset.wechat.entiy.WMTemplateData;
import com.asset.wechat.login.entiy.WxAuthPhone;
import com.asset.wechat.login.service.LoginService;
import com.asset.wechat.login.entiy.Login;
import com.asset.wechat.util.*;
import com.google.common.collect.Maps;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Api(value = "登录管理",description = "登录接口 API", position = 100, protocols = "http")
@RestController
@RequestMapping(value = "/login")
@Slf4j
public class LoginController {

    @Autowired
    private LoginService loginService;

    @Resource
    private WechatConfig wechatConfig;

    @Resource
    private KafkaSender KafkaSender;

    /**
     * 微信授权登录
     * @param code
     * @param appid
     */
    @ApiOperation(value = "微信授权登录", notes = "@author zhangxiangyu")
    @PostMapping("/wechatGrant")
    public AjaxResult wechatGrant(
            @RequestParam("code") String code,
            @RequestParam("appid") String appid) {
        Map<String, Object> resultMap = Maps.newConcurrentMap();
        try {
            log.info("微信授权登录  入参:code=【{}】,appid=【{}】】", code, appid);
            log.info(wechatConfig.toString());
            String result = WechatUtils.getCode2Session(wechatConfig.getJscode2sessionUrl(),wechatConfig.getAppid()
            ,wechatConfig.getAppsecret(),code);//VisitPush.wechatGrant(appid, code);
            JSONObject json = JSONObject.parseObject(result);
            log.info("微信授权登录 获取密码："+json);
            String openid = json.getString("openid");
            String session_key = json.getString("session_key");
            resultMap.put("openid", openid);
            resultMap.put("session_key", session_key);
            resultMap.put("errmsg", "查询成功");
            log.info("微信授权登录  返回数据【{}】", AjaxResult.success(resultMap));
            return AjaxResult.success(resultMap);
        } catch (Exception e) {
            log.error("系统内如错误", e);
            resultMap.put("errmsg", "系统繁忙，请稍候再试");
            return AjaxResult.error("微信授权失败",resultMap);
        }
    }

    /**
     * 小程序普通登录（手机号+验证码）
     *
     * @param phone    手机号
     * @param openid  用户的openid
     * @param appid    小程序appid
     * @param code     小程序获取的code
     */
    @ApiOperation(value = "小程序普通登录（手机号+验证码)", notes = "@author zhangxiangyu")
    @PostMapping("/wechat_login")
    public AjaxResult wechatLogin(
            @RequestParam("phone") String phone,
            @RequestParam("openid") String openid,
            @RequestParam("appid") String appid,
            @RequestParam("code") String code
            ) {
        Map<String, Object> resultMap = Maps.newConcurrentMap();
        try {
            log.info("小程序普通登录（手机号+验证码）入参:phone=【{}】,openid=【{}】,smallAppid=【{}】,code=【{}】", phone, openid, appid, code);
            String sendCode = JedisUtils.get(phone);
            if(StringUtils.isNotBlank(sendCode)){
                if(StringUtils.equals(code,sendCode)){
                    Login login = new Login();
                    login.setOpenid(openid);
                    login.setAppid(appid);
                    login.setCode(sendCode);
                    login.setIsDelete(1);
                    login.setCreateTime(new Date());
                    loginService.insertLogin(login);
                    return AjaxResult.success("登录成功");
                }else{
                    return AjaxResult.error("登录验证码错误");
                }
            }else{
                return AjaxResult.error("登录验证码失效");
            }
        } catch (Exception e) {
            log.error("系统内如错误", e);
            resultMap.put("errmsg", "系统繁忙，请稍候再试");
            return AjaxResult.error("微信登录失败",resultMap);
        }
    }


    /**
     * 小程序微信授权登录（手机号）
     * @param wxAuthPhone
     * @return
     */
    @ApiOperation(value = "小程序微信授权登录（手机号）", notes = "@author zhangxiangyu")
    @PostMapping("/wechatLoginGrant")
    public AjaxResult wechatLoginGrant(@RequestBody WxAuthPhone wxAuthPhone) {
        Map<String, Object> resultMap = Maps.newConcurrentMap();
        try {
            log.info("小程序微信授权登录（手机号）入参:encrypdata=【{}】,ivdata=【{}】,sessionkey=【{}】,openid=【{}】,appid=【{}】",
                    wxAuthPhone.getEncrypdata(), wxAuthPhone.getIvdata(), wxAuthPhone.getSessionkey(), wxAuthPhone.getOpenid(),
                    wxAuthPhone.getAppid());
            String phone = WechatUtils.deciphering(wxAuthPhone);
            log.info("小程序微信授权解密手机号:" + phone);
            Login login = new Login();
            login.setAppid(wxAuthPhone.getAppid());
            login.setCreateTime(new Date());
            login.setIsDelete(1);
            login.setPhone(phone);
            login.setOpenid(wxAuthPhone.getOpenid());
            loginService.insertLogin(login);


            String topic = "topic_messages";

            Map<String, Object> templateDataMaps = new HashMap<>(5);
            templateDataMaps.put("phrase1", new WMTemplateData("登录成功"));
            templateDataMaps.put("time2", new WMTemplateData("2020-02-19"));
            templateDataMaps.put("thing3", new WMTemplateData("审核通过"));
            templateDataMaps.put("thing4", new WMTemplateData("注册审核"));
            templateDataMaps.put("name5", new WMTemplateData("张向宇"));
            String msg = MessageMsgKafka.getMessageSmallWechatMsg(wxAuthPhone.getOpenid(),wxAuthPhone.getAppid(),wechatConfig.getPath(),wechatConfig.getTemplateId(),templateDataMaps);
            log.info("发送消息队列保文信息=========="+msg);
            KafkaSender.send(msg,topic);


            return AjaxResult.success("微信成功");
        } catch (Exception e) {
            log.error("系统内如错误", e);
            resultMap.put("errmsg", "系统繁忙，请稍候再试");
            return AjaxResult.error("微信登录失败",resultMap);
        }
    }

    /**
     * 小程序发送短信
     *
     * @param phone    用户手机号
     */
    @ApiOperation(value = "小程序发送短信", notes = "@author zhangxiangyu")
    @PostMapping("/sendCode")
    public AjaxResult sendCode(
            @RequestParam("phone") String phone) {
        Map<String, Object> resultMap = Maps.newConcurrentMap();
        try {
            String host = wechatConfig.getHost();
            String path = wechatConfig.getCodePath();
            String method = "POST";
            String appcode = wechatConfig.getAppcode();
            Map<String, String> headers = new HashMap<String, String>();
            headers.put("Authorization", "APPCODE " + appcode);
            Map<String, String> querys = new HashMap<String, String>();
            String random = RandomStringUtils.randomNumeric(6);
            querys.put("mobile", phone);
            querys.put("param", "code:"+random);
            querys.put("tpl_id", wechatConfig.getTpl_id());
            log.info("发送短信  入参【{}】", querys);
            Map<String, String> bodys = new HashMap<String, String>();
            //HttpResponse httpResponse = HttpUtils.doPost(host, path, method, headers, querys, bodys);
            //String result = EntityUtils.toString(httpResponse.getEntity());
            //log.info("发送短信  出参:=【{}】", result);
            JedisUtils.set(phone,random,62);
            return AjaxResult.success("{\"return_code\":\"00000\",\"order_id\":\"ALY1613719941770523484\"}");
        } catch (Exception e) {
            log.error("系统内如错误", e);
            resultMap.put("errmsg", "系统繁忙，请稍候再试");// 系统内如错误请稍后重试
            return AjaxResult.error("发送验证码失败",resultMap);

        }
    }

    /**
     * 查询是否登录
     *
     * @param openid 用户唯一表识
     */
    @ApiOperation(value = "查询是否登录", notes = "@author zhangxiangyu")
    @PostMapping("/selectLogin")
    public AjaxResult selectLogin(
            @RequestParam("openid") String openid) {
        Login login = loginService.selectLogin(openid);
        if(login!=null){
            return AjaxResult.success("200",login);
        }else{
            return AjaxResult.success("-1","已经登录成功");
        }

    }

}
