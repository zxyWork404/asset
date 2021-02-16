package com.asset.web.controller.examine;


import com.asset.common.annotation.Log;
import com.asset.common.core.controller.BaseController;
import com.asset.common.core.domain.AjaxResult;
import com.asset.common.core.page.TableDataInfo;
import com.asset.common.enums.BusinessType;
import com.asset.common.utils.KafkaSender;
import com.asset.common.utils.uuid.MessageMsgKafka;
import com.asset.examine.domain.SxExamineLog;
import com.asset.examine.service.SxExamineLogService;
import com.asset.register.domain.RegisterUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/examine/user")
@Slf4j
public class ExamineController extends BaseController {

    @Resource
    private SxExamineLogService sxExamineLogService;
    @Resource
    private KafkaSender KafkaSender;

    /**
     * 提醒通知公告
     */
    @PreAuthorize("@ss.hasPermi('examine:user:notice')")
    @Log(title = "审核通知公告", businessType = BusinessType.UPDATE)
    @PostMapping("/sendMessage")
    public AjaxResult sendMessage(RegisterUser registerUser) {
        try {
            String openid = "o6oRH4xPcsCPf3ZMl6jo06Ej2iBE";
            String templateAppid = "wx387f2dd400f31535";
            String path = "pages/index/index";
            String tpl_id = "h3_tBFyHNtyUQQ2ZLn06LJZCAnQIEnu9C-q3pPe3BL4";
            String topic = "topic_messages";

            Map<String, Object> templateDataMaps = new HashMap<>(5);
            templateDataMaps.put("phrase1", "第一章第一节");
            templateDataMaps.put("time2", "第一章第一节");
            templateDataMaps.put("thing3", "第一章第一节");
            templateDataMaps.put("thing4", "第一章第一节");
            templateDataMaps.put("name5", "第一章第一节");
            String msg = MessageMsgKafka.getMessageSmallWechatMsg(openid,templateAppid,path,tpl_id,templateDataMaps);
            log.info("发送消息队列保文信息=========="+msg);
            KafkaSender.send(msg,topic);
            log.info("发送消息队列成功");
            return toAjax(1);
        }catch (Exception e){
            log.error("发送消息队列失败",e);
            return toAjax(0);
        }
    }

    /**
     * 审核
     */
    @PreAuthorize("@ss.hasPermi('examine:user:saveExamine')")
    @Log(title = "审核通知公告", businessType = BusinessType.UPDATE)
    @PostMapping("/saveExamine")
    public AjaxResult saveExamine(SxExamineLog sxExamineLog) {
        try {
            //String openid = "o6oRH4xPcsCPf3ZMl6jo06Ej2iBE";
            //String templateAppid = "wx387f2dd400f31535";
            String path = "pages/index/index";
            String tpl_id = "h3_tBFyHNtyUQQ2ZLn06LJZCAnQIEnu9C-q3pPe3BL4";
            String topic = "topic_messages";


            sxExamineLog.setCreateTime(LocalDateTime.now());
            //审核成功保存数据库
            int result = sxExamineLogService.insertSxExamineLog(sxExamineLog);

            if(result>0){
                Map<String, Object> templateDataMaps = new HashMap<>(5);
                templateDataMaps.put("phrase1", "第一章第一节");
                templateDataMaps.put("time2", "第一章第一节");
                templateDataMaps.put("thing3", "第一章第一节");
                templateDataMaps.put("thing4", "第一章第一节");
                templateDataMaps.put("name5", "第一章第一节");
                String msg = MessageMsgKafka.getMessageSmallWechatMsg(sxExamineLog.getOpenid(),sxExamineLog.getAppid(),path,tpl_id,templateDataMaps);
                log.info("发送消息队列保文信息=========="+msg);
                KafkaSender.send(msg,topic);
            }

            log.info("发送消息队列成功");
            return toAjax(result);
        }catch (Exception e){
            log.error("发送消息队列失败",e);
            return toAjax(0);
        }
    }

    @PreAuthorize("@ss.hasPermi('examine:user:loglist')")
    @GetMapping("/list")
    public TableDataInfo list(SxExamineLog sxExamineLog){
        startPage();
        List<HashMap> list = sxExamineLogService.querySxExamineLogList(sxExamineLog);
        System.out.println(list);
        return getDataTable(list);
    }
}
