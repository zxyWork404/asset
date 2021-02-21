package com.asset.wechat.ThirdParty;

import com.alibaba.fastjson.JSONObject;
import com.asset.wechat.config.WechatConfig;
import com.asset.wechat.util.AjaxResult;
import com.asset.wechat.util.HttpUtils;
import com.asset.wechat.util.JedisUtils;
import com.asset.wechat.util.StringUtils;
import com.google.common.collect.Maps;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Api(value = "第三方接口管理",description = "第三方接口 API", position = 100, protocols = "http")
@RestController
@RequestMapping(value = "/thirdParty")
@Slf4j
public class ThirdPartyController {

    @Resource
    private WechatConfig wechatConfig;

    /**
     * 第三方接口实名认证
     *
     * @param cardNo    用户唯一表识
     */
    @ApiOperation(value = "第三方接口实名认证", notes = "@author zhangxiangyu")
    @PostMapping("/market")
    public AjaxResult Market(
            @RequestParam("cardNo") String cardNo,
            @RequestParam("realName") String realName) {
        Map<String, Object> resultMap = Maps.newConcurrentMap();
        try {
            String host = wechatConfig.getMarketHost();
            String path = wechatConfig.getMarketPath();
            String appcode = wechatConfig.getAppcode();
            String method = "GET";
            Map<String, String> headers = new HashMap<String, String>();
            headers.put("Authorization", "APPCODE " + appcode);
            Map<String, String> querys = new HashMap<String, String>();
            querys.put("cardNo", cardNo);
            querys.put("realName", realName);
            log.info("第三方接口实名认证  入参【{}】", querys);
            HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
            System.out.println(response.toString());
            String result = EntityUtils.toString(response.getEntity());
            log.info("第三方接口实名认证  出参:=【{}】", result);
            JSONObject json = JSONObject.parseObject(result);
            String error_code = json.get("error_code").toString();
            if (StringUtils.equals("0",error_code)){
                JSONObject object = JSONObject.parseObject(json.get("result").toString());
                boolean status =Boolean.valueOf(object.get("isok").toString());
                if(status){
                    return AjaxResult.success("实名认证成功");
                }else{
                    return AjaxResult.success("实名认证失败");
                }
            }else{
                return AjaxResult.error("-1","实名认证请求失败");
            }
        } catch (Exception e) {
            log.error("系统内如错误", e);
            resultMap.put("errmsg", "系统繁忙，请稍候再试");// 系统内如错误请稍后重试
            return AjaxResult.error("实名认证失败");

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
            HttpResponse httpResponse = HttpUtils.doPost(host, path, method, headers, querys, bodys);
            String result = EntityUtils.toString(httpResponse.getEntity());
            log.info("发送短信  出参:=【{}】", result);
            JSONObject json = JSONObject.parseObject(result);
            String return_code = json.get("return_code").toString();
            if(return_code.equals("00000")){
                JedisUtils.set(phone,random,62);
                return AjaxResult.success("发送验证码成功");
            }else{
                return AjaxResult.success(return_code,"发送验证码失败");
            }
        } catch (Exception e) {
            log.error("系统内如错误", e);
            resultMap.put("errmsg", "系统繁忙，请稍候再试");// 系统内如错误请稍后重试
            return AjaxResult.error("发送验证码失败",resultMap);

        }
    }

    public static void main(String[] args) {
        String host = "https://zid.market.alicloudapi.com";
        String path = "/idcard/VerifyIdcardv2";
        String method = "GET";
        String appcode = "5f090a89f7c5443ab982e616500b2b69";
        Map<String, String> headers = new HashMap<String, String>();
        //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
        headers.put("Authorization", "APPCODE " + appcode);
        Map<String, String> querys = new HashMap<String, String>();
        querys.put("cardNo", "140522199510235932");
        querys.put("realName", "张向宇");


        try {
            /**
             * 重要提示如下:
             * HttpUtils请从
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
             * 下载
             *
             * 相应的依赖请参照
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
             */
            HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
            System.out.println(response.toString());
            //获取response的body
            System.out.println(EntityUtils.toString(response.getEntity()));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
