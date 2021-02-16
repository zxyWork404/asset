package com.asset.wechat.register.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

@Data
public class SxRegister {

  @ApiModelProperty("机构代码/身份证")
  private String codeCard;
  @ApiModelProperty("名称/姓名")
  private String name;
  @ApiModelProperty("联系人")
  private String contacts;
  @ApiModelProperty("联系方式")
  private String phone;
  @ApiModelProperty("资质")
  private String qualifications;
  @ApiModelProperty("用户属性")
  private String openid;
  @ApiModelProperty("小程序属性")
  private String appid;
  @ApiModelProperty(name="是否审核通过",hidden = true)
  private long isNoExamine;
  @ApiModelProperty(name="注册人属性",hidden = true)
  private long registerType;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
  private Date createdTime;

}
