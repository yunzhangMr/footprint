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
  PRIMARY KEY (`id`),
  UNIQUE KEY `namespell` (`namespell`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COMMENT='宝宝信息';

-- 正在导出表  footprint.f_baby 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `f_baby` DISABLE KEYS */;
INSERT INTO `f_baby` (`id`, `bname`, `namespell`, `gender`, `birth`, `telephone`, `parent_id`, `parent_name`, `nursery_id`, `createuser`, `createdate`, `animalsign`, `nickname`, `nurture`, `status`) VALUES
	(26, '赵莹', 'ZhaoYing', '女', '2016-12-23', '13343567890', 'ZhaoYing', NULL, 0, '112', '2016-12-23', NULL, NULL, NULL, 'Y'),
	(27, '李白白', 'LiBaiBai', '男', '2016-12-07', '12345678903', 'LiBaiBai', NULL, 0, '112', '2016-12-23', NULL, NULL, NULL, 'Y'),
	(28, '李白白', 'LiBaiBai001', '女', '2016-12-07', '', 'LiBaiBai001', NULL, 0, '112', '2016-12-23', NULL, NULL, NULL, 'Y');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  footprint.f_baby_class 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `f_baby_class` DISABLE KEYS */;
INSERT INTO `f_baby_class` (`id`, `baby_id`, `class_id`, `status`) VALUES
	(1, 1, 2, 'N'),
	(17, 26, 1318, 'N'),
	(18, 27, 1318, 'N'),
	(19, 28, 1318, 'N');
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
) ENGINE=InnoDB AUTO_INCREMENT=1327 DEFAULT CHARSET=utf8mb4 COMMENT='班级';

-- 正在导出表  footprint.f_class 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `f_class` DISABLE KEYS */;
INSERT INTO `f_class` (`id`, `cname`, `nursery_id`, `nursery_name`, `createdate`, `createyear`, `grade`, `term`, `cnum`, `teacher1id`, `teacher2id`, `teacher3id`, `teacher1name`, `teacher2name`, `teacher3name`, `previous_id`, `status`) VALUES
	(1318, '大（1）班', 0, '', '2016-12-23', '2016', '大', '上学期', '1', '2', '4', '43', '测试老师', '保健医生', '孙名', NULL, 'Y'),
	(1319, '大（2）班', 0, '', '2016-12-23', '2016', '大', '上学期', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(1320, '中（1）班', 0, '', '2016-12-23', '2016', '中', '上学期', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(1321, '中（2）班', 0, '', '2016-12-23', '2016', '中', '上学期', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(1322, '中（3）班', 0, '', '2016-12-23', '2016', '中', '上学期', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(1323, '小（1）班', 0, '', '2016-12-23', '2016', '小', '上学期', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(1324, '小（2）班', 0, '', '2016-12-23', '2016', '小', '上学期', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(1325, '小（3）班', 0, '', '2016-12-23', '2016', '小', '上学期', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y'),
	(1326, '小（4）班', 0, '', '2016-12-23', '2016', '小', '上学期', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='在园每月评价';

-- 正在导出表  footprint.f_comment_t_m 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `f_comment_t_m` DISABLE KEYS */;
INSERT INTO `f_comment_t_m` (`id`, `createyear`, `term`, `class_id`, `createmonth`, `grade`, `createdate`, `baby_id`, `baby_name`, `nursery_id`, `teacher_id`, `teacher_name`, `behavior`, `suggestion`) VALUES
	(3, '2016', '上学期', 1318, '12', '大', '2016-12-23', 26, '赵莹', 0, '112', '测试老师', '很好', '');
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
  `baby_gender` varchar(4) DEFAULT '' COMMENT '性别',
  `nursery_id` int(11) DEFAULT '0' COMMENT '幼儿园ID',
  `teacher_id` varchar(50) DEFAULT '' COMMENT '老师ID',
  `teacher_name` varchar(50) DEFAULT '' COMMENT '老师姓名',
  `sparkle` varchar(250) DEFAULT '' COMMENT '闪光点',
  `progress` varchar(250) DEFAULT '' COMMENT '进步',
  `guidance` varchar(250) DEFAULT '' COMMENT '需指导',
  `factors` varchar(250) DEFAULT '' COMMENT '影响因素',
  `plan` varchar(250) DEFAULT '' COMMENT '指导计划',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='在园学期总结';

-- 正在导出表  footprint.f_comment_t_t 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `f_comment_t_t` DISABLE KEYS */;
INSERT INTO `f_comment_t_t` (`id`, `createyear`, `term`, `class_id`, `grade`, `createdate`, `baby_id`, `baby_name`, `baby_gender`, `nursery_id`, `teacher_id`, `teacher_name`, `sparkle`, `progress`, `guidance`, `factors`, `plan`) VALUES
	(18, '2016', '上学期', 1318, '大', '0000-00-00', 26, '赵莹', '女', 0, '2', '测试老师', '好棒的尽快投入可以听结婚了经营管理v麓湖路经过了机会氯碱化工过来就会更快乐就好过了计划管理结合高科技高了就不', '', '', '', ''),
	(19, '2016', '上学期', 1318, '大', '0000-00-00', 27, '李白白', '男', 0, '2', '测试老师', '', '', '', '', ''),
	(20, '2016', '上学期', 1318, '大', '0000-00-00', 28, '李白白', '女', 0, '2', '测试老师', '', '', '', '', '');
/*!40000 ALTER TABLE `f_comment_t_t` ENABLE KEYS */;


-- 导出  表 footprint.f_common_expressions 结构
CREATE TABLE IF NOT EXISTS `f_common_expressions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `content` varchar(255) DEFAULT '' COMMENT '常用语内容',
  `type` varchar(255) DEFAULT '' COMMENT '常用语类别',
  `teacher_id` varchar(50) DEFAULT '' COMMENT '老师ID',
  `nursery_id` varchar(50) DEFAULT '' COMMENT '幼儿园ID',
  `displayorder` int(11) DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COMMENT='常用语';

-- 正在导出表  footprint.f_common_expressions 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `f_common_expressions` DISABLE KEYS */;
INSERT INTO `f_common_expressions` (`id`, `content`, `type`, `teacher_id`, `nursery_id`, `displayorder`) VALUES
	(27, '真的好！', '闪光点', '2', '0', 1),
	(29, '好棒的', '闪光点', '2', '0', 2),
	(30, '好棒的尽快投入可以听结婚了经营管理v麓湖路经过了机会氯碱化工过来就会更快乐就好过了计划管理结合高科技高了就不', '闪光点', '2', '0', 2);
/*!40000 ALTER TABLE `f_common_expressions` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='健康评价';

-- 正在导出表  footprint.f_health 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `f_health` DISABLE KEYS */;
INSERT INTO `f_health` (`id`, `createyear`, `term`, `class_id`, `createdate`, `grade`, `baby_id`, `baby_name`, `nursery_id`, `teacher_id`, `teacher_name`, `height`, `weight`, `HB`, `allcaries`, `newcaries`, `lefteyesight`, `righteyesight`, `mark`) VALUES
	(1, '2016-2017', '上学期', 2, '2016-12-16', '大', 1, '张小云', 0, '115', '张四111', '150', '', '', '', '', '', '', ''),
	(2, '2016-2017', '上学期', 1315, '2016-12-23', '大', 25, '张小云', 0, '114', '保健医生', '150', '', '', '', '', '', '', ''),
	(3, '2016-2017', '上学期', 1318, '2016-12-23', '大', 26, '赵莹', 0, '114', '保健医生', '170', '', '', '', '', '', '', '水电费斯蒂芬森');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='评测项目';

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
	(11, '空间', '空间', '认知', 2, 0, 0, '大', '上学期', 0);
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
) ENGINE=InnoDB AUTO_INCREMENT=658 DEFAULT CHARSET=utf8mb4 COMMENT='评测记录';

-- 正在导出表  footprint.f_item_score 的数据：~33 rows (大约)
/*!40000 ALTER TABLE `f_item_score` DISABLE KEYS */;
INSERT INTO `f_item_score` (`id`, `createyear`, `term`, `class_id`, `grade`, `stage`, `item_code`, `score`, `baby_id`, `baby_name`, `baby_gender`, `createdate`, `nursery_id`, `teacher_id`, `teacher_name`) VALUES
	(625, '2016', '上学期', 1318, '大', '开学', 1, 1, 26, '赵莹', '女', '2000-01-01', 0, '2', '测试老师'),
	(626, '2016', '上学期', 1318, '大', '开学', 1, 2, 27, '李白白', '男', '2000-01-01', 0, '2', '测试老师'),
	(627, '2016', '上学期', 1318, '大', '开学', 1, 3, 28, '李白白', '女', '2000-01-01', 0, '2', '测试老师'),
	(628, '2016', '上学期', 1318, '大', '开学', 2, 0, 26, '赵莹', '女', '2000-01-01', 0, '2', '测试老师'),
	(629, '2016', '上学期', 1318, '大', '开学', 2, 0, 27, '李白白', '男', '2000-01-01', 0, '2', '测试老师'),
	(630, '2016', '上学期', 1318, '大', '开学', 2, 0, 28, '李白白', '女', '2000-01-01', 0, '2', '测试老师'),
	(631, '2016', '上学期', 1318, '大', '开学', 3, 0, 26, '赵莹', '女', '2000-01-01', 0, '2', '测试老师'),
	(632, '2016', '上学期', 1318, '大', '开学', 3, 0, 27, '李白白', '男', '2000-01-01', 0, '2', '测试老师'),
	(633, '2016', '上学期', 1318, '大', '开学', 3, 0, 28, '李白白', '女', '2000-01-01', 0, '2', '测试老师'),
	(634, '2016', '上学期', 1318, '大', '开学', 4, 0, 26, '赵莹', '女', '2000-01-01', 0, '2', '测试老师'),
	(635, '2016', '上学期', 1318, '大', '开学', 4, 0, 27, '李白白', '男', '2000-01-01', 0, '2', '测试老师'),
	(636, '2016', '上学期', 1318, '大', '开学', 4, 0, 28, '李白白', '女', '2000-01-01', 0, '2', '测试老师'),
	(637, '2016', '上学期', 1318, '大', '开学', 5, 0, 26, '赵莹', '女', '2000-01-01', 0, '2', '测试老师'),
	(638, '2016', '上学期', 1318, '大', '开学', 5, 0, 27, '李白白', '男', '2000-01-01', 0, '2', '测试老师'),
	(639, '2016', '上学期', 1318, '大', '开学', 5, 0, 28, '李白白', '女', '2000-01-01', 0, '2', '测试老师'),
	(640, '2016', '上学期', 1318, '大', '开学', 6, 0, 26, '赵莹', '女', '2000-01-01', 0, '2', '测试老师'),
	(641, '2016', '上学期', 1318, '大', '开学', 6, 0, 27, '李白白', '男', '2000-01-01', 0, '2', '测试老师'),
	(642, '2016', '上学期', 1318, '大', '开学', 6, 0, 28, '李白白', '女', '2000-01-01', 0, '2', '测试老师'),
	(643, '2016', '上学期', 1318, '大', '开学', 7, 0, 26, '赵莹', '女', '2000-01-01', 0, '2', '测试老师'),
	(644, '2016', '上学期', 1318, '大', '开学', 7, 0, 27, '李白白', '男', '2000-01-01', 0, '2', '测试老师'),
	(645, '2016', '上学期', 1318, '大', '开学', 7, 0, 28, '李白白', '女', '2000-01-01', 0, '2', '测试老师'),
	(646, '2016', '上学期', 1318, '大', '开学', 8, 0, 26, '赵莹', '女', '2000-01-01', 0, '2', '测试老师'),
	(647, '2016', '上学期', 1318, '大', '开学', 8, 0, 27, '李白白', '男', '2000-01-01', 0, '2', '测试老师'),
	(648, '2016', '上学期', 1318, '大', '开学', 8, 0, 28, '李白白', '女', '2000-01-01', 0, '2', '测试老师'),
	(649, '2016', '上学期', 1318, '大', '开学', 9, 0, 26, '赵莹', '女', '2000-01-01', 0, '2', '测试老师'),
	(650, '2016', '上学期', 1318, '大', '开学', 9, 0, 27, '李白白', '男', '2000-01-01', 0, '2', '测试老师'),
	(651, '2016', '上学期', 1318, '大', '开学', 9, 0, 28, '李白白', '女', '2000-01-01', 0, '2', '测试老师'),
	(652, '2016', '上学期', 1318, '大', '开学', 10, 0, 26, '赵莹', '女', '2000-01-01', 0, '2', '测试老师'),
	(653, '2016', '上学期', 1318, '大', '开学', 10, 0, 27, '李白白', '男', '2000-01-01', 0, '2', '测试老师'),
	(654, '2016', '上学期', 1318, '大', '开学', 10, 0, 28, '李白白', '女', '2000-01-01', 0, '2', '测试老师'),
	(655, '2016', '上学期', 1318, '大', '开学', 11, 0, 26, '赵莹', '女', '2000-01-01', 0, '2', '测试老师'),
	(656, '2016', '上学期', 1318, '大', '开学', 11, 0, 27, '李白白', '男', '2000-01-01', 0, '2', '测试老师'),
	(657, '2016', '上学期', 1318, '大', '开学', 11, 0, 28, '李白白', '女', '2000-01-01', 0, '2', '测试老师');
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
	('m10', '', '在园每月评价', 10, '', '0', '2', 'teacher/inGarden/inGardenMothEvaluation', NULL),
	('m11', '', '在园学期总结', 11, '', '0', '2', 'teacher/termlySummary', NULL),
	('m12', '', '家长观察总结', 12, '', '0', '2', 'teacher/termlySummaryP', NULL),
	('m13', '', '发送家长通知', 13, '', '0', '2', 'garden/termConclusion', NULL),
	('m14', '', '信息统计查询', 14, '', '0', '2', 'admin/manageClass7', NULL),
	('m15', '', '修改本人信息', 15, '', '0', '2', 'admin/changeOwnMessage', NULL),
	('m16', '', '打印成长手册', 16, '', '0', '2', 'admin/manageClass9', NULL),
	('m17', '', '宝宝成长评价', 17, '', '0', '3', 'parent/babyGrowthEvaluation', NULL),
	('m18', '', '在园每月总结', 18, '', '0', '3', 'admin/manageClass11', NULL),
	('m19', '', '在园学期总结', 19, '', '0', '3', 'admin/manageClass12', NULL),
	('m2', '', '班级管理', 2, '', '0', '1', 'admin/manageClass', NULL),
	('m20', '', '宝宝档案资料', 20, '', '0', '3', 'admin/manageClass1111', NULL),
	('m21', '', '在家每月总结', 21, '', '0', '3', 'admin/manageClass11111', NULL),
	('m22', '', '在家学期总结', 22, '', '0', '3', 'admin/manageClass11112', NULL),
	('m23', '', '修改登录密码', 23, '', '0', '3', 'admin/manageClass22222', NULL),
	('m24', '', '生长发育评价', 24, '', '0', '4', 'doctor/evaluate', NULL),
	('m25', '', '修改信息', 25, '', '0', '4', 'doctor/changeInfo', NULL),
	('m26', '', '创建班级', 26, '', '0', '1', 'admin/createClass', NULL),
	('m3', '', '离园调班', 3, '', '0', '1', 'admin/transferClass', NULL),
	('m4', '', '评价模板', 4, '', '0', '0', 'admin/manageClass66', NULL),
	('m5', '', '配置老师', 5, '', '0', '1', 'admin/configurationTeacher', NULL),
	('m6', '', '基本信息', 6, '', '0', '1', 'admin/manageClass88', NULL),
	('m7', '', '宝宝入园登记', 7, '', '0', '2', 'teacher/register/inRegister', NULL),
	('m8', '', '修改宝宝信息', 8, '', '0', '2', 'teacher/babyInfo/changeBabyInfo', NULL),
	('m9', '', '全班成长评价', 9, '', '0', '2', 'teacher/growthEvaluation', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COMMENT='用户';

-- 正在导出表  footprint.f_user 的数据：~13 rows (大约)
/*!40000 ALTER TABLE `f_user` DISABLE KEYS */;
INSERT INTO `f_user` (`sid`, `id`, `username`, `gender`, `roleids`, `password`, `telephone`, `mobile`, `email`, `createdate`, `nursery_id`, `nursery_name`, `status`, `class_id`, `sessioncode`, `isadmin`) VALUES
	(1, '111', '园长', '', '1', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '2000-01-01', 0, '', 'Y', 0, '', 'N'),
	(2, '112', '测试老师', '男', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '111111', '', '2016-12-06', 0, '向日葵幼儿园', 'Y', 1318, NULL, 'N'),
	(3, '113', '家长', '男', '3', 'e10adc3949ba59abbe56e057f20f883e', '', '213', '', '2016-12-06', 0, '向日葵幼儿园', 'Y', 0, NULL, 'N'),
	(4, '114', '保健医生', '男', '4', 'e10adc3949ba59abbe56e057f20f883e', '', '112', '', '2016-12-06', 0, '向日葵幼儿园', 'Y', 1318, NULL, 'N'),
	(38, '692', '张三', '男', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '13334567890', '', '2016-12-23', 0, '', 'Y', 0, NULL, 'N'),
	(39, '42', '李四', '男', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '13434567890', '', '2016-12-23', 0, '', 'Y', 0, NULL, 'N'),
	(40, '933', '赵五', '女', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '13534567890', '', '2016-12-23', 0, '', 'Y', 0, NULL, 'N'),
	(41, '716', '程非', '女', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '13734567890', '', '2016-12-23', 0, '', 'Y', 0, NULL, 'N'),
	(42, '935', '吕丽', '女', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '13934567890', '', '2016-12-23', 0, '', 'Y', 0, NULL, 'N'),
	(43, '318', '孙名', '女', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '13834567890', '', '2016-12-23', 0, '', 'Y', 1318, NULL, 'N'),
	(49, 'ZhangXiaoYun', NULL, NULL, '3', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, '2016-12-23', 0, NULL, 'N', 0, NULL, 'N'),
	(50, '496', '马佳伟', '女', '2', 'e10adc3949ba59abbe56e057f20f883e', '', '13334567890', '', '2016-12-23', 0, '', 'Y', 0, NULL, 'N'),
	(51, 'ZhaoYing', NULL, NULL, '3', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, '2016-12-23', 0, NULL, 'N', NULL, NULL, 'N'),
	(52, 'LiBaiBai', NULL, NULL, '3', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, '2016-12-23', 0, NULL, 'N', NULL, NULL, 'N'),
	(53, 'LiBaiBai001', NULL, NULL, '3', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, '2016-12-23', 0, NULL, 'N', NULL, NULL, 'N');
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
