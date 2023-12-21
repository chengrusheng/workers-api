/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : worker

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 21/12/2023 13:57:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `department_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门地址',
  `pid` bigint(20) NOT NULL COMMENT '所属部门编号',
  `parent_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属部门名称',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `is_delete` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除(0-未删除 1-已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES (1, '广州码农信息技术有限公司', '020-8888888', '广州市天河区', 0, '顶级部门', 0, 0);
INSERT INTO `sys_department` VALUES (2, '软件技术部', '020-88881001', '广州市天河区', 1, '广州码农信息技术有限公司', 1, 0);
INSERT INTO `sys_department` VALUES (3, '人事管理部', '020-88881002', '广州市天河区', 1, '广州码农信息技术有限公司', 1, 0);
INSERT INTO `sys_department` VALUES (4, '市场管理部', '020-88881003', '广州市天河区', 1, '广州码农信息技术有限公司', 1, 0);
INSERT INTO `sys_department` VALUES (5, '软件研发部', '020-88881234', '广州市天河区', 1, '广州码农信息技术有限公司', 2, 0);
INSERT INTO `sys_department` VALUES (6, 'Java技术部', '020-12345678', '广州市天河区', 2, '软件技术部', NULL, 1);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限编号',
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父权限ID',
  `parent_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父权限名称',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权标识符',
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由地址',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由名称',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权路径',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '权限类型(0-目录 1-菜单 2-按钮)',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `is_delete` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除(0-未删除，1-已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, '系统管理', 0, '顶级菜单', 'sys:manager', '/system', 'system', '/system/system', 0, 'el-icon-menu', '2022-04-25 14:40:32', '2022-04-25 14:40:32', NULL, 0, 0);
INSERT INTO `sys_permission` VALUES (2, '部门管理', 1, '系统管理', 'sys:department', '/department', 'department', '/system/department/department', 1, 'el-icon-s-tools', '2022-04-25 14:40:32', '2022-04-25 14:40:32', NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (3, '新增', 2, '部门管理', 'sys:department:add', NULL, NULL, NULL, 2, 'el-icon-plus', '2022-04-25 14:40:32', '2022-04-25 14:40:32', NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (4, '修改', 2, '部门管理', 'sys:department:edit', NULL, NULL, NULL, 2, 'el-icon-edit', '2022-04-25 14:40:32', '2022-04-25 14:40:32', NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (5, '删除', 2, '部门管理', 'sys:department:delete', NULL, NULL, NULL, 2, 'el-icon-delete', '2022-04-25 14:40:32', '2022-04-25 14:40:32', NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (6, '用户管理', 1, '系统管理', 'sys:user', '/userList', 'userList', '/system/user/userList', 1, 'el-icon-s-custom', '2022-04-25 14:40:32', '2022-04-25 14:40:32', NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (7, '新增', 6, '用户管理', 'sys:user:add', NULL, NULL, NULL, 2, 'el-icon-plus', '2022-04-25 14:40:32', '2022-04-25 14:40:32', NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (8, '修改', 6, '用户管理', 'sys:user:edit', NULL, NULL, NULL, 2, 'el-icon-edit', '2022-04-25 14:40:32', '2022-04-25 14:40:32', NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (9, '删除', 6, '用户管理', 'sys:user:delete', NULL, NULL, NULL, 2, 'el-icon-delete', '2022-04-25 14:40:32', '2022-04-25 14:40:32', NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (10, '角色管理', 1, '系统管理', 'sys:role', '/roleList', 'roleList', '/system/role/roleList', 1, 'el-icon-s-tools', '2022-04-25 14:40:32', '2022-04-25 14:40:32', NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (11, '新增', 10, '角色管理', 'sys:role:add', NULL, NULL, NULL, 2, 'el-icon-plus', '2022-04-25 14:40:32', '2022-04-25 14:40:32', NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (12, '修改', 10, '角色管理', 'sys:role:edit', NULL, NULL, NULL, 2, 'el-icon-edit', '2022-04-25 14:40:32', '2022-04-25 14:40:32', NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (13, '删除', 10, '角色管理', 'sys:role:delete', NULL, NULL, NULL, 2, 'el-icon-delete', '2022-04-25 14:40:32', '2022-04-25 14:40:32', NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (14, '菜单管理', 1, '系统管理', 'sys:menu', '/menuList', 'menuList', '/system/menu/menuList', 1, 'el-icon-s-tools', '2022-04-25 14:40:32', '2022-04-25 14:40:32', NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (15, '新增', 14, '权限管理', 'sys:menu:add', NULL, NULL, NULL, 2, 'el-icon-plus', '2022-04-25 14:40:32', '2022-04-25 14:40:32', NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (16, '修改', 14, '权限管理', 'sys:menu:edit', NULL, NULL, NULL, 2, 'el-icon-edit', '2022-04-25 14:40:32', '2022-04-25 14:40:32', NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (17, '删除', 14, '权限管理', 'sys:menu:delete', NULL, NULL, NULL, 2, 'el-icon-delete', '2022-04-25 14:40:32', '2022-04-25 14:40:32', NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (18, '职工管理', 0, '顶级菜单', 'sys:resource', '/worker', 'resource', '/resource/index', 0, 'el-icon-menu', '2022-04-25 14:40:32', '2022-04-25 14:40:32', NULL, 2, 0);
INSERT INTO `sys_permission` VALUES (19, '职工列表', 18, '职工管理', 'sys:provider', '/workerList', 'workerList', '/worker/workerList', 1, 'el-icon-s-tools', '2022-04-25 14:40:32', '2022-04-25 14:40:32', NULL, 2, 0);
INSERT INTO `sys_permission` VALUES (20, '新增', 19, '供应商管理', 'sys:provider:add', NULL, NULL, NULL, 2, 'el-icon-plus', '2022-04-25 14:40:32', '2022-04-25 14:40:32', NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (21, '修改', 19, '供应商管理', 'sys:provider:edit', NULL, NULL, NULL, 2, 'el-icon-edit', '2022-04-25 14:40:32', '2022-04-25 14:40:32', NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (22, '删除', 19, '供应商管理', 'sys:provider:delete', NULL, NULL, NULL, 2, 'el-icon-delete', '2022-04-25 14:40:32', '2022-04-25 14:40:32', NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (23, '分配角色', 6, '用户管理', 'sys:user:assign', '', '', '', 2, 'el-icon-setting', NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (24, '分配权限', 10, '角色管理', 'sys:role:assign', '', '', '', 2, 'el-icon-setting', NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (25, '查询', 2, '部门管理', 'sys:department:select', '', '', '', 2, 'el-icon-search', NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (26, '查询', 6, '用户管理', 'sys:user:select', '', '', '', 2, 'el-icon-search', NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (27, '查询', 10, '角色管理', 'sys:role:select', '', '', '', 2, 'el-icon-search', NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (28, '查询', 14, '菜单管理', 'sys:menu:select', '', '', '', 2, 'el-icon-search', NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_permission` VALUES (29, '订单管理', 18, '资料管理', 'resource:order', '/resource/order', 'OrderList', '/resource/order/orderList', 1, 'el-icon-setting', NULL, NULL, NULL, 2, 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编码',
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_delete` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除(0-未删除，1-已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'ROLE_SYSTEM', '超级管理员', 1, '2022-04-25 14:44:23', '2022-04-25 14:44:23', NULL, 0);
INSERT INTO `sys_role` VALUES (2, 'ROLE_SYSTEM', '系统管理员', 1, '2022-04-25 14:44:23', '2022-04-25 14:44:23', '拥有系统管理功能模块的权限', 0);
INSERT INTO `sys_role` VALUES (3, 'ROLE_RESOURCE', '资料管理员', NULL, NULL, NULL, '拥有资料管理模块的功能权限', 0);

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `role_Id` bigint(20) NOT NULL COMMENT '角色ID',
  `permission_Id` bigint(20) NOT NULL COMMENT '权限ID'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES (1, 1);
INSERT INTO `sys_role_permission` VALUES (1, 2);
INSERT INTO `sys_role_permission` VALUES (1, 3);
INSERT INTO `sys_role_permission` VALUES (1, 4);
INSERT INTO `sys_role_permission` VALUES (1, 5);
INSERT INTO `sys_role_permission` VALUES (1, 25);
INSERT INTO `sys_role_permission` VALUES (1, 6);
INSERT INTO `sys_role_permission` VALUES (1, 7);
INSERT INTO `sys_role_permission` VALUES (1, 8);
INSERT INTO `sys_role_permission` VALUES (1, 9);
INSERT INTO `sys_role_permission` VALUES (1, 23);
INSERT INTO `sys_role_permission` VALUES (1, 26);
INSERT INTO `sys_role_permission` VALUES (1, 10);
INSERT INTO `sys_role_permission` VALUES (1, 11);
INSERT INTO `sys_role_permission` VALUES (1, 12);
INSERT INTO `sys_role_permission` VALUES (1, 13);
INSERT INTO `sys_role_permission` VALUES (1, 24);
INSERT INTO `sys_role_permission` VALUES (1, 27);
INSERT INTO `sys_role_permission` VALUES (1, 14);
INSERT INTO `sys_role_permission` VALUES (1, 15);
INSERT INTO `sys_role_permission` VALUES (1, 16);
INSERT INTO `sys_role_permission` VALUES (1, 17);
INSERT INTO `sys_role_permission` VALUES (1, 28);
INSERT INTO `sys_role_permission` VALUES (1, 18);
INSERT INTO `sys_role_permission` VALUES (1, 19);
INSERT INTO `sys_role_permission` VALUES (1, 20);
INSERT INTO `sys_role_permission` VALUES (1, 21);
INSERT INTO `sys_role_permission` VALUES (1, 22);
INSERT INTO `sys_role_permission` VALUES (2, 1);
INSERT INTO `sys_role_permission` VALUES (2, 2);
INSERT INTO `sys_role_permission` VALUES (2, 3);
INSERT INTO `sys_role_permission` VALUES (2, 4);
INSERT INTO `sys_role_permission` VALUES (2, 5);
INSERT INTO `sys_role_permission` VALUES (2, 25);
INSERT INTO `sys_role_permission` VALUES (2, 6);
INSERT INTO `sys_role_permission` VALUES (2, 7);
INSERT INTO `sys_role_permission` VALUES (2, 8);
INSERT INTO `sys_role_permission` VALUES (2, 9);
INSERT INTO `sys_role_permission` VALUES (2, 23);
INSERT INTO `sys_role_permission` VALUES (2, 26);
INSERT INTO `sys_role_permission` VALUES (2, 10);
INSERT INTO `sys_role_permission` VALUES (2, 11);
INSERT INTO `sys_role_permission` VALUES (2, 12);
INSERT INTO `sys_role_permission` VALUES (2, 13);
INSERT INTO `sys_role_permission` VALUES (2, 24);
INSERT INTO `sys_role_permission` VALUES (2, 27);
INSERT INTO `sys_role_permission` VALUES (2, 14);
INSERT INTO `sys_role_permission` VALUES (2, 15);
INSERT INTO `sys_role_permission` VALUES (2, 16);
INSERT INTO `sys_role_permission` VALUES (2, 17);
INSERT INTO `sys_role_permission` VALUES (2, 28);
INSERT INTO `sys_role_permission` VALUES (3, 18);
INSERT INTO `sys_role_permission` VALUES (3, 19);
INSERT INTO `sys_role_permission` VALUES (3, 20);
INSERT INTO `sys_role_permission` VALUES (3, 21);
INSERT INTO `sys_role_permission` VALUES (3, 22);
INSERT INTO `sys_role_permission` VALUES (3, 29);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录名称(用户名)',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `is_account_non_expired` tinyint(4) NOT NULL COMMENT '帐户是否过期(1-未过期，0-已过期)',
  `is_account_non_locked` tinyint(4) NOT NULL COMMENT '帐户是否被锁定(1-未过期，0-已过期)',
  `is_credentials_non_expired` tinyint(4) NOT NULL COMMENT '密码是否过期(1-未过期，0-已过期)',
  `is_enabled` tinyint(4) NOT NULL COMMENT '帐户是否可用(1-可用，0-禁用)',
  `real_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `department_id` bigint(20) NULL DEFAULT NULL COMMENT '所属部门ID',
  `department_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门名称',
  `gender` tinyint(4) NOT NULL COMMENT '性别(0-男，1-女)',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'https://manong-authority.oss-cn-guangzhou.aliyuncs.com/avatar/default-avatar.gif' COMMENT '用户头像',
  `is_admin` tinyint(4) NULL DEFAULT 0 COMMENT '是否是管理员(1-管理员)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除(0-未删除，1-已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$TdEVQtGCkpo8L.jKjFB3/uxV5xkkDfiy0zoCa.ZS2yAXHe7H95OIC', 1, 1, 1, 1, '李明', '超级管理员', 1, '广州码农信息技术有限公司', 0, '13242587415', 'liming@163.com', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 1, NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (2, 'liming', '$2a$10$WwhJ8dBezfyMFIn19.ELru58K65k6N2tgewtv2sWdClKiRCjC55wG', 1, 1, 1, 1, '黎明', '黎明', 2, '软件技术部', 0, '13262365412578', '', 'https://manong-authority.oss-cn-guangzhou.aliyuncs.com/avatar/default-avatar.gif', 0, NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (3, 'zhangsan', '$2a$10$iBQbmrAEBE5B84/U3RY7c.zhObI4aIpjl807FV4LzL/uay7arIcpu', 1, 1, 1, 1, '张三', '张三', 2, '软件技术部', 0, '13245678965', 'zhangsan@163.com', 'https://manong-authority.oss-cn-guangzhou.aliyuncs.com/avatar/2022/05/16/bfa834a4c9424461a1ea0cbf8d4c9105-5acd2ed959790ec52b2825cbbc11b72d.jpeg', 0, NULL, NULL, 1);
INSERT INTO `sys_user` VALUES (4, 'lisi', '$2a$10$QywHvELdRoFGiU6LKpd/X.LYpfaXETtS0pD4Nem2K3c0iMQwaZuAm', 1, 1, 1, 1, '李四', '李四', 2, '软件技术部', 0, '13754214568', '', 'https://manong-authority.oss-cn-guangzhou.aliyuncs.com/avatar/2022/05/16/8868a2bfb4364e0697f7c3d28f3d889a-5acd2ed959790ec52b2825cbbc11b72d.jpeg', 0, NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (5, 'wangwu', '$2a$10$O8uyPZFS9PLfR8JN.aMRi.l/YeykYYuKH.cg/HBAR.N4NJeNg8hQK', 1, 1, 1, 1, '王五', '王五', 2, '软件技术部', 0, '13212345678', '', 'https://manong-authority.oss-cn-guangzhou.aliyuncs.com/avatar/2022/05/16/fe664c1e45bb4e39a719cd3f6d95232a-male.jpg', 0, NULL, NULL, 0);
INSERT INTO `sys_user` VALUES (6, 'zhaoliu', '$2a$10$r45wkEYLHlteEr0KLI8y3.G506ylhQrEJkmGM.i2eHkcCnFvfbhCS', 1, 1, 1, 1, '赵六', '赵六', 2, '软件技术部', 0, '13212345676', '', 'https://manong-authority.oss-cn-guangzhou.aliyuncs.com/avatar/2022/05/16/8868a2bfb4364e0697f7c3d28f3d889a-5acd2ed959790ec52b2825cbbc11b72d.jpeg', 0, NULL, NULL, 0);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `role_id` bigint(20) NOT NULL COMMENT '角色编号'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (4, 2);
INSERT INTO `sys_user_role` VALUES (6, 3);
INSERT INTO `sys_user_role` VALUES (5, 3);

-- ----------------------------
-- Table structure for worker
-- ----------------------------
DROP TABLE IF EXISTS `worker`;
CREATE TABLE `worker`  (
  `id` bigint(20) NOT NULL COMMENT '职工ID',
  `emp_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职员姓名',
  `sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `dept_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `emp_degree_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学历',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '职工表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of worker
-- ----------------------------
INSERT INTO `worker` VALUES (1737524635325886466, '张一', '男', 24, '业务部', '本科');
INSERT INTO `worker` VALUES (1737525084489695233, '张二', '女', 24, '人事部', '本科');
INSERT INTO `worker` VALUES (1737525562048954370, '张三', '男', 24, '后勤部', '大专');
INSERT INTO `worker` VALUES (1737525762985476097, '张四', '女', 28, '人事部', '大专');
INSERT INTO `worker` VALUES (1737525779817218049, '张五', '男', 29, '后勤部', '大专');
INSERT INTO `worker` VALUES (1737526535051997185, '张六', '女', 29, '后勤部', '本科');

SET FOREIGN_KEY_CHECKS = 1;
