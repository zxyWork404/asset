package com.asset.wechat.register.dao;

import com.asset.wechat.register.entity.SxRegister;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;


/**
 * [  ]
 *
 * @author zhangxiangyu
 * @version 1.0
 * @company 1024lab.net
 * @copyright (c) 2018 1024lab.netInc. All rights reserved.
 * @date 2021-07-11 16:19:48
 * @since JDK1.8
 */
@Mapper
@Component
public interface RegisterDao extends BaseMapper<SxRegister> {

}
