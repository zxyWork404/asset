package com.asset.examine.mapper;


import com.asset.examine.domain.SxExamineLog;

import java.util.HashMap;
import java.util.List;

/**
 *  @author author
 */
public interface SxExamineLogMapper {

    int insertSxExamineLog(SxExamineLog object);

    int updateSxExamineLog(SxExamineLog object);

    int update(SxExamineLog object);

    List<SxExamineLog> querySxExamineLog(SxExamineLog object);

    SxExamineLog querySxExamineLogLimit1(SxExamineLog object);

    List<HashMap> querySxExamineLogList(SxExamineLog object);


}