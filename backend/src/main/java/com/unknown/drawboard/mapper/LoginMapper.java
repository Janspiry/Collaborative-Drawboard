package com.unknown.drawboard.mapper;

import com.alibaba.fastjson.JSONObject;
import org.apache.ibatis.annotations.Param;

/**
 * @author: Janspiry
 * @description: 登录Mapper
 * @date: 2020/8/14 20:55
 */
public interface LoginMapper {
	/**
	 * 根据用户名和密码查询对应的用户
	 */
	JSONObject getUser(@Param("username") String username, @Param("password") String password);
}
