-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.26 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 footprint 的数据库结构
CREATE DATABASE IF NOT EXISTS `footprint` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `footprint`;


-- 导出  表 footprint.f_actionlog 结构
CREATE TABLE IF NOT EXISTS `f_actionlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createtime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '操作时间',
  `actionname` varchar(20) DEFAULT '' COMMENT '操作名称',
  `actor` varchar(50) DEFAULT '' COMMENT '操作人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  footprint.f_actionlog 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `f_actionlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_actionlog` ENABLE KEYS */;


-- 导出  表 footprint.f_baby 结构
CREATE TABLE IF NOT EXISTS `f_baby` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bname` varchar(50) DEFAULT '' COMMENT '姓名',
  `namespell` varchar(64) DEFAULT NULL COMMENT '名字拼音',
  `gender` varchar(4) DEFAULT '' COMMENT '性别',
  `birth` date DEFAULT '0000-00-00' COMMENT '生日',
  `telephone` varchar(20) DEFAULT '' COMMENT '电话',
  `parent_id` varchar(50) DEFAULT '' COMMENT '家长ID',
  `parent_name` varchar(50) DEFAULT '' COMMENT '家长姓名',
  `nursery_id` int(11) DEFAULT '0' COMMENT '幼儿园ID',
  `createuser` varchar(50) DEFAULT '' COMMENT '创建人员',
  `createdate` date DEFAULT '0000-00-00' COMMENT '录入日期',
  `animalsign` varchar(4) DEFAULT '' COMMENT '属相',
  `nickname` varchar(50) DEFAULT '' COMMENT '乳名',
  `nurture` varchar(250) DEFAULT '' COMMENT '入园前抚育方式',
  `status` varchar(10) DEFAULT '' COMMENT '状态',
  `BANESPELL` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `namespell` (`namespell`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='宝宝信息';

-- 正在导出表  footprint.f_baby 的数据：~18 rows (大约)
/*!40000 ALTER TABLE `f_baby` DISABLE KEYS */;
INSERT INTO `f_baby` (`id`, `bname`, `namespell`, `gender`, `birth`, `telephone`, `parent_id`, `parent_name`, `nursery_id`, `createuser`, `createdate`, `animalsign`, `nickname`, `nurture`, `status`, `BANESPELL`) VALUES
	(1, '张小云', 'zhangxiaoyun', '男', '0000-00-00', '1892342323', '', '', 0, '', '0000-00-00', '', '', '', 'Y', NULL),
	(2, '李白', 'libai', '男', '0000-00-00', '1892342323', '', '', 0, '', '0000-00-00', '', '', '', 'Y', NULL),
	(3, '晓东', NULL, '男', '0000-00-00', '1892342323', '', '', 0, '', '0000-00-00', '', '', '', 'Y', NULL),
	(4, '李西', 'libai003', '女', '0000-00-00', '1892342323', '', '', 0, '', '0000-00-00', '', '', '', 'Y', NULL),
	(5, '立白', 'libai001', '男', '0000-00-00', '1892342323', '', '', 0, '', '0000-00-00', '', '', '', 'Y', NULL),
	(6, '晓东2', NULL, '男', '0000-00-00', '1892342323', '', '', 0, '', '0000-00-00', '', '', '', 'Y', NULL),
	(7, '赵明', NULL, '男', '0000-00-00', '1892342323', '', '', 0, '', '0000-00-00', '', '', '', 'Y', NULL),
	(8, '晓东3', NULL, '男', '0000-00-00', '1892342323', '', '', 0, '', '0000-00-00', '', '', '', 'Y', NULL),
	(9, '张旭', NULL, '男', '0000-00-00', '1892342323', '', '', 0, '', '0000-00-00', '', '', '', 'Y', NULL),
	(10, '晓东4', NULL, '男', '0000-00-00', '1892342323', '', '', 0, '', '0000-00-00', '', '', '', 'Y', NULL),
	(11, '晓东5', NULL, '男', '0000-00-00', '1892342323', '', '', 0, '', '0000-00-00', '', '', '', 'Y', NULL),
	(12, '宋毅', NULL, '男', '0000-00-00', '1892342323', '', '', 0, '', '0000-00-00', '', '', '', 'Y', NULL),
	(13, '周杰伦', 'ZhouJieLun', '男', NULL, '1333333333', 'ZhouJieLun', NULL, 0, '112', '2016-12-14', NULL, NULL, NULL, 'N', NULL),
	(14, '李四', 'LiSi', '男', NULL, '1333333333', 'LiSi', NULL, 0, '112', '2016-12-14', NULL, NULL, NULL, 'N', NULL),
	(15, '李四', 'LiSi001', '男', NULL, '1333333333', 'LiSi001', NULL, 0, '112', '2016-12-14', NULL, NULL, NULL, 'N', NULL),
	(16, '李四', 'LiSi002', '男', NULL, '1333333333', 'LiSi002', NULL, 0, '112', '2016-12-14', NULL, NULL, NULL, 'N', NULL),
	(17, '李四', 'LiSi003', NULL, NULL, '456732', 'LiSi003', NULL, 0, '112', '2016-12-14', NULL, NULL, NULL, 'N', NULL),
	(18, '李四', 'LiSi004', '男', '2016-12-13', '12345345', 'LiSi004', NULL, 0, '112', '2016-12-14', NULL, NULL, NULL, 'N', NULL);
/*!40000 ALTER TABLE `f_baby` ENABLE KEYS */;


-- 导出  表 footprint.f_babyprofile 结构
CREATE TABLE IF NOT EXISTS `f_babyprofile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `baby_id` int(11) DEFAULT '0' COMMENT '宝宝ID',
  `baby_name` varchar(20) DEFAULT '' COMMENT '宝宝姓名',
  `createyear` varchar(20) DEFAULT '' COMMENT '学年',
  `term` varchar(20) DEFAULT '' COMMENT '学期',
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

-- 正在导出表  footprint.f_babyprofile 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `f_babyprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_babyprofile` ENABLE KEYS */;


-- 导出  表 footprint.f_baby_class 结构
CREATE TABLE IF NOT EXISTS `f_baby_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `baby_id` int(11) DEFAULT '0' COMMENT '宝宝ID',
  `class_id` int(11) DEFAULT '0' COMMENT '班级ID',
  `status` varchar(20) DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  footprint.f_baby_class 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `f_baby_class` DISABLE KEYS */;
INSERT INTO `f_baby_class` (`id`, `baby_id`, `class_id`, `status`) VALUES
	(1, 1, 2, 'N'),
	(2, 2, 2, 'N'),
	(3, 3, 2, 'N');
/*!40000 ALTER TABLE `f_baby_class` ENABLE KEYS */;


-- 导出  表 footprint.f_class 结构
CREATE TABLE IF NOT EXISTS `f_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cname` varchar(50) DEFAULT '' COMMENT '名称',
  `nursery_id` int(11) DEFAULT '0' COMMENT '幼儿园ID',
  `nursery_name` varchar(50) DEFAULT '' COMMENT '幼儿园名称',
  `createdate` date DEFAULT '2000-01-01' COMMENT '录入日期',
  `createyear` varchar(20) DEFAULT '' COMMENT '学年',
  `grade` varchar(20) DEFAULT '' COMMENT '年级',
  `term` varchar(20) DEFAULT '' COMMENT '学期',
  `cnum` varchar(5) DEFAULT '' COMMENT '班数',
  `teacher1id` varchar(50) DEFAULT '' COMMENT '老师1ID',
  `teacher2id` varchar(50) DEFAULT '' COMMENT '老师2ID',
  `teacher3id` varchar(50) DEFAULT '' COMMENT '老师3ID',
  `teacher1name` varchar(50) DEFAULT '' COMMENT '老师1姓名',
  `teacher2name` varchar(50) DEFAULT '' COMMENT '老师2姓名',
  `teacher3name` varchar(50) DEFAULT '' COMMENT '老师3姓名',
  `previous_id` int(10) DEFAULT NULL COMMENT '上学期班级编号',
  `status` varchar(10) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1294 DEFAULT CHARSET=utf8mb4 COMMENT='班级';

-- 正在导出表  footprint.f_class 的数据：~23 rows (大约)
/*!40000 ALTER TABLE `f_class` DISABLE KEYS */;
INSERT INTO `f_class` (`id`, `cname`, `nursery_id`, `nursery_name`, `createdate`, `createyear`, `grade`, `term`, `cnum`, `teacher1id`, `teacher2id`, `teacher3id`, `teacher1name`, `teacher2name`, `teacher3name`, `previous_id`, `status`) VALUES
	(1, '向日葵（1）班', 0, 'cname', '2016-12-05', '2016', '大', '上学期', '1', '116', '118', '119', '张三', '张三', '十三', NULL, 'N'),
	(2, '大（1）班', 0, 'cname', '2016-12-05', '2016', '大', '上学期', '1', '116', '118', '119', '张三', '张三', '十三', NULL, 'Y'),
	(1273, '大（1）班', 0, '向日葵幼儿园', '2016-12-08', '2016', '大', '上学期', '1', '', '', '', '', '', '', NULL, 'N'),
	(1274, '大（1）班', 0, '向日葵幼儿园', '2016-12-08', '2016', '大', '上学期', '1', '', '', '', '', '', '', NULL, 'Y'),
	(1275, '大（2）班', 0, '向日葵幼儿园', '2016-12-08', '2016', '大', '上学期', '2', '', '', '', '', '', '', NULL, 'Y'),
	(1276, '小（1）班', 0, '向日葵幼儿园', '2016-12-08', '2016', '小', '上学期', '1', '', '', '', '', '', '', NULL, 'Y'),
	(1277, '大（3）班', 0, '向日葵幼儿园', '2016-12-08', '2016', '大', '上学期', '3', '', '', '', '', '', '', NULL, 'Y'),
	(1278, '大（4）班', 0, '向日葵幼儿园', '2016-12-08', '2016', '大', '上学期', '4', '20', '22', '28', '李利里', '122', '我是谁', NULL, 'Y'),
	(1279, '大（5）班', 0, '向日葵幼儿园', '2016-12-08', '2016', '大', '上学期', '5', '15', '19', '21', '2222', '2223', '李利', NULL, 'Y'),
	(1280, '大（6）班', 0, '向日葵幼儿园', '2016-12-08', '2016', '大', '上学期', '6', '24', '27', '29', '117', '111', '新增人员', NULL, 'Y'),
	(1281, '大（7）班', 0, '向日葵幼儿园', '2016-12-08', '2016', '大', '上学期', '7', '10', '13', '11', '333', '222', '张四111', NULL, 'Y'),
	(1282, '中（1）班', 0, '向日葵幼儿园', '2016-12-08', '2016', '中', '上学期', '1', '12', '30', '31', '111', '测试人员', 'tttttttttttttttt', NULL, 'Y'),
	(1283, '小（2）班', 0, '向日葵幼儿园', '2016-12-08', '2016', '小', '上学期', '2', '35', '33', '32', 'my', '234', '我是我', NULL, 'Y'),
	(1284, '大（8）班', 0, '', '2016-12-09', '2016', '大', '上学期', '8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1'),
	(1285, '大（9）班', 0, '', '2016-12-09', '2016', '大', '上学期', '9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1'),
	(1286, '中（2）班', 0, '', '2016-12-09', '2016', '中', '上学期', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1'),
	(1287, '中（3）班', 0, '', '2016-12-09', '2016', '中', '上学期', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1'),
	(1288, '中（4）班', 0, '', '2016-12-09', '2016', '中', '上学期', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1'),
	(1289, '小（3）班', 0, '', '2016-12-09', '2016', '小', '上学期', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1'),
	(1290, '小（4）班', 0, '', '2016-12-09', '2016', '小', '上学期', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1'),
	(1291, '小（5）班', 0, '', '2016-12-09', '2016', '小', '上学期', '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1'),
	(1292, '小（6）班', 0, '', '2016-12-09', '2016', '小', '上学期', '6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1'),
	(1293, '大（8）班', 0, '', '2016-12-10', '2016', '大', '上学期', '8', '30', '31', '', '测试人员', 'tttttttttttttttt', '', NULL, 'Y');
/*!40000 ALTER TABLE `f_class` ENABLE KEYS */;


-- 导出  表 footprint.f_comment_p_m 结构
CREATE TABLE IF NOT EXISTS `f_comment_p_m` (
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

-- 正在导出表  footprint.f_comment_p_m 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `f_comment_p_m` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_comment_p_m` ENABLE KEYS */;


-- 导出  表 footprint.f_comment_p_t 结构
CREATE TABLE IF NOT EXISTS `f_comment_p_t` (
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

-- 正在导出表  footprint.f_comment_p_t 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `f_comment_p_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_comment_p_t` ENABLE KEYS */;


-- 导出  表 footprint.f_comment_t_m 结构
CREATE TABLE IF NOT EXISTS `f_comment_t_m` (
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

-- 正在导出表  footprint.f_comment_t_m 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `f_comment_t_m` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_comment_t_m` ENABLE KEYS */;


-- 导出  表 footprint.f_comment_t_t 结构
CREATE TABLE IF NOT EXISTS `f_comment_t_t` (
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

-- 正在导出表  footprint.f_comment_t_t 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `f_comment_t_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_comment_t_t` ENABLE KEYS */;


-- 导出  表 footprint.f_function 结构
CREATE TABLE IF NOT EXISTS `f_function` (
  `code` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编码',
  `descript` varchar(50) DEFAULT '' COMMENT '描述',
  `displayorder` int(11) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(250) DEFAULT '' COMMENT '链接',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='功能菜单';

-- 正在导出表  footprint.f_function 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `f_function` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_function` ENABLE KEYS */;


-- 导出  表 footprint.f_grade 结构
CREATE TABLE IF NOT EXISTS `f_grade` (
  `code` int(10) unsigned NOT NULL COMMENT '编码',
  `gname` varchar(20) DEFAULT '' COMMENT '名称',
  `displayorder` int(11) DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='年级';

-- 正在导出表  footprint.f_grade 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `f_grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_grade` ENABLE KEYS */;


-- 导出  表 footprint.f_health 结构
CREATE TABLE IF NOT EXISTS `f_health` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='健康评价';

-- 正在导出表  footprint.f_health 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `f_health` DISABLE KEYS */;
INSERT INTO `f_health` (`id`, `createyear`, `term`, `class_id`, `createdate`, `grade`, `baby_id`, `baby_name`, `nursery_id`, `teacher_id`, `teacher_name`, `height`, `weight`, `HB`, `allcaries`, `newcaries`, `lefteyesight`, `righteyesight`, `mark`) VALUES
	(1, '2016-2017', '上学期', 2, '2016-12-16', '大', 1, '张小云', 0, '115', '张四111', '150', '', '', '', '', '', '', '');
/*!40000 ALTER TABLE `f_health` ENABLE KEYS */;


-- 导出  表 footprint.f_item 结构
CREATE TABLE IF NOT EXISTS `f_item` (
  `code` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编码',
  `quota` varchar(50) NOT NULL DEFAULT '0' COMMENT '评价指标',
  `descript` varchar(200) DEFAULT '' COMMENT '描述',
  `type` varchar(50) DEFAULT '0' COMMENT '评价类型',
  `belongto` int(11) DEFAULT '0' COMMENT '类型',
  `level` int(11) DEFAULT '0' COMMENT '级别',
  `scorestyle` int(11) DEFAULT '0' COMMENT '评分样式',
  `grade` varchar(20) DEFAULT '' COMMENT '年级',
  `term` varchar(20) DEFAULT '' COMMENT '学期',
  `displayorder` int(11) DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='评测项目';

-- 正在导出表  footprint.f_item 的数据：~13 rows (大约)
/*!40000 ALTER TABLE `f_item` DISABLE KEYS */;
INSERT INTO `f_item` (`code`, `quota`, `descript`, `type`, `belongto`, `level`, `scorestyle`, `grade`, `term`, `displayorder`) VALUES
	(1, '走', '上体正直，上下肢体动作自然，较协调，落地亲。列队走时能听口令踏准节拍', '健康', 1, 0, 0, '大', '上学期', 11101),
	(2, '跑', '跑', '健康', 1, 0, 0, '大', '上学期', 21304),
	(3, '跳', '跳', '健康', 1, 0, 0, '大', '上学期', 0),
	(4, '平衡', '平衡', '健康', 1, 0, 0, '大', '上学期', 0),
	(5, '拍球', '拍球', '健康', 1, 0, 0, '大', '上学期', 0),
	(6, '进餐', '进餐', '健康', 1, 0, 0, '大', '上学期', 0),
	(7, '穿衣', '穿衣', '健康', 1, 0, 0, '大', '上学期', 0),
	(8, '卫生习惯', '卫生习惯', '健康', 1, 0, 0, '大', '上学期', 0),
	(9, '躲避危险', '躲避危险', '健康', 1, 0, 0, '大', '上学期', 0),
	(10, '自我保护', '自我保护', '健康', 1, 0, 0, '大', '上学期', 0),
	(11, '空间', '空间', '认知', 2, 0, 0, '大', '上学期', 0),
	(12, '1', '1', '1', 0, 0, 0, '大', '上学期', 0),
	(13, '1', '1', '1', 0, 0, 0, '小', '上学期', 0);
/*!40000 ALTER TABLE `f_item` ENABLE KEYS */;


-- 导出  表 footprint.f_item_score 结构
CREATE TABLE IF NOT EXISTS `f_item_score` (
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
  `baby_gender` varchar(4) DEFAULT '' COMMENT '性别',
  `createdate` date DEFAULT '2000-01-01' COMMENT '录入日期',
  `nursery_id` int(11) DEFAULT '0' COMMENT '幼儿园ID',
  `teacher_id` varchar(50) DEFAULT '' COMMENT '老师ID',
  `teacher_name` varchar(50) DEFAULT '' COMMENT '老师姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=541 DEFAULT CHARSET=utf8mb4 COMMENT='评测记录';

-- 正在导出表  footprint.f_item_score 的数据：~139 rows (大约)
/*!40000 ALTER TABLE `f_item_score` DISABLE KEYS */;
INSERT INTO `f_item_score` (`id`, `createyear`, `term`, `class_id`, `grade`, `stage`, `item_code`, `score`, `baby_id`, `baby_name`, `baby_gender`, `createdate`, `nursery_id`, `teacher_id`, `teacher_name`) VALUES
	(1, '2016-12-12', '上学期', 2, '大', '期中', 10, 3, 1, '张小云', '男', '2000-01-01', 0, '1', '张'),
	(397, '2016', '上学期', 2, '大', '开学', 1, 1, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(398, '2016', '上学期', 2, '大', '开学', 1, 2, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(399, '2016', '上学期', 2, '大', '开学', 1, 1, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(400, '2016', '上学期', 2, '大', '开学', 2, 3, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(401, '2016', '上学期', 2, '大', '开学', 2, 2, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(402, '2016', '上学期', 2, '大', '开学', 2, 3, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(403, '2016', '上学期', 2, '大', '开学', 3, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(404, '2016', '上学期', 2, '大', '开学', 3, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(405, '2016', '上学期', 2, '大', '开学', 3, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(406, '2016', '上学期', 2, '大', '开学', 4, 3, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(407, '2016', '上学期', 2, '大', '开学', 4, 2, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(408, '2016', '上学期', 2, '大', '开学', 4, 3, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(409, '2016', '上学期', 2, '大', '开学', 5, 1, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(410, '2016', '上学期', 2, '大', '开学', 5, 2, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(411, '2016', '上学期', 2, '大', '开学', 5, 3, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(412, '2016', '上学期', 2, '大', '开学', 6, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(413, '2016', '上学期', 2, '大', '开学', 6, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(414, '2016', '上学期', 2, '大', '开学', 6, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(415, '2016', '上学期', 2, '大', '开学', 7, 3, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(416, '2016', '上学期', 2, '大', '开学', 7, 2, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(417, '2016', '上学期', 2, '大', '开学', 7, 2, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(418, '2016', '上学期', 2, '大', '开学', 8, 2, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(419, '2016', '上学期', 2, '大', '开学', 8, 2, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(420, '2016', '上学期', 2, '大', '开学', 8, 1, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(421, '2016', '上学期', 2, '大', '开学', 9, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(422, '2016', '上学期', 2, '大', '开学', 9, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(423, '2016', '上学期', 2, '大', '开学', 9, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(424, '2016', '上学期', 2, '大', '开学', 10, 2, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(425, '2016', '上学期', 2, '大', '开学', 10, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(426, '2016', '上学期', 2, '大', '开学', 10, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(427, '2016', '上学期', 2, '大', '开学', 11, 1, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(428, '2016', '上学期', 2, '大', '开学', 11, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(429, '2016', '上学期', 2, '大', '开学', 11, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(430, '2016', '上学期', 2, '大', '开学', 12, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(431, '2016', '上学期', 2, '大', '开学', 12, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(432, '2016', '上学期', 2, '大', '开学', 12, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(433, '2016', '上学期', 2, '大', 'null', 1, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(434, '2016', '上学期', 2, '大', 'null', 1, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(435, '2016', '上学期', 2, '大', 'null', 1, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(436, '2016', '上学期', 2, '大', 'null', 2, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(437, '2016', '上学期', 2, '大', 'null', 2, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(438, '2016', '上学期', 2, '大', 'null', 2, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(439, '2016', '上学期', 2, '大', 'null', 3, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(440, '2016', '上学期', 2, '大', 'null', 3, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(441, '2016', '上学期', 2, '大', 'null', 3, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(442, '2016', '上学期', 2, '大', 'null', 4, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(443, '2016', '上学期', 2, '大', 'null', 4, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(444, '2016', '上学期', 2, '大', 'null', 4, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(445, '2016', '上学期', 2, '大', 'null', 5, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(446, '2016', '上学期', 2, '大', 'null', 5, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(447, '2016', '上学期', 2, '大', 'null', 5, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(448, '2016', '上学期', 2, '大', 'null', 6, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(449, '2016', '上学期', 2, '大', 'null', 6, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(450, '2016', '上学期', 2, '大', 'null', 6, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(451, '2016', '上学期', 2, '大', 'null', 7, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(452, '2016', '上学期', 2, '大', 'null', 7, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(453, '2016', '上学期', 2, '大', 'null', 7, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(454, '2016', '上学期', 2, '大', 'null', 8, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(455, '2016', '上学期', 2, '大', 'null', 8, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(456, '2016', '上学期', 2, '大', 'null', 8, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(457, '2016', '上学期', 2, '大', 'null', 9, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(458, '2016', '上学期', 2, '大', 'null', 9, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(459, '2016', '上学期', 2, '大', 'null', 9, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(460, '2016', '上学期', 2, '大', 'null', 10, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(461, '2016', '上学期', 2, '大', 'null', 10, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(462, '2016', '上学期', 2, '大', 'null', 10, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(463, '2016', '上学期', 2, '大', 'null', 11, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(464, '2016', '上学期', 2, '大', 'null', 11, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(465, '2016', '上学期', 2, '大', 'null', 11, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(466, '2016', '上学期', 2, '大', 'null', 12, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(467, '2016', '上学期', 2, '大', 'null', 12, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(468, '2016', '上学期', 2, '大', 'null', 12, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(469, '2016', '上学期', 2, '大', '期末', 1, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(470, '2016', '上学期', 2, '大', '期末', 1, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(471, '2016', '上学期', 2, '大', '期末', 1, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(472, '2016', '上学期', 2, '大', '期末', 2, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(473, '2016', '上学期', 2, '大', '期末', 2, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(474, '2016', '上学期', 2, '大', '期末', 2, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(475, '2016', '上学期', 2, '大', '期末', 3, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(476, '2016', '上学期', 2, '大', '期末', 3, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(477, '2016', '上学期', 2, '大', '期末', 3, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(478, '2016', '上学期', 2, '大', '期末', 4, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(479, '2016', '上学期', 2, '大', '期末', 4, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(480, '2016', '上学期', 2, '大', '期末', 4, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(481, '2016', '上学期', 2, '大', '期末', 5, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(482, '2016', '上学期', 2, '大', '期末', 5, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(483, '2016', '上学期', 2, '大', '期末', 5, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(484, '2016', '上学期', 2, '大', '期末', 6, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(485, '2016', '上学期', 2, '大', '期末', 6, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(486, '2016', '上学期', 2, '大', '期末', 6, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(487, '2016', '上学期', 2, '大', '期末', 7, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(488, '2016', '上学期', 2, '大', '期末', 7, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(489, '2016', '上学期', 2, '大', '期末', 7, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(490, '2016', '上学期', 2, '大', '期末', 8, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(491, '2016', '上学期', 2, '大', '期末', 8, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(492, '2016', '上学期', 2, '大', '期末', 8, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(493, '2016', '上学期', 2, '大', '期末', 9, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(494, '2016', '上学期', 2, '大', '期末', 9, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(495, '2016', '上学期', 2, '大', '期末', 9, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(496, '2016', '上学期', 2, '大', '期末', 10, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(497, '2016', '上学期', 2, '大', '期末', 10, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(498, '2016', '上学期', 2, '大', '期末', 10, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(499, '2016', '上学期', 2, '大', '期末', 11, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(500, '2016', '上学期', 2, '大', '期末', 11, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(501, '2016', '上学期', 2, '大', '期末', 11, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(502, '2016', '上学期', 2, '大', '期末', 12, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(503, '2016', '上学期', 2, '大', '期末', 12, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(504, '2016', '上学期', 2, '大', '期末', 12, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(505, '2016', '上学期', 2, '大', '开学', 1, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(506, '2016', '上学期', 2, '大', '开学', 1, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(507, '2016', '上学期', 2, '大', '开学', 1, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(508, '2016', '上学期', 2, '大', '开学', 2, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(509, '2016', '上学期', 2, '大', '开学', 2, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(510, '2016', '上学期', 2, '大', '开学', 2, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(511, '2016', '上学期', 2, '大', '开学', 3, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(512, '2016', '上学期', 2, '大', '开学', 3, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(513, '2016', '上学期', 2, '大', '开学', 3, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(514, '2016', '上学期', 2, '大', '开学', 4, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(515, '2016', '上学期', 2, '大', '开学', 4, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(516, '2016', '上学期', 2, '大', '开学', 4, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(517, '2016', '上学期', 2, '大', '开学', 5, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(518, '2016', '上学期', 2, '大', '开学', 5, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(519, '2016', '上学期', 2, '大', '开学', 5, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(520, '2016', '上学期', 2, '大', '开学', 6, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(521, '2016', '上学期', 2, '大', '开学', 6, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(522, '2016', '上学期', 2, '大', '开学', 6, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(523, '2016', '上学期', 2, '大', '开学', 7, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(524, '2016', '上学期', 2, '大', '开学', 7, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(525, '2016', '上学期', 2, '大', '开学', 7, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(526, '2016', '上学期', 2, '大', '开学', 8, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(527, '2016', '上学期', 2, '大', '开学', 8, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(528, '2016', '上学期', 2, '大', '开学', 8, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(529, '2016', '上学期', 2, '大', '开学', 9, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(530, '2016', '上学期', 2, '大', '开学', 9, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(531, '2016', '上学期', 2, '大', '开学', 9, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(532, '2016', '上学期', 2, '大', '开学', 10, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(533, '2016', '上学期', 2, '大', '开学', 10, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(534, '2016', '上学期', 2, '大', '开学', 10, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(535, '2016', '上学期', 2, '大', '开学', 11, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(536, '2016', '上学期', 2, '大', '开学', 11, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(537, '2016', '上学期', 2, '大', '开学', 11, 0, 3, '晓东', '男', '2000-01-01', 0, '1', ''),
	(538, '2016', '上学期', 2, '大', '开学', 12, 0, 1, '张小云', '男', '2000-01-01', 0, '1', ''),
	(539, '2016', '上学期', 2, '大', '开学', 12, 0, 2, '李白', '男', '2000-01-01', 0, '1', ''),
	(540, '2016', '上学期', 2, '大', '开学', 12, 0, 3, '晓东', '男', '2000-01-01', 0, '1', '');
/*!40000 ALTER TABLE `f_item_score` ENABLE KEYS */;


-- 导出  表 footprint.f_item_type 结构
CREATE TABLE IF NOT EXISTS `f_item_type` (
  `列 1` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  footprint.f_item_type 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `f_item_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_item_type` ENABLE KEYS */;


-- 导出  表 footprint.f_menu 结构
CREATE TABLE IF NOT EXISTS `f_menu` (
  `id` varchar(10) NOT NULL COMMENT 'ID',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `fname` varchar(50) DEFAULT '' COMMENT '名称',
  `seq` int(11) DEFAULT '0' COMMENT '编号',
  `furl` varchar(200) DEFAULT '' COMMENT 'url',
  `belongto` varchar(10) DEFAULT '' COMMENT '上级',
  `roleid` varchar(20) DEFAULT '' COMMENT '角色',
  `url` varchar(50) DEFAULT NULL,
  `ROLEIDS` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  footprint.f_menu 的数据：~27 rows (大约)
/*!40000 ALTER TABLE `f_menu` DISABLE KEYS */;
INSERT INTO `f_menu` (`id`, `icon`, `fname`, `seq`, `furl`, `belongto`, `roleid`, `url`, `ROLEIDS`) VALUES
	('0', '', 'Home', 1, '', '', '', 'admin/manageClass1', NULL),
	('m1', '', '新学期啦', 1, '', '0', '1', 'admin/manageClass2', NULL),
	('m10', '', '在园每月评价', 10, '', '0', '2', 'admin/manageClass3', NULL),
	('m11', '', '在园学期总结', 11, '', '0', '1', 'garden/termConclusion', NULL),
	('m12', '', '家长观察总结', 12, '', '0', '2', 'admin/manageClass5', NULL),
	('m13', '', '发送家长通知', 13, '', '0', '2', 'admin/manageClass6', NULL),
	('m14', '', '信息统计查询', 14, '', '0', '2', 'admin/manageClass7', NULL),
	('m15', '', '修改个人信息', 15, '', '0', '1', 'admin/changeOwnMessage', NULL),
	('m16', '', '打印成长手册', 16, '', '0', '2', 'admin/manageClass9', NULL),
	('m17', '', '宝宝成长评价', 17, '', '0', '3', 'admin/manageClass0', NULL),
	('m18', '', '在园每月总结', 18, '', '0', '3', 'admin/manageClass11', NULL),
	('m19', '', '在园学期总结', 19, '', '0', '3', 'admin/manageClass12', NULL),
	('m2', '', '班级管理', 2, '', '0', '1', 'admin/manageClass', NULL),
	('m20', '', '宝宝档案资料', 20, '', '0', '3', 'admin/manageClass1111', NULL),
	('m21', '', '在家每月总结', 21, '', '0', '3', 'admin/manageClass11111', NULL),
	('m22', '', '在家学期总结', 22, '', '0', '3', 'admin/manageClass11111', NULL),
	('m23', '', '修改登录密码', 23, '', '0', '3', 'admin/manageClass22222', NULL),
	('m24', '', '生长发育评价', 24, '', '0', '4', 'doctor/evaluate', NULL),
	('m25', '', '修改信息', 25, '', '0', '4', 'doctor/changeInfo', NULL),
	('m26', '', '创建班级', 26, '', '0', '1', 'admin/createClass', NULL),
	('m3', '', '离园调班', 3, '', '0', '1', 'admin/transferClass', NULL),
	('m4', '', '评价模板', 4, '', '0', '1', 'admin/manageClass66', NULL),
	('m5', '', '配置老师', 5, '', '0', '1', 'admin/configurationTeacher', NULL),
	('m6', '', '基本信息', 6, '', '0', '1', 'admin/manageClass88', NULL),
	('m7', '', '宝宝入园登记', 7, '', '0', '2', 'teacher/register/inRegister', NULL),
	('m8', '', '修改宝宝信息', 8, '', '0', '1', 'admin/changeBabyMessage', NULL),
	('m9', '', '全班成长评价', 9, '', '0', '1', 'admin/growthEvaluation', NULL);
/*!40000 ALTER TABLE `f_menu` ENABLE KEYS */;


-- 导出  表 footprint.f_movelog 结构
CREATE TABLE IF NOT EXISTS `f_movelog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `movetime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '调班时间',
  `actor` varchar(50) DEFAULT '' COMMENT '操作人',
  `previous` int(11) DEFAULT '0' COMMENT '之前班级ID',
  `after` int(11) DEFAULT '0' COMMENT '调后班级ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  footprint.f_movelog 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `f_movelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_movelog` ENABLE KEYS */;


-- 导出  表 footprint.f_notes 结构
CREATE TABLE IF NOT EXISTS `f_notes` (
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

-- 正在导出表  footprint.f_notes 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `f_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_notes` ENABLE KEYS */;


-- 导出  表 footprint.f_nursery 结构
CREATE TABLE IF NOT EXISTS `f_nursery` (
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
  `createdate` date DEFAULT '2000-01-01' COMMENT '录入日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幼儿园信息';

-- 正在导出表  footprint.f_nursery 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `f_nursery` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_nursery` ENABLE KEYS */;


-- 导出  表 footprint.f_nursery_level 结构
CREATE TABLE IF NOT EXISTS `f_nursery_level` (
  `code` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编码',
  `descript` varchar(50) DEFAULT '' COMMENT '描述',
  `displayorder` int(11) DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幼儿园级别';

-- 正在导出表  footprint.f_nursery_level 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `f_nursery_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_nursery_level` ENABLE KEYS */;


-- 导出  表 footprint.f_nursery_nature 结构
CREATE TABLE IF NOT EXISTS `f_nursery_nature` (
  `code` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编码',
  `descript` varchar(50) DEFAULT '' COMMENT '描述',
  `displayorder` int(11) DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幼儿园性质';

-- 正在导出表  footprint.f_nursery_nature 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `f_nursery_nature` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_nursery_nature` ENABLE KEYS */;


-- 导出  表 footprint.f_p_item 结构
CREATE TABLE IF NOT EXISTS `f_p_item` (
  `code` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编码',
  `descript` varchar(250) DEFAULT '' COMMENT '描述',
  `grade` varchar(20) DEFAULT '' COMMENT '年级',
  `term` varchar(20) DEFAULT '' COMMENT '学期',
  `createmonth` varchar(50) DEFAULT '' COMMENT '月份',
  `displayorder` int(11) DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='在家观察项目';

-- 正在导出表  footprint.f_p_item 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `f_p_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_p_item` ENABLE KEYS */;


-- 导出  表 footprint.f_p_item_score 结构
CREATE TABLE IF NOT EXISTS `f_p_item_score` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createyear` varchar(20) DEFAULT '' COMMENT '学年',
  `term` varchar(20) DEFAULT '' COMMENT '学期',
  `class_id` int(11) DEFAULT '0' COMMENT '班级ID',
  `createmonth` varchar(50) DEFAULT '' COMMENT '月份',
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

-- 正在导出表  footprint.f_p_item_score 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `f_p_item_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_p_item_score` ENABLE KEYS */;


-- 导出  表 footprint.f_role 结构
CREATE TABLE IF NOT EXISTS `f_role` (
  `code` int(10) unsigned NOT NULL COMMENT '编码',
  `rolename` varchar(20) DEFAULT '' COMMENT '名称',
  `displayorder` int(11) DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色（幼儿园管理员、老师、家长、保健医生、教委）';

-- 正在导出表  footprint.f_role 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `f_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_role` ENABLE KEYS */;


-- 导出  表 footprint.f_r_f 结构
CREATE TABLE IF NOT EXISTS `f_r_f` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_id` int(11) DEFAULT '0' COMMENT '角色ID',
  `f_code` int(11) DEFAULT '0' COMMENT '功能编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色-功能';

-- 正在导出表  footprint.f_r_f 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `f_r_f` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_r_f` ENABLE KEYS */;


-- 导出  表 footprint.f_sequence_auto 结构
CREATE TABLE IF NOT EXISTS `f_sequence_auto` (
  `id` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  footprint.f_sequence_auto 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `f_sequence_auto` DISABLE KEYS */;
INSERT INTO `f_sequence_auto` (`id`, `name`) VALUES
	(00002, 'sequence'),
	(00003, 'name'),
	(00005, 'sequence');
/*!40000 ALTER TABLE `f_sequence_auto` ENABLE KEYS */;


-- 导出  表 footprint.f_stage 结构
CREATE TABLE IF NOT EXISTS `f_stage` (
  `code` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编码',
  `descript` varchar(50) DEFAULT '' COMMENT '描述',
  `displayorder` int(11) DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='阶段（评测学期中的阶段）';

-- 正在导出表  footprint.f_stage 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `f_stage` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_stage` ENABLE KEYS */;


-- 导出  表 footprint.f_templete 结构
CREATE TABLE IF NOT EXISTS `f_templete` (
  `code` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编码',
  `descript` varchar(250) DEFAULT '' COMMENT '描述',
  `type` varchar(50) DEFAULT '' COMMENT '类型',
  `displayorder` int(11) DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='模板';

-- 正在导出表  footprint.f_templete 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `f_templete` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_templete` ENABLE KEYS */;


-- 导出  表 footprint.f_term 结构
CREATE TABLE IF NOT EXISTS `f_term` (
  `code` int(10) unsigned NOT NULL COMMENT '编码',
  `tname` varchar(20) DEFAULT '' COMMENT '名称',
  `displayorder` int(11) DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学期';

-- 正在导出表  footprint.f_term 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `f_term` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_term` ENABLE KEYS */;


-- 导出  表 footprint.f_user 结构
CREATE TABLE IF NOT EXISTS `f_user` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一序列号',
  `id` varchar(50) NOT NULL COMMENT '登录号',
  `username` varchar(50) DEFAULT '' COMMENT '姓名',
  `gender` varchar(4) DEFAULT '' COMMENT '性别',
  `roleids` varchar(20) DEFAULT '0' COMMENT '角色IDS，用，分割多种角色权限',
  `password` varchar(300) DEFAULT '' COMMENT '密码',
  `telephone` varchar(20) DEFAULT '' COMMENT '电话',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机',
  `email` varchar(100) DEFAULT '' COMMENT 'email',
  `createdate` date DEFAULT '2000-01-01' COMMENT '录入日期',
  `nursery_id` int(11) DEFAULT '0' COMMENT '幼儿园ID',
  `nursery_name` varchar(50) DEFAULT '' COMMENT '幼儿园名称',
  `status` varchar(10) DEFAULT '' COMMENT '状态',
  `class_id` int(11) DEFAULT '0' COMMENT '班级ID',
  `sessioncode` varchar(300) DEFAULT '' COMMENT 'session代码',
  `isadmin` varchar(4) DEFAULT '' COMMENT '是否管理员',
  PRIMARY KEY (`sid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COMMENT='用户';

-- 正在导出表  footprint.f_user 的数据：~24 rows (大约)
/*!40000 ALTER TABLE `f_user` DISABLE KEYS */;
INSERT INTO `f_user` (`sid`, `id`, `username`, `gender`, `roleids`, `password`, `telephone`, `mobile`, `email`, `createdate`, `nursery_id`, `nursery_name`, `status`, `class_id`, `sessioncode`, `isadmin`) VALUES
	(1, '112', '', '', '1', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '2000-01-01', 0, '', 'Y', 0, '', ''),
	(10, '415', '333', '男', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '2142', '', '2016-12-06', 0, '向日葵幼儿园', 'Y', 1281, NULL, 'N'),
	(11, '115', '张四111', '男', '4', 'e10adc3949ba59abbe56e057f20f883e', '', '112', '', '2016-12-06', 0, '向日葵幼儿园', 'Y', 1281, NULL, 'N'),
	(12, '596', '111', '男', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '213', '', '2016-12-07', 0, '向日葵幼儿园', 'Y', 1282, NULL, 'N'),
	(13, '601', '222', '男', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '213', '', '2016-12-06', 0, '向日葵幼儿园', 'Y', 1281, NULL, 'N'),
	(14, '639', '111', '男', '1', 'e10adc3949ba59abbe56e057f20f883e', '', '213', '', '2016-12-07', 0, '向日葵幼儿园', 'Y', 0, NULL, 'N'),
	(15, '653', '2222', '男', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '11111', '', '2016-12-06', 0, '向日葵幼儿园', 'Y', 1279, NULL, 'N'),
	(19, '761', '2223', '男', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '111', '', '2016-12-06', 0, '向日葵幼儿园', 'Y', 1279, NULL, 'N'),
	(20, '776', '李利里', '男', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '111111', '', '2016-12-06', 0, '向日葵幼儿园', 'Y', 1278, NULL, 'N'),
	(21, '869', '李利', '男', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '12434353533', '', '2016-12-06', 0, '向日葵幼儿园', 'Y', 1279, NULL, 'N'),
	(22, '877', '122', '男', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '11111', '', '2016-12-07', 0, '向日葵幼儿园', 'Y', 1278, NULL, 'N'),
	(23, '897', '李五', '男', '1', 'e10adc3949ba59abbe56e057f20f883e', '', '14325323444', '3124@qq.com', '2016-12-06', 0, '向日葵幼儿园', 'Y', 0, NULL, 'N'),
	(24, '985', '117', '男', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '2016-12-07', 0, '向日葵幼儿园', 'Y', 1280, NULL, 'N'),
	(26, '408', '张三', '女', '1', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '2016-12-07', 0, '向日葵幼儿园', 'Y', 0, NULL, 'N'),
	(27, '312', '111', '男', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '1234234234', '', '2016-12-08', 0, '向日葵幼儿园', 'Y', 1280, NULL, 'N'),
	(28, '854', '我是谁', '男', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '18932433437', '', '2016-12-08', 0, '向日葵幼儿园', 'Y', 1278, NULL, 'N'),
	(29, '815', '新增人员', '女', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '22234', '', '2016-12-08', 0, '向日葵幼儿园', 'Y', 1280, NULL, 'N'),
	(30, '55', '测试人员', '男', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '12412313', '', '2016-12-08', 0, '向日葵幼儿园', 'Y', 1293, NULL, 'N'),
	(31, '464', 'tttttttttttttttt', '男', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '111', '', '2016-12-08', 0, '向日葵幼儿园', 'Y', 1293, NULL, 'N'),
	(32, '743', '我是我', '男', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '111', '', '2016-12-08', 0, '向日葵幼儿园', 'Y', 1283, NULL, 'N'),
	(33, '157', '234', '男', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '24234', '', '2016-12-08', 0, '向日葵幼儿园', 'Y', 1283, NULL, 'N'),
	(34, '808', 'test', '男', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '15835423432', '', '2016-12-08', 0, '向日葵幼儿园', 'Y', NULL, NULL, 'N'),
	(35, '654', 'my', '男', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '1123214235', '', '2016-12-08', 0, '向日葵幼儿园', 'Y', 1283, NULL, 'N'),
	(36, '975', '123', '男', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '1', '', '2016-12-10', 0, '', 'Y', 0, NULL, 'N');
/*!40000 ALTER TABLE `f_user` ENABLE KEYS */;


-- 导出  表 footprint.sequence 结构
CREATE TABLE IF NOT EXISTS `sequence` (
  `name` varchar(50) NOT NULL,
  `current_value` int(11) NOT NULL,
  `increment` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  footprint.sequence 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
