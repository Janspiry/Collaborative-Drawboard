package com.unknown.drawboard.mapper;

import com.alibaba.fastjson.JSONObject;

import java.util.Set;

/**
 * @author: Janspiry
 * @description: 权限
 * @date: 2020/8/14 20:55
 */
public interface PermissionMapper {
	/**
	 * 查询用户的角色 菜单 权限
	 */
	JSONObject getUserPermission(String username);

	/**
	 * 查询所有的菜单
	 */
	Set<String> getAllMenu();

	/**
	 * 查询所有的权限
	 */
	Set<String> getAllPermission();
}
