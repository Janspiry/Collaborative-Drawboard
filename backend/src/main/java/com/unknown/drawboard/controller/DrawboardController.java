package com.unknown.drawboard.controller;
import com.alibaba.fastjson.JSONObject;
import com.unknown.drawboard.util.CommonUtil;
import com.unknown.drawboard.entity.Drawboard;
import com.unknown.drawboard.service.DrawboardService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.*;
import tk.mybatis.mapper.entity.Condition;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by CodeGenerator on 2020/08/18.
 */
@RestController
@RequestMapping("/drawboard")
public class DrawboardController {
	@Resource
	private DrawboardService drawboardService;

//	@RequiresPermissions("drawboard:add")
	@PostMapping("/add")
	public JSONObject add(@RequestBody Drawboard drawboard) {
		drawboardService.save(drawboard);
		return CommonUtil.successJson();
	}

//	@RequiresPermissions("drawboard:delete")
	@PostMapping("/delete")
	public JSONObject delete(@RequestParam Integer id) {
		drawboardService.deleteById(id);
		return CommonUtil.successJson();
	}

//	@RequiresPermissions("drawboard:update")
	@PostMapping("/update")
	//RequestBody 与 RequestParam 的区别
	public JSONObject update(@RequestBody Drawboard drawboard) {
		System.out.println("保存画布,drawboard= "+drawboard);
		drawboardService.update(drawboard);
		return CommonUtil.successJson();
	}

//	@RequiresPermissions("drawboard:detail")
	@GetMapping("/detail")
	public JSONObject detail(@RequestParam Integer id) {
		Drawboard drawboard = drawboardService.findById(id);
		return CommonUtil.successJson(drawboard);
	}


	//查看我的发布
	@GetMapping("/myList")
	public JSONObject myList(@RequestParam Integer user_id) {
		Condition condition=new Condition(Drawboard.class);
		Example.Criteria criteria = condition.createCriteria();
		criteria.andCondition("user_id="+user_id);
		List<Drawboard> list = drawboardService.findByCondition(condition);

		List<JSONObject> ret=new ArrayList(); ;
		for(Drawboard i:list){
			JSONObject obj=new JSONObject();
			obj=(JSONObject)JSONObject.toJSON(i);
			ret.add(obj);
		}
		return CommonUtil.successPage(ret);
	}

	//查看所有发布
	@RequiresPermissions("drawboard:list")
	@GetMapping("/allList")
	public JSONObject allList() {

		List<Drawboard> list = drawboardService.findAll();
		List<JSONObject> ret=new ArrayList(); ;
		for(Drawboard i:list){
			JSONObject obj=new JSONObject();
			obj=(JSONObject)JSONObject.toJSON(i);
			ret.add(obj);
		}
		return CommonUtil.successPage(ret);
	}

	//添加浏览记录
	@PostMapping("/record/add")
	public JSONObject addRecord(@RequestBody JSONObject requestJson) {
		return drawboardService.addRecord(requestJson);
	}

	//删除浏览记录
	@PostMapping("/record/delete")
	public JSONObject deleteRecord(@RequestParam Integer id) {
		return drawboardService.deleteRecord(id);
	}

	//查看浏览记录
	@GetMapping("/record/list")
	public JSONObject getRecordList(@RequestParam Integer user_id) {
		return drawboardService.getRecordList(user_id);
	}



}
