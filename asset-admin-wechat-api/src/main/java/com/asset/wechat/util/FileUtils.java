package com.asset.wechat.util;

import com.asset.wechat.contstant.DisCernImgException;
import com.asset.wechat.contstant.SystemConstants;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Random;

public class FileUtils {

    /**
     * 上传文件到本地服务器磁盘
     * @param fileName 上传文件路径名称
     *                 例如: /static/upload/121321321.jpg
     *                      E:/upload/img/12013212.jpg
     * @param file
     * @return
     */
    public static String uploadFile(String fileName, MultipartFile file){

        //服务器端保存的文件对象
        File serverFile= new File(fileName);
        try {
            //判断文件是否已经存在
            if (serverFile.exists()) {
                throw new DisCernImgException(SystemConstants.PARAM_INCORRECT_CODE,"文件已存在");
            }
            //判断文件父目录是否存在
            if (!serverFile.getParentFile().exists()) {
                serverFile.getParentFile().mkdir();
            }
            //将上传的文件写入到服务器端文件内
            file.transferTo(serverFile);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
        return fileName;
    }

    /**
     * 随机数
     * @return
     */
    public static String genRandomName() {
        //取当前时间的长整形值包含毫秒
        long millis = System.currentTimeMillis();
        //加上三位随机数
        Random random = new Random();
        int end3 = random.nextInt(999);
        //如果不足三位前面补0
        String str = millis + String.format("%03d", end3);

        return str;
    }

}
