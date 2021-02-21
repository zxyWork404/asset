package com.asset.wechat.contstant;

/**
 * @description: 图片识别API
 * @author: zhucj
 * @date: 2019-10-17 9:44
 */
public enum  DisCernImgApi {
    /**
     * 小程序端识别
     */
    ORC_BANKCARD(1, DisCernConstant.WX_DISCERN_SERVER_API+DisCernConstant.WX_BANKCARD_DISCERN_SERVER_NAME),
    ORC_BIZLICENSE(2,DisCernConstant.WX_DISCERN_SERVER_API+DisCernConstant.WX_BUCINESS_DISCERN_SERVER_NAME),
    ORC_DRIVINGLICENSE(3,DisCernConstant.WX_DISCERN_SERVER_API+DisCernConstant.WX_DRIVER_DISCERN_SERVER_NAME),
    ORC_IDCARD(4,DisCernConstant.WX_DISCERN_SERVER_API+DisCernConstant.WX_IDCARD_DISCERN_SERVER_NAME),
    ORC_COMM(5,DisCernConstant.WX_DISCERN_SERVER_API+DisCernConstant.WX_PRINTED_DISCERN_SERVER_NAME),
    ORC_DRIVING(6,DisCernConstant.WX_DISCERN_SERVER_API+DisCernConstant.WX_DRIVING_DISCERN_SERVER_NAME)
    ;

    private int discernType;

    private String  serverName;

    DisCernImgApi(int discernType, String serverName) {
        this.discernType = discernType;
        this.serverName = serverName;
    }

    public int getDiscernType() {
        return discernType;
    }

    public void setDiscernType(int discernType) {
        this.discernType = discernType;
    }

    public String getServerName() {
        return serverName;
    }

    public void setServerName(String serverName) {
        this.serverName = serverName;
    }
}
