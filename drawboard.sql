/*
Navicat MySQL Data Transfer

Source Server         : myself
Source Server Version : 80021
Source Host           : localhost:3306
Source Database       : drawboard

Target Server Type    : MYSQL
Target Server Version : 80021
File Encoding         : 65001

Date: 2020-09-17 13:26:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for drawboard
-- ----------------------------
DROP TABLE IF EXISTS `drawboard`;
CREATE TABLE `drawboard` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '标识ID',
  `session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '会话iD',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '会话密码',
  `user_id` int DEFAULT NULL COMMENT '所属用户',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '画布名称',
  `context` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '画布内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of drawboard
-- ----------------------------
INSERT INTO `drawboard` VALUES ('1', '11111111', '11111111', '10003', '2020-08-19 21:39:48', '2020-09-06 19:45:11', '测试画板', '{\"version\":\"3.6.3\",\"objects\":[{\"type\":\"path\",\"version\":\"3.6.3\",\"originX\":\"left\",\"originY\":\"top\",\"left\":315,\"top\":156,\"width\":21,\"height\":172.01,\"fill\":null,\"stroke\":\"#4D4D4D\",\"strokeWidth\":4,\"strokeDashArray\":null,\"strokeLineCap\":\"round\",\"strokeDashOffset\":0,\"strokeLineJoin\":\"round\",\"strokeMiterLimit\":10,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"paintFirst\":\"fill\",\"globalCompositeOperation\":\"source-over\",\"transformMatrix\":null,\"skewX\":0,\"skewY\":0,\"path\":[[\"M\",317,157.996],[\"Q\",317,158,317,158.5],[\"Q\",317,159,317,167],[\"Q\",317,175,321,197.5],[\"Q\",325,220,328.5,239.5],[\"Q\",332,259,333.5,272],[\"Q\",335,285,336,295],[\"Q\",337,305,337.5,312.5],[\"Q\",338,320,338,324],[\"Q\",338,328,338,329],[\"L\",338,330.004]]},{\"type\":\"path\",\"version\":\"3.6.3\",\"originX\":\"left\",\"originY\":\"top\",\"left\":650,\"top\":125,\"width\":192.01,\"height\":157,\"fill\":null,\"stroke\":\"#4D4D4D\",\"strokeWidth\":4,\"strokeDashArray\":null,\"strokeLineCap\":\"round\",\"strokeDashOffset\":0,\"strokeLineJoin\":\"round\",\"strokeMiterLimit\":10,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"paintFirst\":\"fill\",\"globalCompositeOperation\":\"source-over\",\"transformMatrix\":null,\"skewX\":0,\"skewY\":0,\"path\":[[\"M\",651.996,126.996],[\"Q\",652,127,661.5,127],[\"Q\",671,127,703,133],[\"Q\",735,139,744.5,144],[\"Q\",754,149,759,153],[\"Q\",764,157,767,163.5],[\"Q\",770,170,770.5,175.5],[\"Q\",771,181,769,188.5],[\"Q\",767,196,759.5,203.5],[\"Q\",752,211,739,220.5],[\"Q\",726,230,709.5,242],[\"Q\",693,254,681.5,261.5],[\"Q\",670,269,664,274],[\"Q\",658,279,657,280],[\"Q\",656,281,655.5,282],[\"Q\",655,283,655.5,283.5],[\"Q\",656,284,659,284],[\"Q\",662,284,667.5,284],[\"Q\",673,284,689.5,283],[\"Q\",706,282,731,278.5],[\"Q\",756,275,776,271],[\"Q\",796,267,808.5,264],[\"Q\",821,261,829.5,259.5],[\"Q\",838,258,841,257],[\"L\",844.004,255.996]]},{\"type\":\"path\",\"version\":\"3.6.3\",\"originX\":\"left\",\"originY\":\"top\",\"left\":832,\"top\":141,\"width\":219.8,\"height\":268.83,\"fill\":null,\"stroke\":\"#4D4D4D\",\"strokeWidth\":4,\"strokeDashArray\":null,\"strokeLineCap\":\"round\",\"strokeDashOffset\":0,\"strokeLineJoin\":\"round\",\"strokeMiterLimit\":10,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"paintFirst\":\"fill\",\"globalCompositeOperation\":\"source-over\",\"transformMatrix\":null,\"skewX\":0,\"skewY\":0,\"path\":[[\"M\",975.996,142.996],[\"Q\",976,143,982.5,144.5],[\"Q\",989,146,998.5,150.5],[\"Q\",1008,155,1014,159.5],[\"Q\",1020,164,1023.5,168],[\"Q\",1027,172,1028.5,177.5],[\"Q\",1030,183,1030,189],[\"Q\",1030,195,1023.5,203.5],[\"Q\",1017,212,1007,221.5],[\"Q\",997,231,986.5,239],[\"Q\",976,247,970,252.5],[\"Q\",964,258,962.5,260.5],[\"Q\",961,263,961,264.5],[\"Q\",961,266,964,270],[\"Q\",967,274,974,278],[\"Q\",981,282,990.5,287],[\"Q\",1000,292,1010.5,297.5],[\"Q\",1021,303,1031,309.5],[\"Q\",1041,316,1046,322],[\"Q\",1051,328,1052.5,333],[\"Q\",1054,338,1053.5,344.5],[\"Q\",1053,351,1047.5,358],[\"Q\",1042,365,1018,378],[\"Q\",994,391,973.5,397.5],[\"Q\",953,404,932,407.5],[\"Q\",911,411,891.5,411.5],[\"Q\",872,412,858.5,411],[\"Q\",845,410,839.5,407],[\"L\",833.996,403.996]]},{\"type\":\"path\",\"version\":\"3.6.3\",\"originX\":\"left\",\"originY\":\"top\",\"left\":239,\"top\":232,\"width\":925.01,\"height\":26,\"fill\":null,\"stroke\":\"#4D4D4D\",\"strokeWidth\":4,\"strokeDashArray\":null,\"strokeLineCap\":\"round\",\"strokeDashOffset\":0,\"strokeLineJoin\":\"round\",\"strokeMiterLimit\":10,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"paintFirst\":\"fill\",\"globalCompositeOperation\":\"source-over\",\"transformMatrix\":null,\"skewX\":0,\"skewY\":0,\"path\":[[\"M\",240.996,234],[\"Q\",241,234,242,234],[\"Q\",243,234,245.5,234],[\"Q\",248,234,258,234],[\"Q\",268,234,295,236.5],[\"Q\",322,239,376.5,243],[\"Q\",431,247,504.5,248],[\"Q\",578,249,657.5,249],[\"Q\",737,249,808.5,249],[\"Q\",880,249,938.5,250],[\"Q\",997,251,1037,253.5],[\"Q\",1077,256,1099.5,257.5],[\"Q\",1122,259,1133,259.5],[\"Q\",1144,260,1151.5,260],[\"Q\",1159,260,1160,260],[\"Q\",1161,260,1162,260],[\"Q\",1163,260,1164.5,260],[\"L\",1166.004,260]]},{\"type\":\"path\",\"version\":\"3.6.3\",\"originX\":\"left\",\"originY\":\"top\",\"left\":274,\"top\":142,\"width\":1,\"height\":300.01,\"fill\":null,\"stroke\":\"#4D4D4D\",\"strokeWidth\":4,\"strokeDashArray\":null,\"strokeLineCap\":\"round\",\"strokeDashOffset\":0,\"strokeLineJoin\":\"round\",\"strokeMiterLimit\":10,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"paintFirst\":\"fill\",\"globalCompositeOperation\":\"source-over\",\"transformMatrix\":null,\"skewX\":0,\"skewY\":0,\"path\":[[\"M\",277,143.996],[\"Q\",277,144,277,179.5],[\"Q\",277,215,277,231],[\"Q\",277,247,277,263.5],[\"Q\",277,280,277,297.5],[\"Q\",277,315,277,331.5],[\"Q\",277,348,277,363],[\"Q\",277,378,277,389],[\"Q\",277,400,277,407.5],[\"Q\",277,415,276.5,421],[\"Q\",276,427,276,431.5],[\"Q\",276,436,276,438.5],[\"Q\",276,441,276,442.5],[\"L\",276,444.004]]}]}');
INSERT INTO `drawboard` VALUES ('3', '33333333', '33333333', '10003', '2020-08-19 21:40:24', '2020-09-05 00:03:00', '微信小程序计划', '{\"version\":\"3.6.3\",\"objects\":[{\"type\":\"textbox\",\"version\":\"3.6.3\",\"originX\":\"left\",\"originY\":\"top\",\"left\":585,\"top\":167,\"width\":150,\"height\":22.6,\"fill\":\"rgb(0,0,0)\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeDashOffset\":0,\"strokeLineJoin\":\"miter\",\"strokeMiterLimit\":4,\"scaleX\":2.54,\"scaleY\":2.54,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"paintFirst\":\"fill\",\"globalCompositeOperation\":\"source-over\",\"transformMatrix\":null,\"skewX\":0,\"skewY\":0,\"text\":\"方\",\"fontSize\":20,\"fontWeight\":\"normal\",\"fontFamily\":\"Times New Roman\",\"fontStyle\":\"normal\",\"lineHeight\":1.16,\"underline\":false,\"overline\":false,\"linethrough\":false,\"textAlign\":\"left\",\"textBackgroundColor\":\"\",\"charSpacing\":0,\"minWidth\":20,\"splitByGrapheme\":false,\"styles\":{}}]}');
INSERT INTO `drawboard` VALUES ('4', '44444444', '44444444', '10004', '2020-08-19 21:40:24', '2020-09-10 20:20:46', '微积分1', '{\"version\":\"3.6.3\",\"objects\":[{\"type\":\"path\",\"version\":\"3.6.3\",\"originX\":\"left\",\"originY\":\"top\",\"left\":174,\"top\":130,\"width\":599.01,\"height\":7,\"fill\":null,\"stroke\":\"#4D4D4D\",\"strokeWidth\":4,\"strokeDashArray\":null,\"strokeLineCap\":\"round\",\"strokeDashOffset\":0,\"strokeLineJoin\":\"round\",\"strokeMiterLimit\":10,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"paintFirst\":\"fill\",\"globalCompositeOperation\":\"source-over\",\"transformMatrix\":null,\"skewX\":0,\"skewY\":0,\"path\":[[\"M\",175.996,133],[\"Q\",176,133,177,132.5],[\"Q\",178,132,181,132],[\"Q\",184,132,190,132],[\"Q\",196,132,217.5,132],[\"Q\",239,132,274,132],[\"Q\",309,132,387.5,132],[\"Q\",466,132,520.5,132.5],[\"Q\",575,133,622.5,133],[\"Q\",670,133,699,134.5],[\"Q\",728,136,740.5,136.5],[\"Q\",753,137,758.5,137],[\"Q\",764,137,766.5,137.5],[\"Q\",769,138,770.5,138],[\"Q\",772,138,773.5,138.5],[\"L\",775.004,139.004]]},{\"type\":\"path\",\"version\":\"3.6.3\",\"originX\":\"left\",\"originY\":\"top\",\"left\":377,\"top\":71,\"width\":2,\"height\":212.01,\"fill\":null,\"stroke\":\"#4D4D4D\",\"strokeWidth\":4,\"strokeDashArray\":null,\"strokeLineCap\":\"round\",\"strokeDashOffset\":0,\"strokeLineJoin\":\"round\",\"strokeMiterLimit\":10,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"paintFirst\":\"fill\",\"globalCompositeOperation\":\"source-over\",\"transformMatrix\":null,\"skewX\":0,\"skewY\":0,\"path\":[[\"M\",379,72.996],[\"Q\",379,73,380,77.5],[\"Q\",381,82,381,94.5],[\"Q\",381,107,381,123.5],[\"Q\",381,140,381,156.5],[\"Q\",381,173,381,191],[\"Q\",381,209,381,221.5],[\"Q\",381,234,381,242.5],[\"Q\",381,251,381,258.5],[\"Q\",381,266,381,270.5],[\"Q\",381,275,381,278],[\"Q\",381,281,381,283],[\"L\",381,285.004]]},{\"type\":\"path\",\"version\":\"3.6.3\",\"originX\":\"left\",\"originY\":\"top\",\"left\":547,\"top\":91,\"width\":0,\"height\":184.01,\"fill\":null,\"stroke\":\"#4D4D4D\",\"strokeWidth\":4,\"strokeDashArray\":null,\"strokeLineCap\":\"round\",\"strokeDashOffset\":0,\"strokeLineJoin\":\"round\",\"strokeMiterLimit\":10,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"paintFirst\":\"fill\",\"globalCompositeOperation\":\"source-over\",\"transformMatrix\":null,\"skewX\":0,\"skewY\":0,\"path\":[[\"M\",549,92.996],[\"Q\",549,93,549,94],[\"Q\",549,95,549,106],[\"Q\",549,117,549,131.5],[\"Q\",549,146,549,163.5],[\"Q\",549,181,549,195],[\"Q\",549,209,549,220.5],[\"Q\",549,232,549,241],[\"Q\",549,250,549,257.5],[\"Q\",549,265,549,271],[\"L\",549,277.004]]}]}');

-- ----------------------------
-- Table structure for drawboard_record
-- ----------------------------
DROP TABLE IF EXISTS `drawboard_record`;
CREATE TABLE `drawboard_record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `drawboard_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of drawboard_record
-- ----------------------------
INSERT INTO `drawboard_record` VALUES ('11', '1', '10004');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int NOT NULL DEFAULT '0' COMMENT '自定id,主要供前端展示权限列表分类排序使用.',
  `menu_code` varchar(255) DEFAULT '' COMMENT '归属菜单,前端判断并展示菜单使用,',
  `menu_name` varchar(255) DEFAULT '' COMMENT '菜单的中文释义',
  `permission_code` varchar(255) DEFAULT '' COMMENT '权限的代码/通配符,对应代码中@RequiresPermissions 的value',
  `permission_name` varchar(255) DEFAULT '' COMMENT '本权限的中文释义',
  `required_permission` tinyint(1) DEFAULT '2' COMMENT '是否本菜单必选权限, 1.必选 2非必选 通常是"列表"权限是必选',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台权限表';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('103', 'drawboard', '画板协作', 'drawboard:list', '列表', '2');
INSERT INTO `sys_permission` VALUES ('104', 'drawboard', '画板协作', 'drawboard:delete', '删除', '2');
INSERT INTO `sys_permission` VALUES ('105', 'drawboard', '画板协作', 'drawboard:update', '更新', '2');
INSERT INTO `sys_permission` VALUES ('106', 'alldrawboard', '所有画板', 'drawboard:list', '列表', '2');
INSERT INTO `sys_permission` VALUES ('601', 'user', '用户', 'user:list', '列表', '1');
INSERT INTO `sys_permission` VALUES ('602', 'user', '用户', 'user:add', '新增', '2');
INSERT INTO `sys_permission` VALUES ('603', 'user', '用户', 'user:update', '修改', '2');
INSERT INTO `sys_permission` VALUES ('701', 'role', '角色权限', 'role:list', '列表', '1');
INSERT INTO `sys_permission` VALUES ('702', 'role', '角色权限', 'role:add', '新增', '2');
INSERT INTO `sys_permission` VALUES ('703', 'role', '角色权限', 'role:update', '修改', '2');
INSERT INTO `sys_permission` VALUES ('704', 'role', '角色权限', 'role:delete', '删除', '2');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) DEFAULT NULL COMMENT '角色名',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_status` varchar(1) DEFAULT '1' COMMENT '是否有效  1有效  2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', '2017-11-22 16:24:34', '2017-11-22 16:24:52', '1');
INSERT INTO `sys_role` VALUES ('2', '用户', '2017-11-22 16:24:34', '2020-08-15 14:58:27', '1');
INSERT INTO `sys_role` VALUES ('3', '程序员', '2017-11-22 16:28:47', '2017-11-22 16:28:47', '1');
INSERT INTO `sys_role` VALUES ('4', '测试员', '2020-08-15 14:58:35', '2020-08-15 14:58:41', '1');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL COMMENT '角色id',
  `permission_id` int DEFAULT NULL COMMENT '权限id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_status` varchar(1) DEFAULT '1' COMMENT '是否有效 1有效     2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='角色-权限关联表';

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('64', '2', '601', '2020-09-11 00:04:18', '2020-09-11 00:11:35', '2');
INSERT INTO `sys_role_permission` VALUES ('65', '2', '104', '2020-09-11 00:10:57', '2020-09-11 00:11:35', '2');
INSERT INTO `sys_role_permission` VALUES ('66', '2', '105', '2020-09-11 00:10:57', '2020-09-11 00:11:35', '2');
INSERT INTO `sys_role_permission` VALUES ('67', '2', '106', '2020-09-11 00:14:52', '2020-09-11 00:14:52', '1');
INSERT INTO `sys_role_permission` VALUES ('68', '2', '103', '2020-09-11 00:15:31', '2020-09-11 00:15:31', '1');
INSERT INTO `sys_role_permission` VALUES ('69', '2', '104', '2020-09-11 00:15:31', '2020-09-11 00:15:31', '1');
INSERT INTO `sys_role_permission` VALUES ('70', '2', '105', '2020-09-11 00:15:31', '2020-09-11 00:15:31', '1');
INSERT INTO `sys_role_permission` VALUES ('71', '4', '103', '2020-09-11 00:16:21', '2020-09-11 00:16:21', '1');
INSERT INTO `sys_role_permission` VALUES ('72', '4', '104', '2020-09-11 00:16:21', '2020-09-11 00:16:21', '1');
INSERT INTO `sys_role_permission` VALUES ('73', '4', '105', '2020-09-11 00:16:21', '2020-09-11 00:16:21', '1');
INSERT INTO `sys_role_permission` VALUES ('74', '4', '106', '2020-09-11 00:16:21', '2020-09-11 00:16:21', '1');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `role_id` int DEFAULT '0' COMMENT '角色ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `delete_status` varchar(1) DEFAULT '1' COMMENT '是否有效  1有效  2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10012 DEFAULT CHARSET=utf8 COMMENT='运营后台用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('10003', 'admin', '123456', '超级管理员', '1', '2017-10-30 11:52:38', '2020-08-15 15:01:23', '1');
INSERT INTO `sys_user` VALUES ('10004', 'user1', '123456', '张三', '2', '2017-10-30 16:13:02', '2020-08-15 15:05:01', '1');
