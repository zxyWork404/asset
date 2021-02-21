package com.asset.wechat.contstant;

import lombok.Builder;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

/**
 * @description: 识别请求信息
 * @author: zhucj
 * @date: 2019-10-17 9:31
 */
@Data
@Builder
public class DiscernRequest {

    /**
     * 识别类型
     * 1:银行卡  2:营业执照 3：驾驶证 4:身份证 5:通用印刷体 6：行驶证
     */
    private Integer discernType;

    /**
     * 图片识别模式 1：photo（拍照模式） 2:scan（扫描模式）
     */
    private Integer imgType;

    /**
     * form-data 中媒体文件标识，有filename、filelength、content-type等信息，传这个则不用传 img_url
     */
    private MultipartFile msg;


    private String type;

    public DiscernRequest(Integer discernType, Integer imgType, MultipartFile msg, String type) {
        this.discernType = discernType;
        this.imgType = imgType;
        this.msg = msg;
        this.type = type;
    }
}
