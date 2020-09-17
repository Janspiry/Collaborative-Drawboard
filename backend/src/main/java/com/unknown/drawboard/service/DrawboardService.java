package com.unknown.drawboard.service;

import com.alibaba.fastjson.JSONObject;
import com.unknown.drawboard.base.Service;
import com.unknown.drawboard.entity.Drawboard;


/**
 * Created by CodeGenerator on 2020/08/18.
 */
public interface DrawboardService extends Service<Drawboard> {
    JSONObject addRecord(JSONObject jsonObject);
    JSONObject getRecordList(Integer user_id);
    JSONObject deleteRecord(Integer id);
}
