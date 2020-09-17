package com.unknown.drawboard.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.unknown.drawboard.entity.Drawboard;
import com.unknown.drawboard.entity.DrawboardRecord;
import com.unknown.drawboard.mapper.DrawboardRecordMapper;
import com.unknown.drawboard.service.DrawboardService;
import com.unknown.drawboard.base.AbstractService;
import com.unknown.drawboard.util.CommonUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Condition;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class DrawboardServiceImpl extends AbstractService<Drawboard> implements DrawboardService {
    @Resource
    private DrawboardRecordMapper drawboardRecordMapper;
    public JSONObject addRecord(JSONObject jsonObject) {
        Condition condition=new Condition(DrawboardRecord.class);
        Example.Criteria criteria = condition.createCriteria();
        criteria.andCondition("user_id="+jsonObject.getIntValue("user_id"));
        criteria.andCondition("drawboard_id="+jsonObject.getIntValue("drawboard_id"));
        List<DrawboardRecord> ret = drawboardRecordMapper.selectByCondition(condition);
        if (ret==null || ret.isEmpty()) {
            drawboardRecordMapper.addRecord(jsonObject);
        }
        return CommonUtil.successJson();
    };
    public JSONObject deleteRecord(Integer id) {
        drawboardRecordMapper.deleteByPrimaryKey(id);
        return CommonUtil.successJson();
    };
    public JSONObject getRecordList(Integer user_id) {
        List<JSONObject> list = drawboardRecordMapper.getRecordList(user_id);
        return CommonUtil.successPage(list);
    };
}
