package com.asset.wechat.PersonalCenter.entiy;

import lombok.Data;

import java.io.Serializable;

/**
*
*  @author author
*/
@Data
public class ExamineLog implements Serializable {

    private static final long serialVersionUID = 1613348921210L;


    /**
    * 申请人id
    * isNullAble:1
    */
    private Integer codeId;

    /**
    * 申请类型 1:注册，2:入会，3项目发起申请，4:承销流程
    * isNullAble:1
    */
    private Integer type;

    /**
    * 审核人id
    * isNullAble:1
    */
    private Integer examineId;

    /**
    * 审核结果 0:审核中，1:通过，2:不通过
    * isNullAble:1
    */
    private Integer resultType;

    /**
    * 审核结果内容
    * isNullAble:1
    */
    private String resultContent;

    /**
    * 申请时间
    * isNullAble:1
    */
    private java.time.LocalDateTime createTime;

    /**
     * appid
     * isNullAble:1
     */
    private String openid;

    /**
     * openid
     * isNullAble:1
     */
    private String appid;

}
