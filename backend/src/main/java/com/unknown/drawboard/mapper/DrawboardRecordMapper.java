package com.unknown.drawboard.mapper;

import com.alibaba.fastjson.JSONObject;
import com.unknown.drawboard.base.Mapper;
import com.unknown.drawboard.entity.DrawboardRecord;

import java.util.List;

public interface DrawboardRecordMapper extends Mapper<DrawboardRecord> {
    int addRecord(JSONObject jsonObject);
    List<JSONObject> getRecordList(Integer user_id);
}