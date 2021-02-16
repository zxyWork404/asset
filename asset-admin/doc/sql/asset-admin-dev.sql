/*
 Navicat MySQL Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : asset-admin-dev

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 08/02/2021 13:55:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CALENDAR_NAME` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('devClusteredScheduler', 'TRIGGER_23', 'DEFAULT', '*/5 * * * * ?', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ENTRY_ID` varchar(95) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `JOB_GROUP` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_DURABLE` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('devClusteredScheduler', 'TASK_23', 'DEFAULT', NULL, 'com.asset.module.support.quartz.service.QuartzTask', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000B5441534B5F504152414D53740001337800);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LOCK_NAME` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_LOCKS` VALUES ('devClusteredScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('devClusteredScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('devClusteredScheduler', 'localhost1612711735158', 1612763733960, 60000);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STR_PROP_1` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STR_PROP_2` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STR_PROP_3` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INT_PROP_1` int DEFAULT NULL,
  `INT_PROP_2` int DEFAULT NULL,
  `LONG_PROP_1` bigint DEFAULT NULL,
  `LONG_PROP_2` bigint DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint DEFAULT NULL,
  `PREV_FIRE_TIME` bigint DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MISFIRE_INSTR` smallint DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_TRIGGERS` VALUES ('devClusteredScheduler', 'TRIGGER_23', 'DEFAULT', 'TASK_23', 'DEFAULT', NULL, 1612756665000, -1, 5, 'PAUSED', 'CRON', 1612756663000, 0, NULL, 2, '');
COMMIT;

-- ----------------------------
-- Table structure for sx_examineLog
-- ----------------------------
DROP TABLE IF EXISTS `sx_examineLog`;
CREATE TABLE `sx_examineLog` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code_id` int DEFAULT NULL COMMENT '申请人id',
  `type` int DEFAULT NULL COMMENT '申请类型 1:注册，2:入会，3项目发起申请，4:承销流程',
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审核项目',
  `resultType` int DEFAULT NULL COMMENT '审核结果 1:通过，2:不通过',
  `endType` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审核是否结束 1:结束，2:审核中',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='审核流程记录表';

-- ----------------------------
-- Records of sx_examineLog
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sx_membership
-- ----------------------------
DROP TABLE IF EXISTS `sx_membership`;
CREATE TABLE `sx_membership` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `register_id` int DEFAULT NULL COMMENT '用户注册ID',
  `isNoExamine` int DEFAULT NULL COMMENT '是否审核通过',
  `isNoCancellation` int DEFAULT NULL COMMENT '是否注销 1:正常，2:注销',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户入会信息表';

-- ----------------------------
-- Records of sx_membership
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sx_register
-- ----------------------------
DROP TABLE IF EXISTS `sx_register`;
CREATE TABLE `sx_register` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `codeCard` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构代码/身份证',
  `name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称/姓名',
  `contacts` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系人',
  `phone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `qualifications` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资质',
  `openid` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户属性',
  `appid` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小程序属性',
  `isNoExamine` int DEFAULT NULL COMMENT '是否审核通过 1:审核通过，2审核不通过',
  `registerType` int DEFAULT NULL COMMENT '注册人属性 1:备案机构,2管理人,3发行人，4担保人，5承销商，6投资人或则个人，机构',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户注册基础表 ';

-- ----------------------------
-- Records of sx_register
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '部门主键id',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部门名称',
  `short_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门简称',
  `manager_id` int unsigned DEFAULT NULL COMMENT '部门负责人id',
  `parent_id` int unsigned DEFAULT NULL COMMENT '部门的父级id',
  `sort` int NOT NULL COMMENT '部门排序',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='部门表';

-- ----------------------------
-- Records of t_department
-- ----------------------------
BEGIN;
INSERT INTO `t_department` VALUES (1, '小山数科资产管理', 'ZWGWL', 16, 0, 1, '2019-04-03 10:41:25', '2019-04-03 10:41:25');
INSERT INTO `t_department` VALUES (33, 'A产品类型', NULL, NULL, 1, 33, '2021-02-08 11:41:30', '2021-02-08 11:41:30');
INSERT INTO `t_department` VALUES (34, 'B产品类型', NULL, NULL, 1, 34, '2021-02-08 11:41:52', '2021-02-08 11:41:52');
INSERT INTO `t_department` VALUES (35, '管理人', NULL, NULL, 33, 35, '2021-02-08 11:42:30', '2021-02-08 11:42:30');
INSERT INTO `t_department` VALUES (36, '备案机构', NULL, NULL, 33, 36, '2021-02-08 11:42:38', '2021-02-08 11:42:38');
INSERT INTO `t_department` VALUES (37, '管理人', NULL, NULL, 34, 37, '2021-02-08 11:43:08', '2021-02-08 11:43:08');
INSERT INTO `t_department` VALUES (38, '备案机构', NULL, NULL, 34, 38, '2021-02-08 11:43:18', '2021-02-08 11:43:18');
COMMIT;

-- ----------------------------
-- Table structure for t_email
-- ----------------------------
DROP TABLE IF EXISTS `t_email`;
CREATE TABLE `t_email` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `to_emails` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收件人',
  `send_status` tinyint NOT NULL DEFAULT '0' COMMENT '发送状态 0未发送 1已发送',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮件内容',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_email
-- ----------------------------
BEGIN;
INSERT INTO `t_email` VALUES (20, '新增测试12345', '新增测试@11.com', 1, '<p>这是内容</p>', '2019-08-30 15:35:12', '2019-08-30 15:35:12');
INSERT INTO `t_email` VALUES (21, 'b', 'asdf@33.com', 1, '<p>c</p>', '2019-09-06 14:25:33', '2019-09-06 14:25:33');
INSERT INTO `t_email` VALUES (23, 'string', 'string', 0, 'string', '2019-09-06 06:55:01', '2019-09-06 06:55:01');
INSERT INTO `t_email` VALUES (24, 'string', 'string', 0, 'string', '2019-09-06 06:55:01', '2019-09-06 06:55:01');
INSERT INTO `t_email` VALUES (26, 'string', 'string', 0, 'string', '2019-09-06 07:01:32', '2019-09-06 07:01:32');
INSERT INTO `t_email` VALUES (27, 'string', 'string', 0, 'string', '2019-09-06 07:01:32', '2019-09-06 07:01:32');
INSERT INTO `t_email` VALUES (37, 'ewqwe', '适者生存@22.cc', 1, '<p>qweqwe</p>', '2019-11-09 10:00:46', '2019-11-09 10:00:46');
INSERT INTO `t_email` VALUES (38, 'ewqwe', '适者生存@22.cc', 1, '<p>qweqwe</p>', '2019-11-09 10:00:49', '2019-11-09 10:00:49');
INSERT INTO `t_email` VALUES (39, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:04:54', '2019-11-09 10:04:54');
INSERT INTO `t_email` VALUES (40, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:04:57', '2019-11-09 10:04:57');
INSERT INTO `t_email` VALUES (41, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:04:57', '2019-11-09 10:04:57');
INSERT INTO `t_email` VALUES (42, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:04:58', '2019-11-09 10:04:58');
INSERT INTO `t_email` VALUES (43, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:04:59', '2019-11-09 10:04:59');
INSERT INTO `t_email` VALUES (44, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:04:59', '2019-11-09 10:04:59');
INSERT INTO `t_email` VALUES (45, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:05:16', '2019-11-09 10:05:16');
INSERT INTO `t_email` VALUES (46, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:06:29', '2019-11-09 10:06:29');
INSERT INTO `t_email` VALUES (47, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:07:02', '2019-11-09 10:07:02');
INSERT INTO `t_email` VALUES (48, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:07:16', '2019-11-09 10:07:16');
INSERT INTO `t_email` VALUES (49, '2342', '11@ss.cc', 1, '<p>234234</p>', '2019-11-09 10:08:13', '2019-11-09 10:08:13');
INSERT INTO `t_email` VALUES (50, '2342', '11@ss.cc', 1, '<p>234234</p>', '2019-11-09 10:08:30', '2019-11-09 10:08:30');
INSERT INTO `t_email` VALUES (51, '2342', '11@ss.cc', 1, '<p>234234</p>', '2019-11-09 10:08:50', '2019-11-09 10:08:50');
INSERT INTO `t_email` VALUES (52, '2342', '11@ss.cc', 1, '<p>234234</p>', '2019-11-09 10:09:09', '2019-11-09 10:09:09');
INSERT INTO `t_email` VALUES (53, '2342', '11@ss.cc', 1, '<p>234234</p>', '2019-11-09 10:09:31', '2019-11-09 10:09:31');
INSERT INTO `t_email` VALUES (54, '2342', '11@ss.cc', 1, '<p>234234</p>', '2019-11-09 10:12:24', '2019-11-09 10:12:24');
INSERT INTO `t_email` VALUES (55, '2342', '11@ss.cc', 1, '<p>234234</p>', '2019-11-09 10:13:13', '2019-11-09 10:13:13');
INSERT INTO `t_email` VALUES (56, 'asdasd', '3423@aqq.cc', 0, '<p>asdasd</p>', '2019-11-09 10:20:42', '2019-11-09 10:20:42');
INSERT INTO `t_email` VALUES (57, 'asdasd', '3423@aqq.cc', 0, '<p>asdasd</p>', '2019-11-09 10:20:52', '2019-11-09 10:20:52');
INSERT INTO `t_email` VALUES (58, 'asdasd', '3423@aqq.cc', 0, '<p>asdasd</p>', '2019-11-09 10:21:16', '2019-11-09 10:21:16');
INSERT INTO `t_email` VALUES (59, 'asdasd', '3423@aqq.cc', 0, '<p>asdasd</p>', '2019-11-09 10:21:24', '2019-11-09 10:21:24');
INSERT INTO `t_email` VALUES (60, 'asdasd', '3423@aqq.cc', 0, '<p>asdasd</p>', '2019-11-09 10:21:30', '2019-11-09 10:21:30');
INSERT INTO `t_email` VALUES (61, 'asdasd', '3423@aqq.cc', 0, '<p>asdasd</p>', '2019-11-09 10:21:53', '2019-11-09 10:21:53');
INSERT INTO `t_email` VALUES (62, 'a21312', '23423@qq.cc', 0, '<p>asdasdas</p>', '2019-11-09 10:23:40', '2019-11-09 10:23:40');
INSERT INTO `t_email` VALUES (63, '11', '1234@qq.com', 0, '<p>23</p>', '2019-11-15 15:35:12', '2019-11-15 15:35:12');
INSERT INTO `t_email` VALUES (64, '11', '1234@qq.com', 0, '<p>23</p>', '2019-11-15 15:35:15', '2019-11-15 15:35:15');
INSERT INTO `t_email` VALUES (65, '11', '1234@qq.com', 0, '<p>23</p>', '2019-11-15 15:35:16', '2019-11-15 15:35:16');
INSERT INTO `t_email` VALUES (66, 'eeee', '1234@qq.com', 0, '<p>&nbsp; &nbsp; eee2233<br></p>', '2019-11-15 17:00:00', '2019-11-15 17:00:00');
INSERT INTO `t_email` VALUES (67, 'eeee', '1234@qq.com', 0, '<p>&nbsp; &nbsp; eee2233<br></p>', '2019-11-15 17:00:03', '2019-11-15 17:00:03');
INSERT INTO `t_email` VALUES (68, 'eeee', '1234@qq.com', 0, '<p>&nbsp; &nbsp; eee2233<br></p>', '2019-11-15 17:00:04', '2019-11-15 17:00:04');
INSERT INTO `t_email` VALUES (69, '22223', '1017146812@qq.com', 0, '<p>&nbsp; &nbsp; e34233<br></p>', '2019-11-15 17:00:33', '2019-11-15 17:00:33');
INSERT INTO `t_email` VALUES (70, '22223', '1017146812@qq.com', 0, '<p>&nbsp; &nbsp; e34233<br></p>', '2019-11-15 17:00:34', '2019-11-15 17:00:34');
INSERT INTO `t_email` VALUES (71, '22223', '1017146812@qq.com', 0, '<p>&nbsp; &nbsp; e34233<br></p>', '2019-11-15 17:00:34', '2019-11-15 17:00:34');
INSERT INTO `t_email` VALUES (72, '22223', '12232', 0, '<p>&nbsp; &nbsp; e34233<br></p>', '2019-11-15 17:00:49', '2019-11-15 17:00:49');
INSERT INTO `t_email` VALUES (73, '22223', '12232@qq.com', 0, '<p>&nbsp; &nbsp; e34233<br></p>', '2019-11-15 17:00:56', '2019-11-15 17:00:56');
INSERT INTO `t_email` VALUES (74, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 08:51:44', '2019-11-16 08:51:44');
INSERT INTO `t_email` VALUES (75, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 09:05:10', '2019-11-16 09:05:10');
INSERT INTO `t_email` VALUES (76, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 09:05:14', '2019-11-16 09:05:14');
INSERT INTO `t_email` VALUES (77, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 09:06:34', '2019-11-16 09:06:34');
INSERT INTO `t_email` VALUES (78, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 09:07:09', '2019-11-16 09:07:09');
INSERT INTO `t_email` VALUES (79, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 09:07:30', '2019-11-16 09:07:30');
INSERT INTO `t_email` VALUES (80, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 09:07:32', '2019-11-16 09:07:32');
INSERT INTO `t_email` VALUES (81, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 09:08:29', '2019-11-16 09:08:29');
INSERT INTO `t_email` VALUES (82, 'sdfs', 'ss@ss.cc', 0, '<p>dsdsf</p>', '2019-11-16 09:08:46', '2019-11-16 09:08:46');
INSERT INTO `t_email` VALUES (83, 'asdasd', 'asd@qq.vv', 0, '<p>asdas</p>', '2019-11-16 09:09:18', '2019-11-16 09:09:18');
INSERT INTO `t_email` VALUES (84, 'asdasd', 'asd@qq.vv', 0, '<p>asdas</p>', '2019-11-16 09:09:42', '2019-11-16 09:09:42');
INSERT INTO `t_email` VALUES (85, 'asdasd', 'asd@qq.vv', 0, '<p>asdas</p>', '2019-11-16 09:09:46', '2019-11-16 09:09:46');
INSERT INTO `t_email` VALUES (86, 'dasdad', 'dasda@ss.cc', 1, '<p>dasasdas</p>', '2019-11-16 09:10:05', '2019-11-16 09:10:05');
COMMIT;

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录帐号',
  `login_pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `actual_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工名称',
  `nick_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '别名',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `id_card` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '身份证',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `department_id` int unsigned NOT NULL COMMENT '部门id',
  `is_leave` int NOT NULL DEFAULT '0' COMMENT '是否离职1是',
  `is_disabled` int NOT NULL DEFAULT '0' COMMENT '是否被禁用 0否1是',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_user` int unsigned NOT NULL COMMENT '创建者id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_delete` int NOT NULL DEFAULT '0' COMMENT '是否删除0否 1是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工表';

-- ----------------------------
-- Records of t_employee
-- ----------------------------
BEGIN;
INSERT INTO `t_employee` VALUES (1, 'admin', 'c655798e4648c540812a1b8f48759af7', '管理员', '15515515515', '13112312131', '410306199202020020', '1992-02-02', NULL, 1, 0, 0, NULL, 0, '2021-02-07 11:17:54', '2018-05-11 09:38:54', 0);
INSERT INTO `t_employee` VALUES (41, 'zhangxiangyu', 'c655798e4648c540812a1b8f48759af7', '张向宇', 'zxy', '15201045723', '140522199510235932', '1995-10-23', '943738180@qq.com', 35, 0, 0, NULL, 1, '2021-02-08 11:45:40', '2021-02-08 11:45:40', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `module_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '相关业务id',
  `module_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '相关业务类型',
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `file_size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件大小',
  `file_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件类型，程序中枚举控制，文件类型：如身份证正面，三证合一等等',
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件key，用于文件下载',
  `file_location_type` int NOT NULL COMMENT '文件位置类型',
  `creater_user` int NOT NULL COMMENT '创建人，即上传人',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上次更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `module_id_module_type` (`module_id`,`module_type`) USING BTREE,
  KEY `module_type` (`module_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_file
-- ----------------------------
BEGIN;
INSERT INTO `t_file` VALUES (1, '1', '1', '阿里云1.jpg', NULL, NULL, 'backUser/config/d1788b717be24f14ba526f25397b936f', 2, 1, NULL, '2019-07-05 10:38:15');
INSERT INTO `t_file` VALUES (2, '2', '1', '1.jpg', NULL, NULL, 'backUser/config/8895ec770c4e4e558c6d9b54eb00dffc', 2, 1, '2019-07-18 09:20:59', '2019-07-18 09:20:25');
INSERT INTO `t_file` VALUES (3, '3', '1', '随笔.txt', NULL, NULL, 'backUser/config/f5cbc4c9a56f4fa7ad0ba58b0aa5d169', 2, 1, NULL, '2019-07-18 09:22:47');
INSERT INTO `t_file` VALUES (4, '3', '1', '1.jpg', NULL, NULL, 'backUser/config/2019071809245603e0a4e449a4bf3aa28ee731c309040.jpg', 1, 1, NULL, '2019-07-18 09:24:51');
INSERT INTO `t_file` VALUES (6, '4', '1', '1.jpg', NULL, NULL, 'backUser/config/ddcb8214ba274dec9bb2c33e0e246391', 3, 1, NULL, '2019-07-19 16:19:43');
INSERT INTO `t_file` VALUES (7, '5', '1', 'sql.txt', NULL, NULL, 'backUser/config/cfbdf9562c894405b5b6f64f71fa812a', 3, 1, NULL, '2019-07-19 17:41:55');
INSERT INTO `t_file` VALUES (9, '1', '1', '20190912023241a6132f5713b54e1fb490f4ea88115747.md', NULL, NULL, 'backUser/config/20190912023241a6132f5713b54e1fb490f4ea88115747.md', 1, 1, '2019-09-12 15:25:35', '2019-09-12 14:32:42');
INSERT INTO `t_file` VALUES (10, '1', '1', '201909120232499804998573f643ff8e58189d23485629.mjs', NULL, NULL, 'backUser/config/201909120232499804998573f643ff8e58189d23485629.mjs', 1, 1, '2019-09-12 15:25:19', '2019-09-12 14:32:50');
INSERT INTO `t_file` VALUES (11, '1', '1', '201909120326564cdc8df7b8cc49cfb273926877f047f5.json', NULL, NULL, 'backUser/config/201909120326564cdc8df7b8cc49cfb273926877f047f5.json', 1, 1, NULL, '2019-09-12 15:26:56');
INSERT INTO `t_file` VALUES (12, '1', '1', '201909120343357104b7f1cc684f5797ada35c06aba770.json', NULL, NULL, 'backUser/config/201909120343357104b7f1cc684f5797ada35c06aba770.json', 1, 1, NULL, '2019-09-12 15:43:36');
INSERT INTO `t_file` VALUES (13, '1', '1', '201909120343427e408141a0ea467ea2e012f7086a6265.json', NULL, NULL, 'backUser/config/201909120343427e408141a0ea467ea2e012f7086a6265.json', 1, 1, NULL, '2019-09-12 15:43:42');
INSERT INTO `t_file` VALUES (14, '1', '1', '20190912034543b4d3a061fb2e416c899fe2ff6b9327e0.ts', NULL, NULL, 'backUser/config/20190912034543b4d3a061fb2e416c899fe2ff6b9327e0.ts', 1, 1, NULL, '2019-09-12 15:45:43');
INSERT INTO `t_file` VALUES (15, '1', '1', '20190912034550a5dc04ce79b14a1cb2bb76545c909aa8.md', NULL, NULL, 'backUser/config/20190912034550a5dc04ce79b14a1cb2bb76545c909aa8.md', 1, 1, NULL, '2019-09-12 15:45:51');
INSERT INTO `t_file` VALUES (16, '1', '1', 'LICENCE', NULL, NULL, 'backUser/config/cc02b99c0ec548f1a2231b70b7d569b8', 2, 1, NULL, '2019-09-12 15:47:22');
INSERT INTO `t_file` VALUES (17, '1', '1', 'bignumber.min.js', NULL, NULL, 'backUser/config/bda49e8ad6d242fe8735b2023dfbf125', 2, 1, NULL, '2019-09-12 15:47:29');
INSERT INTO `t_file` VALUES (18, '1', '1', '20190912034880a881fa8fbc841bfb7194ff312bd1058.json', NULL, NULL, 'backUser/config/20190912034880a881fa8fbc841bfb7194ff312bd1058.json', 1, 1, NULL, '2019-09-12 15:48:08');
INSERT INTO `t_file` VALUES (19, '1', '1', '20190912034816ece14084acf345a79396a0f4347c4e44.md', NULL, NULL, 'backUser/config/20190912034816ece14084acf345a79396a0f4347c4e44.md', 1, 1, NULL, '2019-09-12 15:48:16');
INSERT INTO `t_file` VALUES (20, '1', '1', '20191024054412fac4b4e04c574c6eab71f91e13a8a0b6.jpg', NULL, NULL, 'backUser/config/20191024054412fac4b4e04c574c6eab71f91e13a8a0b6.jpg', 1, 1, NULL, '2019-10-24 17:44:13');
INSERT INTO `t_file` VALUES (21, '1', '1', '20191106042073f7ef01bde3046bd8e01928f397230bd.jpg', NULL, NULL, 'backUser/config/20191106042073f7ef01bde3046bd8e01928f397230bd.jpg', 1, 1, NULL, '2019-11-06 02:20:13');
INSERT INTO `t_file` VALUES (22, '1', '1', '201911130802024b8a2ebf80543a98241bb464682650d.jpg', NULL, NULL, 'backUser/config/201911130802024b8a2ebf80543a98241bb464682650d.jpg', 1, 1, NULL, '2019-11-13 06:02:01');
INSERT INTO `t_file` VALUES (23, '1', '1', '20191113080210d1d98eea46364d268b2a03fa03f7a446.jpg', NULL, NULL, 'backUser/config/20191113080210d1d98eea46364d268b2a03fa03f7a446.jpg', 1, 1, NULL, '2019-11-13 06:02:14');
INSERT INTO `t_file` VALUES (24, '1', '1', '20191115043844e92b25e70fb140a1885614b978469ca9.jpg', NULL, NULL, 'backUser/config/20191115043844e92b25e70fb140a1885614b978469ca9.jpg', 1, 38, NULL, '2019-11-15 02:38:45');
INSERT INTO `t_file` VALUES (25, '1', '1', '20191116060546d3a2c703cb5546b3851612907cc3786f.png', NULL, NULL, 'backUser/config/20191116060546d3a2c703cb5546b3851612907cc3786f.png', 1, 1, NULL, '2019-11-16 10:05:47');
COMMIT;

-- ----------------------------
-- Table structure for t_heart_beat_record
-- ----------------------------
DROP TABLE IF EXISTS `t_heart_beat_record`;
CREATE TABLE `t_heart_beat_record` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `project_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `server_ip` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '服务器ip',
  `process_no` int DEFAULT NULL COMMENT '进程号',
  `process_start_time` datetime DEFAULT NULL COMMENT '进程开启时间',
  `heart_beat_time` datetime DEFAULT NULL COMMENT '心跳时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_heart_beat_record
-- ----------------------------
BEGIN;
INSERT INTO `t_heart_beat_record` VALUES (1, '/home/server/smart-admin/dev', '192.168.122.1;172.16.0.145', 14843, '2019-11-16 03:11:50', '2019-11-16 03:58:01');
INSERT INTO `t_heart_beat_record` VALUES (2, 'F:\\codespace\\idea\\gangquan360\\foundation', '172.16.1.188;192.168.56.1', 227992, '2019-11-16 10:02:39', '2019-11-16 10:06:50');
INSERT INTO `t_heart_beat_record` VALUES (3, 'E:\\codespace\\zhuoda', '192.168.8.188', 17564, '2020-12-14 07:11:12', '2020-12-14 07:13:34');
INSERT INTO `t_heart_beat_record` VALUES (4, 'E:\\codespace\\zhuoda', '192.168.8.188', 15568, '2020-12-14 07:13:53', '2020-12-14 07:15:00');
INSERT INTO `t_heart_beat_record` VALUES (5, 'E:\\codespace\\zhuoda', '192.168.8.188', 16548, '2020-12-14 07:16:07', '2020-12-14 07:17:14');
INSERT INTO `t_heart_beat_record` VALUES (6, '/Users/personal/Documents/asset', '10.37.129.2;10.211.55.2;192.168.1.5', 82275, '2021-02-06 16:34:29', '2021-02-07 08:49:11');
INSERT INTO `t_heart_beat_record` VALUES (7, '/Users/personal/Documents/asset', '10.37.129.2;10.211.55.2;192.168.0.24', 82275, '2021-02-06 16:34:29', '2021-02-07 15:10:58');
INSERT INTO `t_heart_beat_record` VALUES (8, '/Users/personal/Documents/asset', '10.37.129.2;10.211.55.2;192.168.1.5', 1283, '2021-02-07 15:28:32', '2021-02-08 05:51:57');
COMMIT;

-- ----------------------------
-- Table structure for t_id_generator
-- ----------------------------
DROP TABLE IF EXISTS `t_id_generator`;
CREATE TABLE `t_id_generator` (
  `id` int DEFAULT NULL,
  `key_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '英文key',
  `rule_format` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则格式。no_cycle没有周期, year_cycle 年周期, month_cycle月周期, day_cycle 日周期',
  `rule_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '格式[yyyy]表示年,[mm]标识月,[dd]表示日,[nnn]表示三位数字',
  `init_number` int NOT NULL DEFAULT '1' COMMENT '初始值',
  `last_number` int DEFAULT NULL COMMENT '上次产生的id, 默认为空',
  `remark` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '备注',
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime NOT NULL,
  UNIQUE KEY `key_name` (`key_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='id生成器定义表';

-- ----------------------------
-- Records of t_id_generator
-- ----------------------------
BEGIN;
INSERT INTO `t_id_generator` VALUES (2, 'goods_num', '[nnnnnnn]', 'NO_CYCLE', 1, NULL, '商品编号', '2019-04-09 09:48:04', '2019-03-29 14:14:12');
INSERT INTO `t_id_generator` VALUES (1, 'order', '[yyyy][mm][dd][nnnnn]', 'DAY_CYCLE', 1, 1, '订单编号', '2019-03-30 11:25:42', '2019-03-29 14:14:12');
COMMIT;

-- ----------------------------
-- Table structure for t_id_generator_record
-- ----------------------------
DROP TABLE IF EXISTS `t_id_generator_record`;
CREATE TABLE `t_id_generator_record` (
  `generator_id` int NOT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `day` int NOT NULL,
  `last_number` int NOT NULL,
  PRIMARY KEY (`generator_id`,`year`,`month`,`day`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='id_generator记录表';

-- ----------------------------
-- Records of t_id_generator_record
-- ----------------------------
BEGIN;
INSERT INTO `t_id_generator_record` VALUES (1, 2019, 3, 30, 1);
INSERT INTO `t_id_generator_record` VALUES (2, 2019, 3, 30, 1);
INSERT INTO `t_id_generator_record` VALUES (2, 2019, 4, 3, 2);
INSERT INTO `t_id_generator_record` VALUES (2, 2019, 4, 8, 2);
INSERT INTO `t_id_generator_record` VALUES (2, 2019, 4, 9, 1);
COMMIT;

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息内容',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '删除状态：0未删除 0删除 ',
  `send_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发送状态 0未发送 1发送',
  `create_user` bigint NOT NULL COMMENT '消息创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
BEGIN;
INSERT INTO `t_notice` VALUES (93, '大扫把', '晓冬吃大便', 1, 1, 41, '2019-07-13 17:54:13', '2021-02-08 12:13:14');
INSERT INTO `t_notice` VALUES (95, '4444444', '444444444444', 1, 1, 41, '2019-07-13 17:54:53', '2021-02-08 12:13:14');
INSERT INTO `t_notice` VALUES (96, '3434', '444444', 1, 1, 41, '2019-07-13 17:58:42', '2021-02-08 12:13:14');
INSERT INTO `t_notice` VALUES (97, '44444', '555555555555', 1, 1, 41, '2019-07-13 17:58:54', '2021-02-08 12:13:14');
INSERT INTO `t_notice` VALUES (98, '《青花瓷》', '素胚勾勒出青花笔锋浓转淡\n瓶身描绘的牡丹一如你初妆\n冉冉檀香透过窗心事我了然\n周杰伦 青花瓷\n周杰伦 青花瓷\n宣纸上走笔至此搁一半\n釉色渲染仕女图韵味被私藏\n而你嫣然的一笑如含苞待放\n你的美一缕飘散\n去到我去不了的地方\n天青色等烟雨 而我在等你\n炊烟袅袅升起 隔江千万里\n在瓶底书刻隶仿前朝的飘逸\n就当我为遇见你伏笔\n天青色等烟雨 而我在等你\n月色被打捞起 晕开了结局\n如传世的青花瓷自顾自美丽\n你眼带笑意\n色白花青的锦鲤跃然于碗底\n临摹宋体落款时却惦记着你\n你隐藏在窑烧里千年的秘密\n极细腻犹如绣花针落地\n篱外芭蕉惹骤雨门环惹铜绿\n而我路过那江南小镇惹了你\n在泼墨山水画里\n你从墨色深处被隐去\n天青色等烟雨 而我在等你\n炊烟袅袅升起 隔江千万里\n在瓶底书刻隶仿前朝的飘逸\n就当我为遇见你伏笔\n天青色等烟雨 而我在等你\n月色被打捞起 晕开了结局\n如传世的青花瓷自顾自美丽\n你眼带笑意\n天青色等烟雨 而我在等你\n炊烟袅袅升起 隔江千万里\n在瓶底书刻隶仿前朝的飘逸\n就当我为遇见你伏笔\n天青色等烟雨 而我在等你\n月色被打捞起 晕开了结局\n如传世的青花瓷自顾自美丽\n你眼带笑意 ', 1, 1, 41, '2019-08-05 16:36:44', '2021-02-08 12:13:20');
INSERT INTO `t_notice` VALUES (99, '1', '2', 1, 1, 30, '2019-08-08 14:53:58', '2019-08-08 14:54:07');
INSERT INTO `t_notice` VALUES (100, '呵呵', '呵呵', 1, 1, 1, '2019-08-20 16:52:53', '2019-09-02 17:46:59');
INSERT INTO `t_notice` VALUES (101, 'aa', 'bbcc', 1, 1, 30, '2019-08-23 09:51:01', '2019-08-23 09:51:28');
INSERT INTO `t_notice` VALUES (102, '1', '2', 0, 1, 1, '2019-09-05 14:28:10', '2019-09-05 14:28:10');
INSERT INTO `t_notice` VALUES (103, '12', '22', 0, 1, 1, '2019-09-05 14:29:30', '2019-09-05 14:29:30');
INSERT INTO `t_notice` VALUES (104, 'a', 'b', 1, 1, 30, '2019-09-06 14:21:18', '2019-09-06 14:24:07');
INSERT INTO `t_notice` VALUES (105, '22222222222', '1111', 0, 0, 1, '2019-11-07 19:05:56', '2019-11-07 19:05:56');
INSERT INTO `t_notice` VALUES (106, '423', '234', 0, 0, 37, '2019-11-08 21:48:19', '2019-11-08 21:48:19');
INSERT INTO `t_notice` VALUES (107, 'AAS', 's\'da\'ssdas', 1, 1, 1, '2019-11-13 19:06:55', '2019-11-14 09:07:06');
COMMIT;

-- ----------------------------
-- Table structure for t_notice_receive_record
-- ----------------------------
DROP TABLE IF EXISTS `t_notice_receive_record`;
CREATE TABLE `t_notice_receive_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `notice_id` bigint NOT NULL COMMENT '消息id',
  `employee_id` bigint NOT NULL COMMENT '用户id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_notice_receive_record
-- ----------------------------
BEGIN;
INSERT INTO `t_notice_receive_record` VALUES (114, 93, 1, '2019-07-13 17:54:16', '2019-07-13 17:54:16');
INSERT INTO `t_notice_receive_record` VALUES (115, 95, 1, '2019-07-13 17:54:55', '2019-07-13 17:54:55');
INSERT INTO `t_notice_receive_record` VALUES (116, 95, 22, '2019-07-13 17:58:03', '2019-07-13 17:58:03');
INSERT INTO `t_notice_receive_record` VALUES (117, 93, 22, '2019-07-13 17:58:05', '2019-07-13 17:58:05');
INSERT INTO `t_notice_receive_record` VALUES (118, 96, 1, '2019-07-13 17:58:44', '2019-07-13 17:58:44');
INSERT INTO `t_notice_receive_record` VALUES (119, 97, 1, '2019-07-13 17:58:58', '2019-07-13 17:58:58');
INSERT INTO `t_notice_receive_record` VALUES (120, 98, 1, '2019-08-05 16:37:01', '2019-08-05 16:37:01');
INSERT INTO `t_notice_receive_record` VALUES (121, 99, 30, '2019-08-08 14:54:05', '2019-08-08 14:54:05');
INSERT INTO `t_notice_receive_record` VALUES (122, 99, 1, '2019-08-08 15:15:44', '2019-08-08 15:15:44');
INSERT INTO `t_notice_receive_record` VALUES (123, 100, 1, '2019-08-20 16:53:29', '2019-08-20 16:53:29');
INSERT INTO `t_notice_receive_record` VALUES (124, 101, 30, '2019-08-23 09:51:11', '2019-08-23 09:51:11');
INSERT INTO `t_notice_receive_record` VALUES (125, 101, 1, '2019-08-23 12:46:27', '2019-08-23 12:46:27');
INSERT INTO `t_notice_receive_record` VALUES (126, 102, 1, '2019-09-05 14:28:32', '2019-09-05 14:28:32');
INSERT INTO `t_notice_receive_record` VALUES (127, 104, 30, '2019-09-06 14:23:58', '2019-09-06 14:23:58');
INSERT INTO `t_notice_receive_record` VALUES (128, 104, 1, '2019-09-06 15:25:13', '2019-09-06 15:25:13');
INSERT INTO `t_notice_receive_record` VALUES (129, 101, 14, '2019-11-02 21:46:13', '2019-11-02 21:46:13');
INSERT INTO `t_notice_receive_record` VALUES (130, 102, 14, '2019-11-02 21:46:14', '2019-11-02 21:46:14');
INSERT INTO `t_notice_receive_record` VALUES (131, 104, 14, '2019-11-02 21:46:15', '2019-11-02 21:46:15');
INSERT INTO `t_notice_receive_record` VALUES (132, 98, 14, '2019-11-02 21:46:18', '2019-11-02 21:46:18');
INSERT INTO `t_notice_receive_record` VALUES (133, 103, 37, '2019-11-07 19:58:06', '2019-11-07 19:58:06');
INSERT INTO `t_notice_receive_record` VALUES (134, 103, 1, '2019-11-07 20:03:54', '2019-11-07 20:03:54');
INSERT INTO `t_notice_receive_record` VALUES (135, 107, 1, '2019-11-13 19:07:02', '2019-11-13 19:07:02');
INSERT INTO `t_notice_receive_record` VALUES (136, 107, 38, '2019-11-15 02:11:04', '2019-11-15 02:11:04');
INSERT INTO `t_notice_receive_record` VALUES (137, 104, 38, '2019-11-15 02:11:17', '2019-11-15 02:11:17');
INSERT INTO `t_notice_receive_record` VALUES (138, 101, 38, '2019-11-15 02:26:33', '2019-11-15 02:26:33');
INSERT INTO `t_notice_receive_record` VALUES (139, 98, 38, '2019-11-15 02:29:32', '2019-11-15 02:29:32');
INSERT INTO `t_notice_receive_record` VALUES (140, 100, 38, '2019-11-15 03:19:18', '2019-11-15 03:19:18');
INSERT INTO `t_notice_receive_record` VALUES (149, 98, 41, '2021-02-08 04:13:59', '2021-02-08 04:13:59');
INSERT INTO `t_notice_receive_record` VALUES (150, 97, 41, '2021-02-08 04:14:33', '2021-02-08 04:14:33');
INSERT INTO `t_notice_receive_record` VALUES (151, 96, 41, '2021-02-08 04:14:34', '2021-02-08 04:14:34');
INSERT INTO `t_notice_receive_record` VALUES (152, 95, 41, '2021-02-08 04:14:34', '2021-02-08 04:14:34');
INSERT INTO `t_notice_receive_record` VALUES (153, 93, 41, '2021-02-08 04:14:35', '2021-02-08 04:14:35');
COMMIT;

-- ----------------------------
-- Table structure for t_order_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `t_order_operate_log`;
CREATE TABLE `t_order_operate_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL COMMENT '各种单据的id',
  `order_type` int NOT NULL COMMENT '单据类型',
  `operate_type` int NOT NULL COMMENT '操作类型',
  `operate_content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作类型 对应的中文',
  `operate_remark` text COLLATE utf8mb4_unicode_ci COMMENT '操作备注',
  `employee_id` int NOT NULL COMMENT '员工id',
  `employee_name` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工名称',
  `ext_data` text COLLATE utf8mb4_unicode_ci COMMENT '额外信息',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id_order_type` (`order_id`,`order_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='各种单据操作记录\r\n';

-- ----------------------------
-- Records of t_order_operate_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_peony
-- ----------------------------
DROP TABLE IF EXISTS `t_peony`;
CREATE TABLE `t_peony` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `kind` varchar(500) DEFAULT NULL COMMENT '品种',
  `name` varchar(500) DEFAULT NULL COMMENT '名字',
  `color` varchar(500) DEFAULT NULL COMMENT '颜色',
  `image_url` text COMMENT '图片链接',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='牡丹花';

-- ----------------------------
-- Records of t_peony
-- ----------------------------
BEGIN;
INSERT INTO `t_peony` VALUES (5, '复色类', '什样锦', '红色', 'https://bkimg.cdn.bcebos.com/pic/3c6d55fbb2fb43160ee185da2aa4462308f7d390?x-bce-process=image/watermark,g_7,image_d2F0ZXIvYmFpa2UxNTA=,xp_5,yp_5', '2020-04-06 22:02:32', '2020-04-06 22:03:30');
INSERT INTO `t_peony` VALUES (6, '绿色', '绿香球', '绿色', '11', '2020-04-06 22:14:35', '2020-04-06 22:17:51');
INSERT INTO `t_peony` VALUES (7, '墨紫色类', '冠世墨玉', '紫色', '34534534534', '2020-04-06 22:15:19', '2020-04-06 22:18:21');
COMMIT;

-- ----------------------------
-- Table structure for t_position
-- ----------------------------
DROP TABLE IF EXISTS `t_position`;
CREATE TABLE `t_position` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `position_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '岗位描述',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='岗位表';

-- ----------------------------
-- Records of t_position
-- ----------------------------
BEGIN;
INSERT INTO `t_position` VALUES (18, '备案机构', '备案机构', '2021-02-07 11:25:48', '2021-02-07 11:25:48');
INSERT INTO `t_position` VALUES (19, '管理人', '管理人', '2021-02-07 11:25:57', '2021-02-07 11:25:57');
INSERT INTO `t_position` VALUES (20, '发行人', '发行人', '2021-02-07 11:26:06', '2021-02-07 11:26:06');
INSERT INTO `t_position` VALUES (21, '担保人', '担保人', '2021-02-07 11:26:13', '2021-02-07 11:26:13');
INSERT INTO `t_position` VALUES (22, '承销商', '承销商', '2021-02-07 11:26:23', '2021-02-07 11:26:23');
INSERT INTO `t_position` VALUES (23, '投资人/机构/个人', '投资人/机构/个人', '2021-02-07 11:26:44', '2021-02-07 11:26:44');
COMMIT;

-- ----------------------------
-- Table structure for t_position_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_position_relation`;
CREATE TABLE `t_position_relation` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `position_id` int DEFAULT NULL COMMENT '岗位ID',
  `employee_id` int DEFAULT NULL COMMENT '员工ID',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `job_id` (`position_id`) USING BTREE,
  KEY `employee_id` (`employee_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='岗位关联表';

-- ----------------------------
-- Records of t_position_relation
-- ----------------------------
BEGIN;
INSERT INTO `t_position_relation` VALUES (53, 18, 40, '2021-02-07 11:30:03', '2021-02-07 11:30:03');
INSERT INTO `t_position_relation` VALUES (54, 19, 41, '2021-02-08 11:45:40', '2021-02-08 11:45:40');
COMMIT;

-- ----------------------------
-- Table structure for t_privilege
-- ----------------------------
DROP TABLE IF EXISTS `t_privilege`;
CREATE TABLE `t_privilege` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '功能权限表主键id',
  `type` tinyint NOT NULL COMMENT '1.菜单 2.功能点',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `key` varchar(1000) NOT NULL COMMENT '路由name 英文关键字',
  `url` text COMMENT '路由path/type=3为API接口',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `parent_key` varchar(1000) DEFAULT NULL COMMENT '父级key',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `parent_key` (`parent_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COMMENT='权限功能表';

-- ----------------------------
-- Records of t_privilege
-- ----------------------------
BEGIN;
INSERT INTO `t_privilege` VALUES (1, 1, '人员管理', 'Employee', '/employee', 20, 'System', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (2, 1, '角色管理', 'RoleManage', '/employee/role', 21, 'Employee', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (3, 1, '岗位管理', 'PositionList', '/employee/position', 22, 'Employee', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (4, 1, '员工管理', 'RoleEmployeeManage', '/employee/role-employee-manage', 23, 'Employee', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (5, 1, '系统设置', 'SystemSetting', '/system-setting', 29, 'System', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (6, 1, '系统参数', 'SystemConfig', '/system-setting/system-config', 30, 'SystemSetting', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (8, 1, '菜单设置', 'SystemPrivilege', '/system-setting/system-privilege', 31, 'SystemSetting', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (9, 1, '消息管理', 'Notice', '/notice', 10, 'Business', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (10, 1, '通知管理', 'NoticeList', '/notice/notice-list', 11, 'Notice', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (11, 1, '个人消息', 'PersonNotice', '/notice/person-notice', 12, 'Notice', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (12, 1, '邮件管理', 'Email', '/email', 4, 'Business', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (13, 1, '邮件管理', 'EmailList', '/email/email-list', 5, 'Email', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (14, 1, '发送邮件', 'SendMail', '/email/send-mail', 6, 'Email', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (15, 1, '用户日志', 'UserLog', '/user-log', 26, 'System', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (16, 1, '用户操作日志', 'UserOperateLog', '/user-log/user-operate-log', 27, 'UserLog', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (17, 1, '用户登录日志', 'UserLoginLog', '/user-log/user-login-log', 28, 'UserLog', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (18, 1, '系统监控', 'Monitor', '/monitor', 37, 'Support', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (19, 1, '在线人数', 'OnlineUser', '/monitor/online-user', 38, 'Monitor', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (20, 1, 'SQL监控', 'Sql', '/monitor/sql', 39, 'Monitor', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (21, 1, '定时任务', 'Task', '/task', 42, 'Support', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (22, 1, '任务管理', 'TaskList', '/system-setting/task-list', 43, 'Task', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (23, 1, '动态加载', 'Reload', '/reload', 40, 'Support', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (24, 1, 'SmartReload', 'SmartReloadList', '/reload/smart-reload-list', 41, 'Reload', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (25, 1, '接口文档', 'ApiDoc', '/api-doc', 33, 'Support', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (26, 1, 'Swagger接口文档', 'Swagger', '/api-doc/swagger', 34, 'ApiDoc', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (27, 1, '三级路由', 'ThreeRouter', '/three-router', 14, 'Business', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (28, 1, '三级菜单', 'LevelTwo', '/three-router/level-two', 15, 'ThreeRouter', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (30, 1, '三级菜单子哈', 'RoleTwoTwo', '/three-router/level-two/level-three2', 17, 'LevelTwo', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (31, 1, '二级菜单', 'RoleOneOne', '/three-router/level-two2', 18, 'ThreeRouter', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (32, 1, 'KeepAlive', 'KeepAlive', '/keep-alive', 7, 'Business', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (33, 1, 'KeepAlive列表', 'KeepAliveContentList', '/keep-alive/content-list', 8, 'KeepAlive', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (34, 1, 'KeepAlive表单', 'KeepAliveAddContent', '/keep-alive/add-content', 9, 'KeepAlive', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (35, 1, '心跳服务', 'HeartBeat', '/heart-beat', 35, 'Support', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (36, 1, '心跳服务', 'HeartBeatList', '/heart-beat/heart-beat-list', 36, 'HeartBeat', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (37, 1, '文件服务', 'File', '/file', 24, 'System', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (38, 1, '文件列表', 'FileList', '/file/file-list', 25, 'File', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (39, 2, '添加角色', 'add-role', 'roleController.addRole', 0, 'RoleManage', '2019-11-01 11:47:29', '2019-11-01 11:47:29');
INSERT INTO `t_privilege` VALUES (40, 2, '删除角色', 'delete-role', 'roleController.deleteRole', 1, 'RoleManage', '2019-11-01 11:47:43', '2019-11-01 11:47:43');
INSERT INTO `t_privilege` VALUES (41, 2, '编辑角色', 'update-role', 'roleController.updateRole', 2, 'RoleManage', '2019-11-01 11:47:55', '2019-11-01 11:47:55');
INSERT INTO `t_privilege` VALUES (42, 2, '修改角色权限', 'update-role-privilege', 'rolePrivilegeController.updateRolePrivilege', 3, 'RoleManage', '2019-11-01 11:48:09', '2019-11-01 11:48:09');
INSERT INTO `t_privilege` VALUES (43, 2, '添加成员', 'add-employee-role', 'roleEmployeeController.addEmployeeList', 4, 'RoleManage', '2019-11-05 10:38:11', '2019-11-05 10:38:11');
INSERT INTO `t_privilege` VALUES (44, 2, '查询成员', 'search-employee-list', 'roleEmployeeController.listAllEmployeeRoleId,roleEmployeeController.listEmployeeByName,roleController.getAllRole,rolePrivilegeController.listPrivilegeByRoleId', 7, 'RoleManage', '2019-11-05 10:39:04', '2019-11-05 10:39:04');
INSERT INTO `t_privilege` VALUES (45, 2, '移除成员', 'delete-employee-role', 'roleEmployeeController.removeEmployee', 5, 'RoleManage', '2019-11-05 10:40:09', '2019-11-05 10:40:09');
INSERT INTO `t_privilege` VALUES (46, 2, '批量移除', 'delete-employee-role-batch', 'roleEmployeeController.removeEmployeeList', 6, 'RoleManage', '2019-11-05 10:40:27', '2019-11-05 10:40:27');
INSERT INTO `t_privilege` VALUES (47, 2, '查询数据范围', 'query-data-scope', 'dataScopeController.dataScopeList,dataScopeController.dataScopeListByRole,rolePrivilegeController.listPrivilegeByRoleId,privilegeController.queryAll,privilegeController.getAllUrl', 8, 'RoleManage', '2019-11-05 10:40:57', '2019-11-05 10:40:57');
INSERT INTO `t_privilege` VALUES (48, 2, '更新数据范围', 'update-data-scope', 'dataScopeController.dataScopeBatchSet', 9, 'RoleManage', '2019-11-05 10:41:03', '2019-11-05 10:41:03');
INSERT INTO `t_privilege` VALUES (49, 2, '查询', 'search-position', 'positionController.queryJobById,positionController.getJobPage', 0, 'PositionList', '2019-11-05 10:41:30', '2019-11-05 10:41:30');
INSERT INTO `t_privilege` VALUES (50, 2, '添加', 'add-position', 'positionController.addJob', 1, 'PositionList', '2019-11-05 10:41:40', '2019-11-05 10:41:40');
INSERT INTO `t_privilege` VALUES (51, 2, '修改', 'update-position', 'positionController.updateJob', 2, 'PositionList', '2019-11-05 10:41:49', '2019-11-05 10:41:49');
INSERT INTO `t_privilege` VALUES (52, 2, '删除', 'delete-position', 'positionController.removeJob', 3, 'PositionList', '2019-11-05 10:41:57', '2019-11-05 10:41:57');
INSERT INTO `t_privilege` VALUES (53, 2, '添加部门', 'add-department', 'departmentController.addDepartment', 0, 'RoleEmployeeManage', '2019-11-05 11:11:18', '2019-11-05 11:11:18');
INSERT INTO `t_privilege` VALUES (54, 2, '编辑部门', 'update-department', 'departmentController.updateDepartment', 1, 'RoleEmployeeManage', '2019-11-05 11:11:29', '2019-11-05 11:11:29');
INSERT INTO `t_privilege` VALUES (55, 2, '删除部门', 'delete-department', 'departmentController.delDepartment', 2, 'RoleEmployeeManage', '2019-11-05 11:11:48', '2019-11-05 11:11:48');
INSERT INTO `t_privilege` VALUES (56, 2, '查询', 'search-department', 'departmentController.listAll,departmentController.getDepartment,departmentController.listDepartmentEmployee,departmentController.listDepartment,employeeController.query', 3, 'RoleEmployeeManage', '2019-11-05 11:12:09', '2019-11-05 11:12:09');
INSERT INTO `t_privilege` VALUES (57, 2, '添加成员', 'add-employee', 'employeeController.addEmployee', 4, 'RoleEmployeeManage', '2019-11-05 17:06:23', '2019-11-05 17:06:23');
INSERT INTO `t_privilege` VALUES (58, 2, '编辑成员', 'update-employee', 'employeeController.updateEmployee', 5, 'RoleEmployeeManage', '2019-11-05 17:06:57', '2019-11-05 17:06:57');
INSERT INTO `t_privilege` VALUES (59, 2, '禁用', 'disabled-employee', 'employeeController.updateStatus', 6, 'RoleEmployeeManage', '2019-11-05 17:14:35', '2019-11-05 17:14:35');
INSERT INTO `t_privilege` VALUES (60, 2, '批量操作', 'disabled-employee-batch', 'employeeController.batchUpdateStatus', 7, 'RoleEmployeeManage', '2019-11-05 17:19:23', '2019-11-05 17:19:23');
INSERT INTO `t_privilege` VALUES (61, 2, '员工角色编辑', 'update-employee-role', 'employeeController.updateRoles', 8, 'RoleEmployeeManage', '2019-11-05 17:21:15', '2019-11-05 17:21:15');
INSERT INTO `t_privilege` VALUES (62, 2, '重置密码', 'reset-employee-password', 'employeeController.resetPasswd', 10, 'RoleEmployeeManage', '2019-11-05 17:22:13', '2019-11-05 17:22:13');
INSERT INTO `t_privilege` VALUES (63, 2, '删除员工', 'delete-employee', 'employeeController.deleteEmployeeById', 9, 'RoleEmployeeManage', '2019-11-05 17:22:27', '2019-11-05 17:22:27');
INSERT INTO `t_privilege` VALUES (64, 2, '查询系统参数', 'system-params-search', 'systemConfigController.selectByKey,systemConfigController.getListByGroup,systemConfigController.getSystemConfigPage', 0, 'SystemConfig', '2019-11-05 17:23:41', '2019-11-05 17:23:41');
INSERT INTO `t_privilege` VALUES (65, 2, '添加系统参数', 'system-params-add', 'systemConfigController.addSystemConfig', 1, 'SystemConfig', '2019-11-05 17:26:00', '2019-11-05 17:26:00');
INSERT INTO `t_privilege` VALUES (66, 2, '修改系统参数', 'system-config-update', 'systemConfigController.updateSystemConfig', 2, 'SystemConfig', '2019-11-05 17:26:07', '2019-11-05 17:26:07');
INSERT INTO `t_privilege` VALUES (67, 2, '搜索系统参数', 'system-config-search', 'systemConfigController.selectByKey,systemConfigController.getListByGroup,systemConfigController.getSystemConfigPage', 3, 'SystemConfig', '2019-11-05 17:26:44', '2019-11-05 17:26:44');
INSERT INTO `t_privilege` VALUES (69, 2, '编辑', 'privilege-main-update', 'privilegeController.menuBatchSave,privilegeController.functionSaveOrUpdate', 1, 'SystemPrivilege', '2020-12-14 15:17:11', '2019-11-05 17:27:28');
INSERT INTO `t_privilege` VALUES (70, 2, '查询', 'privilege-main-search', 'privilegeController.queryAll,privilegeController.getAllUrl,privilegeController.functionQuery', 3, 'SystemPrivilege', '2020-12-14 15:17:11', '2019-11-05 17:28:45');
INSERT INTO `t_privilege` VALUES (71, 2, '查询', 'notice-query', 'noticeController.queryReceiveByPage,noticeController.queryUnreadByPage,noticeController.queryByPage,noticeController.detail', 0, 'NoticeList', '2019-11-05 17:30:16', '2019-11-05 17:30:16');
INSERT INTO `t_privilege` VALUES (72, 2, '添加', 'notice-add', 'noticeController.add', 1, 'NoticeList', '2019-11-05 17:30:28', '2019-11-05 17:30:28');
INSERT INTO `t_privilege` VALUES (73, 2, '修改', 'notice-edit', 'noticeController.update', 2, 'NoticeList', '2019-11-05 17:31:24', '2019-11-05 17:31:24');
INSERT INTO `t_privilege` VALUES (74, 2, '删除', 'notice-delete', 'noticeController.delete', 3, 'NoticeList', '2019-11-06 11:12:32', '2019-11-06 11:12:32');
INSERT INTO `t_privilege` VALUES (75, 2, '详情', 'notice-detail', 'noticeController.detail', 4, 'NoticeList', '2019-11-06 11:12:44', '2019-11-06 11:12:44');
INSERT INTO `t_privilege` VALUES (76, 2, '发送', 'notice-send', 'noticeController.send', 5, 'NoticeList', '2019-11-06 11:12:51', '2019-11-06 11:12:51');
INSERT INTO `t_privilege` VALUES (77, 2, '查询', 'person-notice-query', 'noticeController.queryReceiveByPage,noticeController.queryUnreadByPage,noticeController.queryByPage', 0, 'PersonNotice', '2019-11-06 11:13:27', '2019-11-06 11:13:27');
INSERT INTO `t_privilege` VALUES (78, 2, '详情', 'person-notice-detail', 'noticeController.detail', 1, 'PersonNotice', '2019-11-06 11:13:35', '2019-11-06 11:13:35');
INSERT INTO `t_privilege` VALUES (79, 2, '查询', 'email-query', 'emailController.queryByPage,emailController.detail', 0, 'EmailList', '2019-11-06 11:13:49', '2019-11-06 11:13:49');
INSERT INTO `t_privilege` VALUES (80, 2, '新增', 'email-add', 'emailController.add', 1, 'EmailList', '2019-11-06 11:14:02', '2019-11-06 11:14:02');
INSERT INTO `t_privilege` VALUES (81, 2, '编辑', 'email-update', 'emailController.update', 2, 'EmailList', '2019-11-06 11:14:08', '2019-11-06 11:14:08');
INSERT INTO `t_privilege` VALUES (82, 2, '删除', 'email-delete', 'emailController.delete', 3, 'EmailList', '2019-11-06 11:14:16', '2019-11-06 11:14:16');
INSERT INTO `t_privilege` VALUES (83, 2, '发送', 'email-send', 'emailController.send', 0, 'SendMail', '2019-11-06 11:14:40', '2019-11-06 11:14:40');
INSERT INTO `t_privilege` VALUES (84, 2, '查询', 'user-operate-log-search', 'userOperateLogController.queryByPage', 0, 'UserOperateLog', '2019-11-06 11:15:04', '2019-11-06 11:15:04');
INSERT INTO `t_privilege` VALUES (85, 2, '详情', 'user-operate-log-detail', 'userOperateLogController.detail', 1, 'UserOperateLog', '2019-11-06 11:15:16', '2019-11-06 11:15:16');
INSERT INTO `t_privilege` VALUES (86, 2, '删除', 'user-operate-log-delete', 'userOperateLogController.delete', 2, 'UserOperateLog', '2019-11-06 11:15:25', '2019-11-06 11:15:25');
INSERT INTO `t_privilege` VALUES (87, 2, '查询', 'user-login-log-search', 'userLoginLogController.queryByPage', 0, 'UserLoginLog', '2019-11-06 11:15:43', '2019-11-06 11:15:43');
INSERT INTO `t_privilege` VALUES (88, 2, '删除', 'user-login-log-delete', 'userLoginLogController.delete', 1, 'UserLoginLog', '2019-11-06 11:15:49', '2019-11-06 11:15:49');
INSERT INTO `t_privilege` VALUES (89, 2, '查询', 'online-user-search', 'userLoginLogController.queryUserOnLine', 0, 'OnlineUser', '2019-11-06 11:16:05', '2019-11-06 11:16:05');
INSERT INTO `t_privilege` VALUES (90, 2, '查询任务', 'task-search', 'quartzController.query', 0, 'TaskList', '2019-11-06 11:16:24', '2019-11-06 11:16:24');
INSERT INTO `t_privilege` VALUES (91, 2, '刷新任务', 'task-refresh', 'quartzController.query', 1, 'TaskList', '2019-11-06 11:16:50', '2019-11-06 11:16:50');
INSERT INTO `t_privilege` VALUES (92, 2, '添加任务', 'task-add', 'quartzController.saveOrUpdateTask', 2, 'TaskList', '2019-11-06 11:17:04', '2019-11-06 11:17:04');
INSERT INTO `t_privilege` VALUES (93, 2, '编辑任务', 'task-update', 'quartzController.saveOrUpdateTask', 3, 'TaskList', '2019-11-06 11:17:17', '2019-11-06 11:17:17');
INSERT INTO `t_privilege` VALUES (94, 2, '暂停任务', 'task-pause', 'quartzController.pauseTask', 4, 'TaskList', '2019-11-06 11:17:25', '2019-11-06 11:17:25');
INSERT INTO `t_privilege` VALUES (95, 2, '恢复任务', 'task-resume', 'quartzController.resumeTask', 5, 'TaskList', '2019-11-06 11:17:31', '2019-11-06 11:17:31');
INSERT INTO `t_privilege` VALUES (96, 2, '立即运行任务', 'task-run', 'quartzController.runTask', 6, 'TaskList', '2019-11-06 11:17:38', '2019-11-06 11:17:38');
INSERT INTO `t_privilege` VALUES (97, 2, '查看任务日志', 'task-query-log', 'quartzController.queryLog', 7, 'TaskList', '2019-11-06 11:17:47', '2019-11-06 11:17:47');
INSERT INTO `t_privilege` VALUES (98, 2, '删除任务', 'task-delete', 'quartzController.deleteTask', 8, 'TaskList', '2019-11-06 11:17:53', '2019-11-06 11:17:53');
INSERT INTO `t_privilege` VALUES (99, 2, '查询', 'smart-reload-search', 'smartReloadController.listAllReloadItem', 0, 'SmartReloadList', '2019-11-06 11:18:06', '2019-11-06 11:18:06');
INSERT INTO `t_privilege` VALUES (100, 2, '执行reload', 'smart-reload-update', 'smartReloadController.updateByTag', 1, 'SmartReloadList', '2019-11-06 11:18:14', '2019-11-06 11:18:14');
INSERT INTO `t_privilege` VALUES (101, 2, '查看执行结果', 'smart-reload-result', 'smartReloadController.queryReloadResult', 2, 'SmartReloadList', '2019-11-06 11:18:19', '2019-11-06 11:18:19');
INSERT INTO `t_privilege` VALUES (102, 2, '查询任务', 'heart-beat-query', 'heartBeatController.query', 0, 'HeartBeatList', '2019-11-06 11:18:38', '2019-11-06 11:18:38');
INSERT INTO `t_privilege` VALUES (103, 2, '查询', 'file-filePage-query', 'fileController.queryListByPage,fileController.localGetFile,fileController.downLoadById', 0, 'FileList', '2019-11-06 11:19:06', '2019-11-06 11:19:06');
INSERT INTO `t_privilege` VALUES (104, 2, '上传', 'file-filePage-upload', 'fileController.qiNiuUpload,fileController.localUpload,fileController.aliYunUpload,fileController.saveFile', 1, 'FileList', '2019-11-06 11:19:36', '2019-11-06 11:19:36');
INSERT INTO `t_privilege` VALUES (105, 2, '下载', 'file-filePage-download', 'fileController.downLoadById', 2, 'FileList', '2019-11-16 10:05:02', '2019-11-16 10:05:02');
INSERT INTO `t_privilege` VALUES (106, 1, '业务功能', 'Business', '/business', 0, NULL, '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (107, 1, '牡丹管理', 'Peony', '/peony', 1, 'Business', '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (108, 1, '牡丹花列表', 'PeonyList', '/peony/peony-list', 2, 'Peony', '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (109, 1, '牡丹花列表1', 'PeonyList1', '/peony/peony-list1', 3, 'Peony', '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (110, 1, '消息详情', 'NoticeDetail', '/notice/notice-detail', 13, 'Notice', '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (111, 1, '三级菜单子颗粒', 'ThreeLevelRouterView', '/three-router/level-two/level-three1', 16, 'LevelTwo', '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (112, 1, '系统设置', 'System', '/system', 19, NULL, '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (113, 1, '开发专用', 'Support', '/support', 32, NULL, '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (114, 2, '查询', 'peony-list-query', '', 1, 'PeonyList', '2020-12-14 15:16:30', '2020-12-14 15:16:30');
INSERT INTO `t_privilege` VALUES (115, 2, '新增', 'peony-list-add', '', 2, 'PeonyList', '2020-12-14 15:16:30', '2020-12-14 15:16:30');
INSERT INTO `t_privilege` VALUES (116, 2, '编辑', 'peony-list-update', '', 3, 'PeonyList', '2020-12-14 15:16:30', '2020-12-14 15:16:30');
INSERT INTO `t_privilege` VALUES (117, 2, '批量删除', 'peony-list-batch-delete', '', 4, 'PeonyList', '2020-12-14 15:16:30', '2020-12-14 15:16:30');
INSERT INTO `t_privilege` VALUES (118, 2, '批量导出', 'peony-list-batch-export', '', 5, 'PeonyList', '2020-12-14 15:16:30', '2020-12-14 15:16:30');
INSERT INTO `t_privilege` VALUES (119, 2, '导出全部', 'peony-list-export-all', '', 6, 'PeonyList', '2020-12-14 15:16:30', '2020-12-14 15:16:30');
INSERT INTO `t_privilege` VALUES (120, 2, '查询', 'peony1-list-query', '', 1, 'PeonyList1', '2020-12-14 15:16:33', '2020-12-14 15:16:33');
INSERT INTO `t_privilege` VALUES (121, 2, '新增', 'peony1-list-add', '', 2, 'PeonyList1', '2020-12-14 15:16:33', '2020-12-14 15:16:33');
INSERT INTO `t_privilege` VALUES (122, 2, '编辑', 'peony1-list-update', '', 3, 'PeonyList1', '2020-12-14 15:16:33', '2020-12-14 15:16:33');
INSERT INTO `t_privilege` VALUES (123, 2, '批量删除', 'peony1-list-batch-delete', '', 4, 'PeonyList1', '2020-12-14 15:16:33', '2020-12-14 15:16:33');
INSERT INTO `t_privilege` VALUES (124, 2, '批量导出', 'peony1-list-batch-export', '', 5, 'PeonyList1', '2020-12-14 15:16:33', '2020-12-14 15:16:33');
INSERT INTO `t_privilege` VALUES (125, 2, '导出全部', 'peony1-list-export-all', '', 6, 'PeonyList1', '2020-12-14 15:16:33', '2020-12-14 15:16:33');
INSERT INTO `t_privilege` VALUES (126, 2, '批量保存功能点', 'privilege-batch-save-points', 'privilegeController.functionSaveOrUpdate', 1, 'SystemPrivilege', '2020-12-14 15:17:11', '2020-12-14 15:17:11');
COMMIT;

-- ----------------------------
-- Table structure for t_quartz_task
-- ----------------------------
DROP TABLE IF EXISTS `t_quartz_task`;
CREATE TABLE `t_quartz_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `task_bean` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'spring bean名称',
  `task_params` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务参数',
  `task_cron` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '运行cron表达式',
  `task_status` tinyint NOT NULL DEFAULT '0' COMMENT '任务状态0:正常，1:暂停',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_quartz_task
-- ----------------------------
BEGIN;
INSERT INTO `t_quartz_task` VALUES (9, '2312332', 'exampleTask', '21314', '*/5 * * * * ?', 1, NULL, '2019-09-06 14:41:55', '2019-04-19 15:24:26');
INSERT INTO `t_quartz_task` VALUES (13, '567', 'exampleTask', 'ads', '*/5 * * * * ?', 1, NULL, '2019-09-04 16:37:25', '2019-04-23 15:32:17');
INSERT INTO `t_quartz_task` VALUES (21, '11', 'exampleTask', '11', '*/5 * * * * ?', 1, NULL, '2019-09-04 16:37:30', '2019-04-26 17:29:21');
INSERT INTO `t_quartz_task` VALUES (22, '33', 'exampleTask', '333', '*/5 * * * * ?', 1, NULL, '2019-04-26 17:29:36', '2019-04-26 17:29:36');
INSERT INTO `t_quartz_task` VALUES (23, '1', 'exampleTask', '3', '*/5 * * * * ?', 1, NULL, '2019-09-05 17:21:12', '2019-04-26 17:29:50');
COMMIT;

-- ----------------------------
-- Table structure for t_quartz_task_log
-- ----------------------------
DROP TABLE IF EXISTS `t_quartz_task_log`;
CREATE TABLE `t_quartz_task_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int NOT NULL COMMENT '任务id',
  `task_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `task_params` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务参数',
  `process_status` tinyint NOT NULL COMMENT '任务处理状态0:成功，1:失败',
  `process_duration` bigint NOT NULL DEFAULT '0' COMMENT '运行时长',
  `process_log` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '日志',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '运行主机ip',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=732881 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_quartz_task_log
-- ----------------------------
BEGIN;
INSERT INTO `t_quartz_task_log` VALUES (732870, 9, '231233', '2131', 0, 5, NULL, '127.0.0.1', '2019-05-05 15:28:01', '2019-05-05 15:28:01');
INSERT INTO `t_quartz_task_log` VALUES (732871, 9, '231233', '2131', 0, 32, NULL, '172.16.0.145', '2019-05-05 15:54:40', '2019-05-05 15:54:40');
INSERT INTO `t_quartz_task_log` VALUES (732872, 22, '33', '333', 0, 31, NULL, '172.16.0.145', '2019-05-07 16:20:31', '2019-05-07 16:20:31');
INSERT INTO `t_quartz_task_log` VALUES (732873, 9, '231233', '2131', 0, 304, NULL, '172.16.0.145', '2019-08-02 09:29:36', '2019-08-02 09:29:36');
INSERT INTO `t_quartz_task_log` VALUES (732874, 9, '231233', '2131', 0, 24, NULL, '172.16.0.145', '2019-08-08 16:48:49', '2019-08-08 16:48:49');
INSERT INTO `t_quartz_task_log` VALUES (732875, 9, '231233', '2131', 0, 147, NULL, '172.16.0.145', '2019-08-23 09:41:08', '2019-08-23 09:41:08');
INSERT INTO `t_quartz_task_log` VALUES (732876, 9, '231233', '2131', 0, 610, NULL, '172.16.0.145', '2019-08-26 16:16:34', '2019-08-26 16:16:34');
INSERT INTO `t_quartz_task_log` VALUES (732877, 9, '2312332', '2131', 0, 27, NULL, '172.16.0.145', '2019-09-05 14:34:51', '2019-09-05 14:34:51');
INSERT INTO `t_quartz_task_log` VALUES (732878, 9, '2312332', '2131', 0, 5, NULL, '172.16.0.145', '2019-09-05 17:18:17', '2019-09-05 17:18:17');
INSERT INTO `t_quartz_task_log` VALUES (732879, 9, '2312332', '2131', 0, 1, NULL, '172.16.0.145', '2019-09-05 17:20:15', '2019-09-05 17:20:15');
INSERT INTO `t_quartz_task_log` VALUES (732880, 9, '2312332', '2131', 0, 5, NULL, '172.16.0.145', '2019-09-06 14:42:04', '2019-09-06 14:42:04');
COMMIT;

-- ----------------------------
-- Table structure for t_reload_item
-- ----------------------------
DROP TABLE IF EXISTS `t_reload_item`;
CREATE TABLE `t_reload_item` (
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项名称',
  `args` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '参数 可选',
  `identification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运行标识',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_reload_item
-- ----------------------------
BEGIN;
INSERT INTO `t_reload_item` VALUES ('system_config', '234', 'xxxx', '2019-11-14 16:46:21', '2019-04-18 11:48:27');
COMMIT;

-- ----------------------------
-- Table structure for t_reload_result
-- ----------------------------
DROP TABLE IF EXISTS `t_reload_result`;
CREATE TABLE `t_reload_result` (
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '运行标识',
  `args` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result` tinyint unsigned NOT NULL COMMENT '是否成功 ',
  `exception` text COLLATE utf8mb4_unicode_ci,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_reload_result
-- ----------------------------
BEGIN;
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-07 17:26:04');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-07 17:28:16');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-07 17:35:39');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-07 17:42:58');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-09 08:30:13');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 10:38:19');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 10:42:46');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 10:49:27');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 11:09:10');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 11:10:06');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 11:18:17');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 11:41:18');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 11:45:41');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 11:46:37');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 11:50:35');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 14:55:00');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 15:26:19');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 15:35:51');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 15:36:19');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 15:36:53');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 15:37:58');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-11 15:41:37');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-16 10:12:29');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-20 17:14:08');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-20 17:18:24');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-20 17:23:07');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-20 17:24:17');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-20 17:30:17');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-20 17:31:40');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-20 17:32:34');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-20 17:52:31');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-20 17:55:10');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-20 17:55:47');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-20 17:58:49');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-21 10:53:47');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-22 18:24:21');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-09-24 09:04:42');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-15 11:06:12');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-15 11:22:10');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-15 16:42:16');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-19 15:18:54');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-19 16:50:10');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-21 15:52:25');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-23 10:24:38');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-23 10:28:45');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-23 16:35:45');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-23 16:38:48');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-25 08:52:22');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-28 16:04:30');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-30 19:59:24');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-31 14:29:26');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-31 14:35:38');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-31 15:58:39');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-10-31 17:34:48');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-01 11:23:26');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-01 14:55:34');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-02 08:49:44');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-02 09:40:52');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-02 09:42:48');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-02 09:47:38');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-02 09:50:57');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-02 09:51:32');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-02 09:51:48');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-02 15:48:21');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-02 20:48:44');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-02 21:27:50');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-03 22:10:32');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-03 22:10:32');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '', 1, NULL, '2019-11-04 09:10:24');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-05 10:24:51');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 11:22:42');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 11:25:54');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 11:27:04');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 11:28:00');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 11:34:06');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 11:34:43');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 11:53:11');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 11:56:05');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 13:52:39');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 15:29:29');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 16:05:36');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 16:06:13');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 16:13:22');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 16:19:38');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 16:21:37');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-06 16:22:23');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-08 08:50:08');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-08 13:37:34');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-09 08:35:08');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-09 08:54:38');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-09 09:00:32');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-09 09:01:24');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-09 09:24:16');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-09 09:26:46');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-09 09:43:13');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-09 09:44:48');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-09 10:28:30');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-09 11:24:19');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-11 09:40:42');
INSERT INTO `t_reload_result` VALUES ('system_config', '23', '4234234', 1, NULL, '2019-11-13 17:25:42');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '2423', 1, NULL, '2019-11-13 20:29:19');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '2423', 1, NULL, '2019-11-13 20:29:23');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '234', 1, NULL, '2019-11-14 11:43:57');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '234', 1, NULL, '2019-11-14 11:50:18');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '234', 1, NULL, '2019-11-14 11:51:13');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '234', 1, NULL, '2019-11-14 11:52:03');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '234', 1, NULL, '2019-11-14 11:53:02');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '234', 1, NULL, '2019-11-14 13:49:11');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '234', 1, NULL, '2019-11-14 13:51:05');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '234', 1, NULL, '2019-11-14 13:53:53');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '234', 1, NULL, '2019-11-14 13:55:57');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '234', 1, NULL, '2019-11-14 16:15:44');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343', '234', 1, NULL, '2019-11-14 16:39:36');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343234234', '234', 1, NULL, '2019-11-14 16:41:05');
INSERT INTO `t_reload_result` VALUES ('system_config', '23343234234', '234', 1, NULL, '2019-11-14 16:41:05');
INSERT INTO `t_reload_result` VALUES ('system_config', 'aaaa', '234', 1, NULL, '2019-11-14 16:41:20');
INSERT INTO `t_reload_result` VALUES ('system_config', 'aaaa', '234', 1, NULL, '2019-11-14 16:41:25');
INSERT INTO `t_reload_result` VALUES ('system_config', '111', '234', 1, NULL, '2019-11-14 16:43:20');
INSERT INTO `t_reload_result` VALUES ('system_config', '111', '234', 1, NULL, '2019-11-14 16:44:13');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2019-11-14 16:46:26');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2019-11-14 16:46:39');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2019-11-14 16:48:47');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2019-11-15 14:39:55');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2019-11-16 08:47:43');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2019-11-16 17:12:10');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2019-11-16 18:02:57');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2020-12-14 15:09:53');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2020-12-14 15:13:33');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2020-12-14 15:14:09');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2020-12-14 15:16:23');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2021-02-07 16:51:51');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2021-02-07 16:53:59');
INSERT INTO `t_reload_result` VALUES ('system_config', 'xxxx', '234', 1, NULL, '2021-02-07 23:29:03');
COMMIT;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(20) NOT NULL COMMENT '角色名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of t_role
-- ----------------------------
BEGIN;
INSERT INTO `t_role` VALUES (1, '管理员', '', '2019-06-21 12:09:34', '2019-06-21 12:09:34');
INSERT INTO `t_role` VALUES (50, '备案机构', '', '2021-02-07 11:28:09', '2021-02-07 11:28:09');
INSERT INTO `t_role` VALUES (51, '管理人', '', '2021-02-07 11:28:17', '2021-02-07 11:28:17');
INSERT INTO `t_role` VALUES (52, '发行人', '', '2021-02-07 11:28:22', '2021-02-07 11:28:22');
INSERT INTO `t_role` VALUES (53, '担保人', '', '2021-02-07 11:28:28', '2021-02-07 11:28:28');
INSERT INTO `t_role` VALUES (54, '承销商', '', '2021-02-07 11:28:34', '2021-02-07 11:28:34');
INSERT INTO `t_role` VALUES (55, '投资人/机构/个人', '', '2021-02-07 11:28:42', '2021-02-07 11:28:42');
COMMIT;

-- ----------------------------
-- Table structure for t_role_data_scope
-- ----------------------------
DROP TABLE IF EXISTS `t_role_data_scope`;
CREATE TABLE `t_role_data_scope` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_scope_type` int NOT NULL COMMENT '数据范围id',
  `view_type` int NOT NULL COMMENT '数据范围类型',
  `role_id` int NOT NULL COMMENT '角色id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_role_data_scope
-- ----------------------------
BEGIN;
INSERT INTO `t_role_data_scope` VALUES (5, 0, 2, 9, '2019-04-29 15:01:04', '2019-04-29 15:01:04');
INSERT INTO `t_role_data_scope` VALUES (14, 0, 2, 40, '2019-09-05 15:25:37', '2019-09-05 15:25:37');
INSERT INTO `t_role_data_scope` VALUES (16, 0, 3, 34, '2019-11-06 16:08:02', '2019-11-06 16:08:02');
INSERT INTO `t_role_data_scope` VALUES (17, 0, 0, 50, '2021-02-07 11:31:21', '2021-02-07 11:31:21');
INSERT INTO `t_role_data_scope` VALUES (18, 0, 3, 1, '2021-02-08 11:47:14', '2021-02-08 11:47:14');
COMMIT;

-- ----------------------------
-- Table structure for t_role_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_role_employee`;
CREATE TABLE `t_role_employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL COMMENT '角色id',
  `employee_id` int NOT NULL COMMENT '员工id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色员工功能表';

-- ----------------------------
-- Records of t_role_employee
-- ----------------------------
BEGIN;
INSERT INTO `t_role_employee` VALUES (214, 50, 40, '2021-02-07 11:31:16', '2021-02-07 11:31:16');
INSERT INTO `t_role_employee` VALUES (216, 51, 41, '2021-02-08 11:51:43', '2021-02-08 11:51:43');
COMMIT;

-- ----------------------------
-- Table structure for t_role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `t_role_privilege`;
CREATE TABLE `t_role_privilege` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL COMMENT '角色id',
  `privilege_key` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权限key',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10967 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色权限功能表';

-- ----------------------------
-- Records of t_role_privilege
-- ----------------------------
BEGIN;
INSERT INTO `t_role_privilege` VALUES (10733, 1, 'Employee', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10734, 1, 'RoleManage', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10735, 1, 'PositionList', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10736, 1, 'RoleEmployeeManage', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10737, 1, 'SystemSetting', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10738, 1, 'SystemConfig', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10739, 1, 'SystemPrivilege', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10740, 1, 'Notice', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10741, 1, 'NoticeList', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10742, 1, 'PersonNotice', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10743, 1, 'Email', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10744, 1, 'EmailList', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10745, 1, 'SendMail', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10746, 1, 'UserLog', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10747, 1, 'UserOperateLog', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10748, 1, 'UserLoginLog', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10749, 1, 'Monitor', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10750, 1, 'OnlineUser', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10751, 1, 'Sql', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10752, 1, 'Task', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10753, 1, 'TaskList', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10754, 1, 'Reload', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10755, 1, 'SmartReloadList', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10756, 1, 'ApiDoc', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10757, 1, 'Swagger', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10758, 1, 'ThreeRouter', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10759, 1, 'LevelTwo', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10761, 1, 'RoleTwoTwo', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10762, 1, 'RoleOneOne', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10763, 1, 'KeepAlive', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10764, 1, 'KeepAliveContentList', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10765, 1, 'KeepAliveAddContent', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10766, 1, 'HeartBeat', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10767, 1, 'HeartBeatList', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10768, 1, 'File', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10769, 1, 'FileList', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10770, 1, 'add-role', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10771, 1, 'delete-role', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10772, 1, 'update-role', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10773, 1, 'update-role-privilege', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10774, 1, 'add-employee-role', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10775, 1, 'search-employee-list', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10776, 1, 'delete-employee-role', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10777, 1, 'delete-employee-role-batch', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10778, 1, 'query-data-scope', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10779, 1, 'update-data-scope', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10780, 1, 'search-position', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10781, 1, 'add-position', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10782, 1, 'update-position', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10783, 1, 'delete-position', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10784, 1, 'add-department', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10785, 1, 'update-department', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10786, 1, 'delete-department', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10787, 1, 'search-department', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10788, 1, 'add-employee', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10789, 1, 'update-employee', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10790, 1, 'disabled-employee', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10791, 1, 'disabled-employee-batch', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10792, 1, 'update-employee-role', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10793, 1, 'reset-employee-password', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10794, 1, 'delete-employee', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10795, 1, 'system-params-search', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10796, 1, 'system-params-add', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10797, 1, 'system-config-update', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10798, 1, 'system-config-search', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10799, 1, 'privilege-main-update', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10800, 1, 'privilege-main-search', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10801, 1, 'notice-query', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10802, 1, 'notice-add', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10803, 1, 'notice-edit', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10804, 1, 'notice-delete', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10805, 1, 'notice-detail', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10806, 1, 'notice-send', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10807, 1, 'person-notice-query', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10808, 1, 'person-notice-detail', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10809, 1, 'email-query', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10810, 1, 'email-add', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10811, 1, 'email-update', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10812, 1, 'email-delete', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10813, 1, 'email-send', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10814, 1, 'user-operate-log-search', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10815, 1, 'user-operate-log-detail', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10816, 1, 'user-operate-log-delete', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10817, 1, 'user-login-log-search', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10818, 1, 'user-login-log-delete', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10819, 1, 'online-user-search', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10820, 1, 'task-search', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10821, 1, 'task-refresh', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10822, 1, 'task-add', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10823, 1, 'task-update', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10824, 1, 'task-pause', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10825, 1, 'task-resume', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10826, 1, 'task-run', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10827, 1, 'task-query-log', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10828, 1, 'task-delete', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10829, 1, 'smart-reload-search', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10830, 1, 'smart-reload-update', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10831, 1, 'smart-reload-result', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10832, 1, 'heart-beat-query', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10833, 1, 'file-filePage-query', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10834, 1, 'file-filePage-upload', '2019-11-16 18:04:10', '2019-11-16 18:04:10');
INSERT INTO `t_role_privilege` VALUES (10835, 50, 'Peony', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10836, 50, 'PeonyList', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10837, 50, 'peony-list-query', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10838, 50, 'peony-list-add', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10839, 50, 'peony-list-update', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10840, 50, 'peony-list-batch-delete', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10841, 50, 'peony-list-batch-export', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10842, 50, 'peony-list-export-all', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10843, 50, 'PeonyList1', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10844, 50, 'peony1-list-query', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10845, 50, 'peony1-list-add', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10846, 50, 'peony1-list-update', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10847, 50, 'peony1-list-batch-delete', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10848, 50, 'peony1-list-batch-export', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10849, 50, 'peony1-list-export-all', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10850, 50, 'Business', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10851, 50, 'KeepAlive', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10852, 50, 'KeepAliveContentList', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10853, 50, 'KeepAliveAddContent', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10854, 50, 'Notice', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10855, 50, 'NoticeList', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10856, 50, 'notice-query', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10857, 50, 'notice-add', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10858, 50, 'notice-edit', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10859, 50, 'notice-delete', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10860, 50, 'notice-detail', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10861, 50, 'notice-send', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10862, 50, 'PersonNotice', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10863, 50, 'person-notice-query', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10864, 50, 'person-notice-detail', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10865, 50, 'NoticeDetail', '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_role_privilege` VALUES (10879, 52, 'Notice', '2021-02-07 11:29:04', '2021-02-07 11:29:04');
INSERT INTO `t_role_privilege` VALUES (10880, 52, 'NoticeList', '2021-02-07 11:29:04', '2021-02-07 11:29:04');
INSERT INTO `t_role_privilege` VALUES (10881, 52, 'notice-query', '2021-02-07 11:29:04', '2021-02-07 11:29:04');
INSERT INTO `t_role_privilege` VALUES (10882, 52, 'notice-add', '2021-02-07 11:29:04', '2021-02-07 11:29:04');
INSERT INTO `t_role_privilege` VALUES (10883, 52, 'notice-edit', '2021-02-07 11:29:04', '2021-02-07 11:29:04');
INSERT INTO `t_role_privilege` VALUES (10884, 52, 'notice-delete', '2021-02-07 11:29:04', '2021-02-07 11:29:04');
INSERT INTO `t_role_privilege` VALUES (10885, 52, 'notice-detail', '2021-02-07 11:29:04', '2021-02-07 11:29:04');
INSERT INTO `t_role_privilege` VALUES (10886, 52, 'notice-send', '2021-02-07 11:29:04', '2021-02-07 11:29:04');
INSERT INTO `t_role_privilege` VALUES (10887, 52, 'PersonNotice', '2021-02-07 11:29:04', '2021-02-07 11:29:04');
INSERT INTO `t_role_privilege` VALUES (10888, 52, 'person-notice-query', '2021-02-07 11:29:04', '2021-02-07 11:29:04');
INSERT INTO `t_role_privilege` VALUES (10889, 52, 'person-notice-detail', '2021-02-07 11:29:04', '2021-02-07 11:29:04');
INSERT INTO `t_role_privilege` VALUES (10890, 52, 'NoticeDetail', '2021-02-07 11:29:04', '2021-02-07 11:29:04');
INSERT INTO `t_role_privilege` VALUES (10891, 52, 'Business', '2021-02-07 11:29:04', '2021-02-07 11:29:04');
INSERT INTO `t_role_privilege` VALUES (10892, 53, 'Notice', '2021-02-07 11:29:07', '2021-02-07 11:29:07');
INSERT INTO `t_role_privilege` VALUES (10893, 53, 'NoticeList', '2021-02-07 11:29:07', '2021-02-07 11:29:07');
INSERT INTO `t_role_privilege` VALUES (10894, 53, 'notice-query', '2021-02-07 11:29:07', '2021-02-07 11:29:07');
INSERT INTO `t_role_privilege` VALUES (10895, 53, 'notice-add', '2021-02-07 11:29:07', '2021-02-07 11:29:07');
INSERT INTO `t_role_privilege` VALUES (10896, 53, 'notice-edit', '2021-02-07 11:29:07', '2021-02-07 11:29:07');
INSERT INTO `t_role_privilege` VALUES (10897, 53, 'notice-delete', '2021-02-07 11:29:07', '2021-02-07 11:29:07');
INSERT INTO `t_role_privilege` VALUES (10898, 53, 'notice-detail', '2021-02-07 11:29:07', '2021-02-07 11:29:07');
INSERT INTO `t_role_privilege` VALUES (10899, 53, 'notice-send', '2021-02-07 11:29:07', '2021-02-07 11:29:07');
INSERT INTO `t_role_privilege` VALUES (10900, 53, 'PersonNotice', '2021-02-07 11:29:07', '2021-02-07 11:29:07');
INSERT INTO `t_role_privilege` VALUES (10901, 53, 'person-notice-query', '2021-02-07 11:29:07', '2021-02-07 11:29:07');
INSERT INTO `t_role_privilege` VALUES (10902, 53, 'person-notice-detail', '2021-02-07 11:29:07', '2021-02-07 11:29:07');
INSERT INTO `t_role_privilege` VALUES (10903, 53, 'NoticeDetail', '2021-02-07 11:29:07', '2021-02-07 11:29:07');
INSERT INTO `t_role_privilege` VALUES (10904, 53, 'Business', '2021-02-07 11:29:07', '2021-02-07 11:29:07');
INSERT INTO `t_role_privilege` VALUES (10905, 54, 'Notice', '2021-02-07 11:29:11', '2021-02-07 11:29:11');
INSERT INTO `t_role_privilege` VALUES (10906, 54, 'NoticeList', '2021-02-07 11:29:11', '2021-02-07 11:29:11');
INSERT INTO `t_role_privilege` VALUES (10907, 54, 'notice-query', '2021-02-07 11:29:11', '2021-02-07 11:29:11');
INSERT INTO `t_role_privilege` VALUES (10908, 54, 'notice-add', '2021-02-07 11:29:11', '2021-02-07 11:29:11');
INSERT INTO `t_role_privilege` VALUES (10909, 54, 'notice-edit', '2021-02-07 11:29:11', '2021-02-07 11:29:11');
INSERT INTO `t_role_privilege` VALUES (10910, 54, 'notice-delete', '2021-02-07 11:29:11', '2021-02-07 11:29:11');
INSERT INTO `t_role_privilege` VALUES (10911, 54, 'notice-detail', '2021-02-07 11:29:11', '2021-02-07 11:29:11');
INSERT INTO `t_role_privilege` VALUES (10912, 54, 'notice-send', '2021-02-07 11:29:11', '2021-02-07 11:29:11');
INSERT INTO `t_role_privilege` VALUES (10913, 54, 'PersonNotice', '2021-02-07 11:29:11', '2021-02-07 11:29:11');
INSERT INTO `t_role_privilege` VALUES (10914, 54, 'person-notice-query', '2021-02-07 11:29:11', '2021-02-07 11:29:11');
INSERT INTO `t_role_privilege` VALUES (10915, 54, 'person-notice-detail', '2021-02-07 11:29:11', '2021-02-07 11:29:11');
INSERT INTO `t_role_privilege` VALUES (10916, 54, 'NoticeDetail', '2021-02-07 11:29:11', '2021-02-07 11:29:11');
INSERT INTO `t_role_privilege` VALUES (10917, 54, 'Business', '2021-02-07 11:29:11', '2021-02-07 11:29:11');
INSERT INTO `t_role_privilege` VALUES (10918, 55, 'Notice', '2021-02-07 11:29:15', '2021-02-07 11:29:15');
INSERT INTO `t_role_privilege` VALUES (10919, 55, 'NoticeList', '2021-02-07 11:29:15', '2021-02-07 11:29:15');
INSERT INTO `t_role_privilege` VALUES (10920, 55, 'notice-query', '2021-02-07 11:29:15', '2021-02-07 11:29:15');
INSERT INTO `t_role_privilege` VALUES (10921, 55, 'notice-add', '2021-02-07 11:29:15', '2021-02-07 11:29:15');
INSERT INTO `t_role_privilege` VALUES (10922, 55, 'notice-edit', '2021-02-07 11:29:15', '2021-02-07 11:29:15');
INSERT INTO `t_role_privilege` VALUES (10923, 55, 'notice-delete', '2021-02-07 11:29:15', '2021-02-07 11:29:15');
INSERT INTO `t_role_privilege` VALUES (10924, 55, 'notice-detail', '2021-02-07 11:29:15', '2021-02-07 11:29:15');
INSERT INTO `t_role_privilege` VALUES (10925, 55, 'notice-send', '2021-02-07 11:29:15', '2021-02-07 11:29:15');
INSERT INTO `t_role_privilege` VALUES (10926, 55, 'PersonNotice', '2021-02-07 11:29:15', '2021-02-07 11:29:15');
INSERT INTO `t_role_privilege` VALUES (10927, 55, 'person-notice-query', '2021-02-07 11:29:15', '2021-02-07 11:29:15');
INSERT INTO `t_role_privilege` VALUES (10928, 55, 'person-notice-detail', '2021-02-07 11:29:15', '2021-02-07 11:29:15');
INSERT INTO `t_role_privilege` VALUES (10929, 55, 'NoticeDetail', '2021-02-07 11:29:15', '2021-02-07 11:29:15');
INSERT INTO `t_role_privilege` VALUES (10930, 55, 'Business', '2021-02-07 11:29:15', '2021-02-07 11:29:15');
INSERT INTO `t_role_privilege` VALUES (10931, 51, 'Notice', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10932, 51, 'NoticeList', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10933, 51, 'PersonNotice', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10934, 51, 'notice-query', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10935, 51, 'notice-add', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10936, 51, 'notice-edit', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10937, 51, 'notice-delete', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10938, 51, 'notice-detail', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10939, 51, 'notice-send', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10940, 51, 'person-notice-query', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10941, 51, 'person-notice-detail', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10942, 51, 'Business', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10943, 51, 'NoticeDetail', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10944, 51, 'Peony', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10945, 51, 'PeonyList', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10946, 51, 'peony-list-query', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10947, 51, 'peony-list-add', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10948, 51, 'peony-list-update', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10949, 51, 'peony-list-batch-delete', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10950, 51, 'peony-list-batch-export', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10951, 51, 'peony-list-export-all', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10952, 51, 'PeonyList1', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10953, 51, 'peony1-list-query', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10954, 51, 'peony1-list-add', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10955, 51, 'peony1-list-update', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10956, 51, 'peony1-list-batch-delete', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10957, 51, 'peony1-list-batch-export', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10958, 51, 'peony1-list-export-all', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10959, 51, 'Email', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10960, 51, 'EmailList', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10961, 51, 'email-query', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10962, 51, 'email-add', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10963, 51, 'email-update', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10964, 51, 'email-delete', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10965, 51, 'SendMail', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
INSERT INTO `t_role_privilege` VALUES (10966, 51, 'email-send', '2021-02-08 11:52:16', '2021-02-08 11:52:16');
COMMIT;

-- ----------------------------
-- Table structure for t_system_config
-- ----------------------------
DROP TABLE IF EXISTS `t_system_config`;
CREATE TABLE `t_system_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `config_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数名字',
  `config_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数key',
  `config_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数类别',
  `is_using` int NOT NULL COMMENT '是否使用0 否 1 是',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次修改时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_system_config
-- ----------------------------
BEGIN;
INSERT INTO `t_system_config` VALUES (1, '超级管理员', 'employee_superman', '12,13,1', 'employee', 1, '123r8566456', '2019-11-14 16:40:48', '2018-08-18 16:28:03');
INSERT INTO `t_system_config` VALUES (13, '本地上传URL前缀', 'local_upload_url_prefix', 'http://172.16.0.145/smartAdmin/file/', 'upload', 1, '', '2019-09-04 16:23:49', '2019-04-26 17:06:53');
INSERT INTO `t_system_config` VALUES (14, '阿里云上传配置', 'ali_oss', '{\"accessKeyId\":\"\",\"accessKeySecret\":\"\",\"bucketName\":\"sit\",\"endpoint\":\"http://oss-cn-beijing.aliyuncs.com\"}', 'upload', 1, 'eefwfwfds', '2019-11-16 18:04:30', '2019-05-11 18:00:06');
INSERT INTO `t_system_config` VALUES (15, '邮件发配置', 'email_config', '{\"password\":\"smartadmin\",\"smtpHost\":\"smtp.163.com\",\"username\":\"smartadmin1024@163.com\"}', 'email', 1, NULL, '2019-09-04 16:42:17', '2019-05-13 16:57:48');
INSERT INTO `t_system_config` VALUES (16, '七牛云上传配置', 'qi_niu_oss', '{\"accessKeyId\":\"rX7HgY1ZLpUD25JrA-uwMM_jj-\",\"accessKeySecret\":\"\",\"bucketName\":\"sun-smart-admin\",\"endpoint\":\"http://puvpyay08.bkt.clouddn.com\"}', 'upload', 1, NULL, '2019-11-16 18:04:42', '2019-07-19 16:05:56');
INSERT INTO `t_system_config` VALUES (17, 'test', 'ww_1', 'ewr', '3', 1, 'testoo', '2019-11-08 09:43:36', '2019-11-08 09:27:19');
INSERT INTO `t_system_config` VALUES (18, '4234', '42342', '423423', '23423', 1, '423423111111111111111111111111111111111111423423111111111111111111111111111111111111423423111111111111111111111111111111111111423423111111111111111111111111111111111111423423111111111111111111111111111111111111', '2019-11-14 14:58:39', '2019-11-14 11:22:49');
INSERT INTO `t_system_config` VALUES (19, 'test323@', 'test', '123456', '11_', 1, 'gggggg', '2019-11-15 16:24:52', '2019-11-15 16:24:52');
COMMIT;

-- ----------------------------
-- Table structure for t_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_user_login_log`;
CREATE TABLE `t_user_login_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NOT NULL COMMENT '员工id',
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `remote_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户ip',
  `remote_port` int DEFAULT NULL COMMENT '用户端口',
  `remote_browser` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '浏览器',
  `remote_os` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作系统',
  `login_status` tinyint NOT NULL COMMENT '登录状态 0 失败  1成功',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`user_id`) USING BTREE,
  KEY `auditor_id` (`remote_browser`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1780 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户登录日志';

-- ----------------------------
-- Records of t_user_login_log
-- ----------------------------
BEGIN;
INSERT INTO `t_user_login_log` VALUES (1501, 30, '耿为刚', '172.16.1.234', 61406, 'Chrome', 'Windows 10', 1, '2019-09-06 14:19:47', '2019-09-06 14:19:47');
INSERT INTO `t_user_login_log` VALUES (1502, 30, '耿为刚', '172.16.1.234', 61405, 'Chrome', 'Windows 10', 1, '2019-09-06 14:20:46', '2019-09-06 14:20:46');
INSERT INTO `t_user_login_log` VALUES (1503, 30, '耿为刚', '172.16.1.234', 62213, 'Chrome', 'Windows 10', 1, '2019-09-06 14:28:50', '2019-09-06 14:28:50');
INSERT INTO `t_user_login_log` VALUES (1505, 30, '耿为刚', '172.16.1.234', 62478, 'Chrome', 'Windows 10', 1, '2019-09-06 14:32:57', '2019-09-06 14:32:57');
INSERT INTO `t_user_login_log` VALUES (1506, 1, '管理员', '127.0.0.1', 55613, 'Chrome', 'Windows 10', 1, '2019-09-06 14:35:48', '2019-09-06 14:35:48');
INSERT INTO `t_user_login_log` VALUES (1507, 1, '管理员', '172.16.1.234', 63132, 'Chrome', 'Windows 10', 1, '2019-09-06 14:38:43', '2019-09-06 14:38:43');
INSERT INTO `t_user_login_log` VALUES (1508, 30, '耿为刚', '172.16.1.234', 63132, 'Chrome', 'Windows 10', 1, '2019-09-06 14:41:36', '2019-09-06 14:41:36');
INSERT INTO `t_user_login_log` VALUES (1509, 1, '管理员', '172.16.1.234', 63332, 'Chrome', 'Windows 10', 1, '2019-09-06 14:42:37', '2019-09-06 14:42:37');
INSERT INTO `t_user_login_log` VALUES (1511, 1, '管理员', '172.16.1.166', 29923, 'Chrome', 'Windows 10', 1, '2019-09-06 15:09:22', '2019-09-06 15:09:22');
INSERT INTO `t_user_login_log` VALUES (1512, 1, '管理员', '172.16.1.113', 58150, 'Chrome', 'Windows 7', 1, '2019-09-06 15:23:31', '2019-09-06 15:23:31');
INSERT INTO `t_user_login_log` VALUES (1513, 1, '管理员', '172.16.1.166', 31226, 'Chrome', 'Windows 10', 1, '2019-09-06 15:24:51', '2019-09-06 15:24:51');
INSERT INTO `t_user_login_log` VALUES (1514, 1, '管理员', '172.16.1.113', 58300, 'Chrome', 'Windows 7', 1, '2019-09-06 15:25:04', '2019-09-06 15:25:04');
INSERT INTO `t_user_login_log` VALUES (1515, 1, '管理员', '172.16.1.113', 58300, 'Chrome', 'Windows 7', 1, '2019-09-06 15:25:26', '2019-09-06 15:25:26');
INSERT INTO `t_user_login_log` VALUES (1516, 1, '管理员', '172.16.1.166', 31243, 'Chrome', 'Windows 10', 1, '2019-09-06 15:25:29', '2019-09-06 15:25:29');
INSERT INTO `t_user_login_log` VALUES (1517, 1, '管理员', '172.16.1.221', 61458, 'Chrome', 'Windows 10', 1, '2019-09-06 15:27:07', '2019-09-06 15:27:07');
INSERT INTO `t_user_login_log` VALUES (1518, 1, '管理员', '172.16.1.166', 31243, 'Chrome', 'Windows 10', 1, '2019-09-06 15:27:09', '2019-09-06 15:27:09');
INSERT INTO `t_user_login_log` VALUES (1519, 1, '管理员', '172.16.1.113', 58300, 'Chrome', 'Windows 7', 1, '2019-09-06 15:27:10', '2019-09-06 15:27:10');
INSERT INTO `t_user_login_log` VALUES (1520, 1, '管理员', '172.16.1.166', 31551, 'Chrome', 'Windows 10', 1, '2019-09-06 15:30:01', '2019-09-06 15:30:01');
INSERT INTO `t_user_login_log` VALUES (1521, 1, '管理员', '172.16.4.160', 50527, 'Chrome', 'Windows 10', 1, '2019-09-06 15:50:20', '2019-09-06 15:50:20');
INSERT INTO `t_user_login_log` VALUES (1522, 1, '管理员', '172.16.1.166', 36381, 'Chrome', 'Windows 10', 1, '2019-09-06 16:20:46', '2019-09-06 16:20:46');
INSERT INTO `t_user_login_log` VALUES (1523, 1, '管理员', '172.16.1.166', 40039, 'Chrome', 'Windows 10', 1, '2019-09-06 17:02:33', '2019-09-06 17:02:33');
INSERT INTO `t_user_login_log` VALUES (1524, 1, '管理员', '172.16.1.166', 41014, 'Chrome', 'Windows 10', 1, '2019-09-06 17:16:09', '2019-09-06 17:16:09');
INSERT INTO `t_user_login_log` VALUES (1525, 1, '管理员', '172.16.1.188', 56577, 'Chrome', 'Windows 7', 1, '2019-09-07 08:36:31', '2019-09-07 08:36:31');
INSERT INTO `t_user_login_log` VALUES (1526, 1, '管理员', '172.16.1.48', 60852, 'Chrome', 'Windows 10', 1, '2019-09-07 08:45:02', '2019-09-07 08:45:02');
INSERT INTO `t_user_login_log` VALUES (1527, 1, '管理员', '172.16.4.85', 4818, 'Chrome', 'Windows 10', 1, '2019-09-07 09:04:44', '2019-09-07 09:04:44');
INSERT INTO `t_user_login_log` VALUES (1528, 1, '管理员', '172.16.4.85', 5230, 'Chrome', 'Windows 10', 1, '2019-09-07 09:25:41', '2019-09-07 09:25:41');
INSERT INTO `t_user_login_log` VALUES (1529, 1, '管理员', '172.16.1.166', 10251, 'Chrome', 'Windows 10', 1, '2019-09-07 10:15:20', '2019-09-07 10:15:20');
INSERT INTO `t_user_login_log` VALUES (1530, 1, '管理员', '172.16.1.48', 63877, 'Chrome', 'Windows 10', 1, '2019-09-07 11:26:19', '2019-09-07 11:26:19');
INSERT INTO `t_user_login_log` VALUES (1531, 1, '管理员', '172.16.1.166', 26667, 'Chrome', 'Windows 10', 1, '2019-09-07 14:08:15', '2019-09-07 14:08:15');
INSERT INTO `t_user_login_log` VALUES (1532, 1, '管理员', '172.16.4.85', 10604, 'Chrome', 'Windows 10', 1, '2019-09-07 14:08:33', '2019-09-07 14:08:33');
INSERT INTO `t_user_login_log` VALUES (1533, 1, '管理员', '172.16.4.85', 10604, 'Chrome', 'Windows 10', 1, '2019-09-07 14:08:50', '2019-09-07 14:08:50');
INSERT INTO `t_user_login_log` VALUES (1534, 1, '管理员', '172.16.1.166', 26812, 'Chrome', 'Windows 10', 1, '2019-09-07 14:14:09', '2019-09-07 14:14:09');
INSERT INTO `t_user_login_log` VALUES (1535, 1, '管理员', '172.16.1.188', 52924, 'Chrome', 'Windows 7', 1, '2019-09-07 14:37:16', '2019-09-07 14:37:16');
INSERT INTO `t_user_login_log` VALUES (1536, 1, '管理员', '172.16.1.188', 56721, 'Chrome', 'Windows 7', 1, '2019-09-07 14:49:37', '2019-09-07 14:49:37');
INSERT INTO `t_user_login_log` VALUES (1537, 1, '管理员', '172.16.1.188', 52839, 'Chrome', 'Windows 7', 1, '2019-09-07 15:33:04', '2019-09-07 15:33:04');
INSERT INTO `t_user_login_log` VALUES (1538, 1, '管理员', '172.16.1.166', 32489, 'Chrome', 'Windows 10', 1, '2019-09-07 15:48:02', '2019-09-07 15:48:02');
INSERT INTO `t_user_login_log` VALUES (1539, 1, '管理员', '172.16.1.166', 32847, 'Chrome', 'Windows 10', 1, '2019-09-07 15:52:25', '2019-09-07 15:52:25');
INSERT INTO `t_user_login_log` VALUES (1540, 1, '管理员', '172.16.1.166', 33456, 'Chrome', 'Windows 10', 1, '2019-09-07 16:00:01', '2019-09-07 16:00:01');
INSERT INTO `t_user_login_log` VALUES (1541, 1, '管理员', '172.16.1.188', 61015, 'Chrome', 'Windows 7', 1, '2019-09-07 17:05:49', '2019-09-07 17:05:49');
INSERT INTO `t_user_login_log` VALUES (1542, 1, '管理员', '127.0.0.1', 51566, 'Chrome', 'Windows 7', 1, '2019-09-07 17:31:20', '2019-09-07 17:31:20');
INSERT INTO `t_user_login_log` VALUES (1543, 1, '管理员', '127.0.0.1', 54228, 'Chrome', 'Windows 7', 1, '2019-09-07 17:41:12', '2019-09-07 17:41:12');
INSERT INTO `t_user_login_log` VALUES (1544, 1, '管理员', '127.0.0.1', 54957, 'Chrome', 'Windows 7', 1, '2019-09-07 17:43:21', '2019-09-07 17:43:21');
INSERT INTO `t_user_login_log` VALUES (1545, 1, '管理员', '172.16.4.85', 2336, 'Chrome', 'Windows 10', 1, '2019-09-07 18:25:51', '2019-09-07 18:25:51');
INSERT INTO `t_user_login_log` VALUES (1546, 1, '管理员', '127.0.0.1', 52161, 'Chrome', 'Windows 7', 1, '2019-09-09 08:30:47', '2019-09-09 08:30:47');
INSERT INTO `t_user_login_log` VALUES (1547, 1, '管理员', '172.16.4.85', 5903, 'Chrome', 'Windows 10', 1, '2019-09-09 08:47:47', '2019-09-09 08:47:47');
INSERT INTO `t_user_login_log` VALUES (1548, 1, '管理员', '172.16.1.243', 55673, 'Chrome', 'Windows 10', 1, '2019-09-09 11:25:02', '2019-09-09 11:25:02');
INSERT INTO `t_user_login_log` VALUES (1549, 1, '管理员', '172.16.4.85', 4672, 'Chrome', 'Windows 10', 1, '2019-09-09 11:25:34', '2019-09-09 11:25:34');
INSERT INTO `t_user_login_log` VALUES (1550, 1, '管理员', '172.16.1.188', 61186, 'Chrome', 'Windows 7', 1, '2019-09-09 11:39:24', '2019-09-09 11:39:24');
INSERT INTO `t_user_login_log` VALUES (1551, 1, '管理员', '172.16.4.85', 3032, 'Chrome', 'Windows 10', 1, '2019-09-09 14:17:53', '2019-09-09 14:17:53');
INSERT INTO `t_user_login_log` VALUES (1552, 1, '管理员', '172.16.4.85', 5829, 'Chrome', 'Windows 10', 1, '2019-09-09 14:54:27', '2019-09-09 14:54:27');
INSERT INTO `t_user_login_log` VALUES (1553, 1, '管理员', '172.16.1.166', 23398, 'Chrome', 'Windows 10', 1, '2019-09-09 15:06:50', '2019-09-09 15:06:50');
INSERT INTO `t_user_login_log` VALUES (1554, 1, '管理员', '172.16.5.60', 61094, 'Chrome', 'Windows 10', 1, '2019-09-09 15:20:50', '2019-09-09 15:20:50');
INSERT INTO `t_user_login_log` VALUES (1555, 1, '管理员', '172.16.4.85', 10566, 'Chrome', 'Windows 10', 1, '2019-09-09 15:51:22', '2019-09-09 15:51:22');
INSERT INTO `t_user_login_log` VALUES (1556, 1, '管理员', '172.16.1.166', 32190, 'Chrome', 'Windows 10', 1, '2019-09-09 17:00:59', '2019-09-09 17:00:59');
INSERT INTO `t_user_login_log` VALUES (1557, 1, '管理员', '172.16.5.60', 54502, 'Chrome', 'Windows 10', 1, '2019-09-10 09:10:48', '2019-09-10 09:10:48');
INSERT INTO `t_user_login_log` VALUES (1558, 1, '管理员', '172.16.4.85', 10659, 'Chrome', 'Windows 10', 1, '2019-09-10 09:21:48', '2019-09-10 09:21:48');
INSERT INTO `t_user_login_log` VALUES (1559, 1, '管理员', '172.16.4.85', 3363, 'Chrome', 'Windows 10', 1, '2019-09-10 10:56:23', '2019-09-10 10:56:23');
INSERT INTO `t_user_login_log` VALUES (1560, 1, '管理员', '172.16.4.85', 4460, 'Chrome', 'Windows 10', 1, '2019-09-10 14:23:44', '2019-09-10 14:23:44');
INSERT INTO `t_user_login_log` VALUES (1561, 1, '管理员', '172.16.4.85', 7344, 'Chrome', 'Windows 10', 1, '2019-09-10 14:59:52', '2019-09-10 14:59:52');
INSERT INTO `t_user_login_log` VALUES (1562, 1, '管理员', '172.16.5.89', 49996, 'Chrome', 'Windows 10', 1, '2019-09-10 18:08:04', '2019-09-10 18:08:04');
INSERT INTO `t_user_login_log` VALUES (1563, 1, '管理员', '172.16.1.38', 50152, 'Chrome', 'Windows 10', 1, '2019-09-11 10:19:27', '2019-09-11 10:19:27');
INSERT INTO `t_user_login_log` VALUES (1564, 1, '管理员', '172.16.1.38', 50173, 'Chrome', 'Windows 10', 1, '2019-09-11 10:20:38', '2019-09-11 10:20:38');
INSERT INTO `t_user_login_log` VALUES (1565, 1, '管理员', '172.16.4.141', 60881, 'Chrome', 'Windows 10', 1, '2019-09-11 14:52:02', '2019-09-11 14:52:02');
INSERT INTO `t_user_login_log` VALUES (1566, 1, '管理员', '172.16.4.93', 52688, 'Chrome', 'Windows 10', 1, '2019-09-11 15:15:14', '2019-09-11 15:15:14');
INSERT INTO `t_user_login_log` VALUES (1567, 1, '管理员', '172.16.5.127', 54993, 'Chrome', 'Windows 10', 1, '2019-09-12 14:29:58', '2019-09-12 14:29:58');
INSERT INTO `t_user_login_log` VALUES (1568, 1, '管理员', '172.16.5.127', 57424, 'Chrome', 'Windows 10', 1, '2019-09-12 15:26:46', '2019-09-12 15:26:46');
INSERT INTO `t_user_login_log` VALUES (1569, 1, '管理员', '172.16.5.127', 58073, 'Chrome', 'Windows 10', 1, '2019-09-12 15:41:54', '2019-09-12 15:41:54');
INSERT INTO `t_user_login_log` VALUES (1570, 1, '管理员', '172.16.5.146', 63230, 'Chrome', 'Windows 10', 1, '2019-09-16 10:17:15', '2019-09-16 10:17:15');
INSERT INTO `t_user_login_log` VALUES (1571, 1, '管理员', '172.16.5.146', 52857, 'Chrome', 'Windows 10', 1, '2019-09-16 11:17:18', '2019-09-16 11:17:18');
INSERT INTO `t_user_login_log` VALUES (1572, 1, '管理员', '172.16.1.190', 64527, 'Chrome', 'Windows 10', 1, '2019-09-19 14:06:45', '2019-09-19 14:06:45');
INSERT INTO `t_user_login_log` VALUES (1573, 1, '管理员', '127.0.0.1', 53267, 'Chrome', 'Windows 7', 1, '2019-09-20 17:24:33', '2019-09-20 17:24:33');
INSERT INTO `t_user_login_log` VALUES (1574, 1, '管理员', '127.0.0.1', 53267, 'Chrome', 'Windows 7', 1, '2019-09-20 17:24:43', '2019-09-20 17:24:43');
INSERT INTO `t_user_login_log` VALUES (1575, 1, '管理员', '127.0.0.1', 53267, 'Chrome', 'Windows 7', 1, '2019-09-20 17:24:59', '2019-09-20 17:24:59');
INSERT INTO `t_user_login_log` VALUES (1576, 1, '管理员', '127.0.0.1', 53267, 'Chrome', 'Windows 7', 1, '2019-09-20 17:26:05', '2019-09-20 17:26:05');
INSERT INTO `t_user_login_log` VALUES (1577, 1, '管理员', '127.0.0.1', 60612, 'Chrome', 'Windows 7', 1, '2019-09-20 17:56:06', '2019-09-20 17:56:06');
INSERT INTO `t_user_login_log` VALUES (1578, 1, '管理员', '172.16.1.202', 58066, 'Chrome', 'Windows 7', 1, '2019-09-22 18:25:03', '2019-09-22 18:25:03');
INSERT INTO `t_user_login_log` VALUES (1579, 1, '管理员', '172.16.1.48', 52290, 'Chrome', 'Windows 10', 1, '2019-09-23 16:01:16', '2019-09-23 16:01:16');
INSERT INTO `t_user_login_log` VALUES (1580, 1, '管理员', '172.16.4.141', 60997, 'Chrome', 'Windows 10', 1, '2019-09-23 17:16:55', '2019-09-23 17:16:55');
INSERT INTO `t_user_login_log` VALUES (1581, 1, '管理员', '172.16.5.146', 53246, 'Chrome', 'Windows 10', 1, '2019-09-23 17:54:14', '2019-09-23 17:54:14');
INSERT INTO `t_user_login_log` VALUES (1582, 1, '管理员', '127.0.0.1', 51987, 'Chrome', 'Windows 7', 1, '2019-09-24 09:16:37', '2019-09-24 09:16:37');
INSERT INTO `t_user_login_log` VALUES (1583, 1, '管理员', '172.16.1.202', 55724, 'Chrome', 'Windows 7', 1, '2019-09-24 12:57:39', '2019-09-24 12:57:39');
INSERT INTO `t_user_login_log` VALUES (1584, 1, '管理员', '172.16.1.166', 51876, 'Chrome', 'Windows 10', 1, '2019-09-24 16:24:37', '2019-09-24 16:24:37');
INSERT INTO `t_user_login_log` VALUES (1585, 1, '管理员', '172.16.1.202', 51648, 'Chrome', 'Windows 7', 1, '2019-09-24 19:26:39', '2019-09-24 19:26:39');
INSERT INTO `t_user_login_log` VALUES (1586, 1, '管理员', '172.16.1.234', 60984, 'Chrome', 'Windows 10', 1, '2019-09-26 10:52:07', '2019-09-26 10:52:07');
INSERT INTO `t_user_login_log` VALUES (1587, 1, '管理员', '172.16.1.234', 63440, 'Chrome', 'Windows 10', 1, '2019-09-26 11:30:54', '2019-09-26 11:30:54');
INSERT INTO `t_user_login_log` VALUES (1588, 1, '管理员', '172.16.1.202', 51956, 'Chrome', 'Windows 7', 1, '2019-09-27 20:55:08', '2019-09-27 20:55:08');
INSERT INTO `t_user_login_log` VALUES (1589, 1, '管理员', '172.16.1.48', 56166, 'Chrome', 'Windows 10', 1, '2019-09-30 08:59:13', '2019-09-30 08:59:13');
INSERT INTO `t_user_login_log` VALUES (1590, 1, '管理员', '172.16.1.202', 51448, 'Chrome', 'Windows 7', 1, '2019-09-30 09:00:13', '2019-09-30 09:00:13');
INSERT INTO `t_user_login_log` VALUES (1591, 1, '管理员', '172.16.1.188', 62679, 'Chrome', 'Windows 7', 1, '2019-10-15 11:25:26', '2019-10-15 11:25:26');
INSERT INTO `t_user_login_log` VALUES (1592, 1, '管理员', '172.16.1.234', 54034, 'Chrome', 'Windows 10', 1, '2019-10-18 10:47:14', '2019-10-18 10:47:14');
INSERT INTO `t_user_login_log` VALUES (1593, 1, '管理员', '172.16.1.234', 64515, 'Chrome', 'Windows 10', 1, '2019-10-18 13:32:10', '2019-10-18 13:32:10');
INSERT INTO `t_user_login_log` VALUES (1594, 1, '管理员', '172.16.1.234', 50211, 'Chrome', 'Windows 10', 1, '2019-10-18 13:56:19', '2019-10-18 13:56:19');
INSERT INTO `t_user_login_log` VALUES (1595, 1, '管理员', '172.16.1.234', 55469, 'Chrome', 'Windows 10', 1, '2019-10-18 14:56:24', '2019-10-18 14:56:24');
INSERT INTO `t_user_login_log` VALUES (1596, 1, '管理员', '172.16.1.234', 56392, 'Chrome', 'Windows 10', 1, '2019-10-18 15:08:25', '2019-10-18 15:08:25');
INSERT INTO `t_user_login_log` VALUES (1597, 1, '管理员', '172.16.1.234', 60896, 'Chrome', 'Windows 10', 1, '2019-10-18 16:14:15', '2019-10-18 16:14:15');
INSERT INTO `t_user_login_log` VALUES (1598, 1, '管理员', '172.16.1.234', 50590, 'Chrome', 'Windows 10', 1, '2019-10-19 08:38:54', '2019-10-19 08:38:54');
INSERT INTO `t_user_login_log` VALUES (1599, 1, '管理员', '172.16.1.166', 4879, 'Chrome', 'Windows 10', 1, '2019-10-19 09:19:08', '2019-10-19 09:19:08');
INSERT INTO `t_user_login_log` VALUES (1600, 1, '管理员', '172.16.1.188', 62895, 'Chrome', 'Windows 7', 1, '2019-10-19 13:49:29', '2019-10-19 13:49:29');
INSERT INTO `t_user_login_log` VALUES (1601, 1, '管理员', '172.16.1.234', 58144, 'Chrome', 'Windows 10', 1, '2019-10-19 14:55:50', '2019-10-19 14:55:50');
INSERT INTO `t_user_login_log` VALUES (1602, 1, '管理员', '127.0.0.1', 61033, 'Chrome', 'Windows 7', 1, '2019-10-19 15:19:38', '2019-10-19 15:19:38');
INSERT INTO `t_user_login_log` VALUES (1603, 1, '管理员', '172.16.1.188', 58944, 'Chrome', 'Windows 7', 1, '2019-10-19 16:48:49', '2019-10-19 16:48:49');
INSERT INTO `t_user_login_log` VALUES (1604, 1, '管理员', '172.16.1.188', 63950, 'Chrome', 'Windows 7', 1, '2019-10-21 08:10:38', '2019-10-21 08:10:38');
INSERT INTO `t_user_login_log` VALUES (1605, 1, '管理员', '172.16.1.188', 64899, 'Chrome', 'Windows 7', 1, '2019-10-21 08:17:40', '2019-10-21 08:17:40');
INSERT INTO `t_user_login_log` VALUES (1606, 1, '管理员', '172.16.1.221', 53180, 'Chrome', 'Windows 10', 1, '2019-10-21 15:52:36', '2019-10-21 15:52:36');
INSERT INTO `t_user_login_log` VALUES (1607, 1, '管理员', '172.16.1.221', 56067, 'Chrome', 'Windows 10', 1, '2019-10-23 10:19:39', '2019-10-23 10:19:39');
INSERT INTO `t_user_login_log` VALUES (1608, 1, '管理员', '172.16.1.221', 57692, 'Chrome', 'Windows 10', 1, '2019-10-23 16:36:39', '2019-10-23 16:36:39');
INSERT INTO `t_user_login_log` VALUES (1609, 1, '管理员', '172.16.1.188', 57180, 'Chrome', 'Windows 7', 1, '2019-10-24 08:26:21', '2019-10-24 08:26:21');
INSERT INTO `t_user_login_log` VALUES (1610, 1, '管理员', '172.16.0.196', 61409, 'Chrome', 'Windows 10', 1, '2019-10-24 08:26:55', '2019-10-24 08:26:55');
INSERT INTO `t_user_login_log` VALUES (1611, 1, '管理员', '172.16.1.234', 51906, 'Chrome', 'Windows 10', 1, '2019-10-24 15:56:50', '2019-10-24 15:56:50');
INSERT INTO `t_user_login_log` VALUES (1612, 1, '管理员', '172.16.1.234', 56793, 'Chrome', 'Windows 10', 1, '2019-10-24 17:04:54', '2019-10-24 17:04:54');
INSERT INTO `t_user_login_log` VALUES (1613, 30, '耿为刚', '172.16.1.234', 60368, 'Chrome', 'Windows 10', 1, '2019-10-24 17:51:13', '2019-10-24 17:51:13');
INSERT INTO `t_user_login_log` VALUES (1614, 1, '管理员', '172.16.1.234', 60368, 'Chrome', 'Windows 10', 1, '2019-10-24 17:51:56', '2019-10-24 17:51:56');
INSERT INTO `t_user_login_log` VALUES (1615, 30, '耿为刚', '172.16.1.234', 60589, 'Chrome 65', 'Windows 10', 1, '2019-10-24 17:52:52', '2019-10-24 17:52:52');
INSERT INTO `t_user_login_log` VALUES (1616, 1, '管理员', '172.16.1.234', 52998, 'Chrome', 'Windows 10', 1, '2019-10-25 09:28:13', '2019-10-25 09:28:13');
INSERT INTO `t_user_login_log` VALUES (1617, 1, '管理员', '172.16.1.234', 54948, 'Chrome', 'Windows 10', 1, '2019-10-25 10:01:34', '2019-10-25 10:01:34');
INSERT INTO `t_user_login_log` VALUES (1618, 1, '管理员', '172.16.1.234', 56800, 'Chrome', 'Windows 10', 1, '2019-10-25 10:32:53', '2019-10-25 10:32:53');
INSERT INTO `t_user_login_log` VALUES (1619, 1, '管理员', '127.0.0.1', 59071, 'Chrome', 'Windows 7', 1, '2019-10-28 16:05:21', '2019-10-28 16:05:21');
INSERT INTO `t_user_login_log` VALUES (1620, 1, '管理员', '127.0.0.1', 60106, 'Chrome', 'Windows 7', 1, '2019-10-28 16:11:29', '2019-10-28 16:11:29');
INSERT INTO `t_user_login_log` VALUES (1621, 1, '管理员', '127.0.0.1', 63479, 'Chrome', 'Windows 7', 1, '2019-10-28 16:28:59', '2019-10-28 16:28:59');
INSERT INTO `t_user_login_log` VALUES (1622, 1, '管理员', '127.0.0.1', 63479, 'Chrome', 'Windows 7', 1, '2019-10-28 16:29:55', '2019-10-28 16:29:55');
INSERT INTO `t_user_login_log` VALUES (1623, 1, '管理员', '127.0.0.1', 57588, 'Chrome', 'Windows 7', 1, '2019-10-29 15:37:03', '2019-10-29 15:37:03');
INSERT INTO `t_user_login_log` VALUES (1741, 1, '管理员', '127.0.0.1', 54621, 'Chrome', 'Windows 7', 1, '2019-11-16 18:03:45', '2019-11-16 18:03:45');
INSERT INTO `t_user_login_log` VALUES (1742, 1, '管理员', '127.0.0.1', 60932, 'Chrome 8', 'Windows 10', 1, '2020-12-14 15:14:55', '2020-12-14 15:14:55');
INSERT INTO `t_user_login_log` VALUES (1743, 40, '张向宇', '127.0.0.1', 52848, 'Chrome 8', 'Mac OS X', 1, '2021-02-07 11:30:15', '2021-02-07 11:30:15');
INSERT INTO `t_user_login_log` VALUES (1744, 1, '管理员', '127.0.0.1', 52848, 'Chrome 8', 'Mac OS X', 1, '2021-02-07 11:30:42', '2021-02-07 11:30:42');
INSERT INTO `t_user_login_log` VALUES (1745, 40, '张向宇', '127.0.0.1', 53573, 'Chrome 8', 'Mac OS X', 1, '2021-02-07 11:31:34', '2021-02-07 11:31:34');
INSERT INTO `t_user_login_log` VALUES (1746, 1, '管理员', '127.0.0.1', 54675, 'Chrome 8', 'Mac OS X', 1, '2021-02-07 11:34:38', '2021-02-07 11:34:38');
INSERT INTO `t_user_login_log` VALUES (1747, 40, '张向宇', '127.0.0.1', 59898, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 11:53:15', '2021-02-07 11:53:15');
INSERT INTO `t_user_login_log` VALUES (1748, 40, '张向宇', '127.0.0.1', 61403, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 11:58:48', '2021-02-07 11:58:48');
INSERT INTO `t_user_login_log` VALUES (1749, 40, '张向宇', '127.0.0.1', 61403, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 11:59:42', '2021-02-07 11:59:42');
INSERT INTO `t_user_login_log` VALUES (1750, 40, '张向宇', '127.0.0.1', 65291, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 12:14:22', '2021-02-07 12:14:22');
INSERT INTO `t_user_login_log` VALUES (1751, 1, '管理员', '127.0.0.1', 56865, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 12:44:34', '2021-02-07 12:44:34');
INSERT INTO `t_user_login_log` VALUES (1752, 40, '张向宇', '127.0.0.1', 58499, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 12:50:03', '2021-02-07 12:50:03');
INSERT INTO `t_user_login_log` VALUES (1753, 40, '张向宇', '127.0.0.1', 58499, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 12:50:25', '2021-02-07 12:50:25');
INSERT INTO `t_user_login_log` VALUES (1754, 40, '张向宇', '127.0.0.1', 59522, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 12:53:24', '2021-02-07 12:53:24');
INSERT INTO `t_user_login_log` VALUES (1755, 40, '张向宇', '127.0.0.1', 59985, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 12:54:44', '2021-02-07 12:54:44');
INSERT INTO `t_user_login_log` VALUES (1756, 1, '管理员', '127.0.0.1', 60919, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 12:58:07', '2021-02-07 12:58:07');
INSERT INTO `t_user_login_log` VALUES (1757, 40, '张向宇', '127.0.0.1', 60919, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 12:58:59', '2021-02-07 12:58:59');
INSERT INTO `t_user_login_log` VALUES (1758, 1, '管理员', '127.0.0.1', 64060, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 13:07:57', '2021-02-07 13:07:57');
INSERT INTO `t_user_login_log` VALUES (1759, 40, '张向宇', '127.0.0.1', 64060, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 13:08:29', '2021-02-07 13:08:29');
INSERT INTO `t_user_login_log` VALUES (1760, 1, '管理员', '127.0.0.1', 64601, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 13:09:58', '2021-02-07 13:09:58');
INSERT INTO `t_user_login_log` VALUES (1761, 40, '张向宇', '127.0.0.1', 65535, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 13:13:15', '2021-02-07 13:13:15');
INSERT INTO `t_user_login_log` VALUES (1762, 40, '张向宇', '127.0.0.1', 51961, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 13:23:37', '2021-02-07 13:23:37');
INSERT INTO `t_user_login_log` VALUES (1763, 1, '管理员', '127.0.0.1', 52797, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 13:26:46', '2021-02-07 13:26:46');
INSERT INTO `t_user_login_log` VALUES (1764, 40, '张向宇', '127.0.0.1', 53281, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 13:28:24', '2021-02-07 13:28:24');
INSERT INTO `t_user_login_log` VALUES (1765, 1, '管理员', '127.0.0.1', 53281, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 13:28:37', '2021-02-07 13:28:37');
INSERT INTO `t_user_login_log` VALUES (1766, 1, '管理员', '127.0.0.1', 53281, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 13:28:56', '2021-02-07 13:28:56');
INSERT INTO `t_user_login_log` VALUES (1767, 1, '管理员', '127.0.0.1', 55236, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 13:35:22', '2021-02-07 13:35:22');
INSERT INTO `t_user_login_log` VALUES (1768, 40, '张向宇', '127.0.0.1', 52391, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 20:46:52', '2021-02-07 20:46:52');
INSERT INTO `t_user_login_log` VALUES (1769, 1, '管理员', '127.0.0.1', 61014, 'Chrome 8', 'Mac OS X', 1, '2021-02-07 23:05:26', '2021-02-07 23:05:26');
INSERT INTO `t_user_login_log` VALUES (1770, 40, '张向宇', '127.0.0.1', 55367, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 23:43:27', '2021-02-07 23:43:27');
INSERT INTO `t_user_login_log` VALUES (1771, 40, '张向宇', '127.0.0.1', 55899, 'Chrome Mobile', 'Android 6.x', 1, '2021-02-07 23:45:18', '2021-02-07 23:45:18');
INSERT INTO `t_user_login_log` VALUES (1772, 1, '管理员', '127.0.0.1', 59118, 'Chrome 8', 'Mac OS X', 1, '2021-02-08 10:49:20', '2021-02-08 10:49:20');
INSERT INTO `t_user_login_log` VALUES (1773, 1, '管理员', '127.0.0.1', 55364, 'Chrome 8', 'Mac OS X', 1, '2021-02-08 11:47:58', '2021-02-08 11:47:58');
INSERT INTO `t_user_login_log` VALUES (1774, 41, '张向宇', '127.0.0.1', 56221, 'Chrome 8', 'Mac OS X', 1, '2021-02-08 11:50:18', '2021-02-08 11:50:18');
INSERT INTO `t_user_login_log` VALUES (1775, 1, '管理员', '127.0.0.1', 56221, 'Chrome 8', 'Mac OS X', 1, '2021-02-08 11:51:00', '2021-02-08 11:51:00');
INSERT INTO `t_user_login_log` VALUES (1776, 41, '张向宇', '127.0.0.1', 56492, 'Chrome 8', 'Mac OS X', 1, '2021-02-08 11:52:28', '2021-02-08 11:52:28');
INSERT INTO `t_user_login_log` VALUES (1777, 1, '管理员', '127.0.0.1', 56492, 'Chrome 8', 'Mac OS X', 1, '2021-02-08 11:55:01', '2021-02-08 11:55:01');
INSERT INTO `t_user_login_log` VALUES (1778, 41, '张向宇', '127.0.0.1', 62176, 'Chrome 8', 'Mac OS X', 1, '2021-02-08 12:06:16', '2021-02-08 12:06:16');
INSERT INTO `t_user_login_log` VALUES (1779, 1, '管理员', '127.0.0.1', 51608, 'Chrome 8', 'Mac OS X', 1, '2021-02-08 13:50:52', '2021-02-08 13:50:52');
COMMIT;

-- ----------------------------
-- Table structure for t_user_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `t_user_operate_log`;
CREATE TABLE `t_user_operate_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NOT NULL COMMENT '用户id',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名称',
  `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作模块',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作内容',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求路径',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求方法',
  `param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '请求参数',
  `result` tinyint DEFAULT NULL COMMENT '请求结果 0失败 1成功',
  `fail_reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '失败原因',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=565 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_user_operate_log
-- ----------------------------
BEGIN;
INSERT INTO `t_user_operate_log` VALUES (1, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/0', 'com.gangquan360.smartadmin.module.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[0]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (2, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.gangquan360.smartadmin.module.role.basic.RoleController.getAllRole', '', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (3, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.gangquan360.smartadmin.module.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (4, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.gangquan360.smartadmin.module.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true,\"sort\":false}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (5, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.gangquan360.smartadmin.module.role.basic.RoleController.getAllRole', '', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (6, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.gangquan360.smartadmin.module.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (7, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.gangquan360.smartadmin.module.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (8, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.gangquan360.smartadmin.module.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":10}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (9, 1, '管理员', '管理端-用户', '员工重置密码', '/smart-admin-api/employee/resetPasswd/29', 'com.gangquan360.smartadmin.module.employee.EmployeeController.resetPasswd', 'Integer[29]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (10, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.gangquan360.smartadmin.module.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":10}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (11, 1, '管理员', '管理端-角色用户', '通过员工id获取所有角色以及员工具有的角色', '/smart-admin-api/role/getRoles/29', 'com.gangquan360.smartadmin.module.role.roleemployee.RoleEmployeeController.getRoleByEmployeeId', 'Long[29]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (12, 1, '管理员', '管理端-用户', '单个员工角色授权', '/smart-admin-api/employee/updateRoles', 'com.gangquan360.smartadmin.module.employee.EmployeeController.updateRoles', 'EmployeeUpdateRolesDTO[{\"employeeId\":29,\"roleIds\":[34,45]}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (13, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.gangquan360.smartadmin.module.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":10}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (14, 1, '管理员', '管理端-角色权限', '更新角色权限', '/smart-admin-api/privilege/updateRolePrivilege', 'com.gangquan360.smartadmin.module.role.roleprivilege.RolePrivilegeController.updateRolePrivilege', 'RolePrivilegeDTO[{\"privilegeKeyList\":[\"Employee\",\"RoleManage\",\"PositionList\",\"RoleEmployeeManage\",\"SystemSetting\",\"SystemConfig\",\"SystemPrivilege\",\"Notice\",\"NoticeList\",\"PersonNotice\",\"Email\",\"EmailList\",\"SendMail\",\"UserLog\",\"UserOperateLog\",\"UserLoginLog\",\"Monitor\",\"OnlineUser\",\"Sql\",\"Task\",\"TaskList\",\"Reload\",\"SmartReloadList\",\"ApiDoc\",\"Swagger\",\"ThreeRouter\",\"LevelTwo\",\"RoleOneTwo\",\"RoleTwoTwo\",\"RoleOneOne\",\"KeepAlive\",\"KeepAliveContentList\",\"KeepAliveAddContent\",\"HeartBeat\",\"HeartBeatList\",\"File\",\"FileList\",\"add-role\",\"delete-role\",\"update-role\",\"update-role-privilege\",\"add-employee-role\",\"search-employee-list\",\"delete-employee-role\",\"delete-employee-role-batch\",\"query-data-scope\",\"update-data-scope\",\"search-position\",\"add-position\",\"update-position\",\"delete-position\",\"add-department\",\"update-department\",\"delete-department\",\"search-department\",\"add-employee\",\"update-employee\",\"disabled-employee\",\"disabled-employee-batch\",\"update-employee-role\",\"reset-employee-password\",\"delete-employee\",\"system-params-search\",\"system-params-add\",\"system-config-update\",\"system-config-search\",\"privilege-main-update\",\"privilege-main-search\",\"notice-query\",\"notice-add\",\"notice-edit\",\"notice-delete\",\"notice-detail\",\"notice-send\",\"person-notice-query\",\"person-notice-detail\",\"email-query\",\"email-add\",\"email-update\",\"email-delete\",\"email-send\",\"user-operate-log-search\",\"user-operate-log-detail\",\"user-operate-log-delete\",\"user-login-log-search\",\"user-login-log-delete\",\"online-user-search\",\"task-search\",\"task-refresh\",\"task-add\",\"task-update\",\"task-pause\",\"task-resume\",\"task-run\",\"task-query-log\",\"task-delete\",\"smart-reload-search\",\"smart-reload-update\",\"smart-reload-result\",\"heart-beat-query\",\"file-filePage-query\",\"file-filePage-upload\"],\"roleId\":1}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (15, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.gangquan360.smartadmin.module.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (16, 1, '管理员', '管理端-系统配置', '分页查询所有系统配置', '/smart-admin-api/systemConfig/getListPage', 'com.gangquan360.smartadmin.module.systemconfig.SystemConfigController.getSystemConfigPage', 'SystemConfigQueryDTO[{\"key\":\"\",\"pageNum\":1,\"pageSize\":10}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (17, 1, '管理员', '管理端-系统配置', '修改配置参数', '/smart-admin-api/systemConfig/update', 'com.gangquan360.smartadmin.module.systemconfig.SystemConfigController.updateSystemConfig', 'SystemConfigUpdateDTO[{\"configGroup\":\"upload\",\"configKey\":\"ali_oss\",\"configName\":\"阿里云上传配置\",\"configValue\":\"{\\\"accessKeyId\\\":\\\"\\\",\\\"accessKeySecret\\\":\\\"\\\",\\\"bucketName\\\":\\\"sit\\\",\\\"endpoint\\\":\\\"http://oss-cn-beijing.aliyuncs.com\\\"}\",\"id\":14,\"remark\":\"eefwfwfds\"}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (18, 1, '管理员', '管理端-系统配置', '分页查询所有系统配置', '/smart-admin-api/systemConfig/getListPage', 'com.gangquan360.smartadmin.module.systemconfig.SystemConfigController.getSystemConfigPage', 'SystemConfigQueryDTO[{\"key\":\"\",\"pageNum\":1,\"pageSize\":10}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (19, 1, '管理员', '管理端-系统配置', '修改配置参数', '/smart-admin-api/systemConfig/update', 'com.gangquan360.smartadmin.module.systemconfig.SystemConfigController.updateSystemConfig', 'SystemConfigUpdateDTO[{\"configGroup\":\"upload\",\"configKey\":\"qi_niu_oss\",\"configName\":\"七牛云上传配置\",\"configValue\":\"{\\\"accessKeyId\\\":\\\"rX7HgY1ZLpUD25JrA-uwMM_jj-\\\",\\\"accessKeySecret\\\":\\\"\\\",\\\"bucketName\\\":\\\"sun-smart-admin\\\",\\\"endpoint\\\":\\\"http://puvpyay08.bkt.clouddn.com\\\"}\",\"id\":16}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (20, 1, '管理员', '管理端-系统配置', '分页查询所有系统配置', '/smart-admin-api/systemConfig/getListPage', 'com.gangquan360.smartadmin.module.systemconfig.SystemConfigController.getSystemConfigPage', 'SystemConfigQueryDTO[{\"key\":\"\",\"pageNum\":1,\"pageSize\":10}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (21, 1, '管理员', '通用-权限', '获取所有请求路径', '/smart-admin-api/privilege/getAllUrl', 'com.gangquan360.smartadmin.module.privilege.controller.PrivilegeController.getAllUrl', '', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (22, 1, '管理员', '通用-权限', '查询所有菜单项', '/smart-admin-api/privilege/menu/queryAll', 'com.gangquan360.smartadmin.module.privilege.controller.PrivilegeController.queryAll', '', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (23, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/FileList', 'com.gangquan360.smartadmin.module.privilege.controller.PrivilegeController.functionQuery', 'String[\"FileList\"]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (24, 1, '管理员', '通用-权限', '保存更新功能点', '/smart-admin-api/privilege/function/saveOrUpdate', 'com.gangquan360.smartadmin.module.privilege.controller.PrivilegeController.functionSaveOrUpdate', 'PrivilegeFunctionDTO[{\"functionKey\":\"file-filePage-download\",\"functionName\":\"下载\",\"menuKey\":\"FileList\",\"sort\":2,\"url\":\"fileController.downLoadById\"}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (25, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/FileList', 'com.gangquan360.smartadmin.module.privilege.controller.PrivilegeController.functionQuery', 'String[\"FileList\"]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (26, 1, '管理员', '通用-邮件发送', '分页查询', '/smart-admin-api/email/page/query', 'com.gangquan360.smartadmin.module.email.EmailController.queryByPage', 'EmailQueryDTO[{\"endDate\":\"\",\"pageNum\":1,\"pageSize\":10,\"searchCount\":true,\"startDate\":\"\"}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (27, 1, '管理员', '管理端-用户操作日志', '分页查询', '/smart-admin-api/userOperateLog/page/query', 'com.gangquan360.smartadmin.module.log.useroperatelog.UserOperateLogController.queryByPage', 'UserOperateLogQueryDTO[{\"endDate\":\"\",\"pageNum\":1,\"pageSize\":10,\"searchCount\":true,\"sort\":false,\"startDate\":\"\",\"userName\":\"\"}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (28, 1, '管理员', '管理端-用户登录日志', '分页查询用户登录日志', '/smart-admin-api/userLoginLog/page/query', 'com.gangquan360.smartadmin.module.log.userloginlog.UserLoginLogController.queryByPage', 'UserLoginLogQueryDTO[{\"endDate\":\"\",\"pageNum\":1,\"pageSize\":10,\"searchCount\":true,\"sort\":false,\"startDate\":\"\",\"userName\":\"\"}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (29, 1, '管理员', '管理端-用户登录日志', '查询员工在线状态', '/smart-admin-api/userOnLine/query', 'com.gangquan360.smartadmin.module.log.userloginlog.UserLoginLogController.queryUserOnLine', 'EmployeeQueryDTO[{\"actualName\":\"\",\"employeeIds\":[1],\"isDelete\":0,\"pageNum\":1,\"pageSize\":10}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (30, 1, '管理员', '管理端-任务调度', '查询任务', '/smart-admin-api/quartz/task/query', 'com.gangquan360.smartadmin.module.quartz.controller.QuartzController.query', 'QuartzQueryDTO[{\"pageNum\":1,\"pageSize\":10}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (31, 1, '管理员', '管理端-smart reload', '获取全部Smart-reload项', '/smart-admin-api/smartReload/all', 'com.gangquan360.smartadmin.module.smartreload.SmartReloadController.listAllReloadItem', '', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (32, 1, '管理员', '通用-心跳服务', '查询心跳记录 @author zhuoda', '/smart-admin-api/heartBeat/query', 'com.gangquan360.smartadmin.module.heartbeat.HeartBeatController.query', 'PageParamDTO[{\"pageNum\":1,\"pageSize\":10}]', 1, NULL, '2019-11-01 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `t_user_operate_log` VALUES (33, 1, '管理员', '通用-权限', '获取所有请求路径', '/smart-admin-api/privilege/getAllUrl', 'com.asset.module.system.privilege.controller.PrivilegeController.getAllUrl', '', 1, NULL, '2020-12-14 15:15:06', '2020-12-14 15:15:06');
INSERT INTO `t_user_operate_log` VALUES (34, 1, '管理员', '通用-权限', '查询所有菜单项', '/smart-admin-api/privilege/menu/queryAll', 'com.asset.module.system.privilege.controller.PrivilegeController.queryAll', '', 1, NULL, '2020-12-14 15:15:06', '2020-12-14 15:15:06');
INSERT INTO `t_user_operate_log` VALUES (35, 1, '管理员', '通用-权限', '菜单批量保存', '/smart-admin-api/privilege/menu/batchSaveMenu', 'com.asset.module.system.privilege.controller.PrivilegeController.menuBatchSave', 'ValidateList[[{\"menuKey\":\"Business\",\"menuName\":\"业务功能\",\"sort\":0,\"type\":1,\"url\":\"/business\"},{\"menuKey\":\"Peony\",\"menuName\":\"牡丹管理\",\"parentKey\":\"Business\",\"sort\":0,\"type\":1,\"url\":\"/peony\"},{\"menuKey\":\"PeonyList\",\"menuName\":\"牡丹花列表\",\"parentKey\":\"Peony\",\"sort\":0,\"type\":1,\"url\":\"/peony/peony-list\"},{\"menuKey\":\"PeonyList1\",\"menuName\":\"牡丹花列表1\",\"parentKey\":\"Peony\",\"sort\":0,\"type\":1,\"url\":\"/peony/peony-list1\"},{\"menuKey\":\"Email\",\"menuName\":\"邮件管理\",\"parentKey\":\"Business\",\"sort\":0,\"type\":1,\"url\":\"/email\"},{\"menuKey\":\"EmailList\",\"menuName\":\"邮件管理\",\"parentKey\":\"Email\",\"sort\":0,\"type\":1,\"url\":\"/email/email-list\"},{\"menuKey\":\"SendMail\",\"menuName\":\"发送邮件\",\"parentKey\":\"Email\",\"sort\":0,\"type\":1,\"url\":\"/email/send-mail\"},{\"menuKey\":\"KeepAlive\",\"menuName\":\"KeepAlive\",\"parentKey\":\"Business\",\"sort\":0,\"type\":1,\"url\":\"/keep-alive\"},{\"menuKey\":\"KeepAliveContentList\",\"menuName\":\"KeepAlive列表\",\"parentKey\":\"KeepAlive\",\"sort\":0,\"type\":1,\"url\":\"/keep-alive/content-list\"},{\"menuKey\":\"KeepAliveAddContent\",\"menuName\":\"KeepAlive表单\",\"parentKey\":\"KeepAlive\",\"sort\":0,\"type\":1,\"url\":\"/keep-alive/add-content\"},{\"menuKey\":\"Notice\",\"menuName\":\"消息管理\",\"parentKey\":\"Business\",\"sort\":0,\"type\":1,\"url\":\"/notice\"},{\"menuKey\":\"NoticeList\",\"menuName\":\"通知管理\",\"parentKey\":\"Notice\",\"sort\":0,\"type\":1,\"url\":\"/notice/notice-list\"},{\"menuKey\":\"PersonNotice\",\"menuName\":\"个人消息\",\"parentKey\":\"Notice\",\"sort\":0,\"type\":1,\"url\":\"/notice/person-notice\"},{\"menuKey\":\"NoticeDetail\",\"menuName\":\"消息详情\",\"parentKey\":\"Notice\",\"sort\":0,\"type\":1,\"url\":\"/notice/notice-detail\"},{\"menuKey\":\"ThreeRouter\",\"menuName\":\"三级路由\",\"parentKey\":\"Business\",\"sort\":0,\"type\":1,\"url\":\"/three-router\"},{\"menuKey\":\"LevelTwo\",\"menuName\":\"三级菜单\",\"parentKey\":\"ThreeRouter\",\"sort\":0,\"type\":1,\"url\":\"/three-router/level-two\"},{\"menuKey\":\"ThreeLevelRouterView\",\"menuName\":\"三级菜单子颗粒\",\"parentKey\":\"LevelTwo\",\"sort\":0,\"type\":1,\"url\":\"/three-router/level-two/level-three1\"},{\"menuKey\":\"RoleTwoTwo\",\"menuName\":\"三级菜单子哈\",\"parentKey\":\"LevelTwo\",\"sort\":0,\"type\":1,\"url\":\"/three-router/level-two/level-three2\"},{\"menuKey\":\"RoleOneOne\",\"menuName\":\"二级菜单\",\"parentKey\":\"ThreeRouter\",\"sort\":0,\"type\":1,\"url\":\"/three-router/level-two2\"},{\"menuKey\":\"System\",\"menuName\":\"系统设置\",\"sort\":0,\"type\":1,\"url\":\"/system\"},{\"menuKey\":\"Employee\",\"menuName\":\"人员管理\",\"parentKey\":\"System\",\"sort\":0,\"type\":1,\"url\":\"/employee\"},{\"menuKey\":\"RoleManage\",\"menuName\":\"角色管理\",\"parentKey\":\"Employee\",\"sort\":0,\"type\":1,\"url\":\"/employee/role\"},{\"menuKey\":\"PositionList\",\"menuName\":\"岗位管理\",\"parentKey\":\"Employee\",\"sort\":0,\"type\":1,\"url\":\"/employee/position\"},{\"menuKey\":\"RoleEmployeeManage\",\"menuName\":\"员工管理\",\"parentKey\":\"Employee\",\"sort\":0,\"type\":1,\"url\":\"/employee/role-employee-manage\"},{\"menuKey\":\"File\",\"menuName\":\"文件服务\",\"parentKey\":\"System\",\"sort\":0,\"type\":1,\"url\":\"/file\"},{\"menuKey\":\"FileList\",\"menuName\":\"文件列表\",\"parentKey\":\"File\",\"sort\":0,\"type\":1,\"url\":\"/file/file-list\"},{\"menuKey\":\"UserLog\",\"menuName\":\"用户日志\",\"parentKey\":\"System\",\"sort\":0,\"type\":1,\"url\":\"/user-log\"},{\"menuKey\":\"UserOperateLog\",\"menuName\":\"用户操作日志\",\"parentKey\":\"UserLog\",\"sort\":0,\"type\":1,\"url\":\"/user-log/user-operate-log\"},{\"menuKey\":\"UserLoginLog\",\"menuName\":\"用户登录日志\",\"parentKey\":\"UserLog\",\"sort\":0,\"type\":1,\"url\":\"/user-log/user-login-log\"},{\"menuKey\":\"SystemSetting\",\"menuName\":\"系统设置\",\"parentKey\":\"System\",\"sort\":0,\"type\":1,\"url\":\"/system-setting\"},{\"menuKey\":\"SystemConfig\",\"menuName\":\"系统参数\",\"parentKey\":\"SystemSetting\",\"sort\":0,\"type\":1,\"url\":\"/system-setting/system-config\"},{\"menuKey\":\"SystemPrivilege\",\"menuName\":\"菜单设置\",\"parentKey\":\"SystemSetting\",\"sort\":0,\"type\":1,\"url\":\"/system-setting/system-privilege\"},{\"menuKey\":\"Support\",\"menuName\":\"开发专用\",\"sort\":0,\"type\":1,\"url\":\"/support\"},{\"menuKey\":\"ApiDoc\",\"menuName\":\"接口文档\",\"parentKey\":\"Support\",\"sort\":0,\"type\":1,\"url\":\"/api-doc\"},{\"menuKey\":\"Swagger\",\"menuName\":\"Swagger接口文档\",\"parentKey\":\"ApiDoc\",\"sort\":0,\"type\":1,\"url\":\"/api-doc/swagger\"},{\"menuKey\":\"HeartBeat\",\"menuName\":\"心跳服务\",\"parentKey\":\"Support\",\"sort\":0,\"type\":1,\"url\":\"/heart-beat\"},{\"menuKey\":\"HeartBeatList\",\"menuName\":\"心跳服务\",\"parentKey\":\"HeartBeat\",\"sort\":0,\"type\":1,\"url\":\"/heart-beat/heart-beat-list\"},{\"menuKey\":\"Monitor\",\"menuName\":\"系统监控\",\"parentKey\":\"Support\",\"sort\":0,\"type\":1,\"url\":\"/monitor\"},{\"menuKey\":\"OnlineUser\",\"menuName\":\"在线人数\",\"parentKey\":\"Monitor\",\"sort\":0,\"type\":1,\"url\":\"/monitor/online-user\"},{\"menuKey\":\"Sql\",\"menuName\":\"SQL监控\",\"parentKey\":\"Monitor\",\"sort\":0,\"type\":1,\"url\":\"/monitor/sql\"},{\"menuKey\":\"Reload\",\"menuName\":\"动态加载\",\"parentKey\":\"Support\",\"sort\":0,\"type\":1,\"url\":\"/reload\"},{\"menuKey\":\"SmartReloadList\",\"menuName\":\"SmartReload\",\"parentKey\":\"Reload\",\"sort\":0,\"type\":1,\"url\":\"/reload/smart-reload-list\"},{\"menuKey\":\"Task\",\"menuName\":\"定时任务\",\"parentKey\":\"Support\",\"sort\":0,\"type\":1,\"url\":\"/task\"},{\"menuKey\":\"TaskList\",\"menuName\":\"任务管理\",\"parentKey\":\"Task\",\"sort\":0,\"type\":1,\"url\":\"/system-setting/task-list\"}]]', 1, NULL, '2020-12-14 15:15:07', '2020-12-14 15:15:07');
INSERT INTO `t_user_operate_log` VALUES (36, 1, '管理员', '通用-权限', '查询所有菜单项', '/smart-admin-api/privilege/menu/queryAll', 'com.asset.module.system.privilege.controller.PrivilegeController.queryAll', '', 1, NULL, '2020-12-14 15:15:07', '2020-12-14 15:15:07');
INSERT INTO `t_user_operate_log` VALUES (37, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2020-12-14 15:15:29', '2020-12-14 15:15:29');
INSERT INTO `t_user_operate_log` VALUES (38, 1, '管理员', '通用-权限', '获取所有请求路径', '/smart-admin-api/privilege/getAllUrl', 'com.asset.module.system.privilege.controller.PrivilegeController.getAllUrl', '', 1, NULL, '2020-12-14 15:16:25', '2020-12-14 15:16:25');
INSERT INTO `t_user_operate_log` VALUES (39, 1, '管理员', '通用-权限', '查询所有菜单项', '/smart-admin-api/privilege/menu/queryAll', 'com.asset.module.system.privilege.controller.PrivilegeController.queryAll', '', 1, NULL, '2020-12-14 15:16:25', '2020-12-14 15:16:25');
INSERT INTO `t_user_operate_log` VALUES (40, 1, '管理员', '通用-权限', '菜单批量保存', '/smart-admin-api/privilege/menu/batchSaveMenu', 'com.asset.module.system.privilege.controller.PrivilegeController.menuBatchSave', 'ValidateList[[{\"menuKey\":\"Business\",\"menuName\":\"业务功能\",\"sort\":0,\"type\":1,\"url\":\"/business\"},{\"menuKey\":\"Peony\",\"menuName\":\"牡丹管理\",\"parentKey\":\"Business\",\"sort\":1,\"type\":1,\"url\":\"/peony\"},{\"menuKey\":\"PeonyList\",\"menuName\":\"牡丹花列表\",\"parentKey\":\"Peony\",\"sort\":2,\"type\":1,\"url\":\"/peony/peony-list\"},{\"menuKey\":\"PeonyList1\",\"menuName\":\"牡丹花列表1\",\"parentKey\":\"Peony\",\"sort\":3,\"type\":1,\"url\":\"/peony/peony-list1\"},{\"menuKey\":\"Email\",\"menuName\":\"邮件管理\",\"parentKey\":\"Business\",\"sort\":4,\"type\":1,\"url\":\"/email\"},{\"menuKey\":\"EmailList\",\"menuName\":\"邮件管理\",\"parentKey\":\"Email\",\"sort\":5,\"type\":1,\"url\":\"/email/email-list\"},{\"menuKey\":\"SendMail\",\"menuName\":\"发送邮件\",\"parentKey\":\"Email\",\"sort\":6,\"type\":1,\"url\":\"/email/send-mail\"},{\"menuKey\":\"KeepAlive\",\"menuName\":\"KeepAlive\",\"parentKey\":\"Business\",\"sort\":7,\"type\":1,\"url\":\"/keep-alive\"},{\"menuKey\":\"KeepAliveContentList\",\"menuName\":\"KeepAlive列表\",\"parentKey\":\"KeepAlive\",\"sort\":8,\"type\":1,\"url\":\"/keep-alive/content-list\"},{\"menuKey\":\"KeepAliveAddContent\",\"menuName\":\"KeepAlive表单\",\"parentKey\":\"KeepAlive\",\"sort\":9,\"type\":1,\"url\":\"/keep-alive/add-content\"},{\"menuKey\":\"Notice\",\"menuName\":\"消息管理\",\"parentKey\":\"Business\",\"sort\":10,\"type\":1,\"url\":\"/notice\"},{\"menuKey\":\"NoticeList\",\"menuName\":\"通知管理\",\"parentKey\":\"Notice\",\"sort\":11,\"type\":1,\"url\":\"/notice/notice-list\"},{\"menuKey\":\"PersonNotice\",\"menuName\":\"个人消息\",\"parentKey\":\"Notice\",\"sort\":12,\"type\":1,\"url\":\"/notice/person-notice\"},{\"menuKey\":\"NoticeDetail\",\"menuName\":\"消息详情\",\"parentKey\":\"Notice\",\"sort\":13,\"type\":1,\"url\":\"/notice/notice-detail\"},{\"menuKey\":\"ThreeRouter\",\"menuName\":\"三级路由\",\"parentKey\":\"Business\",\"sort\":14,\"type\":1,\"url\":\"/three-router\"},{\"menuKey\":\"LevelTwo\",\"menuName\":\"三级菜单\",\"parentKey\":\"ThreeRouter\",\"sort\":15,\"type\":1,\"url\":\"/three-router/level-two\"},{\"menuKey\":\"ThreeLevelRouterView\",\"menuName\":\"三级菜单子颗粒\",\"parentKey\":\"LevelTwo\",\"sort\":16,\"type\":1,\"url\":\"/three-router/level-two/level-three1\"},{\"menuKey\":\"RoleTwoTwo\",\"menuName\":\"三级菜单子哈\",\"parentKey\":\"LevelTwo\",\"sort\":17,\"type\":1,\"url\":\"/three-router/level-two/level-three2\"},{\"menuKey\":\"RoleOneOne\",\"menuName\":\"二级菜单\",\"parentKey\":\"ThreeRouter\",\"sort\":18,\"type\":1,\"url\":\"/three-router/level-two2\"},{\"menuKey\":\"System\",\"menuName\":\"系统设置\",\"sort\":19,\"type\":1,\"url\":\"/system\"},{\"menuKey\":\"Employee\",\"menuName\":\"人员管理\",\"parentKey\":\"System\",\"sort\":20,\"type\":1,\"url\":\"/employee\"},{\"menuKey\":\"RoleManage\",\"menuName\":\"角色管理\",\"parentKey\":\"Employee\",\"sort\":21,\"type\":1,\"url\":\"/employee/role\"},{\"menuKey\":\"PositionList\",\"menuName\":\"岗位管理\",\"parentKey\":\"Employee\",\"sort\":22,\"type\":1,\"url\":\"/employee/position\"},{\"menuKey\":\"RoleEmployeeManage\",\"menuName\":\"员工管理\",\"parentKey\":\"Employee\",\"sort\":23,\"type\":1,\"url\":\"/employee/role-employee-manage\"},{\"menuKey\":\"File\",\"menuName\":\"文件服务\",\"parentKey\":\"System\",\"sort\":24,\"type\":1,\"url\":\"/file\"},{\"menuKey\":\"FileList\",\"menuName\":\"文件列表\",\"parentKey\":\"File\",\"sort\":25,\"type\":1,\"url\":\"/file/file-list\"},{\"menuKey\":\"UserLog\",\"menuName\":\"用户日志\",\"parentKey\":\"System\",\"sort\":26,\"type\":1,\"url\":\"/user-log\"},{\"menuKey\":\"UserOperateLog\",\"menuName\":\"用户操作日志\",\"parentKey\":\"UserLog\",\"sort\":27,\"type\":1,\"url\":\"/user-log/user-operate-log\"},{\"menuKey\":\"UserLoginLog\",\"menuName\":\"用户登录日志\",\"parentKey\":\"UserLog\",\"sort\":28,\"type\":1,\"url\":\"/user-log/user-login-log\"},{\"menuKey\":\"SystemSetting\",\"menuName\":\"系统设置\",\"parentKey\":\"System\",\"sort\":29,\"type\":1,\"url\":\"/system-setting\"},{\"menuKey\":\"SystemConfig\",\"menuName\":\"系统参数\",\"parentKey\":\"SystemSetting\",\"sort\":30,\"type\":1,\"url\":\"/system-setting/system-config\"},{\"menuKey\":\"SystemPrivilege\",\"menuName\":\"菜单设置\",\"parentKey\":\"SystemSetting\",\"sort\":31,\"type\":1,\"url\":\"/system-setting/system-privilege\"},{\"menuKey\":\"Support\",\"menuName\":\"开发专用\",\"sort\":32,\"type\":1,\"url\":\"/support\"},{\"menuKey\":\"ApiDoc\",\"menuName\":\"接口文档\",\"parentKey\":\"Support\",\"sort\":33,\"type\":1,\"url\":\"/api-doc\"},{\"menuKey\":\"Swagger\",\"menuName\":\"Swagger接口文档\",\"parentKey\":\"ApiDoc\",\"sort\":34,\"type\":1,\"url\":\"/api-doc/swagger\"},{\"menuKey\":\"HeartBeat\",\"menuName\":\"心跳服务\",\"parentKey\":\"Support\",\"sort\":35,\"type\":1,\"url\":\"/heart-beat\"},{\"menuKey\":\"HeartBeatList\",\"menuName\":\"心跳服务\",\"parentKey\":\"HeartBeat\",\"sort\":36,\"type\":1,\"url\":\"/heart-beat/heart-beat-list\"},{\"menuKey\":\"Monitor\",\"menuName\":\"系统监控\",\"parentKey\":\"Support\",\"sort\":37,\"type\":1,\"url\":\"/monitor\"},{\"menuKey\":\"OnlineUser\",\"menuName\":\"在线人数\",\"parentKey\":\"Monitor\",\"sort\":38,\"type\":1,\"url\":\"/monitor/online-user\"},{\"menuKey\":\"Sql\",\"menuName\":\"SQL监控\",\"parentKey\":\"Monitor\",\"sort\":39,\"type\":1,\"url\":\"/monitor/sql\"},{\"menuKey\":\"Reload\",\"menuName\":\"动态加载\",\"parentKey\":\"Support\",\"sort\":40,\"type\":1,\"url\":\"/reload\"},{\"menuKey\":\"SmartReloadList\",\"menuName\":\"SmartReload\",\"parentKey\":\"Reload\",\"sort\":41,\"type\":1,\"url\":\"/reload/smart-reload-list\"},{\"menuKey\":\"Task\",\"menuName\":\"定时任务\",\"parentKey\":\"Support\",\"sort\":42,\"type\":1,\"url\":\"/task\"},{\"menuKey\":\"TaskList\",\"menuName\":\"任务管理\",\"parentKey\":\"Task\",\"sort\":43,\"type\":1,\"url\":\"/system-setting/task-list\"}]]', 1, NULL, '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_user_operate_log` VALUES (41, 1, '管理员', '通用-权限', '查询所有菜单项', '/smart-admin-api/privilege/menu/queryAll', 'com.asset.module.system.privilege.controller.PrivilegeController.queryAll', '', 1, NULL, '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_user_operate_log` VALUES (42, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/PeonyList', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"PeonyList\"]', 1, NULL, '2020-12-14 15:16:28', '2020-12-14 15:16:28');
INSERT INTO `t_user_operate_log` VALUES (43, 1, '管理员', '通用-权限', '批量保存功能点', '/smart-admin-api/privilege/function/batchSave', 'com.asset.module.system.privilege.controller.PrivilegeController.batchSaveFunctionList', 'ValidateList[[{\"functionKey\":\"peony-list-query\",\"functionName\":\"查询\",\"menuKey\":\"PeonyList\",\"sort\":1},{\"functionKey\":\"peony-list-add\",\"functionName\":\"新增\",\"menuKey\":\"PeonyList\",\"sort\":2},{\"functionKey\":\"peony-list-update\",\"functionName\":\"编辑\",\"menuKey\":\"PeonyList\",\"sort\":3},{\"functionKey\":\"peony-list-batch-delete\",\"functionName\":\"批量删除\",\"menuKey\":\"PeonyList\",\"sort\":4},{\"functionKey\":\"peony-list-batch-export\",\"functionName\":\"批量导出\",\"menuKey\":\"PeonyList\",\"sort\":5},{\"functionKey\":\"peony-list-export-all\",\"functionName\":\"导出全部\",\"menuKey\":\"PeonyList\",\"sort\":6}]]', 1, NULL, '2020-12-14 15:16:30', '2020-12-14 15:16:30');
INSERT INTO `t_user_operate_log` VALUES (44, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/PeonyList', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"PeonyList\"]', 1, NULL, '2020-12-14 15:16:30', '2020-12-14 15:16:30');
INSERT INTO `t_user_operate_log` VALUES (45, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/PeonyList1', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"PeonyList1\"]', 1, NULL, '2020-12-14 15:16:32', '2020-12-14 15:16:32');
INSERT INTO `t_user_operate_log` VALUES (46, 1, '管理员', '通用-权限', '批量保存功能点', '/smart-admin-api/privilege/function/batchSave', 'com.asset.module.system.privilege.controller.PrivilegeController.batchSaveFunctionList', 'ValidateList[[{\"functionKey\":\"peony1-list-query\",\"functionName\":\"查询\",\"menuKey\":\"PeonyList1\",\"sort\":1},{\"functionKey\":\"peony1-list-add\",\"functionName\":\"新增\",\"menuKey\":\"PeonyList1\",\"sort\":2},{\"functionKey\":\"peony1-list-update\",\"functionName\":\"编辑\",\"menuKey\":\"PeonyList1\",\"sort\":3},{\"functionKey\":\"peony1-list-batch-delete\",\"functionName\":\"批量删除\",\"menuKey\":\"PeonyList1\",\"sort\":4},{\"functionKey\":\"peony1-list-batch-export\",\"functionName\":\"批量导出\",\"menuKey\":\"PeonyList1\",\"sort\":5},{\"functionKey\":\"peony1-list-export-all\",\"functionName\":\"导出全部\",\"menuKey\":\"PeonyList1\",\"sort\":6}]]', 1, NULL, '2020-12-14 15:16:33', '2020-12-14 15:16:33');
INSERT INTO `t_user_operate_log` VALUES (47, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/PeonyList1', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"PeonyList1\"]', 1, NULL, '2020-12-14 15:16:33', '2020-12-14 15:16:33');
INSERT INTO `t_user_operate_log` VALUES (48, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/EmailList', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"EmailList\"]', 1, NULL, '2020-12-14 15:16:34', '2020-12-14 15:16:34');
INSERT INTO `t_user_operate_log` VALUES (49, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/SendMail', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"SendMail\"]', 1, NULL, '2020-12-14 15:16:36', '2020-12-14 15:16:36');
INSERT INTO `t_user_operate_log` VALUES (50, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/KeepAliveContentList', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"KeepAliveContentList\"]', 1, NULL, '2020-12-14 15:16:38', '2020-12-14 15:16:38');
INSERT INTO `t_user_operate_log` VALUES (51, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/KeepAliveAddContent', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"KeepAliveAddContent\"]', 1, NULL, '2020-12-14 15:16:38', '2020-12-14 15:16:38');
INSERT INTO `t_user_operate_log` VALUES (52, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/NoticeList', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"NoticeList\"]', 1, NULL, '2020-12-14 15:16:40', '2020-12-14 15:16:40');
INSERT INTO `t_user_operate_log` VALUES (53, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/PersonNotice', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"PersonNotice\"]', 1, NULL, '2020-12-14 15:16:41', '2020-12-14 15:16:41');
INSERT INTO `t_user_operate_log` VALUES (54, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/NoticeDetail', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"NoticeDetail\"]', 1, NULL, '2020-12-14 15:16:42', '2020-12-14 15:16:42');
INSERT INTO `t_user_operate_log` VALUES (55, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/ThreeLevelRouterView', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"ThreeLevelRouterView\"]', 1, NULL, '2020-12-14 15:16:44', '2020-12-14 15:16:44');
INSERT INTO `t_user_operate_log` VALUES (56, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/RoleManage', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"RoleManage\"]', 1, NULL, '2020-12-14 15:16:47', '2020-12-14 15:16:47');
INSERT INTO `t_user_operate_log` VALUES (57, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/PositionList', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"PositionList\"]', 1, NULL, '2020-12-14 15:16:48', '2020-12-14 15:16:48');
INSERT INTO `t_user_operate_log` VALUES (58, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/RoleEmployeeManage', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"RoleEmployeeManage\"]', 1, NULL, '2020-12-14 15:16:53', '2020-12-14 15:16:53');
INSERT INTO `t_user_operate_log` VALUES (59, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/FileList', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"FileList\"]', 1, NULL, '2020-12-14 15:17:00', '2020-12-14 15:17:00');
INSERT INTO `t_user_operate_log` VALUES (60, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/UserOperateLog', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"UserOperateLog\"]', 1, NULL, '2020-12-14 15:17:03', '2020-12-14 15:17:03');
INSERT INTO `t_user_operate_log` VALUES (61, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/UserLoginLog', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"UserLoginLog\"]', 1, NULL, '2020-12-14 15:17:03', '2020-12-14 15:17:03');
INSERT INTO `t_user_operate_log` VALUES (62, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/SystemConfig', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"SystemConfig\"]', 1, NULL, '2020-12-14 15:17:04', '2020-12-14 15:17:04');
INSERT INTO `t_user_operate_log` VALUES (63, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/SystemPrivilege', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"SystemPrivilege\"]', 1, NULL, '2020-12-14 15:17:06', '2020-12-14 15:17:06');
INSERT INTO `t_user_operate_log` VALUES (64, 1, '管理员', '通用-权限', '批量保存功能点', '/smart-admin-api/privilege/function/batchSave', 'com.asset.module.system.privilege.controller.PrivilegeController.batchSaveFunctionList', 'ValidateList[[{\"functionKey\":\"privilege-main-update\",\"functionName\":\"编辑\",\"menuKey\":\"SystemPrivilege\",\"sort\":1},{\"functionKey\":\"privilege-batch-save-points\",\"functionName\":\"批量保存功能点\",\"menuKey\":\"SystemPrivilege\",\"sort\":2},{\"functionKey\":\"privilege-main-search\",\"functionName\":\"查询\",\"menuKey\":\"SystemPrivilege\",\"sort\":3}]]', 1, NULL, '2020-12-14 15:17:11', '2020-12-14 15:17:11');
INSERT INTO `t_user_operate_log` VALUES (65, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/SystemPrivilege', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"SystemPrivilege\"]', 1, NULL, '2020-12-14 15:17:11', '2020-12-14 15:17:11');
INSERT INTO `t_user_operate_log` VALUES (66, 1, '管理员', '通用-权限', '保存更新功能点', '/smart-admin-api/privilege/function/saveOrUpdate', 'com.asset.module.system.privilege.controller.PrivilegeController.functionSaveOrUpdate', 'PrivilegeFunctionDTO[{\"functionKey\":\"privilege-batch-save-points\",\"functionName\":\"批量保存功能点\",\"menuKey\":\"SystemPrivilege\",\"sort\":1,\"url\":\"privilegeController.functionSaveOrUpdate\"}]', 1, NULL, '2020-12-14 15:17:30', '2020-12-14 15:17:30');
INSERT INTO `t_user_operate_log` VALUES (67, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/SystemPrivilege', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"SystemPrivilege\"]', 1, NULL, '2020-12-14 15:17:30', '2020-12-14 15:17:30');
INSERT INTO `t_user_operate_log` VALUES (68, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/Swagger', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"Swagger\"]', 1, NULL, '2020-12-14 15:17:36', '2020-12-14 15:17:36');
INSERT INTO `t_user_operate_log` VALUES (69, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/HeartBeatList', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"HeartBeatList\"]', 1, NULL, '2020-12-14 15:17:37', '2020-12-14 15:17:37');
INSERT INTO `t_user_operate_log` VALUES (70, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/SmartReloadList', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"SmartReloadList\"]', 1, NULL, '2020-12-14 15:17:42', '2020-12-14 15:17:42');
INSERT INTO `t_user_operate_log` VALUES (71, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/TaskList', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"TaskList\"]', 1, NULL, '2020-12-14 15:17:43', '2020-12-14 15:17:43');
INSERT INTO `t_user_operate_log` VALUES (72, 1, '管理员', '通用-邮件发送', '分页查询', '/smart-admin-api/email/page/query', 'com.asset.module.business.email.EmailController.queryByPage', 'EmailQueryDTO[{\"endDate\":\"\",\"pageNum\":1,\"pageSize\":10,\"searchCount\":true,\"startDate\":\"\"}]', 1, NULL, '2020-12-14 15:17:57', '2020-12-14 15:17:57');
INSERT INTO `t_user_operate_log` VALUES (73, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2020-12-14 15:18:14', '2020-12-14 15:18:14');
INSERT INTO `t_user_operate_log` VALUES (74, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2020-12-14 15:18:27', '2020-12-14 15:18:27');
INSERT INTO `t_user_operate_log` VALUES (75, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 11:18:53', '2021-02-07 11:18:53');
INSERT INTO `t_user_operate_log` VALUES (76, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 11:18:54', '2021-02-07 11:18:54');
INSERT INTO `t_user_operate_log` VALUES (77, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 11:18:54', '2021-02-07 11:18:54');
INSERT INTO `t_user_operate_log` VALUES (78, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2021-02-07 11:18:54', '2021-02-07 11:18:54');
INSERT INTO `t_user_operate_log` VALUES (79, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-07 11:18:54', '2021-02-07 11:18:54');
INSERT INTO `t_user_operate_log` VALUES (80, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":1,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 11:19:00', '2021-02-07 11:19:00');
INSERT INTO `t_user_operate_log` VALUES (81, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":1,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 11:19:00', '2021-02-07 11:19:00');
INSERT INTO `t_user_operate_log` VALUES (82, 1, '管理员', '管理端-部门', '添加部门', '/smart-admin-api/department/add', 'com.asset.module.system.department.DepartmentController.addDepartment', 'DepartmentCreateDTO[{\"name\":\"备案机构\",\"parentId\":1}]', 1, NULL, '2021-02-07 11:19:09', '2021-02-07 11:19:09');
INSERT INTO `t_user_operate_log` VALUES (83, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-07 11:19:09', '2021-02-07 11:19:09');
INSERT INTO `t_user_operate_log` VALUES (84, 1, '管理员', '管理端-部门', '添加部门', '/smart-admin-api/department/add', 'com.asset.module.system.department.DepartmentController.addDepartment', 'DepartmentCreateDTO[{\"name\":\"管理人\",\"parentId\":1}]', 1, NULL, '2021-02-07 11:19:16', '2021-02-07 11:19:16');
INSERT INTO `t_user_operate_log` VALUES (85, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-07 11:19:16', '2021-02-07 11:19:16');
INSERT INTO `t_user_operate_log` VALUES (86, 1, '管理员', '管理端-部门', '添加部门', '/smart-admin-api/department/add', 'com.asset.module.system.department.DepartmentController.addDepartment', 'DepartmentCreateDTO[{\"name\":\"发行人\",\"parentId\":1}]', 1, NULL, '2021-02-07 11:19:23', '2021-02-07 11:19:23');
INSERT INTO `t_user_operate_log` VALUES (87, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-07 11:19:23', '2021-02-07 11:19:23');
INSERT INTO `t_user_operate_log` VALUES (88, 1, '管理员', '管理端-部门', '添加部门', '/smart-admin-api/department/add', 'com.asset.module.system.department.DepartmentController.addDepartment', 'DepartmentCreateDTO[{\"name\":\"担保人\",\"parentId\":1}]', 1, NULL, '2021-02-07 11:19:29', '2021-02-07 11:19:29');
INSERT INTO `t_user_operate_log` VALUES (89, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-07 11:19:29', '2021-02-07 11:19:29');
INSERT INTO `t_user_operate_log` VALUES (90, 1, '管理员', '管理端-部门', '添加部门', '/smart-admin-api/department/add', 'com.asset.module.system.department.DepartmentController.addDepartment', 'DepartmentCreateDTO[{\"name\":\"承销商\",\"parentId\":1}]', 1, NULL, '2021-02-07 11:19:42', '2021-02-07 11:19:42');
INSERT INTO `t_user_operate_log` VALUES (91, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-07 11:19:42', '2021-02-07 11:19:42');
INSERT INTO `t_user_operate_log` VALUES (92, 1, '管理员', '管理端-部门', '更新部门信息', '/smart-admin-api/department/update', 'com.asset.module.system.department.DepartmentController.updateDepartment', 'DepartmentUpdateDTO[{\"id\":1,\"name\":\"小山数科资产管理\",\"parentId\":0}]', 1, NULL, '2021-02-07 11:19:55', '2021-02-07 11:19:55');
INSERT INTO `t_user_operate_log` VALUES (93, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-07 11:19:55', '2021-02-07 11:19:55');
INSERT INTO `t_user_operate_log` VALUES (94, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-07 11:19:57', '2021-02-07 11:19:57');
INSERT INTO `t_user_operate_log` VALUES (95, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/17', 'com.asset.module.system.position.PositionController.removeJob', 'Long[17]', 1, NULL, '2021-02-07 11:20:01', '2021-02-07 11:20:01');
INSERT INTO `t_user_operate_log` VALUES (96, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-07 11:20:01', '2021-02-07 11:20:01');
INSERT INTO `t_user_operate_log` VALUES (97, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/16', 'com.asset.module.system.position.PositionController.removeJob', 'Long[16]', 1, NULL, '2021-02-07 11:20:03', '2021-02-07 11:20:03');
INSERT INTO `t_user_operate_log` VALUES (98, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/15', 'com.asset.module.system.position.PositionController.removeJob', 'Long[15]', 1, NULL, '2021-02-07 11:20:06', '2021-02-07 11:20:06');
INSERT INTO `t_user_operate_log` VALUES (99, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/15', 'com.asset.module.system.position.PositionController.removeJob', 'Long[15]', 1, NULL, '2021-02-07 11:20:12', '2021-02-07 11:20:12');
INSERT INTO `t_user_operate_log` VALUES (100, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/14', 'com.asset.module.system.position.PositionController.removeJob', 'Long[14]', 1, NULL, '2021-02-07 11:20:15', '2021-02-07 11:20:15');
INSERT INTO `t_user_operate_log` VALUES (101, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/13', 'com.asset.module.system.position.PositionController.removeJob', 'Long[13]', 1, NULL, '2021-02-07 11:20:17', '2021-02-07 11:20:17');
INSERT INTO `t_user_operate_log` VALUES (102, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/12', 'com.asset.module.system.position.PositionController.removeJob', 'Long[12]', 1, NULL, '2021-02-07 11:20:19', '2021-02-07 11:20:19');
INSERT INTO `t_user_operate_log` VALUES (103, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-07 11:20:19', '2021-02-07 11:20:19');
INSERT INTO `t_user_operate_log` VALUES (104, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/9', 'com.asset.module.system.position.PositionController.removeJob', 'Long[9]', 1, NULL, '2021-02-07 11:20:21', '2021-02-07 11:20:21');
INSERT INTO `t_user_operate_log` VALUES (105, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-07 11:20:21', '2021-02-07 11:20:21');
INSERT INTO `t_user_operate_log` VALUES (106, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/8', 'com.asset.module.system.position.PositionController.removeJob', 'Long[8]', 1, NULL, '2021-02-07 11:20:24', '2021-02-07 11:20:24');
INSERT INTO `t_user_operate_log` VALUES (107, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/3', 'com.asset.module.system.position.PositionController.removeJob', 'Long[3]', 1, NULL, '2021-02-07 11:20:26', '2021-02-07 11:20:26');
INSERT INTO `t_user_operate_log` VALUES (108, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/2', 'com.asset.module.system.position.PositionController.removeJob', 'Long[2]', 1, NULL, '2021-02-07 11:20:28', '2021-02-07 11:20:28');
INSERT INTO `t_user_operate_log` VALUES (109, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/2', 'com.asset.module.system.position.PositionController.removeJob', 'Long[2]', 1, NULL, '2021-02-07 11:20:30', '2021-02-07 11:20:30');
INSERT INTO `t_user_operate_log` VALUES (110, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/1', 'com.asset.module.system.position.PositionController.removeJob', 'Long[1]', 1, NULL, '2021-02-07 11:20:33', '2021-02-07 11:20:33');
INSERT INTO `t_user_operate_log` VALUES (111, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/3', 'com.asset.module.system.position.PositionController.removeJob', 'Long[3]', 1, NULL, '2021-02-07 11:20:35', '2021-02-07 11:20:35');
INSERT INTO `t_user_operate_log` VALUES (112, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/11', 'com.asset.module.system.position.PositionController.removeJob', 'Long[11]', 1, NULL, '2021-02-07 11:20:37', '2021-02-07 11:20:37');
INSERT INTO `t_user_operate_log` VALUES (113, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-07 11:20:37', '2021-02-07 11:20:37');
INSERT INTO `t_user_operate_log` VALUES (114, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/15', 'com.asset.module.system.position.PositionController.removeJob', 'Long[15]', 1, NULL, '2021-02-07 11:20:39', '2021-02-07 11:20:39');
INSERT INTO `t_user_operate_log` VALUES (115, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/1', 'com.asset.module.system.position.PositionController.removeJob', 'Long[1]', 1, NULL, '2021-02-07 11:20:41', '2021-02-07 11:20:41');
INSERT INTO `t_user_operate_log` VALUES (116, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/2', 'com.asset.module.system.position.PositionController.removeJob', 'Long[2]', 1, NULL, '2021-02-07 11:20:45', '2021-02-07 11:20:45');
INSERT INTO `t_user_operate_log` VALUES (117, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/3', 'com.asset.module.system.position.PositionController.removeJob', 'Long[3]', 1, NULL, '2021-02-07 11:20:47', '2021-02-07 11:20:47');
INSERT INTO `t_user_operate_log` VALUES (118, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/8', 'com.asset.module.system.position.PositionController.removeJob', 'Long[8]', 1, NULL, '2021-02-07 11:20:49', '2021-02-07 11:20:49');
INSERT INTO `t_user_operate_log` VALUES (119, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/10', 'com.asset.module.system.position.PositionController.removeJob', 'Long[10]', 1, NULL, '2021-02-07 11:20:51', '2021-02-07 11:20:51');
INSERT INTO `t_user_operate_log` VALUES (120, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-07 11:20:51', '2021-02-07 11:20:51');
INSERT INTO `t_user_operate_log` VALUES (121, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/14', 'com.asset.module.system.position.PositionController.removeJob', 'Long[14]', 1, NULL, '2021-02-07 11:20:53', '2021-02-07 11:20:53');
INSERT INTO `t_user_operate_log` VALUES (122, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/15', 'com.asset.module.system.position.PositionController.removeJob', 'Long[15]', 1, NULL, '2021-02-07 11:20:55', '2021-02-07 11:20:55');
INSERT INTO `t_user_operate_log` VALUES (123, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 11:20:57', '2021-02-07 11:20:57');
INSERT INTO `t_user_operate_log` VALUES (124, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2021-02-07 11:20:57', '2021-02-07 11:20:57');
INSERT INTO `t_user_operate_log` VALUES (125, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 11:20:57', '2021-02-07 11:20:57');
INSERT INTO `t_user_operate_log` VALUES (126, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-07 11:20:58', '2021-02-07 11:20:58');
INSERT INTO `t_user_operate_log` VALUES (127, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":1,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 11:20:59', '2021-02-07 11:20:59');
INSERT INTO `t_user_operate_log` VALUES (128, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":1,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 11:20:59', '2021-02-07 11:20:59');
INSERT INTO `t_user_operate_log` VALUES (129, 1, '管理员', '管理端-角色用户', '通过员工id获取所有角色以及员工具有的角色', '/smart-admin-api/role/getRoles/1', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.getRoleByEmployeeId', 'Long[1]', 1, NULL, '2021-02-07 11:21:04', '2021-02-07 11:21:04');
INSERT INTO `t_user_operate_log` VALUES (130, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":200}]', 1, NULL, '2021-02-07 11:21:15', '2021-02-07 11:21:15');
INSERT INTO `t_user_operate_log` VALUES (131, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":26,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 11:21:24', '2021-02-07 11:21:24');
INSERT INTO `t_user_operate_log` VALUES (132, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":26,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 11:21:24', '2021-02-07 11:21:24');
INSERT INTO `t_user_operate_log` VALUES (133, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":200}]', 1, NULL, '2021-02-07 11:21:26', '2021-02-07 11:21:26');
INSERT INTO `t_user_operate_log` VALUES (134, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2021-02-07 11:21:52', '2021-02-07 11:21:52');
INSERT INTO `t_user_operate_log` VALUES (135, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/16', 'com.asset.module.system.position.PositionController.removeJob', 'Long[16]', 1, NULL, '2021-02-07 11:22:51', '2021-02-07 11:22:51');
INSERT INTO `t_user_operate_log` VALUES (136, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/16', 'com.asset.module.system.position.PositionController.removeJob', 'Long[16]', 1, NULL, '2021-02-07 11:25:19', '2021-02-07 11:25:19');
INSERT INTO `t_user_operate_log` VALUES (137, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-07 11:25:19', '2021-02-07 11:25:19');
INSERT INTO `t_user_operate_log` VALUES (138, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/15', 'com.asset.module.system.position.PositionController.removeJob', 'Long[15]', 1, NULL, '2021-02-07 11:25:21', '2021-02-07 11:25:21');
INSERT INTO `t_user_operate_log` VALUES (139, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-07 11:25:21', '2021-02-07 11:25:21');
INSERT INTO `t_user_operate_log` VALUES (140, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/14', 'com.asset.module.system.position.PositionController.removeJob', 'Long[14]', 1, NULL, '2021-02-07 11:25:23', '2021-02-07 11:25:23');
INSERT INTO `t_user_operate_log` VALUES (141, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-07 11:25:23', '2021-02-07 11:25:23');
INSERT INTO `t_user_operate_log` VALUES (142, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/13', 'com.asset.module.system.position.PositionController.removeJob', 'Long[13]', 1, NULL, '2021-02-07 11:25:25', '2021-02-07 11:25:25');
INSERT INTO `t_user_operate_log` VALUES (143, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-07 11:25:25', '2021-02-07 11:25:25');
INSERT INTO `t_user_operate_log` VALUES (144, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/8', 'com.asset.module.system.position.PositionController.removeJob', 'Long[8]', 1, NULL, '2021-02-07 11:25:27', '2021-02-07 11:25:27');
INSERT INTO `t_user_operate_log` VALUES (145, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-07 11:25:27', '2021-02-07 11:25:27');
INSERT INTO `t_user_operate_log` VALUES (146, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/3', 'com.asset.module.system.position.PositionController.removeJob', 'Long[3]', 1, NULL, '2021-02-07 11:25:28', '2021-02-07 11:25:28');
INSERT INTO `t_user_operate_log` VALUES (147, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-07 11:25:28', '2021-02-07 11:25:28');
INSERT INTO `t_user_operate_log` VALUES (148, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/2', 'com.asset.module.system.position.PositionController.removeJob', 'Long[2]', 1, NULL, '2021-02-07 11:25:31', '2021-02-07 11:25:31');
INSERT INTO `t_user_operate_log` VALUES (149, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-07 11:25:31', '2021-02-07 11:25:31');
INSERT INTO `t_user_operate_log` VALUES (150, 1, '管理员', '管理端-岗位', '根据ID删除岗位', '/smart-admin-api/position/remove/1', 'com.asset.module.system.position.PositionController.removeJob', 'Long[1]', 1, NULL, '2021-02-07 11:25:32', '2021-02-07 11:25:32');
INSERT INTO `t_user_operate_log` VALUES (151, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-07 11:25:32', '2021-02-07 11:25:32');
INSERT INTO `t_user_operate_log` VALUES (152, 1, '管理员', '管理端-岗位', '添加岗位', '/smart-admin-api/position/add', 'com.asset.module.system.position.PositionController.addJob', 'PositionAddDTO[{\"positionName\":\"备案机构\",\"remark\":\"备案机构\"}]', 1, NULL, '2021-02-07 11:25:48', '2021-02-07 11:25:48');
INSERT INTO `t_user_operate_log` VALUES (153, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-07 11:25:48', '2021-02-07 11:25:48');
INSERT INTO `t_user_operate_log` VALUES (154, 1, '管理员', '管理端-岗位', '添加岗位', '/smart-admin-api/position/add', 'com.asset.module.system.position.PositionController.addJob', 'PositionAddDTO[{\"positionName\":\"管理人\",\"remark\":\"管理人\"}]', 1, NULL, '2021-02-07 11:25:57', '2021-02-07 11:25:57');
INSERT INTO `t_user_operate_log` VALUES (155, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-07 11:25:57', '2021-02-07 11:25:57');
INSERT INTO `t_user_operate_log` VALUES (156, 1, '管理员', '管理端-岗位', '添加岗位', '/smart-admin-api/position/add', 'com.asset.module.system.position.PositionController.addJob', 'PositionAddDTO[{\"positionName\":\"发行人\",\"remark\":\"发行人\"}]', 1, NULL, '2021-02-07 11:26:06', '2021-02-07 11:26:06');
INSERT INTO `t_user_operate_log` VALUES (157, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-07 11:26:06', '2021-02-07 11:26:06');
INSERT INTO `t_user_operate_log` VALUES (158, 1, '管理员', '管理端-岗位', '添加岗位', '/smart-admin-api/position/add', 'com.asset.module.system.position.PositionController.addJob', 'PositionAddDTO[{\"positionName\":\"担保人\",\"remark\":\"担保人\"}]', 1, NULL, '2021-02-07 11:26:13', '2021-02-07 11:26:13');
INSERT INTO `t_user_operate_log` VALUES (159, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-07 11:26:13', '2021-02-07 11:26:13');
INSERT INTO `t_user_operate_log` VALUES (160, 1, '管理员', '管理端-岗位', '添加岗位', '/smart-admin-api/position/add', 'com.asset.module.system.position.PositionController.addJob', 'PositionAddDTO[{\"positionName\":\"承销商\",\"remark\":\"承销商\"}]', 1, NULL, '2021-02-07 11:26:23', '2021-02-07 11:26:23');
INSERT INTO `t_user_operate_log` VALUES (161, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-07 11:26:23', '2021-02-07 11:26:23');
INSERT INTO `t_user_operate_log` VALUES (162, 1, '管理员', '管理端-岗位', '添加岗位', '/smart-admin-api/position/add', 'com.asset.module.system.position.PositionController.addJob', 'PositionAddDTO[{\"positionName\":\"投资人/机构/个人\",\"remark\":\"投资人/机构/个人\"}]', 1, NULL, '2021-02-07 11:26:44', '2021-02-07 11:26:44');
INSERT INTO `t_user_operate_log` VALUES (163, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-07 11:26:44', '2021-02-07 11:26:44');
INSERT INTO `t_user_operate_log` VALUES (164, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":1,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 11:26:48', '2021-02-07 11:26:48');
INSERT INTO `t_user_operate_log` VALUES (165, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2021-02-07 11:27:00', '2021-02-07 11:27:00');
INSERT INTO `t_user_operate_log` VALUES (166, 1, '管理员', '管理端-部门', '添加部门', '/smart-admin-api/department/add', 'com.asset.module.system.department.DepartmentController.addDepartment', 'DepartmentCreateDTO[{\"name\":\"投资人/机构/个人\",\"parentId\":1}]', 1, NULL, '2021-02-07 11:27:03', '2021-02-07 11:27:03');
INSERT INTO `t_user_operate_log` VALUES (167, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-07 11:27:03', '2021-02-07 11:27:03');
INSERT INTO `t_user_operate_log` VALUES (168, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":26,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 11:27:05', '2021-02-07 11:27:05');
INSERT INTO `t_user_operate_log` VALUES (169, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":26,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 11:27:05', '2021-02-07 11:27:05');
INSERT INTO `t_user_operate_log` VALUES (170, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 11:27:12', '2021-02-07 11:27:12');
INSERT INTO `t_user_operate_log` VALUES (171, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/0', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[0]', 1, NULL, '2021-02-07 11:27:12', '2021-02-07 11:27:12');
INSERT INTO `t_user_operate_log` VALUES (172, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2021-02-07 11:27:12', '2021-02-07 11:27:12');
INSERT INTO `t_user_operate_log` VALUES (173, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/34', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[34]', 1, NULL, '2021-02-07 11:27:16', '2021-02-07 11:27:16');
INSERT INTO `t_user_operate_log` VALUES (174, 1, '管理员', '管理端-角色', '删除角色', '/smart-admin-api/role/delete/34', 'com.asset.module.system.role.basic.RoleController.deleteRole', 'Long[34]', 1, NULL, '2021-02-07 11:27:24', '2021-02-07 11:27:24');
INSERT INTO `t_user_operate_log` VALUES (175, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 11:27:25', '2021-02-07 11:27:25');
INSERT INTO `t_user_operate_log` VALUES (176, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2021-02-07 11:27:25', '2021-02-07 11:27:25');
INSERT INTO `t_user_operate_log` VALUES (177, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/35', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[35]', 1, NULL, '2021-02-07 11:27:27', '2021-02-07 11:27:27');
INSERT INTO `t_user_operate_log` VALUES (178, 1, '管理员', '管理端-角色', '删除角色', '/smart-admin-api/role/delete/35', 'com.asset.module.system.role.basic.RoleController.deleteRole', 'Long[35]', 1, NULL, '2021-02-07 11:27:28', '2021-02-07 11:27:28');
INSERT INTO `t_user_operate_log` VALUES (179, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 11:27:28', '2021-02-07 11:27:28');
INSERT INTO `t_user_operate_log` VALUES (180, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2021-02-07 11:27:28', '2021-02-07 11:27:28');
INSERT INTO `t_user_operate_log` VALUES (181, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/36', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[36]', 1, NULL, '2021-02-07 11:27:29', '2021-02-07 11:27:29');
INSERT INTO `t_user_operate_log` VALUES (182, 1, '管理员', '管理端-角色', '删除角色', '/smart-admin-api/role/delete/36', 'com.asset.module.system.role.basic.RoleController.deleteRole', 'Long[36]', 1, NULL, '2021-02-07 11:27:32', '2021-02-07 11:27:32');
INSERT INTO `t_user_operate_log` VALUES (183, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 11:27:32', '2021-02-07 11:27:32');
INSERT INTO `t_user_operate_log` VALUES (184, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2021-02-07 11:27:33', '2021-02-07 11:27:33');
INSERT INTO `t_user_operate_log` VALUES (185, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/37', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[37]', 1, NULL, '2021-02-07 11:27:34', '2021-02-07 11:27:34');
INSERT INTO `t_user_operate_log` VALUES (186, 1, '管理员', '管理端-角色', '删除角色', '/smart-admin-api/role/delete/37', 'com.asset.module.system.role.basic.RoleController.deleteRole', 'Long[37]', 1, NULL, '2021-02-07 11:27:35', '2021-02-07 11:27:35');
INSERT INTO `t_user_operate_log` VALUES (187, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 11:27:35', '2021-02-07 11:27:35');
INSERT INTO `t_user_operate_log` VALUES (188, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2021-02-07 11:27:36', '2021-02-07 11:27:36');
INSERT INTO `t_user_operate_log` VALUES (189, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/38', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[38]', 1, NULL, '2021-02-07 11:27:37', '2021-02-07 11:27:37');
INSERT INTO `t_user_operate_log` VALUES (190, 1, '管理员', '管理端-角色', '删除角色', '/smart-admin-api/role/delete/38', 'com.asset.module.system.role.basic.RoleController.deleteRole', 'Long[38]', 1, NULL, '2021-02-07 11:27:38', '2021-02-07 11:27:38');
INSERT INTO `t_user_operate_log` VALUES (191, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 11:27:38', '2021-02-07 11:27:38');
INSERT INTO `t_user_operate_log` VALUES (192, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2021-02-07 11:27:38', '2021-02-07 11:27:38');
INSERT INTO `t_user_operate_log` VALUES (193, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/40', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[40]', 1, NULL, '2021-02-07 11:27:40', '2021-02-07 11:27:40');
INSERT INTO `t_user_operate_log` VALUES (194, 1, '管理员', '管理端-角色', '删除角色', '/smart-admin-api/role/delete/40', 'com.asset.module.system.role.basic.RoleController.deleteRole', 'Long[40]', 1, NULL, '2021-02-07 11:27:41', '2021-02-07 11:27:41');
INSERT INTO `t_user_operate_log` VALUES (195, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 11:27:41', '2021-02-07 11:27:41');
INSERT INTO `t_user_operate_log` VALUES (196, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2021-02-07 11:27:41', '2021-02-07 11:27:41');
INSERT INTO `t_user_operate_log` VALUES (197, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/41', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[41]', 1, NULL, '2021-02-07 11:27:43', '2021-02-07 11:27:43');
INSERT INTO `t_user_operate_log` VALUES (198, 1, '管理员', '管理端-角色', '删除角色', '/smart-admin-api/role/delete/41', 'com.asset.module.system.role.basic.RoleController.deleteRole', 'Long[41]', 1, NULL, '2021-02-07 11:27:45', '2021-02-07 11:27:45');
INSERT INTO `t_user_operate_log` VALUES (199, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 11:27:45', '2021-02-07 11:27:45');
INSERT INTO `t_user_operate_log` VALUES (200, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2021-02-07 11:27:45', '2021-02-07 11:27:45');
INSERT INTO `t_user_operate_log` VALUES (201, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/42', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[42]', 1, NULL, '2021-02-07 11:27:47', '2021-02-07 11:27:47');
INSERT INTO `t_user_operate_log` VALUES (202, 1, '管理员', '管理端-角色', '删除角色', '/smart-admin-api/role/delete/42', 'com.asset.module.system.role.basic.RoleController.deleteRole', 'Long[42]', 1, NULL, '2021-02-07 11:27:48', '2021-02-07 11:27:48');
INSERT INTO `t_user_operate_log` VALUES (203, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 11:27:48', '2021-02-07 11:27:48');
INSERT INTO `t_user_operate_log` VALUES (204, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2021-02-07 11:27:48', '2021-02-07 11:27:48');
INSERT INTO `t_user_operate_log` VALUES (205, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/43', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[43]', 1, NULL, '2021-02-07 11:27:50', '2021-02-07 11:27:50');
INSERT INTO `t_user_operate_log` VALUES (206, 1, '管理员', '管理端-角色', '删除角色', '/smart-admin-api/role/delete/43', 'com.asset.module.system.role.basic.RoleController.deleteRole', 'Long[43]', 1, NULL, '2021-02-07 11:27:50', '2021-02-07 11:27:50');
INSERT INTO `t_user_operate_log` VALUES (207, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 11:27:51', '2021-02-07 11:27:51');
INSERT INTO `t_user_operate_log` VALUES (208, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2021-02-07 11:27:51', '2021-02-07 11:27:51');
INSERT INTO `t_user_operate_log` VALUES (209, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/45', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[45]', 1, NULL, '2021-02-07 11:27:52', '2021-02-07 11:27:52');
INSERT INTO `t_user_operate_log` VALUES (210, 1, '管理员', '管理端-角色', '删除角色', '/smart-admin-api/role/delete/45', 'com.asset.module.system.role.basic.RoleController.deleteRole', 'Long[45]', 1, NULL, '2021-02-07 11:27:53', '2021-02-07 11:27:53');
INSERT INTO `t_user_operate_log` VALUES (211, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 11:27:53', '2021-02-07 11:27:53');
INSERT INTO `t_user_operate_log` VALUES (212, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2021-02-07 11:27:53', '2021-02-07 11:27:53');
INSERT INTO `t_user_operate_log` VALUES (213, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/46', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[46]', 1, NULL, '2021-02-07 11:27:55', '2021-02-07 11:27:55');
INSERT INTO `t_user_operate_log` VALUES (214, 1, '管理员', '管理端-角色', '删除角色', '/smart-admin-api/role/delete/46', 'com.asset.module.system.role.basic.RoleController.deleteRole', 'Long[46]', 1, NULL, '2021-02-07 11:27:56', '2021-02-07 11:27:56');
INSERT INTO `t_user_operate_log` VALUES (215, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 11:27:56', '2021-02-07 11:27:56');
INSERT INTO `t_user_operate_log` VALUES (216, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2021-02-07 11:27:56', '2021-02-07 11:27:56');
INSERT INTO `t_user_operate_log` VALUES (217, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/47', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[47]', 1, NULL, '2021-02-07 11:27:58', '2021-02-07 11:27:58');
INSERT INTO `t_user_operate_log` VALUES (218, 1, '管理员', '管理端-角色', '删除角色', '/smart-admin-api/role/delete/47', 'com.asset.module.system.role.basic.RoleController.deleteRole', 'Long[47]', 1, NULL, '2021-02-07 11:27:59', '2021-02-07 11:27:59');
INSERT INTO `t_user_operate_log` VALUES (219, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 11:27:59', '2021-02-07 11:27:59');
INSERT INTO `t_user_operate_log` VALUES (220, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2021-02-07 11:27:59', '2021-02-07 11:27:59');
INSERT INTO `t_user_operate_log` VALUES (221, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/48', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[48]', 1, NULL, '2021-02-07 11:28:00', '2021-02-07 11:28:00');
INSERT INTO `t_user_operate_log` VALUES (222, 1, '管理员', '管理端-角色', '删除角色', '/smart-admin-api/role/delete/48', 'com.asset.module.system.role.basic.RoleController.deleteRole', 'Long[48]', 1, NULL, '2021-02-07 11:28:01', '2021-02-07 11:28:01');
INSERT INTO `t_user_operate_log` VALUES (223, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 11:28:01', '2021-02-07 11:28:01');
INSERT INTO `t_user_operate_log` VALUES (224, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2021-02-07 11:28:01', '2021-02-07 11:28:01');
INSERT INTO `t_user_operate_log` VALUES (225, 1, '管理员', '管理端-角色', '添加角色', '/smart-admin-api/role/add', 'com.asset.module.system.role.basic.RoleController.addRole', 'RoleAddDTO[{\"remark\":\"\",\"roleName\":\"备案机构\"}]', 1, NULL, '2021-02-07 11:28:09', '2021-02-07 11:28:09');
INSERT INTO `t_user_operate_log` VALUES (226, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 11:28:09', '2021-02-07 11:28:09');
INSERT INTO `t_user_operate_log` VALUES (227, 1, '管理员', '管理端-角色', '添加角色', '/smart-admin-api/role/add', 'com.asset.module.system.role.basic.RoleController.addRole', 'RoleAddDTO[{\"remark\":\"\",\"roleName\":\"管理人\"}]', 1, NULL, '2021-02-07 11:28:17', '2021-02-07 11:28:17');
INSERT INTO `t_user_operate_log` VALUES (228, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 11:28:17', '2021-02-07 11:28:17');
INSERT INTO `t_user_operate_log` VALUES (229, 1, '管理员', '管理端-角色', '添加角色', '/smart-admin-api/role/add', 'com.asset.module.system.role.basic.RoleController.addRole', 'RoleAddDTO[{\"remark\":\"\",\"roleName\":\"发行人\"}]', 1, NULL, '2021-02-07 11:28:22', '2021-02-07 11:28:22');
INSERT INTO `t_user_operate_log` VALUES (230, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 11:28:22', '2021-02-07 11:28:22');
INSERT INTO `t_user_operate_log` VALUES (231, 1, '管理员', '管理端-角色', '添加角色', '/smart-admin-api/role/add', 'com.asset.module.system.role.basic.RoleController.addRole', 'RoleAddDTO[{\"remark\":\"\",\"roleName\":\"担保人\"}]', 1, NULL, '2021-02-07 11:28:28', '2021-02-07 11:28:28');
INSERT INTO `t_user_operate_log` VALUES (232, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 11:28:28', '2021-02-07 11:28:28');
INSERT INTO `t_user_operate_log` VALUES (233, 1, '管理员', '管理端-角色', '添加角色', '/smart-admin-api/role/add', 'com.asset.module.system.role.basic.RoleController.addRole', 'RoleAddDTO[{\"remark\":\"\",\"roleName\":\"承销商\"}]', 1, NULL, '2021-02-07 11:28:34', '2021-02-07 11:28:34');
INSERT INTO `t_user_operate_log` VALUES (234, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 11:28:34', '2021-02-07 11:28:34');
INSERT INTO `t_user_operate_log` VALUES (235, 1, '管理员', '管理端-角色', '添加角色', '/smart-admin-api/role/add', 'com.asset.module.system.role.basic.RoleController.addRole', 'RoleAddDTO[{\"remark\":\"\",\"roleName\":\"投资人/机构/个人\"}]', 1, NULL, '2021-02-07 11:28:42', '2021-02-07 11:28:42');
INSERT INTO `t_user_operate_log` VALUES (236, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 11:28:42', '2021-02-07 11:28:42');
INSERT INTO `t_user_operate_log` VALUES (237, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/50', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[50]', 1, NULL, '2021-02-07 11:28:44', '2021-02-07 11:28:44');
INSERT INTO `t_user_operate_log` VALUES (238, 1, '管理员', '管理端-角色权限', '更新角色权限', '/smart-admin-api/privilege/updateRolePrivilege', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.updateRolePrivilege', 'RolePrivilegeDTO[{\"privilegeKeyList\":[\"Peony\",\"PeonyList\",\"peony-list-query\",\"peony-list-add\",\"peony-list-update\",\"peony-list-batch-delete\",\"peony-list-batch-export\",\"peony-list-export-all\",\"PeonyList1\",\"peony1-list-query\",\"peony1-list-add\",\"peony1-list-update\",\"peony1-list-batch-delete\",\"peony1-list-batch-export\",\"peony1-list-export-all\",\"Business\",\"KeepAlive\",\"KeepAliveContentList\",\"KeepAliveAddContent\",\"Notice\",\"NoticeList\",\"notice-query\",\"notice-add\",\"notice-edit\",\"notice-delete\",\"notice-detail\",\"notice-send\",\"PersonNotice\",\"person-notice-query\",\"person-notice-detail\",\"NoticeDetail\"],\"roleId\":50}]', 1, NULL, '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_user_operate_log` VALUES (239, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/50', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[50]', 1, NULL, '2021-02-07 11:28:53', '2021-02-07 11:28:53');
INSERT INTO `t_user_operate_log` VALUES (240, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/51', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[51]', 1, NULL, '2021-02-07 11:28:54', '2021-02-07 11:28:54');
INSERT INTO `t_user_operate_log` VALUES (241, 1, '管理员', '管理端-角色权限', '更新角色权限', '/smart-admin-api/privilege/updateRolePrivilege', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.updateRolePrivilege', 'RolePrivilegeDTO[{\"privilegeKeyList\":[\"Notice\",\"NoticeList\",\"notice-query\",\"notice-add\",\"notice-edit\",\"notice-delete\",\"notice-detail\",\"notice-send\",\"PersonNotice\",\"person-notice-query\",\"person-notice-detail\",\"NoticeDetail\",\"Business\"],\"roleId\":51}]', 1, NULL, '2021-02-07 11:28:59', '2021-02-07 11:28:59');
INSERT INTO `t_user_operate_log` VALUES (242, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/51', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[51]', 1, NULL, '2021-02-07 11:28:59', '2021-02-07 11:28:59');
INSERT INTO `t_user_operate_log` VALUES (243, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/52', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[52]', 1, NULL, '2021-02-07 11:29:01', '2021-02-07 11:29:01');
INSERT INTO `t_user_operate_log` VALUES (244, 1, '管理员', '管理端-角色权限', '更新角色权限', '/smart-admin-api/privilege/updateRolePrivilege', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.updateRolePrivilege', 'RolePrivilegeDTO[{\"privilegeKeyList\":[\"Notice\",\"NoticeList\",\"notice-query\",\"notice-add\",\"notice-edit\",\"notice-delete\",\"notice-detail\",\"notice-send\",\"PersonNotice\",\"person-notice-query\",\"person-notice-detail\",\"NoticeDetail\",\"Business\"],\"roleId\":52}]', 1, NULL, '2021-02-07 11:29:04', '2021-02-07 11:29:04');
INSERT INTO `t_user_operate_log` VALUES (245, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/52', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[52]', 1, NULL, '2021-02-07 11:29:04', '2021-02-07 11:29:04');
INSERT INTO `t_user_operate_log` VALUES (246, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/53', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[53]', 1, NULL, '2021-02-07 11:29:05', '2021-02-07 11:29:05');
INSERT INTO `t_user_operate_log` VALUES (247, 1, '管理员', '管理端-角色权限', '更新角色权限', '/smart-admin-api/privilege/updateRolePrivilege', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.updateRolePrivilege', 'RolePrivilegeDTO[{\"privilegeKeyList\":[\"Notice\",\"NoticeList\",\"notice-query\",\"notice-add\",\"notice-edit\",\"notice-delete\",\"notice-detail\",\"notice-send\",\"PersonNotice\",\"person-notice-query\",\"person-notice-detail\",\"NoticeDetail\",\"Business\"],\"roleId\":53}]', 1, NULL, '2021-02-07 11:29:07', '2021-02-07 11:29:07');
INSERT INTO `t_user_operate_log` VALUES (248, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/53', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[53]', 1, NULL, '2021-02-07 11:29:07', '2021-02-07 11:29:07');
INSERT INTO `t_user_operate_log` VALUES (249, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/54', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[54]', 1, NULL, '2021-02-07 11:29:08', '2021-02-07 11:29:08');
INSERT INTO `t_user_operate_log` VALUES (250, 1, '管理员', '管理端-角色权限', '更新角色权限', '/smart-admin-api/privilege/updateRolePrivilege', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.updateRolePrivilege', 'RolePrivilegeDTO[{\"privilegeKeyList\":[\"Notice\",\"NoticeList\",\"notice-query\",\"notice-add\",\"notice-edit\",\"notice-delete\",\"notice-detail\",\"notice-send\",\"PersonNotice\",\"person-notice-query\",\"person-notice-detail\",\"NoticeDetail\",\"Business\"],\"roleId\":54}]', 1, NULL, '2021-02-07 11:29:11', '2021-02-07 11:29:11');
INSERT INTO `t_user_operate_log` VALUES (251, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/54', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[54]', 1, NULL, '2021-02-07 11:29:11', '2021-02-07 11:29:11');
INSERT INTO `t_user_operate_log` VALUES (252, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/55', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[55]', 1, NULL, '2021-02-07 11:29:12', '2021-02-07 11:29:12');
INSERT INTO `t_user_operate_log` VALUES (253, 1, '管理员', '管理端-角色权限', '更新角色权限', '/smart-admin-api/privilege/updateRolePrivilege', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.updateRolePrivilege', 'RolePrivilegeDTO[{\"privilegeKeyList\":[\"Notice\",\"NoticeList\",\"notice-query\",\"notice-add\",\"notice-edit\",\"notice-delete\",\"notice-detail\",\"notice-send\",\"PersonNotice\",\"person-notice-query\",\"person-notice-detail\",\"NoticeDetail\",\"Business\"],\"roleId\":55}]', 1, NULL, '2021-02-07 11:29:15', '2021-02-07 11:29:15');
INSERT INTO `t_user_operate_log` VALUES (254, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/55', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[55]', 1, NULL, '2021-02-07 11:29:15', '2021-02-07 11:29:15');
INSERT INTO `t_user_operate_log` VALUES (255, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":200}]', 1, NULL, '2021-02-07 11:29:27', '2021-02-07 11:29:27');
INSERT INTO `t_user_operate_log` VALUES (256, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2021-02-07 11:29:51', '2021-02-07 11:29:51');
INSERT INTO `t_user_operate_log` VALUES (257, 1, '管理员', '管理端-用户', '添加员工', '/smart-admin-api/employee/add', 'com.asset.module.system.employee.EmployeeController.addEmployee', 'EmployeeAddDTO[{\"actualName\":\"张向宇\",\"birthday\":\"\",\"departmentId\":26,\"email\":\"\",\"idCard\":\"\",\"isDisabled\":0,\"loginName\":\"zhangxiangyu\",\"loginPwd\":\"123456\",\"nickName\":\"zhangxiangyu\",\"phone\":\"15201045723\",\"positionIdList\":[18]}]', 1, NULL, '2021-02-07 11:30:03', '2021-02-07 11:30:03');
INSERT INTO `t_user_operate_log` VALUES (258, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":26,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 11:30:03', '2021-02-07 11:30:03');
INSERT INTO `t_user_operate_log` VALUES (259, 1, '管理员', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-07 11:30:07', '2021-02-07 11:30:07');
INSERT INTO `t_user_operate_log` VALUES (260, 40, '张向宇', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-07 11:30:31', '2021-02-07 11:30:31');
INSERT INTO `t_user_operate_log` VALUES (261, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 11:30:52', '2021-02-07 11:30:52');
INSERT INTO `t_user_operate_log` VALUES (262, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/0', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[0]', 1, NULL, '2021-02-07 11:30:52', '2021-02-07 11:30:52');
INSERT INTO `t_user_operate_log` VALUES (263, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2021-02-07 11:30:52', '2021-02-07 11:30:52');
INSERT INTO `t_user_operate_log` VALUES (264, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/50', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[50]', 1, NULL, '2021-02-07 11:30:53', '2021-02-07 11:30:53');
INSERT INTO `t_user_operate_log` VALUES (265, 1, '管理员', '管理端-数据范围', '获取当前系统所配置的所有数据范围', '/smart-admin-api/dataScope/list', 'com.asset.module.system.datascope.DataScopeController.dataScopeList', '', 1, NULL, '2021-02-07 11:31:08', '2021-02-07 11:31:08');
INSERT INTO `t_user_operate_log` VALUES (266, 1, '管理员', '管理端-数据范围', '获取某角色所设置的数据范围', '/smart-admin-api/dataScope/listByRole/50', 'com.asset.module.system.datascope.DataScopeController.dataScopeListByRole', 'Long[50]', 1, NULL, '2021-02-07 11:31:08', '2021-02-07 11:31:08');
INSERT INTO `t_user_operate_log` VALUES (267, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2021-02-07 11:31:11', '2021-02-07 11:31:11');
INSERT INTO `t_user_operate_log` VALUES (268, 1, '管理员', '管理端-角色用户', '获取角色成员-员工列表', '/smart-admin-api/role/listEmployee', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName', 'RoleQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"roleId\":\"50\"}]', 1, NULL, '2021-02-07 11:31:11', '2021-02-07 11:31:11');
INSERT INTO `t_user_operate_log` VALUES (269, 1, '管理员', '管理端-角色用户', '根据角色id获取角色员工列表(无分页)', '/smart-admin-api/role/listAllEmployee/50', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listAllEmployeeRoleId', 'Long[50]', 1, NULL, '2021-02-07 11:31:11', '2021-02-07 11:31:11');
INSERT INTO `t_user_operate_log` VALUES (270, 1, '管理员', '管理端-角色用户', '根据角色id获取角色员工列表(无分页)', '/smart-admin-api/role/listAllEmployee/50', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listAllEmployeeRoleId', 'Long[50]', 1, NULL, '2021-02-07 11:31:13', '2021-02-07 11:31:13');
INSERT INTO `t_user_operate_log` VALUES (271, 1, '管理员', '管理端-角色用户', '获取角色成员-员工列表', '/smart-admin-api/role/listEmployee', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName', 'RoleQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"roleId\":\"50\"}]', 1, NULL, '2021-02-07 11:31:16', '2021-02-07 11:31:16');
INSERT INTO `t_user_operate_log` VALUES (272, 1, '管理员', '管理端-角色用户', '角色成员列表中批量添加员工', '/smart-admin-api/role/addEmployeeList', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.addEmployeeList', 'RoleBatchDTO[{\"employeeIds\":[40],\"roleId\":50}]', 1, NULL, '2021-02-07 11:31:16', '2021-02-07 11:31:16');
INSERT INTO `t_user_operate_log` VALUES (273, 1, '管理员', '管理端-角色用户', '根据角色id获取角色员工列表(无分页)', '/smart-admin-api/role/listAllEmployee/50', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listAllEmployeeRoleId', 'Long[50]', 1, NULL, '2021-02-07 11:31:16', '2021-02-07 11:31:16');
INSERT INTO `t_user_operate_log` VALUES (274, 1, '管理员', '管理端-角色用户', '获取角色成员-员工列表', '/smart-admin-api/role/listEmployee', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName', 'RoleQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"roleId\":\"50\"}]', 1, NULL, '2021-02-07 11:31:16', '2021-02-07 11:31:16');
INSERT INTO `t_user_operate_log` VALUES (275, 1, '管理员', '管理端-角色用户', '根据角色id获取角色员工列表(无分页)', '/smart-admin-api/role/listAllEmployee/50', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listAllEmployeeRoleId', 'Long[50]', 1, NULL, '2021-02-07 11:31:16', '2021-02-07 11:31:16');
INSERT INTO `t_user_operate_log` VALUES (276, 1, '管理员', '管理端-数据范围', '获取当前系统所配置的所有数据范围', '/smart-admin-api/dataScope/list', 'com.asset.module.system.datascope.DataScopeController.dataScopeList', '', 1, NULL, '2021-02-07 11:31:18', '2021-02-07 11:31:18');
INSERT INTO `t_user_operate_log` VALUES (277, 1, '管理员', '管理端-数据范围', '获取某角色所设置的数据范围', '/smart-admin-api/dataScope/listByRole/50', 'com.asset.module.system.datascope.DataScopeController.dataScopeListByRole', 'Long[50]', 1, NULL, '2021-02-07 11:31:18', '2021-02-07 11:31:18');
INSERT INTO `t_user_operate_log` VALUES (278, 1, '管理员', '管理端-数据范围', '批量设置某角色数据范围', '/smart-admin-api/dataScope/batchSet', 'com.asset.module.system.datascope.DataScopeController.dataScopeBatchSet', 'DataScopeBatchSetRoleDTO[{\"batchSetList\":[{\"dataScopeType\":0,\"viewType\":0}],\"roleId\":50}]', 1, NULL, '2021-02-07 11:31:21', '2021-02-07 11:31:21');
INSERT INTO `t_user_operate_log` VALUES (279, 1, '管理员', '管理端-数据范围', '获取当前系统所配置的所有数据范围', '/smart-admin-api/dataScope/list', 'com.asset.module.system.datascope.DataScopeController.dataScopeList', '', 1, NULL, '2021-02-07 11:31:21', '2021-02-07 11:31:21');
INSERT INTO `t_user_operate_log` VALUES (280, 1, '管理员', '管理端-数据范围', '获取某角色所设置的数据范围', '/smart-admin-api/dataScope/listByRole/50', 'com.asset.module.system.datascope.DataScopeController.dataScopeListByRole', 'Long[50]', 1, NULL, '2021-02-07 11:31:22', '2021-02-07 11:31:22');
INSERT INTO `t_user_operate_log` VALUES (281, 1, '管理员', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-07 11:31:27', '2021-02-07 11:31:27');
INSERT INTO `t_user_operate_log` VALUES (282, 40, '张向宇', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-07 11:34:32', '2021-02-07 11:34:32');
INSERT INTO `t_user_operate_log` VALUES (283, 1, '管理员', '通用-权限', '获取所有请求路径', '/smart-admin-api/privilege/getAllUrl', 'com.asset.module.system.privilege.controller.PrivilegeController.getAllUrl', '', 1, NULL, '2021-02-07 11:34:58', '2021-02-07 11:34:58');
INSERT INTO `t_user_operate_log` VALUES (284, 1, '管理员', '通用-权限', '查询所有菜单项', '/smart-admin-api/privilege/menu/queryAll', 'com.asset.module.system.privilege.controller.PrivilegeController.queryAll', '', 1, NULL, '2021-02-07 11:34:58', '2021-02-07 11:34:58');
INSERT INTO `t_user_operate_log` VALUES (285, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/PeonyList', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"PeonyList\"]', 1, NULL, '2021-02-07 11:35:16', '2021-02-07 11:35:16');
INSERT INTO `t_user_operate_log` VALUES (286, 1, '管理员', '通用-权限', '获取所有请求路径', '/smart-admin-api/privilege/getAllUrl', 'com.asset.module.system.privilege.controller.PrivilegeController.getAllUrl', '', 1, NULL, '2021-02-07 11:36:05', '2021-02-07 11:36:05');
INSERT INTO `t_user_operate_log` VALUES (287, 1, '管理员', '通用-权限', '查询所有菜单项', '/smart-admin-api/privilege/menu/queryAll', 'com.asset.module.system.privilege.controller.PrivilegeController.queryAll', '', 1, NULL, '2021-02-07 11:36:05', '2021-02-07 11:36:05');
INSERT INTO `t_user_operate_log` VALUES (288, 1, '管理员', '通用-权限', '获取所有请求路径', '/smart-admin-api/privilege/getAllUrl', 'com.asset.module.system.privilege.controller.PrivilegeController.getAllUrl', '', 1, NULL, '2021-02-07 11:36:46', '2021-02-07 11:36:46');
INSERT INTO `t_user_operate_log` VALUES (289, 1, '管理员', '通用-权限', '查询所有菜单项', '/smart-admin-api/privilege/menu/queryAll', 'com.asset.module.system.privilege.controller.PrivilegeController.queryAll', '', 1, NULL, '2021-02-07 11:36:46', '2021-02-07 11:36:46');
INSERT INTO `t_user_operate_log` VALUES (290, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/RoleManage', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"RoleManage\"]', 1, NULL, '2021-02-07 11:39:13', '2021-02-07 11:39:13');
INSERT INTO `t_user_operate_log` VALUES (291, 1, '管理员', '通用-权限', '获取所有请求路径', '/smart-admin-api/privilege/getAllUrl', 'com.asset.module.system.privilege.controller.PrivilegeController.getAllUrl', '', 1, NULL, '2021-02-07 11:41:35', '2021-02-07 11:41:35');
INSERT INTO `t_user_operate_log` VALUES (292, 1, '管理员', '通用-权限', '查询所有菜单项', '/smart-admin-api/privilege/menu/queryAll', 'com.asset.module.system.privilege.controller.PrivilegeController.queryAll', '', 1, NULL, '2021-02-07 11:41:35', '2021-02-07 11:41:35');
INSERT INTO `t_user_operate_log` VALUES (293, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 11:44:05', '2021-02-07 11:44:05');
INSERT INTO `t_user_operate_log` VALUES (294, 1, '管理员', '通用-权限', '获取所有请求路径', '/smart-admin-api/privilege/getAllUrl', 'com.asset.module.system.privilege.controller.PrivilegeController.getAllUrl', '', 1, NULL, '2021-02-07 11:44:06', '2021-02-07 11:44:06');
INSERT INTO `t_user_operate_log` VALUES (295, 1, '管理员', '通用-权限', '查询所有菜单项', '/smart-admin-api/privilege/menu/queryAll', 'com.asset.module.system.privilege.controller.PrivilegeController.queryAll', '', 1, NULL, '2021-02-07 11:44:06', '2021-02-07 11:44:06');
INSERT INTO `t_user_operate_log` VALUES (296, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/RoleManage', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"RoleManage\"]', 1, NULL, '2021-02-07 11:44:28', '2021-02-07 11:44:28');
INSERT INTO `t_user_operate_log` VALUES (297, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 11:45:00', '2021-02-07 11:45:00');
INSERT INTO `t_user_operate_log` VALUES (298, 1, '管理员', '通用-权限', '获取所有请求路径', '/smart-admin-api/privilege/getAllUrl', 'com.asset.module.system.privilege.controller.PrivilegeController.getAllUrl', '', 1, NULL, '2021-02-07 11:45:01', '2021-02-07 11:45:01');
INSERT INTO `t_user_operate_log` VALUES (299, 1, '管理员', '通用-权限', '查询所有菜单项', '/smart-admin-api/privilege/menu/queryAll', 'com.asset.module.system.privilege.controller.PrivilegeController.queryAll', '', 1, NULL, '2021-02-07 11:45:01', '2021-02-07 11:45:01');
INSERT INTO `t_user_operate_log` VALUES (300, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 11:50:18', '2021-02-07 11:50:18');
INSERT INTO `t_user_operate_log` VALUES (301, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 11:50:32', '2021-02-07 11:50:32');
INSERT INTO `t_user_operate_log` VALUES (302, 1, '管理员', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-07 11:50:35', '2021-02-07 11:50:35');
INSERT INTO `t_user_operate_log` VALUES (303, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 11:54:49', '2021-02-07 11:54:49');
INSERT INTO `t_user_operate_log` VALUES (304, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 11:55:18', '2021-02-07 11:55:18');
INSERT INTO `t_user_operate_log` VALUES (305, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 11:55:33', '2021-02-07 11:55:33');
INSERT INTO `t_user_operate_log` VALUES (306, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 11:56:41', '2021-02-07 11:56:41');
INSERT INTO `t_user_operate_log` VALUES (307, 40, '张向宇', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-07 11:58:42', '2021-02-07 11:58:42');
INSERT INTO `t_user_operate_log` VALUES (308, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 11:59:18', '2021-02-07 11:59:18');
INSERT INTO `t_user_operate_log` VALUES (309, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 11:59:25', '2021-02-07 11:59:25');
INSERT INTO `t_user_operate_log` VALUES (310, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 11:59:35', '2021-02-07 11:59:35');
INSERT INTO `t_user_operate_log` VALUES (311, 40, '张向宇', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-07 11:59:37', '2021-02-07 11:59:37');
INSERT INTO `t_user_operate_log` VALUES (312, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 12:02:45', '2021-02-07 12:02:45');
INSERT INTO `t_user_operate_log` VALUES (313, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 12:03:02', '2021-02-07 12:03:02');
INSERT INTO `t_user_operate_log` VALUES (314, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 12:04:51', '2021-02-07 12:04:51');
INSERT INTO `t_user_operate_log` VALUES (315, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 12:08:04', '2021-02-07 12:08:04');
INSERT INTO `t_user_operate_log` VALUES (316, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 12:08:51', '2021-02-07 12:08:51');
INSERT INTO `t_user_operate_log` VALUES (317, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 12:09:28', '2021-02-07 12:09:28');
INSERT INTO `t_user_operate_log` VALUES (318, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 12:10:08', '2021-02-07 12:10:08');
INSERT INTO `t_user_operate_log` VALUES (319, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 12:11:38', '2021-02-07 12:11:38');
INSERT INTO `t_user_operate_log` VALUES (320, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 12:12:57', '2021-02-07 12:12:57');
INSERT INTO `t_user_operate_log` VALUES (321, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 12:13:36', '2021-02-07 12:13:36');
INSERT INTO `t_user_operate_log` VALUES (322, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 12:14:11', '2021-02-07 12:14:11');
INSERT INTO `t_user_operate_log` VALUES (323, 40, '张向宇', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-07 12:14:17', '2021-02-07 12:14:17');
INSERT INTO `t_user_operate_log` VALUES (324, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 12:43:59', '2021-02-07 12:43:59');
INSERT INTO `t_user_operate_log` VALUES (325, 40, '张向宇', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-07 12:44:22', '2021-02-07 12:44:22');
INSERT INTO `t_user_operate_log` VALUES (326, 1, '管理员', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-07 12:46:19', '2021-02-07 12:46:19');
INSERT INTO `t_user_operate_log` VALUES (327, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 12:53:13', '2021-02-07 12:53:13');
INSERT INTO `t_user_operate_log` VALUES (328, 40, '张向宇', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-07 12:53:18', '2021-02-07 12:53:18');
INSERT INTO `t_user_operate_log` VALUES (329, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 12:54:38', '2021-02-07 12:54:38');
INSERT INTO `t_user_operate_log` VALUES (330, 40, '张向宇', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-07 12:54:39', '2021-02-07 12:54:39');
INSERT INTO `t_user_operate_log` VALUES (331, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 12:58:48', '2021-02-07 12:58:48');
INSERT INTO `t_user_operate_log` VALUES (332, 1, '管理员', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-07 12:58:52', '2021-02-07 12:58:52');
INSERT INTO `t_user_operate_log` VALUES (333, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 13:26:39', '2021-02-07 13:26:39');
INSERT INTO `t_user_operate_log` VALUES (334, 40, '张向宇', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-07 13:26:41', '2021-02-07 13:26:41');
INSERT INTO `t_user_operate_log` VALUES (335, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 13:28:50', '2021-02-07 13:28:50');
INSERT INTO `t_user_operate_log` VALUES (336, 1, '管理员', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-07 13:28:51', '2021-02-07 13:28:51');
INSERT INTO `t_user_operate_log` VALUES (337, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 13:35:14', '2021-02-07 13:35:14');
INSERT INTO `t_user_operate_log` VALUES (338, 1, '管理员', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-07 13:35:15', '2021-02-07 13:35:15');
INSERT INTO `t_user_operate_log` VALUES (339, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 13:56:38', '2021-02-07 13:56:38');
INSERT INTO `t_user_operate_log` VALUES (340, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 14:00:59', '2021-02-07 14:00:59');
INSERT INTO `t_user_operate_log` VALUES (341, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 14:01:17', '2021-02-07 14:01:17');
INSERT INTO `t_user_operate_log` VALUES (342, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 14:16:51', '2021-02-07 14:16:51');
INSERT INTO `t_user_operate_log` VALUES (343, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 14:17:28', '2021-02-07 14:17:28');
INSERT INTO `t_user_operate_log` VALUES (344, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 14:21:15', '2021-02-07 14:21:15');
INSERT INTO `t_user_operate_log` VALUES (345, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 14:22:14', '2021-02-07 14:22:14');
INSERT INTO `t_user_operate_log` VALUES (346, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 14:22:59', '2021-02-07 14:22:59');
INSERT INTO `t_user_operate_log` VALUES (347, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 14:34:40', '2021-02-07 14:34:40');
INSERT INTO `t_user_operate_log` VALUES (348, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 14:34:55', '2021-02-07 14:34:55');
INSERT INTO `t_user_operate_log` VALUES (349, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 16:20:10', '2021-02-07 16:20:10');
INSERT INTO `t_user_operate_log` VALUES (350, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/0', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[0]', 1, NULL, '2021-02-07 16:20:10', '2021-02-07 16:20:10');
INSERT INTO `t_user_operate_log` VALUES (351, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2021-02-07 16:20:10', '2021-02-07 16:20:10');
INSERT INTO `t_user_operate_log` VALUES (352, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/54', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[54]', 1, NULL, '2021-02-07 16:25:41', '2021-02-07 16:25:41');
INSERT INTO `t_user_operate_log` VALUES (353, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2021-02-07 16:29:52', '2021-02-07 16:29:52');
INSERT INTO `t_user_operate_log` VALUES (354, 1, '管理员', '管理端-角色用户', '获取角色成员-员工列表', '/smart-admin-api/role/listEmployee', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName', 'RoleQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"roleId\":\"54\"}]', 1, NULL, '2021-02-07 16:29:52', '2021-02-07 16:29:52');
INSERT INTO `t_user_operate_log` VALUES (355, 1, '管理员', '管理端-角色用户', '根据角色id获取角色员工列表(无分页)', '/smart-admin-api/role/listAllEmployee/54', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listAllEmployeeRoleId', 'Long[54]', 1, NULL, '2021-02-07 16:29:52', '2021-02-07 16:29:52');
INSERT INTO `t_user_operate_log` VALUES (356, 1, '管理员', '管理端-角色用户', '根据角色id获取角色员工列表(无分页)', '/smart-admin-api/role/listAllEmployee/54', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listAllEmployeeRoleId', 'Long[54]', 1, NULL, '2021-02-07 16:32:39', '2021-02-07 16:32:39');
INSERT INTO `t_user_operate_log` VALUES (357, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 16:54:03', '2021-02-07 16:54:03');
INSERT INTO `t_user_operate_log` VALUES (358, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 16:54:04', '2021-02-07 16:54:04');
INSERT INTO `t_user_operate_log` VALUES (359, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/0', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[0]', 1, NULL, '2021-02-07 16:54:04', '2021-02-07 16:54:04');
INSERT INTO `t_user_operate_log` VALUES (360, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2021-02-07 16:54:05', '2021-02-07 16:54:05');
INSERT INTO `t_user_operate_log` VALUES (361, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-07 16:54:11', '2021-02-07 16:54:11');
INSERT INTO `t_user_operate_log` VALUES (362, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 16:54:14', '2021-02-07 16:54:14');
INSERT INTO `t_user_operate_log` VALUES (363, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/0', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[0]', 1, NULL, '2021-02-07 16:54:14', '2021-02-07 16:54:14');
INSERT INTO `t_user_operate_log` VALUES (364, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2021-02-07 16:54:15', '2021-02-07 16:54:15');
INSERT INTO `t_user_operate_log` VALUES (365, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 16:54:16', '2021-02-07 16:54:16');
INSERT INTO `t_user_operate_log` VALUES (366, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-07 16:54:16', '2021-02-07 16:54:16');
INSERT INTO `t_user_operate_log` VALUES (367, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2021-02-07 16:54:16', '2021-02-07 16:54:16');
INSERT INTO `t_user_operate_log` VALUES (368, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 16:54:16', '2021-02-07 16:54:16');
INSERT INTO `t_user_operate_log` VALUES (369, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2021-02-07 16:55:02', '2021-02-07 16:55:02');
INSERT INTO `t_user_operate_log` VALUES (370, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2021-02-07 16:56:02', '2021-02-07 16:56:02');
INSERT INTO `t_user_operate_log` VALUES (371, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":26,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 16:58:22', '2021-02-07 16:58:22');
INSERT INTO `t_user_operate_log` VALUES (372, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2021-02-07 16:58:25', '2021-02-07 16:58:25');
INSERT INTO `t_user_operate_log` VALUES (373, 1, '管理员', '管理端-部门', '更新部门信息', '/smart-admin-api/department/update', 'com.asset.module.system.department.DepartmentController.updateDepartment', 'DepartmentUpdateDTO[{\"id\":26,\"managerId\":40,\"name\":\"备案机构\",\"parentId\":1}]', 1, NULL, '2021-02-07 16:58:35', '2021-02-07 16:58:35');
INSERT INTO `t_user_operate_log` VALUES (374, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-07 16:58:36', '2021-02-07 16:58:36');
INSERT INTO `t_user_operate_log` VALUES (375, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":27,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 16:58:43', '2021-02-07 16:58:43');
INSERT INTO `t_user_operate_log` VALUES (376, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":27,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 16:58:43', '2021-02-07 16:58:43');
INSERT INTO `t_user_operate_log` VALUES (377, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":26,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 17:00:21', '2021-02-07 17:00:21');
INSERT INTO `t_user_operate_log` VALUES (378, 1, '管理员', '管理端-角色用户', '通过员工id获取所有角色以及员工具有的角色', '/smart-admin-api/role/getRoles/40', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.getRoleByEmployeeId', 'Long[40]', 1, NULL, '2021-02-07 17:00:27', '2021-02-07 17:00:27');
INSERT INTO `t_user_operate_log` VALUES (379, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 17:08:41', '2021-02-07 17:08:41');
INSERT INTO `t_user_operate_log` VALUES (380, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-07 17:08:42', '2021-02-07 17:08:42');
INSERT INTO `t_user_operate_log` VALUES (381, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 17:08:42', '2021-02-07 17:08:42');
INSERT INTO `t_user_operate_log` VALUES (382, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2021-02-07 17:08:42', '2021-02-07 17:08:42');
INSERT INTO `t_user_operate_log` VALUES (383, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-07 17:08:42', '2021-02-07 17:08:42');
INSERT INTO `t_user_operate_log` VALUES (384, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":1,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 17:25:40', '2021-02-07 17:25:40');
INSERT INTO `t_user_operate_log` VALUES (385, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":1,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 17:25:40', '2021-02-07 17:25:40');
INSERT INTO `t_user_operate_log` VALUES (386, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2021-02-07 17:27:08', '2021-02-07 17:27:08');
INSERT INTO `t_user_operate_log` VALUES (387, 1, '管理员', '管理端-部门', '添加部门', '/smart-admin-api/department/add', 'com.asset.module.system.department.DepartmentController.addDepartment', 'DepartmentCreateDTO[{\"name\":\"123\",\"parentId\":26}]', 1, NULL, '2021-02-07 17:27:41', '2021-02-07 17:27:41');
INSERT INTO `t_user_operate_log` VALUES (388, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-07 17:27:41', '2021-02-07 17:27:41');
INSERT INTO `t_user_operate_log` VALUES (389, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":32,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 17:52:26', '2021-02-07 17:52:26');
INSERT INTO `t_user_operate_log` VALUES (390, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":32,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 17:52:26', '2021-02-07 17:52:26');
INSERT INTO `t_user_operate_log` VALUES (391, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":26,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 17:52:29', '2021-02-07 17:52:29');
INSERT INTO `t_user_operate_log` VALUES (392, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":26,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-07 17:52:29', '2021-02-07 17:52:29');
INSERT INTO `t_user_operate_log` VALUES (393, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 17:59:39', '2021-02-07 17:59:39');
INSERT INTO `t_user_operate_log` VALUES (394, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 20:46:24', '2021-02-07 20:46:24');
INSERT INTO `t_user_operate_log` VALUES (395, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 20:46:39', '2021-02-07 20:46:39');
INSERT INTO `t_user_operate_log` VALUES (396, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 20:46:43', '2021-02-07 20:46:43');
INSERT INTO `t_user_operate_log` VALUES (397, 1, '管理员', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-07 20:46:45', '2021-02-07 20:46:45');
INSERT INTO `t_user_operate_log` VALUES (398, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 20:55:28', '2021-02-07 20:55:28');
INSERT INTO `t_user_operate_log` VALUES (399, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 22:55:37', '2021-02-07 22:55:37');
INSERT INTO `t_user_operate_log` VALUES (400, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 22:55:47', '2021-02-07 22:55:47');
INSERT INTO `t_user_operate_log` VALUES (401, 40, '张向宇', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-07 22:55:51', '2021-02-07 22:55:51');
INSERT INTO `t_user_operate_log` VALUES (402, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 23:07:05', '2021-02-07 23:07:05');
INSERT INTO `t_user_operate_log` VALUES (403, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 23:08:23', '2021-02-07 23:08:23');
INSERT INTO `t_user_operate_log` VALUES (404, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 23:08:47', '2021-02-07 23:08:47');
INSERT INTO `t_user_operate_log` VALUES (405, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 23:09:14', '2021-02-07 23:09:14');
INSERT INTO `t_user_operate_log` VALUES (406, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 23:09:38', '2021-02-07 23:09:38');
INSERT INTO `t_user_operate_log` VALUES (407, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 23:10:49', '2021-02-07 23:10:49');
INSERT INTO `t_user_operate_log` VALUES (408, 40, '张向宇', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-07 23:44:16', '2021-02-07 23:44:16');
INSERT INTO `t_user_operate_log` VALUES (409, 40, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-07 23:57:26', '2021-02-07 23:57:26');
INSERT INTO `t_user_operate_log` VALUES (410, 1, '管理员', '管理端-任务调度', '查询任务', '/smart-admin-api/quartz/task/query', 'com.asset.module.support.quartz.controller.QuartzController.query', 'QuartzQueryDTO[{\"pageNum\":1,\"pageSize\":10}]', 1, NULL, '2021-02-08 10:49:35', '2021-02-08 10:49:35');
INSERT INTO `t_user_operate_log` VALUES (411, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-08 11:32:02', '2021-02-08 11:32:02');
INSERT INTO `t_user_operate_log` VALUES (412, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-08 11:32:42', '2021-02-08 11:32:42');
INSERT INTO `t_user_operate_log` VALUES (413, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-08 11:33:19', '2021-02-08 11:33:19');
INSERT INTO `t_user_operate_log` VALUES (414, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-08 11:33:31', '2021-02-08 11:33:31');
INSERT INTO `t_user_operate_log` VALUES (415, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-08 11:35:35', '2021-02-08 11:35:35');
INSERT INTO `t_user_operate_log` VALUES (416, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-08 11:36:02', '2021-02-08 11:36:02');
INSERT INTO `t_user_operate_log` VALUES (417, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-08 11:38:26', '2021-02-08 11:38:26');
INSERT INTO `t_user_operate_log` VALUES (418, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-08 11:40:32', '2021-02-08 11:40:32');
INSERT INTO `t_user_operate_log` VALUES (419, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/0', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[0]', 1, NULL, '2021-02-08 11:40:32', '2021-02-08 11:40:32');
INSERT INTO `t_user_operate_log` VALUES (420, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2021-02-08 11:40:32', '2021-02-08 11:40:32');
INSERT INTO `t_user_operate_log` VALUES (421, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-08 11:40:38', '2021-02-08 11:40:38');
INSERT INTO `t_user_operate_log` VALUES (422, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-08 11:40:45', '2021-02-08 11:40:45');
INSERT INTO `t_user_operate_log` VALUES (423, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2021-02-08 11:40:45', '2021-02-08 11:40:45');
INSERT INTO `t_user_operate_log` VALUES (424, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-08 11:40:45', '2021-02-08 11:40:45');
INSERT INTO `t_user_operate_log` VALUES (425, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-08 11:40:45', '2021-02-08 11:40:45');
INSERT INTO `t_user_operate_log` VALUES (426, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2021-02-08 11:41:08', '2021-02-08 11:41:08');
INSERT INTO `t_user_operate_log` VALUES (427, 1, '管理员', '管理端-部门', '添加部门', '/smart-admin-api/department/add', 'com.asset.module.system.department.DepartmentController.addDepartment', 'DepartmentCreateDTO[{\"name\":\"A产品\",\"parentId\":1}]', 1, NULL, '2021-02-08 11:41:30', '2021-02-08 11:41:30');
INSERT INTO `t_user_operate_log` VALUES (428, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-08 11:41:31', '2021-02-08 11:41:31');
INSERT INTO `t_user_operate_log` VALUES (429, 1, '管理员', '管理端-部门', '删除部门', '/smart-admin-api/department/delete/32', 'com.asset.module.system.department.DepartmentController.delDepartment', 'Long[32]', 1, NULL, '2021-02-08 11:41:38', '2021-02-08 11:41:38');
INSERT INTO `t_user_operate_log` VALUES (430, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-08 11:41:38', '2021-02-08 11:41:38');
INSERT INTO `t_user_operate_log` VALUES (431, 1, '管理员', '管理端-部门', '添加部门', '/smart-admin-api/department/add', 'com.asset.module.system.department.DepartmentController.addDepartment', 'DepartmentCreateDTO[{\"name\":\"B产品类型\",\"parentId\":1}]', 1, NULL, '2021-02-08 11:41:52', '2021-02-08 11:41:52');
INSERT INTO `t_user_operate_log` VALUES (432, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-08 11:41:52', '2021-02-08 11:41:52');
INSERT INTO `t_user_operate_log` VALUES (433, 1, '管理员', '管理端-部门', '更新部门信息', '/smart-admin-api/department/update', 'com.asset.module.system.department.DepartmentController.updateDepartment', 'DepartmentUpdateDTO[{\"id\":33,\"name\":\"A产品类型\",\"parentId\":1}]', 1, NULL, '2021-02-08 11:42:00', '2021-02-08 11:42:00');
INSERT INTO `t_user_operate_log` VALUES (434, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-08 11:42:00', '2021-02-08 11:42:00');
INSERT INTO `t_user_operate_log` VALUES (435, 1, '管理员', '管理端-部门', '添加部门', '/smart-admin-api/department/add', 'com.asset.module.system.department.DepartmentController.addDepartment', 'DepartmentCreateDTO[{\"name\":\"管理人\",\"parentId\":33}]', 1, NULL, '2021-02-08 11:42:30', '2021-02-08 11:42:30');
INSERT INTO `t_user_operate_log` VALUES (436, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-08 11:42:31', '2021-02-08 11:42:31');
INSERT INTO `t_user_operate_log` VALUES (437, 1, '管理员', '管理端-部门', '添加部门', '/smart-admin-api/department/add', 'com.asset.module.system.department.DepartmentController.addDepartment', 'DepartmentCreateDTO[{\"name\":\"备案机构\",\"parentId\":33}]', 1, NULL, '2021-02-08 11:42:38', '2021-02-08 11:42:38');
INSERT INTO `t_user_operate_log` VALUES (438, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-08 11:42:38', '2021-02-08 11:42:38');
INSERT INTO `t_user_operate_log` VALUES (439, 1, '管理员', '管理端-部门', '删除部门', '/smart-admin-api/department/delete/31', 'com.asset.module.system.department.DepartmentController.delDepartment', 'Long[31]', 1, NULL, '2021-02-08 11:42:44', '2021-02-08 11:42:44');
INSERT INTO `t_user_operate_log` VALUES (440, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-08 11:42:44', '2021-02-08 11:42:44');
INSERT INTO `t_user_operate_log` VALUES (441, 1, '管理员', '管理端-部门', '删除部门', '/smart-admin-api/department/delete/30', 'com.asset.module.system.department.DepartmentController.delDepartment', 'Long[30]', 1, NULL, '2021-02-08 11:42:47', '2021-02-08 11:42:47');
INSERT INTO `t_user_operate_log` VALUES (442, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-08 11:42:47', '2021-02-08 11:42:47');
INSERT INTO `t_user_operate_log` VALUES (443, 1, '管理员', '管理端-部门', '删除部门', '/smart-admin-api/department/delete/29', 'com.asset.module.system.department.DepartmentController.delDepartment', 'Long[29]', 1, NULL, '2021-02-08 11:42:49', '2021-02-08 11:42:49');
INSERT INTO `t_user_operate_log` VALUES (444, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-08 11:42:49', '2021-02-08 11:42:49');
INSERT INTO `t_user_operate_log` VALUES (445, 1, '管理员', '管理端-部门', '删除部门', '/smart-admin-api/department/delete/28', 'com.asset.module.system.department.DepartmentController.delDepartment', 'Long[28]', 1, NULL, '2021-02-08 11:42:52', '2021-02-08 11:42:52');
INSERT INTO `t_user_operate_log` VALUES (446, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-08 11:42:52', '2021-02-08 11:42:52');
INSERT INTO `t_user_operate_log` VALUES (447, 1, '管理员', '管理端-部门', '删除部门', '/smart-admin-api/department/delete/27', 'com.asset.module.system.department.DepartmentController.delDepartment', 'Long[27]', 1, NULL, '2021-02-08 11:42:55', '2021-02-08 11:42:55');
INSERT INTO `t_user_operate_log` VALUES (448, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-08 11:42:55', '2021-02-08 11:42:55');
INSERT INTO `t_user_operate_log` VALUES (449, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":26,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-08 11:42:57', '2021-02-08 11:42:57');
INSERT INTO `t_user_operate_log` VALUES (450, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":26,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-08 11:42:57', '2021-02-08 11:42:57');
INSERT INTO `t_user_operate_log` VALUES (451, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":34,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-08 11:42:59', '2021-02-08 11:42:59');
INSERT INTO `t_user_operate_log` VALUES (452, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":34,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-08 11:42:59', '2021-02-08 11:42:59');
INSERT INTO `t_user_operate_log` VALUES (453, 1, '管理员', '管理端-部门', '添加部门', '/smart-admin-api/department/add', 'com.asset.module.system.department.DepartmentController.addDepartment', 'DepartmentCreateDTO[{\"name\":\"管理人\",\"parentId\":34}]', 1, NULL, '2021-02-08 11:43:08', '2021-02-08 11:43:08');
INSERT INTO `t_user_operate_log` VALUES (454, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-08 11:43:08', '2021-02-08 11:43:08');
INSERT INTO `t_user_operate_log` VALUES (455, 1, '管理员', '管理端-部门', '添加部门', '/smart-admin-api/department/add', 'com.asset.module.system.department.DepartmentController.addDepartment', 'DepartmentCreateDTO[{\"name\":\"备案机构\",\"parentId\":34}]', 1, NULL, '2021-02-08 11:43:18', '2021-02-08 11:43:18');
INSERT INTO `t_user_operate_log` VALUES (456, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-08 11:43:18', '2021-02-08 11:43:18');
INSERT INTO `t_user_operate_log` VALUES (457, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":35,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-08 11:43:20', '2021-02-08 11:43:20');
INSERT INTO `t_user_operate_log` VALUES (458, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":35,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-08 11:43:20', '2021-02-08 11:43:20');
INSERT INTO `t_user_operate_log` VALUES (459, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2021-02-08 11:43:27', '2021-02-08 11:43:27');
INSERT INTO `t_user_operate_log` VALUES (460, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":26,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-08 11:43:33', '2021-02-08 11:43:33');
INSERT INTO `t_user_operate_log` VALUES (461, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":26,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-08 11:43:33', '2021-02-08 11:43:33');
INSERT INTO `t_user_operate_log` VALUES (462, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":26,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-08 11:44:00', '2021-02-08 11:44:00');
INSERT INTO `t_user_operate_log` VALUES (463, 1, '管理员', '管理端-用户', '禁用单个员工', '/smart-admin-api/employee/updateStatus/40/1', 'com.asset.module.system.employee.EmployeeController.updateStatus', 'Long[40]Integer[1]', 1, NULL, '2021-02-08 11:44:00', '2021-02-08 11:44:00');
INSERT INTO `t_user_operate_log` VALUES (464, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":26,\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-08 11:44:00', '2021-02-08 11:44:00');
INSERT INTO `t_user_operate_log` VALUES (465, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":26,\"isDelete\":0,\"isDisabled\":1,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-08 11:44:01', '2021-02-08 11:44:01');
INSERT INTO `t_user_operate_log` VALUES (466, 1, '管理员', '管理端-用户', '删除员工信息', '/smart-admin-api/employee/delete/40', 'com.asset.module.system.employee.EmployeeController.deleteEmployeeById', 'Long[40]', 1, NULL, '2021-02-08 11:44:05', '2021-02-08 11:44:05');
INSERT INTO `t_user_operate_log` VALUES (467, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":26,\"isDelete\":0,\"isDisabled\":1,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-08 11:44:05', '2021-02-08 11:44:05');
INSERT INTO `t_user_operate_log` VALUES (468, 1, '管理员', '管理端-部门', '删除部门', '/smart-admin-api/department/delete/26', 'com.asset.module.system.department.DepartmentController.delDepartment', 'Long[26]', 1, NULL, '2021-02-08 11:44:13', '2021-02-08 11:44:13');
INSERT INTO `t_user_operate_log` VALUES (469, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-08 11:44:13', '2021-02-08 11:44:13');
INSERT INTO `t_user_operate_log` VALUES (470, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":35,\"isDelete\":0,\"isDisabled\":1,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-08 11:44:16', '2021-02-08 11:44:16');
INSERT INTO `t_user_operate_log` VALUES (471, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":35,\"isDelete\":0,\"isDisabled\":1,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-08 11:44:16', '2021-02-08 11:44:16');
INSERT INTO `t_user_operate_log` VALUES (472, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":200}]', 1, NULL, '2021-02-08 11:44:19', '2021-02-08 11:44:19');
INSERT INTO `t_user_operate_log` VALUES (473, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2021-02-08 11:45:01', '2021-02-08 11:45:01');
INSERT INTO `t_user_operate_log` VALUES (474, 1, '管理员', '管理端-用户', '添加员工', '/smart-admin-api/employee/add', 'com.asset.module.system.employee.EmployeeController.addEmployee', 'EmployeeAddDTO[{\"actualName\":\"张向宇\",\"birthday\":\"1995-10-23\",\"departmentId\":35,\"email\":\"943738180@qq.com\",\"idCard\":\"140522199510235932\",\"isDisabled\":0,\"loginName\":\"zhangxiangyu\",\"loginPwd\":\"123456\",\"nickName\":\"zxy\",\"phone\":\"15201045723\",\"positionIdList\":[19]}]', 1, NULL, '2021-02-08 11:45:40', '2021-02-08 11:45:40');
INSERT INTO `t_user_operate_log` VALUES (475, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"departmentId\":35,\"isDelete\":0,\"isDisabled\":1,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-08 11:45:40', '2021-02-08 11:45:40');
INSERT INTO `t_user_operate_log` VALUES (476, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2021-02-08 11:46:11', '2021-02-08 11:46:11');
INSERT INTO `t_user_operate_log` VALUES (477, 1, '管理员', '管理端-角色用户', '获取角色成员-员工列表', '/smart-admin-api/role/listEmployee', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName', 'RoleQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"roleId\":\"1\"}]', 0, 'java.lang.NullPointerException\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService.lambda$listEmployeeByName$0(RoleEmployeeService.java:53)\n	at java.util.stream.ReferencePipeline$2$1.accept(ReferencePipeline.java:174)\n	at java.util.ArrayList$ArrayListSpliterator.forEachRemaining(ArrayList.java:1382)\n	at java.util.stream.AbstractPipeline.copyInto(AbstractPipeline.java:481)\n	at java.util.stream.AbstractPipeline.wrapAndCopyInto(AbstractPipeline.java:471)\n	at java.util.stream.ForEachOps$ForEachOp.evaluateSequential(ForEachOps.java:151)\n	at java.util.stream.ForEachOps$ForEachOp$OfRef.evaluateSequential(ForEachOps.java:174)\n	at java.util.stream.AbstractPipeline.evaluate(AbstractPipeline.java:234)\n	at java.util.stream.ReferencePipeline.forEach(ReferencePipeline.java:418)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService.listEmployeeByName(RoleEmployeeService.java:53)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService$$FastClassBySpringCGLIB$$c35b34f7.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:771)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:73)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:691)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService$$EnhancerBySpringCGLIB$$22085487.listEmployeeByName(<generated>)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName(RoleEmployeeController.java:39)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeController$$FastClassBySpringCGLIB$$5fa6361a.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:771)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:62)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.adapter.AfterReturningAdviceInterceptor.invoke(AfterReturningAdviceInterceptor.java:55)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:95)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:691)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeController$$EnhancerBySpringCGLIB$$261a216c.listEmployeeByName(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:105)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:878)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:792)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1040)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:943)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:652)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:733)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.github.xiaoymin.knife4j.spring.filter.ProductionSecurityFilter.doFilter(ProductionSecurityFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.github.xiaoymin.knife4j.spring.filter.SecurityBasicAuthFilter.doFilter(SecurityBasicAuthFilter.java:90)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.boot.actuate.metrics.web.servlet.WebMvcMetricsFilter.doFilterInternal(WebMvcMetricsFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:143)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:690)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:374)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:868)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1590)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:748)\n', '2021-02-08 11:46:11', '2021-02-08 11:46:11');
INSERT INTO `t_user_operate_log` VALUES (478, 1, '管理员', '管理端-角色用户', '获取角色成员-员工列表', '/smart-admin-api/role/listEmployee', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName', 'RoleQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"roleId\":\"50\"}]', 0, 'java.lang.NullPointerException\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService.lambda$listEmployeeByName$1(RoleEmployeeService.java:55)\n	at java.util.stream.ForEachOps$ForEachOp$OfRef.accept(ForEachOps.java:184)\n	at java.util.stream.ReferencePipeline$2$1.accept(ReferencePipeline.java:175)\n	at java.util.ArrayList$ArrayListSpliterator.forEachRemaining(ArrayList.java:1382)\n	at java.util.stream.AbstractPipeline.copyInto(AbstractPipeline.java:481)\n	at java.util.stream.AbstractPipeline.wrapAndCopyInto(AbstractPipeline.java:471)\n	at java.util.stream.ForEachOps$ForEachOp.evaluateSequential(ForEachOps.java:151)\n	at java.util.stream.ForEachOps$ForEachOp$OfRef.evaluateSequential(ForEachOps.java:174)\n	at java.util.stream.AbstractPipeline.evaluate(AbstractPipeline.java:234)\n	at java.util.stream.ReferencePipeline.forEach(ReferencePipeline.java:418)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService.listEmployeeByName(RoleEmployeeService.java:53)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService$$FastClassBySpringCGLIB$$c35b34f7.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:771)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:73)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:691)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService$$EnhancerBySpringCGLIB$$22085487.listEmployeeByName(<generated>)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName(RoleEmployeeController.java:39)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeController$$FastClassBySpringCGLIB$$5fa6361a.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:771)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:62)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.adapter.AfterReturningAdviceInterceptor.invoke(AfterReturningAdviceInterceptor.java:55)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:95)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:691)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeController$$EnhancerBySpringCGLIB$$261a216c.listEmployeeByName(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:105)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:878)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:792)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1040)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:943)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:652)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:733)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.github.xiaoymin.knife4j.spring.filter.ProductionSecurityFilter.doFilter(ProductionSecurityFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.github.xiaoymin.knife4j.spring.filter.SecurityBasicAuthFilter.doFilter(SecurityBasicAuthFilter.java:90)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.boot.actuate.metrics.web.servlet.WebMvcMetricsFilter.doFilterInternal(WebMvcMetricsFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:143)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:690)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:374)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:868)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1590)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:748)\n', '2021-02-08 11:46:16', '2021-02-08 11:46:16');
INSERT INTO `t_user_operate_log` VALUES (479, 1, '管理员', '管理端-角色用户', '获取角色成员-员工列表', '/smart-admin-api/role/listEmployee', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName', 'RoleQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"roleId\":\"1\"}]', 0, 'java.lang.NullPointerException\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService.lambda$listEmployeeByName$0(RoleEmployeeService.java:53)\n	at java.util.stream.ReferencePipeline$2$1.accept(ReferencePipeline.java:174)\n	at java.util.ArrayList$ArrayListSpliterator.forEachRemaining(ArrayList.java:1382)\n	at java.util.stream.AbstractPipeline.copyInto(AbstractPipeline.java:481)\n	at java.util.stream.AbstractPipeline.wrapAndCopyInto(AbstractPipeline.java:471)\n	at java.util.stream.ForEachOps$ForEachOp.evaluateSequential(ForEachOps.java:151)\n	at java.util.stream.ForEachOps$ForEachOp$OfRef.evaluateSequential(ForEachOps.java:174)\n	at java.util.stream.AbstractPipeline.evaluate(AbstractPipeline.java:234)\n	at java.util.stream.ReferencePipeline.forEach(ReferencePipeline.java:418)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService.listEmployeeByName(RoleEmployeeService.java:53)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService$$FastClassBySpringCGLIB$$c35b34f7.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:771)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:73)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:691)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService$$EnhancerBySpringCGLIB$$22085487.listEmployeeByName(<generated>)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName(RoleEmployeeController.java:39)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeController$$FastClassBySpringCGLIB$$5fa6361a.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:771)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:62)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.adapter.AfterReturningAdviceInterceptor.invoke(AfterReturningAdviceInterceptor.java:55)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:95)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:691)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeController$$EnhancerBySpringCGLIB$$261a216c.listEmployeeByName(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:105)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:878)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:792)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1040)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:943)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:652)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:733)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.github.xiaoymin.knife4j.spring.filter.ProductionSecurityFilter.doFilter(ProductionSecurityFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.github.xiaoymin.knife4j.spring.filter.SecurityBasicAuthFilter.doFilter(SecurityBasicAuthFilter.java:90)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.boot.actuate.metrics.web.servlet.WebMvcMetricsFilter.doFilterInternal(WebMvcMetricsFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:143)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:690)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:374)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:868)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1590)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:748)\n', '2021-02-08 11:46:18', '2021-02-08 11:46:18');
INSERT INTO `t_user_operate_log` VALUES (480, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-08 11:46:33', '2021-02-08 11:46:33');
INSERT INTO `t_user_operate_log` VALUES (481, 1, '管理员', '管理端-角色用户', '获取角色成员-员工列表', '/smart-admin-api/role/listEmployee', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName', 'RoleQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"roleId\":\"50\"}]', 0, 'java.lang.NullPointerException\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService.lambda$listEmployeeByName$1(RoleEmployeeService.java:55)\n	at java.util.stream.ForEachOps$ForEachOp$OfRef.accept(ForEachOps.java:184)\n	at java.util.stream.ReferencePipeline$2$1.accept(ReferencePipeline.java:175)\n	at java.util.ArrayList$ArrayListSpliterator.forEachRemaining(ArrayList.java:1382)\n	at java.util.stream.AbstractPipeline.copyInto(AbstractPipeline.java:481)\n	at java.util.stream.AbstractPipeline.wrapAndCopyInto(AbstractPipeline.java:471)\n	at java.util.stream.ForEachOps$ForEachOp.evaluateSequential(ForEachOps.java:151)\n	at java.util.stream.ForEachOps$ForEachOp$OfRef.evaluateSequential(ForEachOps.java:174)\n	at java.util.stream.AbstractPipeline.evaluate(AbstractPipeline.java:234)\n	at java.util.stream.ReferencePipeline.forEach(ReferencePipeline.java:418)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService.listEmployeeByName(RoleEmployeeService.java:53)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService$$FastClassBySpringCGLIB$$c35b34f7.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:771)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:73)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:691)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService$$EnhancerBySpringCGLIB$$22085487.listEmployeeByName(<generated>)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName(RoleEmployeeController.java:39)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeController$$FastClassBySpringCGLIB$$5fa6361a.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:771)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:62)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.adapter.AfterReturningAdviceInterceptor.invoke(AfterReturningAdviceInterceptor.java:55)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:95)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:691)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeController$$EnhancerBySpringCGLIB$$261a216c.listEmployeeByName(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:105)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:878)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:792)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1040)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:943)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:652)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:733)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.github.xiaoymin.knife4j.spring.filter.ProductionSecurityFilter.doFilter(ProductionSecurityFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.github.xiaoymin.knife4j.spring.filter.SecurityBasicAuthFilter.doFilter(SecurityBasicAuthFilter.java:90)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.boot.actuate.metrics.web.servlet.WebMvcMetricsFilter.doFilterInternal(WebMvcMetricsFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:143)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:690)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:374)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:868)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1590)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:748)\n', '2021-02-08 11:46:48', '2021-02-08 11:46:48');
INSERT INTO `t_user_operate_log` VALUES (482, 1, '管理员', '管理端-角色用户', '获取角色成员-员工列表', '/smart-admin-api/role/listEmployee', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName', 'RoleQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"roleId\":\"51\"}]', 1, NULL, '2021-02-08 11:46:50', '2021-02-08 11:46:50');
INSERT INTO `t_user_operate_log` VALUES (483, 1, '管理员', '管理端-角色用户', '根据角色id获取角色员工列表(无分页)', '/smart-admin-api/role/listAllEmployee/51', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listAllEmployeeRoleId', 'Long[51]', 1, NULL, '2021-02-08 11:46:50', '2021-02-08 11:46:50');
INSERT INTO `t_user_operate_log` VALUES (484, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/51', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[51]', 1, NULL, '2021-02-08 11:46:51', '2021-02-08 11:46:51');
INSERT INTO `t_user_operate_log` VALUES (485, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/52', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[52]', 1, NULL, '2021-02-08 11:47:02', '2021-02-08 11:47:02');
INSERT INTO `t_user_operate_log` VALUES (486, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/53', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[53]', 1, NULL, '2021-02-08 11:47:03', '2021-02-08 11:47:03');
INSERT INTO `t_user_operate_log` VALUES (487, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/54', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[54]', 1, NULL, '2021-02-08 11:47:04', '2021-02-08 11:47:04');
INSERT INTO `t_user_operate_log` VALUES (488, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/55', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[55]', 1, NULL, '2021-02-08 11:47:04', '2021-02-08 11:47:04');
INSERT INTO `t_user_operate_log` VALUES (489, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2021-02-08 11:47:06', '2021-02-08 11:47:06');
INSERT INTO `t_user_operate_log` VALUES (490, 1, '管理员', '管理端-数据范围', '获取当前系统所配置的所有数据范围', '/smart-admin-api/dataScope/list', 'com.asset.module.system.datascope.DataScopeController.dataScopeList', '', 1, NULL, '2021-02-08 11:47:11', '2021-02-08 11:47:11');
INSERT INTO `t_user_operate_log` VALUES (491, 1, '管理员', '管理端-数据范围', '获取某角色所设置的数据范围', '/smart-admin-api/dataScope/listByRole/1', 'com.asset.module.system.datascope.DataScopeController.dataScopeListByRole', 'Long[1]', 1, NULL, '2021-02-08 11:47:11', '2021-02-08 11:47:11');
INSERT INTO `t_user_operate_log` VALUES (492, 1, '管理员', '管理端-数据范围', '批量设置某角色数据范围', '/smart-admin-api/dataScope/batchSet', 'com.asset.module.system.datascope.DataScopeController.dataScopeBatchSet', 'DataScopeBatchSetRoleDTO[{\"batchSetList\":[{\"dataScopeType\":0,\"viewType\":3}],\"roleId\":1}]', 1, NULL, '2021-02-08 11:47:14', '2021-02-08 11:47:14');
INSERT INTO `t_user_operate_log` VALUES (493, 1, '管理员', '管理端-数据范围', '获取当前系统所配置的所有数据范围', '/smart-admin-api/dataScope/list', 'com.asset.module.system.datascope.DataScopeController.dataScopeList', '', 1, NULL, '2021-02-08 11:47:14', '2021-02-08 11:47:14');
INSERT INTO `t_user_operate_log` VALUES (494, 1, '管理员', '管理端-数据范围', '获取某角色所设置的数据范围', '/smart-admin-api/dataScope/listByRole/1', 'com.asset.module.system.datascope.DataScopeController.dataScopeListByRole', 'Long[1]', 1, NULL, '2021-02-08 11:47:14', '2021-02-08 11:47:14');
INSERT INTO `t_user_operate_log` VALUES (495, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2021-02-08 11:47:16', '2021-02-08 11:47:16');
INSERT INTO `t_user_operate_log` VALUES (496, 1, '管理员', '管理端-角色用户', '获取角色成员-员工列表', '/smart-admin-api/role/listEmployee', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName', 'RoleQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"roleId\":\"1\"}]', 0, 'java.lang.NullPointerException\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService.lambda$listEmployeeByName$0(RoleEmployeeService.java:53)\n	at java.util.stream.ReferencePipeline$2$1.accept(ReferencePipeline.java:174)\n	at java.util.ArrayList$ArrayListSpliterator.forEachRemaining(ArrayList.java:1382)\n	at java.util.stream.AbstractPipeline.copyInto(AbstractPipeline.java:481)\n	at java.util.stream.AbstractPipeline.wrapAndCopyInto(AbstractPipeline.java:471)\n	at java.util.stream.ForEachOps$ForEachOp.evaluateSequential(ForEachOps.java:151)\n	at java.util.stream.ForEachOps$ForEachOp$OfRef.evaluateSequential(ForEachOps.java:174)\n	at java.util.stream.AbstractPipeline.evaluate(AbstractPipeline.java:234)\n	at java.util.stream.ReferencePipeline.forEach(ReferencePipeline.java:418)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService.listEmployeeByName(RoleEmployeeService.java:53)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService$$FastClassBySpringCGLIB$$c35b34f7.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:771)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:73)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:691)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService$$EnhancerBySpringCGLIB$$22085487.listEmployeeByName(<generated>)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName(RoleEmployeeController.java:39)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeController$$FastClassBySpringCGLIB$$5fa6361a.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:771)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:62)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.adapter.AfterReturningAdviceInterceptor.invoke(AfterReturningAdviceInterceptor.java:55)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:95)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:691)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeController$$EnhancerBySpringCGLIB$$261a216c.listEmployeeByName(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:105)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:878)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:792)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1040)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:943)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:652)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:733)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.github.xiaoymin.knife4j.spring.filter.ProductionSecurityFilter.doFilter(ProductionSecurityFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.github.xiaoymin.knife4j.spring.filter.SecurityBasicAuthFilter.doFilter(SecurityBasicAuthFilter.java:90)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.boot.actuate.metrics.web.servlet.WebMvcMetricsFilter.doFilterInternal(WebMvcMetricsFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:143)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:690)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:374)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:868)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1590)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:748)\n', '2021-02-08 11:47:16', '2021-02-08 11:47:16');
INSERT INTO `t_user_operate_log` VALUES (497, 1, '管理员', '管理端-角色用户', '根据角色id获取角色员工列表(无分页)', '/smart-admin-api/role/listAllEmployee/1', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listAllEmployeeRoleId', 'Long[1]', 1, NULL, '2021-02-08 11:47:18', '2021-02-08 11:47:18');
INSERT INTO `t_user_operate_log` VALUES (498, 1, '管理员', '管理端-角色用户', '获取角色成员-员工列表', '/smart-admin-api/role/listEmployee', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName', 'RoleQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"roleId\":\"1\"}]', 0, 'java.lang.NullPointerException\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService.lambda$listEmployeeByName$0(RoleEmployeeService.java:53)\n	at java.util.stream.ReferencePipeline$2$1.accept(ReferencePipeline.java:174)\n	at java.util.ArrayList$ArrayListSpliterator.forEachRemaining(ArrayList.java:1382)\n	at java.util.stream.AbstractPipeline.copyInto(AbstractPipeline.java:481)\n	at java.util.stream.AbstractPipeline.wrapAndCopyInto(AbstractPipeline.java:471)\n	at java.util.stream.ForEachOps$ForEachOp.evaluateSequential(ForEachOps.java:151)\n	at java.util.stream.ForEachOps$ForEachOp$OfRef.evaluateSequential(ForEachOps.java:174)\n	at java.util.stream.AbstractPipeline.evaluate(AbstractPipeline.java:234)\n	at java.util.stream.ReferencePipeline.forEach(ReferencePipeline.java:418)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService.listEmployeeByName(RoleEmployeeService.java:53)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService$$FastClassBySpringCGLIB$$c35b34f7.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:771)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:73)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:691)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeService$$EnhancerBySpringCGLIB$$22085487.listEmployeeByName(<generated>)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName(RoleEmployeeController.java:39)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeController$$FastClassBySpringCGLIB$$5fa6361a.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:771)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:62)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.adapter.AfterReturningAdviceInterceptor.invoke(AfterReturningAdviceInterceptor.java:55)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:95)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:691)\n	at com.asset.module.system.role.roleemployee.RoleEmployeeController$$EnhancerBySpringCGLIB$$261a216c.listEmployeeByName(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:105)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:878)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:792)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1040)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:943)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:652)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:733)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.github.xiaoymin.knife4j.spring.filter.ProductionSecurityFilter.doFilter(ProductionSecurityFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.github.xiaoymin.knife4j.spring.filter.SecurityBasicAuthFilter.doFilter(SecurityBasicAuthFilter.java:90)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.boot.actuate.metrics.web.servlet.WebMvcMetricsFilter.doFilterInternal(WebMvcMetricsFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:143)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:690)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:374)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:868)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1590)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:748)\n', '2021-02-08 11:47:40', '2021-02-08 11:47:40');
INSERT INTO `t_user_operate_log` VALUES (499, 1, '管理员', '管理端-角色用户', '角色成员列表中批量添加员工', '/smart-admin-api/role/addEmployeeList', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.addEmployeeList', 'RoleBatchDTO[{\"employeeIds\":[41],\"roleId\":1}]', 1, NULL, '2021-02-08 11:47:40', '2021-02-08 11:47:40');
INSERT INTO `t_user_operate_log` VALUES (500, 1, '管理员', '管理端-角色用户', '获取角色成员-员工列表', '/smart-admin-api/role/listEmployee', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName', 'RoleQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"roleId\":\"1\"}]', 1, NULL, '2021-02-08 11:47:40', '2021-02-08 11:47:40');
INSERT INTO `t_user_operate_log` VALUES (501, 1, '管理员', '管理端-角色用户', '根据角色id获取角色员工列表(无分页)', '/smart-admin-api/role/listAllEmployee/1', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listAllEmployeeRoleId', 'Long[1]', 1, NULL, '2021-02-08 11:47:40', '2021-02-08 11:47:40');
INSERT INTO `t_user_operate_log` VALUES (502, 1, '管理员', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-08 11:47:52', '2021-02-08 11:47:52');
INSERT INTO `t_user_operate_log` VALUES (503, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-08 11:48:07', '2021-02-08 11:48:07');
INSERT INTO `t_user_operate_log` VALUES (504, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/0', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[0]', 1, NULL, '2021-02-08 11:48:07', '2021-02-08 11:48:07');
INSERT INTO `t_user_operate_log` VALUES (505, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2021-02-08 11:48:07', '2021-02-08 11:48:07');
INSERT INTO `t_user_operate_log` VALUES (506, 1, '管理员', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-08 11:48:16', '2021-02-08 11:48:16');
INSERT INTO `t_user_operate_log` VALUES (507, 41, '张向宇', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-08 11:50:52', '2021-02-08 11:50:52');
INSERT INTO `t_user_operate_log` VALUES (508, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-08 11:51:08', '2021-02-08 11:51:08');
INSERT INTO `t_user_operate_log` VALUES (509, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/0', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[0]', 1, NULL, '2021-02-08 11:51:08', '2021-02-08 11:51:08');
INSERT INTO `t_user_operate_log` VALUES (510, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2021-02-08 11:51:08', '2021-02-08 11:51:08');
INSERT INTO `t_user_operate_log` VALUES (511, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2021-02-08 11:51:12', '2021-02-08 11:51:12');
INSERT INTO `t_user_operate_log` VALUES (512, 1, '管理员', '管理端-角色用户', '获取角色成员-员工列表', '/smart-admin-api/role/listEmployee', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName', 'RoleQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"roleId\":\"1\"}]', 1, NULL, '2021-02-08 11:51:12', '2021-02-08 11:51:12');
INSERT INTO `t_user_operate_log` VALUES (513, 1, '管理员', '管理端-角色用户', '根据角色id获取角色员工列表(无分页)', '/smart-admin-api/role/listAllEmployee/1', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listAllEmployeeRoleId', 'Long[1]', 1, NULL, '2021-02-08 11:51:13', '2021-02-08 11:51:13');
INSERT INTO `t_user_operate_log` VALUES (514, 1, '管理员', '管理端-数据范围', '获取当前系统所配置的所有数据范围', '/smart-admin-api/dataScope/list', 'com.asset.module.system.datascope.DataScopeController.dataScopeList', '', 1, NULL, '2021-02-08 11:51:17', '2021-02-08 11:51:17');
INSERT INTO `t_user_operate_log` VALUES (515, 1, '管理员', '管理端-数据范围', '获取某角色所设置的数据范围', '/smart-admin-api/dataScope/listByRole/1', 'com.asset.module.system.datascope.DataScopeController.dataScopeListByRole', 'Long[1]', 1, NULL, '2021-02-08 11:51:17', '2021-02-08 11:51:17');
INSERT INTO `t_user_operate_log` VALUES (516, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/1', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[1]', 1, NULL, '2021-02-08 11:51:20', '2021-02-08 11:51:20');
INSERT INTO `t_user_operate_log` VALUES (517, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/51', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[51]', 1, NULL, '2021-02-08 11:51:25', '2021-02-08 11:51:25');
INSERT INTO `t_user_operate_log` VALUES (518, 1, '管理员', '管理端-角色用户', '获取角色成员-员工列表', '/smart-admin-api/role/listEmployee', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName', 'RoleQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"roleId\":\"51\"}]', 1, NULL, '2021-02-08 11:51:28', '2021-02-08 11:51:28');
INSERT INTO `t_user_operate_log` VALUES (519, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2021-02-08 11:51:28', '2021-02-08 11:51:28');
INSERT INTO `t_user_operate_log` VALUES (520, 1, '管理员', '管理端-角色用户', '根据角色id获取角色员工列表(无分页)', '/smart-admin-api/role/listAllEmployee/51', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listAllEmployeeRoleId', 'Long[51]', 1, NULL, '2021-02-08 11:51:28', '2021-02-08 11:51:28');
INSERT INTO `t_user_operate_log` VALUES (521, 1, '管理员', '管理端-角色用户', '获取角色成员-员工列表', '/smart-admin-api/role/listEmployee', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName', 'RoleQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"roleId\":\"1\"}]', 1, NULL, '2021-02-08 11:51:31', '2021-02-08 11:51:31');
INSERT INTO `t_user_operate_log` VALUES (522, 1, '管理员', '管理端-角色用户', '根据角色id获取角色员工列表(无分页)', '/smart-admin-api/role/listAllEmployee/1', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listAllEmployeeRoleId', 'Long[1]', 1, NULL, '2021-02-08 11:51:31', '2021-02-08 11:51:31');
INSERT INTO `t_user_operate_log` VALUES (523, 1, '管理员', '管理端-角色用户', '从角色成员列表中移除员工', '/smart-admin-api/role/removeEmployee', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.removeEmployee', 'Long[41]Long[1]', 1, NULL, '2021-02-08 11:51:35', '2021-02-08 11:51:35');
INSERT INTO `t_user_operate_log` VALUES (524, 1, '管理员', '管理端-角色用户', '获取角色成员-员工列表', '/smart-admin-api/role/listEmployee', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName', 'RoleQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"roleId\":\"1\"}]', 1, NULL, '2021-02-08 11:51:35', '2021-02-08 11:51:35');
INSERT INTO `t_user_operate_log` VALUES (525, 1, '管理员', '管理端-角色用户', '根据角色id获取角色员工列表(无分页)', '/smart-admin-api/role/listAllEmployee/1', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listAllEmployeeRoleId', 'Long[1]', 1, NULL, '2021-02-08 11:51:36', '2021-02-08 11:51:36');
INSERT INTO `t_user_operate_log` VALUES (526, 1, '管理员', '管理端-角色用户', '获取角色成员-员工列表', '/smart-admin-api/role/listEmployee', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName', 'RoleQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"roleId\":\"51\"}]', 1, NULL, '2021-02-08 11:51:37', '2021-02-08 11:51:37');
INSERT INTO `t_user_operate_log` VALUES (527, 1, '管理员', '管理端-角色用户', '根据角色id获取角色员工列表(无分页)', '/smart-admin-api/role/listAllEmployee/51', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listAllEmployeeRoleId', 'Long[51]', 1, NULL, '2021-02-08 11:51:37', '2021-02-08 11:51:37');
INSERT INTO `t_user_operate_log` VALUES (528, 1, '管理员', '管理端-角色用户', '根据角色id获取角色员工列表(无分页)', '/smart-admin-api/role/listAllEmployee/51', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listAllEmployeeRoleId', 'Long[51]', 1, NULL, '2021-02-08 11:51:39', '2021-02-08 11:51:39');
INSERT INTO `t_user_operate_log` VALUES (529, 1, '管理员', '管理端-角色用户', '获取角色成员-员工列表', '/smart-admin-api/role/listEmployee', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName', 'RoleQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"roleId\":\"51\"}]', 1, NULL, '2021-02-08 11:51:43', '2021-02-08 11:51:43');
INSERT INTO `t_user_operate_log` VALUES (530, 1, '管理员', '管理端-角色用户', '角色成员列表中批量添加员工', '/smart-admin-api/role/addEmployeeList', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.addEmployeeList', 'RoleBatchDTO[{\"employeeIds\":[41],\"roleId\":51}]', 1, NULL, '2021-02-08 11:51:43', '2021-02-08 11:51:43');
INSERT INTO `t_user_operate_log` VALUES (531, 1, '管理员', '管理端-角色用户', '根据角色id获取角色员工列表(无分页)', '/smart-admin-api/role/listAllEmployee/51', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listAllEmployeeRoleId', 'Long[51]', 1, NULL, '2021-02-08 11:51:43', '2021-02-08 11:51:43');
INSERT INTO `t_user_operate_log` VALUES (532, 1, '管理员', '管理端-角色用户', '获取角色成员-员工列表', '/smart-admin-api/role/listEmployee', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listEmployeeByName', 'RoleQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"roleId\":\"51\"}]', 1, NULL, '2021-02-08 11:51:43', '2021-02-08 11:51:43');
INSERT INTO `t_user_operate_log` VALUES (533, 1, '管理员', '管理端-角色用户', '根据角色id获取角色员工列表(无分页)', '/smart-admin-api/role/listAllEmployee/51', 'com.asset.module.system.role.roleemployee.RoleEmployeeController.listAllEmployeeRoleId', 'Long[51]', 1, NULL, '2021-02-08 11:51:43', '2021-02-08 11:51:43');
INSERT INTO `t_user_operate_log` VALUES (534, 1, '管理员', '管理端-数据范围', '获取当前系统所配置的所有数据范围', '/smart-admin-api/dataScope/list', 'com.asset.module.system.datascope.DataScopeController.dataScopeList', '', 1, NULL, '2021-02-08 11:51:45', '2021-02-08 11:51:45');
INSERT INTO `t_user_operate_log` VALUES (535, 1, '管理员', '管理端-数据范围', '获取某角色所设置的数据范围', '/smart-admin-api/dataScope/listByRole/51', 'com.asset.module.system.datascope.DataScopeController.dataScopeListByRole', 'Long[51]', 1, NULL, '2021-02-08 11:51:45', '2021-02-08 11:51:45');
INSERT INTO `t_user_operate_log` VALUES (536, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/51', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[51]', 1, NULL, '2021-02-08 11:51:50', '2021-02-08 11:51:50');
INSERT INTO `t_user_operate_log` VALUES (537, 1, '管理员', '管理端-角色权限', '更新角色权限', '/smart-admin-api/privilege/updateRolePrivilege', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.updateRolePrivilege', 'RolePrivilegeDTO[{\"privilegeKeyList\":[\"Notice\",\"NoticeList\",\"PersonNotice\",\"notice-query\",\"notice-add\",\"notice-edit\",\"notice-delete\",\"notice-detail\",\"notice-send\",\"person-notice-query\",\"person-notice-detail\",\"Business\",\"NoticeDetail\",\"Peony\",\"PeonyList\",\"peony-list-query\",\"peony-list-add\",\"peony-list-update\",\"peony-list-batch-delete\",\"peony-list-batch-export\",\"peony-list-export-all\",\"PeonyList1\",\"peony1-list-query\",\"peony1-list-add\",\"peony1-list-update\",\"peony1-list-batch-delete\",\"peony1-list-batch-export\",\"peony1-list-export-all\",\"Email\",\"EmailList\",\"email-query\",\"email-add\",\"email-update\",\"email-delete\",\"SendMail\",\"email-send\"],\"roleId\":51}]', 1, NULL, '2021-02-08 11:52:17', '2021-02-08 11:52:17');
INSERT INTO `t_user_operate_log` VALUES (538, 1, '管理员', '管理端-角色权限', '获取角色可选的功能权限', '/smart-admin-api/privilege/listPrivilegeByRoleId/51', 'com.asset.module.system.role.roleprivilege.RolePrivilegeController.listPrivilegeByRoleId', 'Long[51]', 1, NULL, '2021-02-08 11:52:17', '2021-02-08 11:52:17');
INSERT INTO `t_user_operate_log` VALUES (539, 1, '管理员', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-08 11:52:20', '2021-02-08 11:52:20');
INSERT INTO `t_user_operate_log` VALUES (540, 41, '张向宇', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-08 11:54:56', '2021-02-08 11:54:56');
INSERT INTO `t_user_operate_log` VALUES (541, 1, '管理员', '通用-权限', '获取所有请求路径', '/smart-admin-api/privilege/getAllUrl', 'com.asset.module.system.privilege.controller.PrivilegeController.getAllUrl', '', 1, NULL, '2021-02-08 11:55:11', '2021-02-08 11:55:11');
INSERT INTO `t_user_operate_log` VALUES (542, 1, '管理员', '通用-权限', '查询所有菜单项', '/smart-admin-api/privilege/menu/queryAll', 'com.asset.module.system.privilege.controller.PrivilegeController.queryAll', '', 1, NULL, '2021-02-08 11:55:11', '2021-02-08 11:55:11');
INSERT INTO `t_user_operate_log` VALUES (543, 1, '管理员', '管理端-任务调度', '查询任务', '/smart-admin-api/quartz/task/query', 'com.asset.module.support.quartz.controller.QuartzController.query', 'QuartzQueryDTO[{\"pageNum\":1,\"pageSize\":10}]', 1, NULL, '2021-02-08 11:55:28', '2021-02-08 11:55:28');
INSERT INTO `t_user_operate_log` VALUES (544, 1, '管理员', '管理端-任务调度', '暂停某个任务', '/smart-admin-api/quartz/task/pause/23', 'com.asset.module.support.quartz.controller.QuartzController.pauseTask', 'Long[23]', 0, 'org.quartz.JobPersistenceException: Couldn\'t check for existence of job: Table \'asset-admin-dev.qrtz_job_details\' doesn\'t exist [See nested exception: java.sql.SQLSyntaxErrorException: Table \'asset-admin-dev.qrtz_job_details\' doesn\'t exist]\n	at org.quartz.impl.jdbcjobstore.JobStoreSupport.checkExists(JobStoreSupport.java:1964)\n	at org.quartz.impl.jdbcjobstore.JobStoreSupport$22.execute(JobStoreSupport.java:1955)\n	at org.quartz.impl.jdbcjobstore.JobStoreCMT.executeInLock(JobStoreCMT.java:245)\n	at org.quartz.impl.jdbcjobstore.JobStoreSupport.executeWithoutLock(JobStoreSupport.java:3800)\n	at org.quartz.impl.jdbcjobstore.JobStoreSupport.checkExists(JobStoreSupport.java:1952)\n	at org.quartz.core.QuartzScheduler.checkExists(QuartzScheduler.java:1519)\n	at org.quartz.impl.StdScheduler.checkExists(StdScheduler.java:583)\n	at com.asset.module.support.quartz.service.QuartzTaskService.pauseQuartzTask(QuartzTaskService.java:305)\n	at com.asset.module.support.quartz.service.QuartzTaskService.pauseTask(QuartzTaskService.java:173)\n	at com.asset.module.support.quartz.service.QuartzTaskService$$FastClassBySpringCGLIB$$41608eff.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:771)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:367)\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:118)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:73)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:691)\n	at com.asset.module.support.quartz.service.QuartzTaskService$$EnhancerBySpringCGLIB$$521ce79f.pauseTask(<generated>)\n	at com.asset.module.support.quartz.controller.QuartzController.pauseTask(QuartzController.java:67)\n	at com.asset.module.support.quartz.controller.QuartzController$$FastClassBySpringCGLIB$$d2b62a4c.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:771)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:62)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.adapter.AfterReturningAdviceInterceptor.invoke(AfterReturningAdviceInterceptor.java:55)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:95)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:691)\n	at com.asset.module.support.quartz.controller.QuartzController$$EnhancerBySpringCGLIB$$73432d42.pauseTask(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:105)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:878)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:792)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1040)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:943)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:898)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:626)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:733)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.github.xiaoymin.knife4j.spring.filter.ProductionSecurityFilter.doFilter(ProductionSecurityFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.github.xiaoymin.knife4j.spring.filter.SecurityBasicAuthFilter.doFilter(SecurityBasicAuthFilter.java:90)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.boot.actuate.metrics.web.servlet.WebMvcMetricsFilter.doFilterInternal(WebMvcMetricsFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:143)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:690)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:374)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:868)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1590)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:748)\nCaused by: java.sql.SQLSyntaxErrorException: Table \'asset-admin-dev.qrtz_job_details\' doesn\'t exist\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:120)\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:97)\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:953)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeQuery(ClientPreparedStatement.java:1003)\n	at com.p6spy.engine.wrapper.PreparedStatementWrapper.executeQuery(PreparedStatementWrapper.java:78)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeQuery(FilterChainImpl.java:3240)\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_executeQuery(FilterEventAdapter.java:465)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeQuery(FilterChainImpl.java:3237)\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_executeQuery(FilterEventAdapter.java:465)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeQuery(FilterChainImpl.java:3237)\n	at com.alibaba.druid.proxy.jdbc.PreparedStatementProxyImpl.executeQuery(PreparedStatementProxyImpl.java:181)\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.executeQuery(DruidPooledPreparedStatement.java:227)\n	at org.quartz.impl.jdbcjobstore.StdJDBCDelegate.jobExists(StdJDBCDelegate.java:776)\n	at org.quartz.impl.jdbcjobstore.JobStoreSupport.checkExists(JobStoreSupport.java:1962)\n	... 103 more\n', '2021-02-08 11:55:35', '2021-02-08 11:55:35');
INSERT INTO `t_user_operate_log` VALUES (545, 1, '管理员', '管理端-任务调度', '暂停某个任务', '/smart-admin-api/quartz/task/pause/23', 'com.asset.module.support.quartz.controller.QuartzController.pauseTask', 'Long[23]', 0, 'org.quartz.impl.jdbcjobstore.LockException: Failure obtaining db row lock: Table \'asset-admin-dev.qrtz_locks\' doesn\'t exist [See nested exception: java.sql.SQLSyntaxErrorException: Table \'asset-admin-dev.qrtz_locks\' doesn\'t exist]\n	at org.quartz.impl.jdbcjobstore.StdRowLockSemaphore.executeSQL(StdRowLockSemaphore.java:184)\n	at org.quartz.impl.jdbcjobstore.DBSemaphore.obtainLock(DBSemaphore.java:113)\n	at org.quartz.impl.jdbcjobstore.JobStoreCMT.executeInLock(JobStoreCMT.java:238)\n	at org.quartz.impl.jdbcjobstore.JobStoreSupport.storeJobAndTrigger(JobStoreSupport.java:1063)\n	at org.quartz.core.QuartzScheduler.scheduleJob(QuartzScheduler.java:855)\n	at org.quartz.impl.StdScheduler.scheduleJob(StdScheduler.java:249)\n	at com.asset.module.support.quartz.service.QuartzTaskService.createQuartzTask(QuartzTaskService.java:240)\n	at com.asset.module.support.quartz.service.QuartzTaskService.pauseQuartzTask(QuartzTaskService.java:306)\n	at com.asset.module.support.quartz.service.QuartzTaskService.pauseTask(QuartzTaskService.java:173)\n	at com.asset.module.support.quartz.service.QuartzTaskService$$FastClassBySpringCGLIB$$41608eff.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:771)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:367)\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:118)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:73)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:691)\n	at com.asset.module.support.quartz.service.QuartzTaskService$$EnhancerBySpringCGLIB$$521ce79f.pauseTask(<generated>)\n	at com.asset.module.support.quartz.controller.QuartzController.pauseTask(QuartzController.java:67)\n	at com.asset.module.support.quartz.controller.QuartzController$$FastClassBySpringCGLIB$$d2b62a4c.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:771)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:62)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.adapter.AfterReturningAdviceInterceptor.invoke(AfterReturningAdviceInterceptor.java:55)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:95)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:691)\n	at com.asset.module.support.quartz.controller.QuartzController$$EnhancerBySpringCGLIB$$73432d42.pauseTask(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:105)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:878)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:792)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1040)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:943)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:898)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:626)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:733)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.github.xiaoymin.knife4j.spring.filter.ProductionSecurityFilter.doFilter(ProductionSecurityFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.github.xiaoymin.knife4j.spring.filter.SecurityBasicAuthFilter.doFilter(SecurityBasicAuthFilter.java:90)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.boot.actuate.metrics.web.servlet.WebMvcMetricsFilter.doFilterInternal(WebMvcMetricsFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:143)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:690)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:374)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:868)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1590)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:748)\nCaused by: java.sql.SQLSyntaxErrorException: Table \'asset-admin-dev.qrtz_locks\' doesn\'t exist\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:120)\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:97)\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:953)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeQuery(ClientPreparedStatement.java:1003)\n	at com.p6spy.engine.wrapper.PreparedStatementWrapper.executeQuery(PreparedStatementWrapper.java:78)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeQuery(FilterChainImpl.java:3240)\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_executeQuery(FilterEventAdapter.java:465)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeQuery(FilterChainImpl.java:3237)\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_executeQuery(FilterEventAdapter.java:465)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_executeQuery(FilterChainImpl.java:3237)\n	at com.alibaba.druid.proxy.jdbc.PreparedStatementProxyImpl.executeQuery(PreparedStatementProxyImpl.java:181)\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.executeQuery(DruidPooledPreparedStatement.java:227)\n	at org.quartz.impl.jdbcjobstore.StdRowLockSemaphore.executeSQL(StdRowLockSemaphore.java:123)\n	... 103 more\n', '2021-02-08 11:56:48', '2021-02-08 11:56:48');
INSERT INTO `t_user_operate_log` VALUES (546, 1, '管理员', '管理端-任务调度', '暂停某个任务', '/smart-admin-api/quartz/task/pause/23', 'com.asset.module.support.quartz.controller.QuartzController.pauseTask', 'Long[23]', 1, NULL, '2021-02-08 11:57:43', '2021-02-08 11:57:43');
INSERT INTO `t_user_operate_log` VALUES (547, 1, '管理员', '管理端-任务调度', '查询任务', '/smart-admin-api/quartz/task/query', 'com.asset.module.support.quartz.controller.QuartzController.query', 'QuartzQueryDTO[{\"pageNum\":1,\"pageSize\":10}]', 1, NULL, '2021-02-08 11:57:43', '2021-02-08 11:57:43');
INSERT INTO `t_user_operate_log` VALUES (548, 1, '管理员', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-08 12:05:39', '2021-02-08 12:05:39');
INSERT INTO `t_user_operate_log` VALUES (549, 1, '管理员', '管理端-任务调度', '查询任务', '/smart-admin-api/quartz/task/query', 'com.asset.module.support.quartz.controller.QuartzController.query', 'QuartzQueryDTO[{\"pageNum\":1,\"pageSize\":10}]', 1, NULL, '2021-02-08 12:05:40', '2021-02-08 12:05:40');
INSERT INTO `t_user_operate_log` VALUES (550, 1, '管理员', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-08 12:05:42', '2021-02-08 12:05:42');
INSERT INTO `t_user_operate_log` VALUES (551, 41, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-08 12:09:56', '2021-02-08 12:09:56');
INSERT INTO `t_user_operate_log` VALUES (552, 41, '张向宇', '管理端-用户登录', '获取session', '/smart-admin-api/session/get', 'com.asset.module.system.login.LoginController.getSession', '', 1, NULL, '2021-02-08 13:50:01', '2021-02-08 13:50:01');
INSERT INTO `t_user_operate_log` VALUES (553, 41, '张向宇', '管理端-用户登录', '退出登陆', '/smart-admin-api/session/logOut', 'com.asset.module.system.login.LoginController.logOut', '', 1, NULL, '2021-02-08 13:50:45', '2021-02-08 13:50:45');
INSERT INTO `t_user_operate_log` VALUES (554, 1, '管理员', '管理端-系统配置', '分页查询所有系统配置', '/smart-admin-api/systemConfig/getListPage', 'com.asset.module.system.systemconfig.SystemConfigController.getSystemConfigPage', 'SystemConfigQueryDTO[{\"key\":\"\",\"pageNum\":1,\"pageSize\":10}]', 1, NULL, '2021-02-08 13:51:02', '2021-02-08 13:51:02');
INSERT INTO `t_user_operate_log` VALUES (555, 1, '管理员', '通用-权限', '获取所有请求路径', '/smart-admin-api/privilege/getAllUrl', 'com.asset.module.system.privilege.controller.PrivilegeController.getAllUrl', '', 1, NULL, '2021-02-08 13:51:08', '2021-02-08 13:51:08');
INSERT INTO `t_user_operate_log` VALUES (556, 1, '管理员', '通用-权限', '查询所有菜单项', '/smart-admin-api/privilege/menu/queryAll', 'com.asset.module.system.privilege.controller.PrivilegeController.queryAll', '', 1, NULL, '2021-02-08 13:51:08', '2021-02-08 13:51:08');
INSERT INTO `t_user_operate_log` VALUES (557, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/PeonyList', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"PeonyList\"]', 1, NULL, '2021-02-08 13:51:21', '2021-02-08 13:51:21');
INSERT INTO `t_user_operate_log` VALUES (558, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/EmailList', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"EmailList\"]', 1, NULL, '2021-02-08 13:51:29', '2021-02-08 13:51:29');
INSERT INTO `t_user_operate_log` VALUES (559, 1, '管理员', '通用-权限', '查询菜单功能点', '/smart-admin-api/privilege/function/query/RoleManage', 'com.asset.module.system.privilege.controller.PrivilegeController.functionQuery', 'String[\"RoleManage\"]', 1, NULL, '2021-02-08 13:51:42', '2021-02-08 13:51:42');
INSERT INTO `t_user_operate_log` VALUES (560, 1, '管理员', '管理端-角色', '获取所有角色', '/smart-admin-api/role/getAll', 'com.asset.module.system.role.basic.RoleController.getAllRole', '', 1, NULL, '2021-02-08 13:54:03', '2021-02-08 13:54:03');
INSERT INTO `t_user_operate_log` VALUES (561, 1, '管理员', '管理端-部门', '查询部门及员工列表', '/smart-admin-api/department/listEmployee', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', '', 1, NULL, '2021-02-08 13:54:03', '2021-02-08 13:54:03');
INSERT INTO `t_user_operate_log` VALUES (562, 1, '管理员', '管理端-部门', '根据部门名称查询部门及员工列表', '/smart-admin-api/department/listEmployeeByDepartmentName', 'com.asset.module.system.department.DepartmentController.listDepartmentEmployee', 'String[\"\"]', 1, NULL, '2021-02-08 13:54:04', '2021-02-08 13:54:04');
INSERT INTO `t_user_operate_log` VALUES (563, 1, '管理员', '管理端-用户', '员工管理查询', '/smart-admin-api/employee/query', 'com.asset.module.system.employee.EmployeeController.query', 'EmployeeQueryDTO[{\"isDelete\":0,\"isDisabled\":0,\"keyword\":\"\",\"pageNum\":1,\"pageSize\":20}]', 1, NULL, '2021-02-08 13:54:04', '2021-02-08 13:54:04');
INSERT INTO `t_user_operate_log` VALUES (564, 1, '管理员', '管理端-岗位', '分页查询所有岗位', '/smart-admin-api/position/getListPage', 'com.asset.module.system.position.PositionController.getJobPage', 'PositionQueryDTO[{\"pageNum\":1,\"pageSize\":10,\"positionName\":\"\",\"searchCount\":true}]', 1, NULL, '2021-02-08 13:54:11', '2021-02-08 13:54:11');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
