package com.asset.examine.service.impl;

import com.asset.examine.domain.SxExamineLog;
import com.asset.examine.mapper.SxExamineLogMapper;
import com.asset.examine.service.SxExamineLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service
public class SxExamineLogServiceImpl implements SxExamineLogService {

    @Resource
    private SxExamineLogMapper sxExamineLogMapper;

    @Override
    public int insertSxExamineLog(SxExamineLog object) {
        return sxExamineLogMapper.insertSxExamineLog(object);
    }

    @Override
    public int updateSxExamineLog(SxExamineLog object) {
        return 0;
    }

    @Override
    public int update(SxExamineLog object) {
        return 0;
    }

    @Override
    public List<SxExamineLog> querySxExamineLog(SxExamineLog object) {
        return null;
    }

    @Override
    public SxExamineLog querySxExamineLogLimit1(SxExamineLog object) {
        return null;
    }

    @Override
    public List<HashMap> querySxExamineLogList(SxExamineLog object) {
        return sxExamineLogMapper.querySxExamineLogList(object);
    }
}
