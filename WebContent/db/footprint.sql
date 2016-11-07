/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50626
Source Host           : 127.0.0.1:3306
Source Database       : footprint

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2016-11-07 09:41:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for f_actionlog
-- ----------------------------
DROP TABLE IF EXISTS `f_actionlog`;
CREATE TABLE `f_actionlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ceatetime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '操作时间',
  `actionname` varchar(20) DEFAULT '' COMMENT '操作名称',
  `actor` varchar(50) DEFAULT '' COMMENT '操作人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of f_actionlog
-- ----------------------------

-- ----------------------------
-- Table structure for f_baby
-- ----------------------------
DROP TABLE IF EXISTS `f_baby`;
CREATE TABLE `f_baby` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bname` varchar(50) DEFAULT '' COMMENT '姓名',
  `gender` varchar(4) DEFAULT '' COMMENT '性别',
  `birth` date DEFAULT '0000-00-00' COMMENT '生日',
  `telephone` varchar(20) DEFAULT '' COMMENT '电话',
  `parent_id` varchar(50) DEFAULT '' COMMENT '家长ID',
  `parent_name` varchar(50) DEFAULT '' COMMENT '家长姓名',
  `nursery_id` int(11) DEFAULT '0' COMMENT '幼儿园ID',
  `b_c_id` int(11) DEFAULT '0' COMMENT '宝宝_班级对应ID',
  `createuser` varchar(50) DEFAULT '' COMMENT '创建人员',
  `ceatedate` date DEFAULT '0000-00-00' COMMENT '录入日期',
  `animalsign` varchar(4) DEFAULT '' COMMENT '属相',
  `nickname` varchar(50) DEFAULT '' COMMENT '乳名',
  `nurture` varchar(250) DEFAULT '' COMMENT '入园前抚育方式',
  `status` varchar(10) DEFAULT '' COMMENT '状态',
  `CREATEDATE` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='宝宝信息';

-- ----------------------------
-- Records of f_baby
-- ----------------------------

-- ----------------------------
-- Table structure for f_babyprofile
-- ----------------------------
DROP TABLE IF EXISTS `f_babyprofile`;
CREATE TABLE `f_babyprofile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `baby_id` int(11) DEFAULT '0' COMMENT '宝宝ID',
  `baby_name` varchar(20) DEFAULT '' COMMENT '宝宝姓名',
  `createyear` varchar(20) DEFAULT '' COMMENT '学年',
  `term` varchar(20) DEFAULT '' COMMENT '学期',
  `b_c_id` int(11) DEFAULT '0' COMMENT '班级ID',
  `grade` varchar(20) DEFAULT '' COMMENT '年级',
  `createdate` date DEFAULT '0000-00-00' COMMENT '创建时间',
  `allergenic` varchar(250) DEFAULT '' COMMENT '过敏反应',
  `congenital` varchar(250) DEFAULT '' COMMENT '疾病或先天病史',
  `health` varchar(250) DEFAULT '' COMMENT '现在身体状况',
  `favfood` varchar(250) DEFAULT '' COMMENT '喜欢的食物',
  `friend` varchar(250) DEFAULT '' COMMENT '喜欢的朋友',
  `liketodo` varchar(250) DEFAULT '' COMMENT '喜欢做的事',
  `personality` varchar(250) DEFAULT '' COMMENT '性格特点',
  `selfcare` varchar(250) DEFAULT '' COMMENT '自理能力',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of f_babyprofile
-- ----------------------------

-- ----------------------------
-- Table structure for f_baby_class
-- ----------------------------
DROP TABLE IF EXISTS `f_baby_class`;
CREATE TABLE `f_baby_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `baby_id` int(11) DEFAULT '0' COMMENT '宝宝ID',
  `class_id` int(11) DEFAULT '0' COMMENT '班级ID',
  `status` varchar(20) DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of f_baby_class
-- ----------------------------

-- ----------------------------
-- Table structure for f_class
-- ----------------------------
DROP TABLE IF EXISTS `f_class`;
CREATE TABLE `f_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cname` varchar(50) DEFAULT '' COMMENT '名称',
  `nursery_id` int(11) DEFAULT '0' COMMENT '幼儿园ID',
  `nursery_name` varchar(50) DEFAULT '' COMMENT '幼儿园名称',
  `ceatedate` date DEFAULT '2000-01-01' COMMENT '录入日期',
  `createyear` varchar(20) DEFAULT '' COMMENT '学年',
  `grade` varchar(5) DEFAULT '' COMMENT '年级',
  `term` varchar(5) DEFAULT '' COMMENT '学期',
  `cnum` varchar(5) DEFAULT '' COMMENT '班数',
  `teacher1id` varchar(50) DEFAULT '' COMMENT '老师1ID',
  `teacher2id` varchar(50) DEFAULT '' COMMENT '老师2ID',
  `teacher3id` varchar(50) DEFAULT '' COMMENT '老师3ID',
  `teacher1name` varchar(50) DEFAULT '' COMMENT '老师1姓名',
  `teacher2name` varchar(50) DEFAULT '' COMMENT '老师2姓名',
  `teacher3name` varchar(50) DEFAULT '' COMMENT '老师3姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='班级';

-- ----------------------------
-- Records of f_class
-- ----------------------------

-- ----------------------------
-- Table structure for f_comment_p_m
-- ----------------------------
DROP TABLE IF EXISTS `f_comment_p_m`;
CREATE TABLE `f_comment_p_m` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createyear` varchar(20) DEFAULT '' COMMENT '学年',
  `term` varchar(20) DEFAULT '' COMMENT '学期',
  `class_id` int(11) DEFAULT '0' COMMENT '班级ID',
  `createmonth` varchar(50) DEFAULT '' COMMENT '月份',
  `grade` varchar(20) DEFAULT '' COMMENT '年级',
  `createdate` date DEFAULT '0000-00-00' COMMENT '录入日期',
  `baby_id` int(11) DEFAULT '0' COMMENT '宝宝ID',
  `baby_name` varchar(50) DEFAULT '' COMMENT '宝宝姓名',
  `nursery_id` int(11) DEFAULT '0' COMMENT '幼儿园ID',
  `parent_id` varchar(50) DEFAULT '' COMMENT '家长ID',
  `parent_name` varchar(50) DEFAULT '' COMMENT '家长姓名',
  `behavior` varchar(250) DEFAULT '' COMMENT '表现',
  `suggestion` varchar(250) DEFAULT '' COMMENT '建议',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='在家每月总结';

-- ----------------------------
-- Records of f_comment_p_m
-- ----------------------------

-- ----------------------------
-- Table structure for f_comment_p_t
-- ----------------------------
DROP TABLE IF EXISTS `f_comment_p_t`;
CREATE TABLE `f_comment_p_t` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createyear` char(4) DEFAULT '' COMMENT '创建年度',
  `createdate` date DEFAULT '0000-00-00' COMMENT '录入日期',
  `baby_id` int(11) DEFAULT '0' COMMENT '宝宝ID',
  `baby_name` varchar(50) DEFAULT '' COMMENT '宝宝姓名',
  `nursery_id` int(11) DEFAULT '0' COMMENT '幼儿园ID',
  `class_id` int(11) DEFAULT '0' COMMENT '班级ID',
  `parent_id` varchar(50) DEFAULT '' COMMENT '家长ID',
  `parent_name` varchar(50) DEFAULT '' COMMENT '家长姓名',
  `grade` varchar(20) DEFAULT '' COMMENT '年级',
  `term` varchar(20) DEFAULT '' COMMENT '学期',
  `sparkle` varchar(250) DEFAULT '' COMMENT '闪光点',
  `progress` varchar(250) DEFAULT '' COMMENT '进步',
  `guidance` varchar(250) DEFAULT '' COMMENT '需指导',
  `hope` varchar(250) DEFAULT '' COMMENT '鼓励',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='在家学期总结';

-- ----------------------------
-- Records of f_comment_p_t
-- ----------------------------

-- ----------------------------
-- Table structure for f_comment_t_m
-- ----------------------------
DROP TABLE IF EXISTS `f_comment_t_m`;
CREATE TABLE `f_comment_t_m` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createyear` varchar(20) DEFAULT '' COMMENT '学年',
  `term` varchar(20) DEFAULT '' COMMENT '学期',
  `class_id` int(11) DEFAULT '0' COMMENT '班级ID',
  `createmonth` varchar(50) DEFAULT '' COMMENT '月份',
  `grade` varchar(20) DEFAULT '' COMMENT '年级',
  `createdate` date DEFAULT '2000-01-01' COMMENT '录入日期',
  `baby_id` int(11) DEFAULT '0' COMMENT '宝宝ID',
  `baby_name` varchar(50) DEFAULT '' COMMENT '宝宝姓名',
  `nursery_id` int(11) DEFAULT '0' COMMENT '幼儿园ID',
  `teacher_id` varchar(50) DEFAULT '' COMMENT '老师ID',
  `teacher_name` varchar(50) DEFAULT '' COMMENT '老师姓名',
  `behavior` varchar(250) DEFAULT '' COMMENT '表现',
  `suggestion` varchar(250) DEFAULT '' COMMENT '建议',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='在园每月评价';

-- ----------------------------
-- Records of f_comment_t_m
-- ----------------------------

-- ----------------------------
-- Table structure for f_comment_t_t
-- ----------------------------
DROP TABLE IF EXISTS `f_comment_t_t`;
CREATE TABLE `f_comment_t_t` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createyear` varchar(20) DEFAULT '' COMMENT '学年',
  `term` varchar(20) DEFAULT '' COMMENT '学期',
  `class_id` int(11) DEFAULT '0' COMMENT '班级ID',
  `grade` varchar(20) DEFAULT '' COMMENT '年级',
  `createdate` date DEFAULT '0000-00-00' COMMENT '录入日期',
  `baby_id` int(11) DEFAULT '0' COMMENT '宝宝ID',
  `baby_name` varchar(50) DEFAULT '' COMMENT '宝宝姓名',
  `nursery_id` int(11) DEFAULT '0' COMMENT '幼儿园ID',
  `teacher_id` varchar(50) DEFAULT '' COMMENT '老师ID',
  `teacher_name` varchar(50) DEFAULT '' COMMENT '老师姓名',
  `sparkle` varchar(250) DEFAULT '' COMMENT '闪光点',
  `progress` varchar(250) DEFAULT '' COMMENT '进步',
  `guidance` varchar(250) DEFAULT '' COMMENT '需指导',
  `factors` varchar(250) DEFAULT '' COMMENT '影响因素',
  `plan` varchar(250) DEFAULT '' COMMENT '指导计划',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='在园学期总结';

-- ----------------------------
-- Records of f_comment_t_t
-- ----------------------------

-- ----------------------------
-- Table structure for f_function
-- ----------------------------
DROP TABLE IF EXISTS `f_function`;
CREATE TABLE `f_function` (
  `code` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编码',
  `descript` varchar(50) DEFAULT '' COMMENT '描述',
  `displayorder` int(11) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(250) DEFAULT '' COMMENT '链接',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='功能菜单';

-- ----------------------------
-- Records of f_function
-- ----------------------------

-- ----------------------------
-- Table structure for f_grade
-- ----------------------------
DROP TABLE IF EXISTS `f_grade`;
CREATE TABLE `f_grade` (
  `code` int(10) unsigned NOT NULL COMMENT '编码',
  `gname` varchar(20) DEFAULT '' COMMENT '名称',
  `displayorder` int(11) DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='年级';

-- ----------------------------
-- Records of f_grade
-- ----------------------------

-- ----------------------------
-- Table structure for f_health
-- ----------------------------
DROP TABLE IF EXISTS `f_health`;
CREATE TABLE `f_health` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createyear` varchar(20) DEFAULT '' COMMENT '学年',
  `term` varchar(20) DEFAULT '' COMMENT '学期',
  `class_id` int(11) DEFAULT '0' COMMENT '班级ID',
  `createdate` date DEFAULT '0000-00-00' COMMENT '录入日期',
  `grade` varchar(20) DEFAULT '' COMMENT '年级',
  `baby_id` int(11) DEFAULT '0' COMMENT '宝宝ID',
  `baby_name` varchar(50) DEFAULT '' COMMENT '宝宝姓名',
  `nursery_id` int(11) DEFAULT '0' COMMENT '幼儿园ID',
  `teacher_id` varchar(50) DEFAULT '' COMMENT '医生ID',
  `teacher_name` varchar(50) DEFAULT '' COMMENT '医生姓名',
  `height` varchar(50) DEFAULT '' COMMENT '身高',
  `weight` varchar(50) DEFAULT '' COMMENT '体重',
  `HB` varchar(50) DEFAULT '' COMMENT '血色素',
  `allcaries` varchar(50) DEFAULT '' COMMENT '总共龋齿',
  `newcaries` varchar(50) DEFAULT '' COMMENT '新增龋齿',
  `lefteyesight` varchar(50) DEFAULT '' COMMENT '左眼视力',
  `righteyesight` varchar(50) DEFAULT '' COMMENT '右眼视力',
  `mark` varchar(250) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='健康评价';

-- ----------------------------
-- Records of f_health
-- ----------------------------

-- ----------------------------
-- Table structure for f_item
-- ----------------------------
DROP TABLE IF EXISTS `f_item`;
CREATE TABLE `f_item` (
  `code` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编码',
  `descript` varchar(200) DEFAULT '' COMMENT '描述',
  `belongto` int(11) DEFAULT '0' COMMENT '类型',
  `level` int(11) DEFAULT '0' COMMENT '级别',
  `scorestyle` int(11) DEFAULT '0' COMMENT '评分样式',
  `grade` varchar(20) DEFAULT '' COMMENT '年级',
  `term` varchar(20) DEFAULT '' COMMENT '学期',
  `displayorder` int(11) DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='评测项目';

-- ----------------------------
-- Records of f_item
-- ----------------------------

-- ----------------------------
-- Table structure for f_item_score
-- ----------------------------
DROP TABLE IF EXISTS `f_item_score`;
CREATE TABLE `f_item_score` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createyear` varchar(20) DEFAULT '' COMMENT '学年',
  `term` varchar(20) DEFAULT '' COMMENT '学期',
  `class_id` int(11) DEFAULT '0' COMMENT '班级ID',
  `grade` varchar(20) DEFAULT '' COMMENT '年级',
  `stage` varchar(20) DEFAULT '' COMMENT '阶段',
  `item_code` int(11) DEFAULT '0' COMMENT '项目编码',
  `score` int(11) DEFAULT '0' COMMENT '评分',
  `baby_id` int(11) DEFAULT '0' COMMENT '宝宝ID',
  `baby_name` varchar(50) DEFAULT '' COMMENT '宝宝姓名',
  `createdate` date DEFAULT '2000-01-01' COMMENT '录入日期',
  `nursery_id` int(11) DEFAULT '0' COMMENT '幼儿园ID',
  `teacher_id` varchar(50) DEFAULT '' COMMENT '老师ID',
  `teacher_name` varchar(50) DEFAULT '' COMMENT '老师姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='评测记录';

-- ----------------------------
-- Records of f_item_score
-- ----------------------------

-- ----------------------------
-- Table structure for f_menu
-- ----------------------------
DROP TABLE IF EXISTS `f_menu`;
CREATE TABLE `f_menu` (
  `id` varchar(10) NOT NULL COMMENT 'ID',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `fname` varchar(50) DEFAULT '' COMMENT '名称',
  `seq` int(11) DEFAULT '0' COMMENT '编号',
  `furl` varchar(200) DEFAULT '' COMMENT 'url',
  `belongto` varchar(10) DEFAULT '' COMMENT '上级',
  `roleids` varchar(20) DEFAULT '' COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of f_menu
-- ----------------------------
INSERT INTO `f_menu` VALUES ('0', '', 'Home', '1', '', '', '');
INSERT INTO `f_menu` VALUES ('m1', '', '新学期啦', '1', '', '0', '1');
INSERT INTO `f_menu` VALUES ('m10', '', '在园每月评价', '10', '', '0', '2');
INSERT INTO `f_menu` VALUES ('m11', '', '在园学期总结', '11', '', '0', '2');
INSERT INTO `f_menu` VALUES ('m12', '', '家长观察总结', '12', '', '0', '2');
INSERT INTO `f_menu` VALUES ('m13', '', '发送家长通知', '13', '', '0', '2');
INSERT INTO `f_menu` VALUES ('m14', '', '信息统计查询', '14', '', '0', '2');
INSERT INTO `f_menu` VALUES ('m15', '', '修改个人信息', '15', '', '0', '2');
INSERT INTO `f_menu` VALUES ('m16', '', '打印成长手册', '16', '', '0', '2');
INSERT INTO `f_menu` VALUES ('m17', '', '宝宝成长评价', '17', '', '0', '3');
INSERT INTO `f_menu` VALUES ('m18', '', '在园每月总结', '18', '', '0', '3');
INSERT INTO `f_menu` VALUES ('m19', '', '在园学期总结', '19', '', '0', '3');
INSERT INTO `f_menu` VALUES ('m2', '', '班级管理', '2', '', '0', '1');
INSERT INTO `f_menu` VALUES ('m20', '', '宝宝档案资料', '20', '', '0', '3');
INSERT INTO `f_menu` VALUES ('m21', '', '在家每月总结', '21', '', '0', '3');
INSERT INTO `f_menu` VALUES ('m22', '', '在家学期总结', '22', '', '0', '3');
INSERT INTO `f_menu` VALUES ('m23', '', '修改登录密码', '23', '', '0', '3');
INSERT INTO `f_menu` VALUES ('m24', '', '生长发育评价', '24', '', '0', '4');
INSERT INTO `f_menu` VALUES ('m25', '', '修改信息', '25', '', '0', '4');
INSERT INTO `f_menu` VALUES ('m3', '', '离园调班', '3', '', '0', '1');
INSERT INTO `f_menu` VALUES ('m4', '', '评价模板', '4', '', '0', '1');
INSERT INTO `f_menu` VALUES ('m5', '', '配置老师', '5', '', '0', '1');
INSERT INTO `f_menu` VALUES ('m6', '', '基本信息', '6', '', '0', '1');
INSERT INTO `f_menu` VALUES ('m7', '', '宝宝入园登记', '7', '', '0', '2');
INSERT INTO `f_menu` VALUES ('m8', '', '修改宝宝信息', '8', '', '0', '2');
INSERT INTO `f_menu` VALUES ('m9', '', '全班成长评价', '9', '', '0', '2');

-- ----------------------------
-- Table structure for f_movelog
-- ----------------------------
DROP TABLE IF EXISTS `f_movelog`;
CREATE TABLE `f_movelog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `movetime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '调班时间',
  `actor` varchar(50) DEFAULT '' COMMENT '操作人',
  `previous` int(11) DEFAULT '0' COMMENT '之前班级ID',
  `after` int(11) DEFAULT '0' COMMENT '调后班级ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of f_movelog
-- ----------------------------

-- ----------------------------
-- Table structure for f_notes
-- ----------------------------
DROP TABLE IF EXISTS `f_notes`;
CREATE TABLE `f_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createdate` date DEFAULT '0000-00-00' COMMENT '录入日期',
  `nursery_id` int(11) DEFAULT '0' COMMENT '幼儿园ID',
  `class_id` int(11) DEFAULT '0' COMMENT '班级ID',
  `teacher_id` varchar(50) DEFAULT '' COMMENT '老师ID',
  `teacher_name` varchar(50) DEFAULT '' COMMENT '老师姓名',
  `parent_id` varchar(50) DEFAULT '' COMMENT '家长ID',
  `parent_name` varchar(50) DEFAULT '' COMMENT '家长姓名',
  `content` varchar(250) DEFAULT '' COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通知';

-- ----------------------------
-- Records of f_notes
-- ----------------------------

-- ----------------------------
-- Table structure for f_nursery
-- ----------------------------
DROP TABLE IF EXISTS `f_nursery`;
CREATE TABLE `f_nursery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `nname` varchar(50) DEFAULT '' COMMENT '名称',
  `headname` varchar(50) DEFAULT '' COMMENT '园长姓名',
  `level` varchar(50) DEFAULT '' COMMENT '等级',
  `nurserycode` varchar(20) DEFAULT '' COMMENT '幼儿园编码',
  `address` varchar(250) DEFAULT '' COMMENT '地址',
  `admincode` varchar(20) DEFAULT '' COMMENT '行政区划代码',
  `province` varchar(50) DEFAULT '' COMMENT '省',
  `city` varchar(50) DEFAULT '' COMMENT '市',
  `county` varchar(50) DEFAULT '' COMMENT '县',
  `telephone` varchar(20) DEFAULT '' COMMENT '联系电话',
  `nature` varchar(50) DEFAULT '' COMMENT '性质',
  `ceatedate` date DEFAULT '2000-01-01' COMMENT '录入日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幼儿园信息';

-- ----------------------------
-- Records of f_nursery
-- ----------------------------

-- ----------------------------
-- Table structure for f_nursery_level
-- ----------------------------
DROP TABLE IF EXISTS `f_nursery_level`;
CREATE TABLE `f_nursery_level` (
  `code` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编码',
  `descript` varchar(50) DEFAULT '' COMMENT '描述',
  `displayorder` int(11) DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幼儿园级别';

-- ----------------------------
-- Records of f_nursery_level
-- ----------------------------

-- ----------------------------
-- Table structure for f_nursery_nature
-- ----------------------------
DROP TABLE IF EXISTS `f_nursery_nature`;
CREATE TABLE `f_nursery_nature` (
  `code` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编码',
  `descript` varchar(50) DEFAULT '' COMMENT '描述',
  `displayorder` int(11) DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幼儿园性质';

-- ----------------------------
-- Records of f_nursery_nature
-- ----------------------------

-- ----------------------------
-- Table structure for f_p_item
-- ----------------------------
DROP TABLE IF EXISTS `f_p_item`;
CREATE TABLE `f_p_item` (
  `code` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编码',
  `descript` varchar(250) DEFAULT '' COMMENT '描述',
  `grade` varchar(20) DEFAULT '' COMMENT '年级',
  `term` varchar(20) DEFAULT '' COMMENT '学期',
  `month` char(2) DEFAULT '' COMMENT '月份',
  `displayorder` int(11) DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='在家观察项目';

-- ----------------------------
-- Records of f_p_item
-- ----------------------------

-- ----------------------------
-- Table structure for f_p_item_score
-- ----------------------------
DROP TABLE IF EXISTS `f_p_item_score`;
CREATE TABLE `f_p_item_score` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createyear` varchar(20) DEFAULT '' COMMENT '学年',
  `term` varchar(20) DEFAULT '' COMMENT '学期',
  `class_id` int(11) DEFAULT '0' COMMENT '班级ID',
  `month` char(2) DEFAULT '' COMMENT '月份',
  `grade` varchar(20) DEFAULT '' COMMENT '年级',
  `createdate` date DEFAULT '0000-00-00' COMMENT '录入日期',
  `item_code` int(11) DEFAULT '0' COMMENT '项目编码',
  `score` int(11) DEFAULT '0' COMMENT '评分',
  `baby_id` int(11) DEFAULT '0' COMMENT '宝宝ID',
  `baby_name` varchar(50) DEFAULT '' COMMENT '宝宝姓名',
  `nursery_id` int(11) DEFAULT '0' COMMENT '幼儿园ID',
  `parent_id` varchar(50) DEFAULT '' COMMENT '家长ID',
  `parent_name` varchar(50) DEFAULT '' COMMENT '家长姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='在家观察评分';

-- ----------------------------
-- Records of f_p_item_score
-- ----------------------------

-- ----------------------------
-- Table structure for f_role
-- ----------------------------
DROP TABLE IF EXISTS `f_role`;
CREATE TABLE `f_role` (
  `code` int(10) unsigned NOT NULL COMMENT '编码',
  `rolename` varchar(20) DEFAULT '' COMMENT '名称',
  `displayorder` int(11) DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色（幼儿园管理员、老师、家长、保健医生、教委）';

-- ----------------------------
-- Records of f_role
-- ----------------------------

-- ----------------------------
-- Table structure for f_r_f
-- ----------------------------
DROP TABLE IF EXISTS `f_r_f`;
CREATE TABLE `f_r_f` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_id` int(11) DEFAULT '0' COMMENT '角色ID',
  `f_code` int(11) DEFAULT '0' COMMENT '功能编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色-功能';

-- ----------------------------
-- Records of f_r_f
-- ----------------------------

-- ----------------------------
-- Table structure for f_stage
-- ----------------------------
DROP TABLE IF EXISTS `f_stage`;
CREATE TABLE `f_stage` (
  `code` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编码',
  `descript` varchar(50) DEFAULT '' COMMENT '描述',
  `displayorder` int(11) DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='阶段（评测学期中的阶段）';

-- ----------------------------
-- Records of f_stage
-- ----------------------------

-- ----------------------------
-- Table structure for f_templete
-- ----------------------------
DROP TABLE IF EXISTS `f_templete`;
CREATE TABLE `f_templete` (
  `code` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编码',
  `descript` varchar(250) DEFAULT '' COMMENT '描述',
  `type` varchar(50) DEFAULT '' COMMENT '类型',
  `displayorder` int(11) DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='模板';

-- ----------------------------
-- Records of f_templete
-- ----------------------------

-- ----------------------------
-- Table structure for f_term
-- ----------------------------
DROP TABLE IF EXISTS `f_term`;
CREATE TABLE `f_term` (
  `code` int(10) unsigned NOT NULL COMMENT '编码',
  `tname` varchar(20) DEFAULT '' COMMENT '名称',
  `displayorder` int(11) DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学期';

-- ----------------------------
-- Records of f_term
-- ----------------------------

-- ----------------------------
-- Table structure for f_user
-- ----------------------------
DROP TABLE IF EXISTS `f_user`;
CREATE TABLE `f_user` (
  `id` varchar(50) NOT NULL COMMENT 'ID',
  `username` varchar(50) DEFAULT '' COMMENT '姓名',
  `gender` varchar(4) DEFAULT '' COMMENT '性别',
  `roleid` int(11) DEFAULT '0' COMMENT '角色ID',
  `password` varchar(300) DEFAULT '' COMMENT '密码',
  `telephone` varchar(20) DEFAULT '' COMMENT '电话',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机',
  `email` varchar(100) DEFAULT '' COMMENT 'email',
  `ceatedate` date DEFAULT '2000-01-01' COMMENT '录入日期',
  `nursery_id` int(11) DEFAULT '0' COMMENT '幼儿园ID',
  `status` varchar(10) DEFAULT '' COMMENT '状态',
  `sessioncode` varchar(300) DEFAULT '' COMMENT 'session代码',
  `isadmin` varchar(4) DEFAULT '' COMMENT '是否管理员',
  `CREATEDATE` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户';

-- ----------------------------
-- Records of f_user
-- ----------------------------
INSERT INTO `f_user` VALUES ('111', 'test01', '', '1', '698d51a19d8a121ce581499d7b701668', '', '', '', '2000-01-01', '0', '', '', '', null);
INSERT INTO `f_user` VALUES ('112', 'test02', '', '2', '698d51a19d8a121ce581499d7b701668', '', '', '', '2000-01-01', '0', '', '', '', null);
INSERT INTO `f_user` VALUES ('113', 'test03', '', '3', '698d51a19d8a121ce581499d7b701668', '', '', '', '2000-01-01', '0', '', '', '', null);
INSERT INTO `f_user` VALUES ('114', 'test04', '', '4', '698d51a19d8a121ce581499d7b701668', '', '', '', '2000-01-01', '0', '', '', '', null);
