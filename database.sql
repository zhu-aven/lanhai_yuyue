SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `analyaccount`
-- ----------------------------
DROP TABLE IF EXISTS `analyaccount`;
CREATE TABLE `analyaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_id` int(11) DEFAULT '0' COMMENT '院医',
  `plan` char(120) DEFAULT NULL COMMENT '广推计划',
  `unit` char(100) DEFAULT NULL COMMENT '推广单元',
  `keyword` char(120) DEFAULT NULL COMMENT '关键词',
  `cost` decimal(10,2) DEFAULT '0.00' COMMENT '费消',
  `show` int(5) DEFAULT '0' COMMENT '现展',
  `click` int(5) DEFAULT '0' COMMENT '击点',
  `click_rate` char(10) DEFAULT '0.00' COMMENT '击率点',
  `offer` decimal(10,2) DEFAULT '0.00' COMMENT '价出',
  `average_price` decimal(10,2) DEFAULT '0.00' COMMENT '均平点击价格',
  `visit_url` text COMMENT '访问URL',
  `mobile_visit_url` text COMMENT '移动访问URL',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of analyaccount
-- ----------------------------

-- ----------------------------
-- Table structure for `analykeyword`
-- ----------------------------
DROP TABLE IF EXISTS `analykeyword`;
CREATE TABLE `analykeyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_id` int(11) DEFAULT '0' COMMENT '医院',
  `plan` char(120) DEFAULT NULL COMMENT '推广计划',
  `unit` char(120) DEFAULT NULL COMMENT '推广单元',
  `keyword` char(120) DEFAULT NULL COMMENT '键词关',
  `search_keyword` char(120) DEFAULT NULL COMMENT '索搜词',
  `show` int(5) DEFAULT '0' COMMENT '现展',
  `click` int(5) DEFAULT '0' COMMENT '击点',
  `click_rate` char(10) DEFAULT '0.00' COMMENT '击率点',
  `date` int(11) DEFAULT '0' COMMENT '期日',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of analykeyword
-- ----------------------------

-- ----------------------------
-- Table structure for `analyswt`
-- ----------------------------
DROP TABLE IF EXISTS `analyswt`;
CREATE TABLE `analyswt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_id` int(11) DEFAULT '0' COMMENT '院医ID',
  `keyword` char(100) DEFAULT NULL COMMENT '关键词',
  `dialog_type` char(15) DEFAULT NULL COMMENT '对话类型',
  `browser` char(30) DEFAULT NULL COMMENT '浏览器',
  `system` char(30) DEFAULT NULL COMMENT '操作系统',
  `position` char(50) DEFAULT NULL COMMENT 'IP定位',
  `visit_time` int(11) DEFAULT NULL COMMENT '访问时间',
  `first_visit_url` text COMMENT '初次访问地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of analyswt
-- ----------------------------

-- ----------------------------
-- Table structure for `area`
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '科室ID',
  `hospital_id` int(11) NOT NULL DEFAULT '1' COMMENT '所属医院ID',
  `name` varchar(20) DEFAULT NULL COMMENT '室科名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='科室表';

-- ----------------------------
-- Records of area
-- ----------------------------

-- ----------------------------
-- Table structure for `arriveway`
-- ----------------------------
DROP TABLE IF EXISTS `arriveway`;
CREATE TABLE `arriveway` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '沟通渠道ID',
  `hospital_id` int(11) NOT NULL DEFAULT '1' COMMENT '所属医院ID',
  `reid` int(11) NOT NULL DEFAULT '0' COMMENT '级父ID',
  `name` varchar(20) DEFAULT NULL COMMENT '诊到方式',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否禁用（默认1为正常 0为禁用）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='沟通渠道表';

-- ----------------------------
-- Records of arriveway
-- ----------------------------

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '科室ID',
  `hospital_id` int(11) NOT NULL DEFAULT '1' COMMENT '所属医院ID',
  `reid` int(11) NOT NULL DEFAULT '0' COMMENT '级上ID',
  `name` varchar(20) DEFAULT NULL COMMENT '室科名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='科室表';

-- ----------------------------
-- Records of department
-- ----------------------------

-- ----------------------------
-- Table structure for `doctor`
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '医生ID',
  `hospital_id` int(11) NOT NULL DEFAULT '1' COMMENT '所属医院ID',
  `name` varchar(20) NOT NULL COMMENT '医生名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='医生表';

-- ----------------------------
-- Records of doctor
-- ----------------------------

-- ----------------------------
-- Table structure for `group`
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(15) NOT NULL COMMENT '用户组名称',
  `purviews` text COMMENT '用户组权限值',
  `is_modify` tinyint(1) NOT NULL DEFAULT '0' COMMENT '不允许：0 允许：1',
  `rank` tinyint(1) NOT NULL DEFAULT '0' COMMENT '级等',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否禁用（默认1为正常 0为禁用）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统用户组表';

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES ('1', '系统管理员', null, '1', '10', '1');

-- ----------------------------
-- Table structure for `hospital`
-- ----------------------------
DROP TABLE IF EXISTS `hospital`;
CREATE TABLE `hospital` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '医院ID',
  `name` varchar(20) NOT NULL COMMENT '医院名称',
  `info` varchar(180) DEFAULT NULL COMMENT '院医信息',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0' COMMENT '否是开启短信发送（默认关闭：0   开启：1）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='医院表';

-- ----------------------------
-- Records of hospital
-- ----------------------------

-- ----------------------------
-- Table structure for `logs`
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `groupid` int(11) NOT NULL DEFAULT '0' COMMENT '户组用ID',
  `operateid` int(11) NOT NULL DEFAULT '0' COMMENT '被操作数据ID',
  `model` char(30) DEFAULT NULL COMMENT '模型名',
  `method` char(30) DEFAULT NULL COMMENT '方法名',
  `info` char(180) DEFAULT NULL COMMENT '事件说明',
  `modifys` text COMMENT '修改记录',
  `ip` char(16) DEFAULT NULL,
  `area` char(10) DEFAULT NULL,
  `created` int(11) NOT NULL DEFAULT '0' COMMENT '志日记录时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logs
-- ----------------------------

-- ----------------------------
-- Table structure for `mcolumn`
-- ----------------------------
DROP TABLE IF EXISTS `mcolumn`;
CREATE TABLE `mcolumn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '字段名',
  `method_id` int(11) NOT NULL COMMENT '系统方法ID',
  `info` char(60) DEFAULT NULL COMMENT '方法字段概述',
  PRIMARY KEY (`id`),
  KEY `k_meid` (`method_id`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COMMENT='系统字段表';

-- ----------------------------
-- Records of mcolumn
-- ----------------------------
INSERT INTO `mcolumn` VALUES ('1', 'name', '26', '姓名');
INSERT INTO `mcolumn` VALUES ('2', 'sex', '26', '性别');
INSERT INTO `mcolumn` VALUES ('3', 'age', '26', '年龄');
INSERT INTO `mcolumn` VALUES ('4', 'phone', '26', '联系方式');
INSERT INTO `mcolumn` VALUES ('5', 'arrive_way', '26', '沟通方式');
INSERT INTO `mcolumn` VALUES ('6', 'hospital_id', '26', '所属医院');
INSERT INTO `mcolumn` VALUES ('7', 'class_id', '26', '预约科室');
INSERT INTO `mcolumn` VALUES ('8', 'area', '26', '所属区域');
INSERT INTO `mcolumn` VALUES ('9', 'cost', '26', '消费');
INSERT INTO `mcolumn` VALUES ('10', 'order_date', '26', '预约日期');
INSERT INTO `mcolumn` VALUES ('11', 'arrive_date', '26', '到诊日期');
INSERT INTO `mcolumn` VALUES ('12', 'revisit_date', '26', '回访日期');
INSERT INTO `mcolumn` VALUES ('13', 'last_revisit', '26', '最近回访');
INSERT INTO `mcolumn` VALUES ('14', 'revisit_count', '26', '回访次数');
INSERT INTO `mcolumn` VALUES ('15', 'is_arrive', '26', '是否到院');
INSERT INTO `mcolumn` VALUES ('16', 'is_return', '26', '是否回访');
INSERT INTO `mcolumn` VALUES ('17', 'level', '26', '等级');
INSERT INTO `mcolumn` VALUES ('18', 'user_id', '26', '录入者');
INSERT INTO `mcolumn` VALUES ('19', 'name', '29', '患者姓名');
INSERT INTO `mcolumn` VALUES ('20', 'sex', '29', '患者性别');
INSERT INTO `mcolumn` VALUES ('21', 'age', '29', '患者年龄');
INSERT INTO `mcolumn` VALUES ('22', 'phone', '29', '联系电话');
INSERT INTO `mcolumn` VALUES ('23', 'arrive_way', '29', '沟通方式');
INSERT INTO `mcolumn` VALUES ('24', 'hospital_id', '29', '所属医院');
INSERT INTO `mcolumn` VALUES ('25', 'class_id', '29', '预约科室');
INSERT INTO `mcolumn` VALUES ('26', 'cost', '29', '消费');
INSERT INTO `mcolumn` VALUES ('27', 'user_id', '29', '录入者');
INSERT INTO `mcolumn` VALUES ('28', 'order_date', '29', '预约日期');
INSERT INTO `mcolumn` VALUES ('29', 'arrive_date', '29', '到诊日期');
INSERT INTO `mcolumn` VALUES ('30', 'revisit_date', '29', '回访日期');
INSERT INTO `mcolumn` VALUES ('31', 'is_arrive', '29', '是否到院');
INSERT INTO `mcolumn` VALUES ('32', 'is_return', '29', '是否回访');
INSERT INTO `mcolumn` VALUES ('33', 'check_item', '29', '检查');
INSERT INTO `mcolumn` VALUES ('34', 'operation', '29', '手术');
INSERT INTO `mcolumn` VALUES ('35', 'medicine', '29', '药物');
INSERT INTO `mcolumn` VALUES ('36', 'treatment', '29', '疗程');
INSERT INTO `mcolumn` VALUES ('37', 'info', '29', '咨询备注');
INSERT INTO `mcolumn` VALUES ('38', 'dialog', '29', '对话内容');
INSERT INTO `mcolumn` VALUES ('39', 'message', '29', '回访跟踪');
INSERT INTO `mcolumn` VALUES ('40', 'name', '91', '姓名');
INSERT INTO `mcolumn` VALUES ('41', 'sex', '91', '性别');
INSERT INTO `mcolumn` VALUES ('42', 'age', '91', '年龄');
INSERT INTO `mcolumn` VALUES ('43', 'phone', '91', '联系方式');
INSERT INTO `mcolumn` VALUES ('44', 'arrive_way', '91', '沟通方式');
INSERT INTO `mcolumn` VALUES ('45', 'hospital_id', '91', '所属医院');
INSERT INTO `mcolumn` VALUES ('46', 'class_id', '91', '预约科室');
INSERT INTO `mcolumn` VALUES ('47', 'area', '91', '所属区域');
INSERT INTO `mcolumn` VALUES ('48', 'created', '91', '录入时间');
INSERT INTO `mcolumn` VALUES ('49', 'order_date', '91', '预约日期');
INSERT INTO `mcolumn` VALUES ('50', 'arrive_date', '91', '到诊日期');
INSERT INTO `mcolumn` VALUES ('51', 'revisit_date', '91', '回访日期');
INSERT INTO `mcolumn` VALUES ('52', 'last_revisit', '91', '最近回访');
INSERT INTO `mcolumn` VALUES ('53', 'revisit_count', '91', '回访次数');
INSERT INTO `mcolumn` VALUES ('54', 'is_return', '91', '是否回访');
INSERT INTO `mcolumn` VALUES ('55', 'level', '91', '等级');
INSERT INTO `mcolumn` VALUES ('56', 'user_id', '91', '录入者');
INSERT INTO `mcolumn` VALUES ('57', 'name', '28', '患者姓名');
INSERT INTO `mcolumn` VALUES ('58', 'sex', '28', '患者性别');
INSERT INTO `mcolumn` VALUES ('59', 'age', '28', '患者年龄');
INSERT INTO `mcolumn` VALUES ('60', 'phone', '28', '联系电话');
INSERT INTO `mcolumn` VALUES ('61', 'hospital_id', '28', '所属医院');
INSERT INTO `mcolumn` VALUES ('62', 'class_id', '28', '预约科室');
INSERT INTO `mcolumn` VALUES ('63', 'doctor_id', '28', '接诊医生');
INSERT INTO `mcolumn` VALUES ('64', 'arrive_way', '28', '沟通方式');
INSERT INTO `mcolumn` VALUES ('65', 'user_id', '28', '录入者');
INSERT INTO `mcolumn` VALUES ('66', 'area', '28', '所属区域');
INSERT INTO `mcolumn` VALUES ('67', 'booking_num', '28', '预约号');
INSERT INTO `mcolumn` VALUES ('68', 'cost', '28', '消费');
INSERT INTO `mcolumn` VALUES ('69', 'order_date', '28', '预约日期');
INSERT INTO `mcolumn` VALUES ('70', 'arrive_date', '28', '到诊日期');
INSERT INTO `mcolumn` VALUES ('71', 'revisit_date', '28', '回访日期');
INSERT INTO `mcolumn` VALUES ('72', 'level', '28', '等级');
INSERT INTO `mcolumn` VALUES ('73', 'check_item', '28', '检查');
INSERT INTO `mcolumn` VALUES ('74', 'operation', '28', '手术');
INSERT INTO `mcolumn` VALUES ('75', 'medicine', '28', '药物');
INSERT INTO `mcolumn` VALUES ('76', 'treatment', '28', '疗程');
INSERT INTO `mcolumn` VALUES ('77', 'info', '28', '咨询备注');
INSERT INTO `mcolumn` VALUES ('78', 'dialog', '28', '对话内容');
INSERT INTO `mcolumn` VALUES ('79', 'name', '27', '患者姓名');
INSERT INTO `mcolumn` VALUES ('80', 'sex', '27', '患者性别');
INSERT INTO `mcolumn` VALUES ('81', 'age', '27', '患者年龄');
INSERT INTO `mcolumn` VALUES ('82', 'phone', '27', '联系电话');
INSERT INTO `mcolumn` VALUES ('83', 'area', '27', '所属区域');
INSERT INTO `mcolumn` VALUES ('84', 'cost', '27', '消费');
INSERT INTO `mcolumn` VALUES ('85', 'arrive_way', '27', '沟通方式');
INSERT INTO `mcolumn` VALUES ('86', 'hospital_id', '27', '所属医院');
INSERT INTO `mcolumn` VALUES ('87', 'class_id', '27', '预约科室');
INSERT INTO `mcolumn` VALUES ('88', 'doctor_id', '27', '接诊医生');
INSERT INTO `mcolumn` VALUES ('89', 'is_arrive', '27', '是否到院');
INSERT INTO `mcolumn` VALUES ('90', 'is_return', '27', '是否回访');
INSERT INTO `mcolumn` VALUES ('91', 'user_id', '27', '录入者');
INSERT INTO `mcolumn` VALUES ('92', 'revisiter', '27', '最近回访人');
INSERT INTO `mcolumn` VALUES ('93', 'created', '27', '录入时间');
INSERT INTO `mcolumn` VALUES ('94', 'order_date', '27', '预约日期');
INSERT INTO `mcolumn` VALUES ('95', 'arrive_date', '27', '到诊日期');
INSERT INTO `mcolumn` VALUES ('96', 'revisit_date', '27', '回访日期');
INSERT INTO `mcolumn` VALUES ('97', 'booking_num', '27', '预约号');
INSERT INTO `mcolumn` VALUES ('98', 'level', '27', '等级');
INSERT INTO `mcolumn` VALUES ('99', 'check_item', '27', '检查');
INSERT INTO `mcolumn` VALUES ('100', 'operation', '27', '手术');
INSERT INTO `mcolumn` VALUES ('101', 'medicine', '27', '药物');
INSERT INTO `mcolumn` VALUES ('102', 'treatment', '27', '疗程');
INSERT INTO `mcolumn` VALUES ('103', 'info', '27', '咨询备注');
INSERT INTO `mcolumn` VALUES ('104', 'dialog', '27', '对话内容');
INSERT INTO `mcolumn` VALUES ('105', 'message', '27', '回访信息');
INSERT INTO `mcolumn` VALUES ('106', 'name', '92', '患者姓名');
INSERT INTO `mcolumn` VALUES ('107', 'sex', '92', '患者性别');
INSERT INTO `mcolumn` VALUES ('108', 'age', '92', '患者年龄');
INSERT INTO `mcolumn` VALUES ('109', 'phone', '92', '联系电话');
INSERT INTO `mcolumn` VALUES ('110', 'arrive_way', '92', '沟通方式');
INSERT INTO `mcolumn` VALUES ('111', 'hospital_id', '92', '所属医院');
INSERT INTO `mcolumn` VALUES ('112', 'class_id', '92', '预约科室');
INSERT INTO `mcolumn` VALUES ('113', 'cost', '92', '消费');
INSERT INTO `mcolumn` VALUES ('114', 'user_id', '92', '录入者');
INSERT INTO `mcolumn` VALUES ('115', 'order_date', '92', '预约日期');
INSERT INTO `mcolumn` VALUES ('116', 'arrive_date', '92', '到诊日期');
INSERT INTO `mcolumn` VALUES ('117', 'revisit_date', '92', '回访日期');
INSERT INTO `mcolumn` VALUES ('118', 'is_arrive', '92', '是否到院');
INSERT INTO `mcolumn` VALUES ('119', 'is_return', '92', '是否回访');
INSERT INTO `mcolumn` VALUES ('120', 'check_item', '92', '检查');
INSERT INTO `mcolumn` VALUES ('121', 'operation', '92', '手术');
INSERT INTO `mcolumn` VALUES ('122', 'medicine', '92', '药物');
INSERT INTO `mcolumn` VALUES ('123', 'treatment', '92', '疗程');
INSERT INTO `mcolumn` VALUES ('124', 'info', '92', '咨询备注');
INSERT INTO `mcolumn` VALUES ('125', 'dialog', '92', '对话内容');
INSERT INTO `mcolumn` VALUES ('126', 'message', '92', '回访跟踪');
INSERT INTO `mcolumn` VALUES ('128', 'area', '29', '所属区域');
INSERT INTO `mcolumn` VALUES ('129', 'booking_num', '29', '预约号');
INSERT INTO `mcolumn` VALUES ('130', 'level', '29', '等级');
INSERT INTO `mcolumn` VALUES ('131', 'doctor_id', '29', '接诊医生');
INSERT INTO `mcolumn` VALUES ('132', 'created', '26', '录入时间');
INSERT INTO `mcolumn` VALUES ('133', 'qq', '26', 'QQ');
INSERT INTO `mcolumn` VALUES ('134', 'weichat', '26', '微信');
INSERT INTO `mcolumn` VALUES ('135', 'qq', '27', 'QQ');
INSERT INTO `mcolumn` VALUES ('136', 'weichat', '27', '微信');
INSERT INTO `mcolumn` VALUES ('137', 'qq', '28', 'QQ');
INSERT INTO `mcolumn` VALUES ('138', 'weichat', '28', '微信');
INSERT INTO `mcolumn` VALUES ('139', 'qq', '29', 'QQ');
INSERT INTO `mcolumn` VALUES ('140', 'weichat', '29', '微信');
INSERT INTO `mcolumn` VALUES ('141', 'QQ', '91', 'qq');
INSERT INTO `mcolumn` VALUES ('142', 'weichat', '91', '微信');
INSERT INTO `mcolumn` VALUES ('143', 'is_arrive', '28', '是否到院');
INSERT INTO `mcolumn` VALUES ('144', 'is_return', '28', '是否回访');
INSERT INTO `mcolumn` VALUES ('145', 'booking_num', '26', '预约号');
INSERT INTO `mcolumn` VALUES ('146', 'doctor_id', '26', '接诊医生');

-- ----------------------------
-- Table structure for `method`
-- ----------------------------
DROP TABLE IF EXISTS `method`;
CREATE TABLE `method` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) NOT NULL COMMENT '系统方法名',
  `model_id` int(11) NOT NULL COMMENT '系统模型ID',
  `info` char(60) DEFAULT NULL COMMENT '系统方法概述',
  PRIMARY KEY (`id`),
  KEY `k_moid` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COMMENT='系统方法表';

-- ----------------------------
-- Records of method
-- ----------------------------
INSERT INTO `method` VALUES ('1', 'index', '2', '系统模块列表');
INSERT INTO `method` VALUES ('2', 'add', '2', '系统模块添加');
INSERT INTO `method` VALUES ('3', 'edit', '2', '系统模块编辑');
INSERT INTO `method` VALUES ('4', 'save', '2', '系统模块保存');
INSERT INTO `method` VALUES ('5', 'delete', '2', '系统模块删除');
INSERT INTO `method` VALUES ('6', 'add', '3', '系统方法添加');
INSERT INTO `method` VALUES ('7', 'edit', '3', '系统方法编辑');
INSERT INTO `method` VALUES ('8', 'save', '3', '系统方法保存');
INSERT INTO `method` VALUES ('9', 'save_batch', '3', '系统方法批量保存');
INSERT INTO `method` VALUES ('10', 'delete', '3', '系统方法删除');
INSERT INTO `method` VALUES ('11', 'index', '4', '系统权限列表');
INSERT INTO `method` VALUES ('12', 'view', '4', '系统权限查看');
INSERT INTO `method` VALUES ('13', 'edit', '4', '系统权限设置');
INSERT INTO `method` VALUES ('14', 'save', '4', '系统权限保存');
INSERT INTO `method` VALUES ('15', 'index', '5', '系统用户组列表');
INSERT INTO `method` VALUES ('16', 'add', '5', '系统用户组添加');
INSERT INTO `method` VALUES ('17', 'edit', '5', '系统用户组编辑');
INSERT INTO `method` VALUES ('18', 'save', '5', '系统用户组保存');
INSERT INTO `method` VALUES ('19', 'delete', '5', '系统用户组删除');
INSERT INTO `method` VALUES ('20', 'index', '6', '系统用户列表');
INSERT INTO `method` VALUES ('21', 'view', '6', '系统用户查看');
INSERT INTO `method` VALUES ('22', 'add', '6', '系统用户添加');
INSERT INTO `method` VALUES ('23', 'edit', '6', '系统用户编辑');
INSERT INTO `method` VALUES ('24', 'save', '6', '系统用户保存');
INSERT INTO `method` VALUES ('25', 'delete', '6', '系统用户删除');
INSERT INTO `method` VALUES ('26', 'index', '7', '预约列表');
INSERT INTO `method` VALUES ('27', 'view', '7', '预约查看');
INSERT INTO `method` VALUES ('28', 'add', '7', '预约添加');
INSERT INTO `method` VALUES ('29', 'edit', '7', '预约编辑');
INSERT INTO `method` VALUES ('30', 'save', '7', '预约保存');
INSERT INTO `method` VALUES ('31', 'delete', '7', '预约删除');
INSERT INTO `method` VALUES ('32', 'index', '8', '医院列表');
INSERT INTO `method` VALUES ('33', 'add', '8', '医院添加');
INSERT INTO `method` VALUES ('34', 'edit', '8', '医院编辑');
INSERT INTO `method` VALUES ('35', 'save', '8', '医院保存');
INSERT INTO `method` VALUES ('36', 'delete', '8', '医院删除');
INSERT INTO `method` VALUES ('37', 'index', '9', '科室列表');
INSERT INTO `method` VALUES ('38', 'add', '9', '科室添加');
INSERT INTO `method` VALUES ('39', 'edit', '9', '科室编辑');
INSERT INTO `method` VALUES ('40', 'save', '9', '科室保存');
INSERT INTO `method` VALUES ('41', 'delete', '9', '科室删除');
INSERT INTO `method` VALUES ('42', 'index', '10', '医生列表');
INSERT INTO `method` VALUES ('43', 'add', '10', '医生添加');
INSERT INTO `method` VALUES ('44', 'edit', '10', '医生编辑');
INSERT INTO `method` VALUES ('45', 'save', '10', '医生保存');
INSERT INTO `method` VALUES ('46', 'delete', '10', '医生删除');
INSERT INTO `method` VALUES ('47', 'index', '11', '到诊方式列表');
INSERT INTO `method` VALUES ('48', 'add', '11', '到诊方式添加');
INSERT INTO `method` VALUES ('49', 'edit', '11', '到诊方式编辑');
INSERT INTO `method` VALUES ('50', 'save', '11', '到诊方式保存');
INSERT INTO `method` VALUES ('51', 'delete', '11', '到诊方式删除');
INSERT INTO `method` VALUES ('52', 'index', '12', '区域列表');
INSERT INTO `method` VALUES ('53', 'add', '12', '区域添加');
INSERT INTO `method` VALUES ('54', 'edit', '12', '区域编辑');
INSERT INTO `method` VALUES ('55', 'save', '12', '区域保存');
INSERT INTO `method` VALUES ('56', 'delete', '12', '区域删除');
INSERT INTO `method` VALUES ('57', 'notice', '1', '未回访提示');
INSERT INTO `method` VALUES ('68', 'variable_page', '7', '患者回访页');
INSERT INTO `method` VALUES ('69', 'overview', '13', '简要统计');
INSERT INTO `method` VALUES ('70', 'distributes', '13', '患者日期分布图');
INSERT INTO `method` VALUES ('71', 'historys', '13', '医院历史业绩');
INSERT INTO `method` VALUES ('72', 'areas', '13', '患者来源分布');
INSERT INTO `method` VALUES ('73', 'others', '13', '其它分布图');
INSERT INTO `method` VALUES ('76', 'index', '15', '备份列表');
INSERT INTO `method` VALUES ('77', 'backup', '15', '数据库备份');
INSERT INTO `method` VALUES ('78', 'download', '15', '数据库下载');
INSERT INTO `method` VALUES ('79', 'unlink', '15', '数据库删除');
INSERT INTO `method` VALUES ('80', 'export', '7', '导出Excel报表');
INSERT INTO `method` VALUES ('81', 'analysis_swt', '14', '商务通报表');
INSERT INTO `method` VALUES ('82', 'deseases', '13', '病种转化率');
INSERT INTO `method` VALUES ('83', 'analysis_keyword', '14', '搜索词报表');
INSERT INTO `method` VALUES ('84', 'analysis_account', '14', '账户报表');
INSERT INTO `method` VALUES ('85', 'analysis', '14', '转化率分析图表');
INSERT INTO `method` VALUES ('86', 'analysis_swt_insert', '14', '商务通数据插入');
INSERT INTO `method` VALUES ('87', 'analysis_keyword_insert', '14', '搜索词数据插入');
INSERT INTO `method` VALUES ('88', 'analysis_account_insert', '14', '账户数据插入');
INSERT INTO `method` VALUES ('89', 'fileupload', '14', 'Excel文件上传');
INSERT INTO `method` VALUES ('90', 'delete_file', '14', 'Excel文件删除');
INSERT INTO `method` VALUES ('91', 'revisit', '7', '患者回访列表');
INSERT INTO `method` VALUES ('92', 'revisit_edit', '7', '患者回访');
INSERT INTO `method` VALUES ('93', 'revisit_record', '7', '查看回访记录');
INSERT INTO `method` VALUES ('94', 'revisit_delete', '7', '删除回访记录');
INSERT INTO `method` VALUES ('95', 'notice', '6', '系统用户消息提醒');
INSERT INTO `method` VALUES ('96', 'edit_batch', '17', '系统字段批量编辑');
INSERT INTO `method` VALUES ('109', 'index', '16', '日志列表');
INSERT INTO `method` VALUES ('98', 'index', '3', '系统方法列表');
INSERT INTO `method` VALUES ('99', 'edit_batch', '3', '系统方法批量编辑');
INSERT INTO `method` VALUES ('100', 'add', '17', '系统字段添加');
INSERT INTO `method` VALUES ('101', 'edit_batch', '17', '系统字段批量编辑');
INSERT INTO `method` VALUES ('102', 'save', '17', '系统字段保存');
INSERT INTO `method` VALUES ('103', 'save_batch', '17', '系统字段批量保存');
INSERT INTO `method` VALUES ('104', 'delete', '17', '系统字段删除');
INSERT INTO `method` VALUES ('105', 'purviews_column', '4', '系统方法字段显示');
INSERT INTO `method` VALUES ('106', 'save_purviews_column', '4', '系统方法字段保存');
INSERT INTO `method` VALUES ('107', 'add_son', '9', '添加子科室');
INSERT INTO `method` VALUES ('108', 'fileupload', '7', 'html对话上传');
INSERT INTO `method` VALUES ('110', 'delete', '16', '日志删除');
INSERT INTO `method` VALUES ('112', 'modify_record', '16', '查看修改详细');
INSERT INTO `method` VALUES ('113', 'index', '18', '短信模块列表');
INSERT INTO `method` VALUES ('114', 'smsinscribe', '18', '短信落款设置');
INSERT INTO `method` VALUES ('115', 'smsaccount', '18', '短信接口设置');
INSERT INTO `method` VALUES ('116', 'save_smsaccount', '18', '短信接口设置保存');
INSERT INTO `method` VALUES ('117', 'revisit_sms', '18', '患者短信回访');
INSERT INTO `method` VALUES ('118', 'send_sms', '18', '患者短信回访发送');
INSERT INTO `method` VALUES ('119', 'add_sms', '18', '新增短信');
INSERT INTO `method` VALUES ('120', 'edit_sms', '18', '编辑短信');
INSERT INTO `method` VALUES ('121', 'save_sms', '18', '保存短信');
INSERT INTO `method` VALUES ('122', 'delete_sms', '18', '删除短信');
INSERT INTO `method` VALUES ('123', 'add_inscribe', '18', '新增短信落款');
INSERT INTO `method` VALUES ('124', 'edit_inscribe', '18', '编辑短信落款');
INSERT INTO `method` VALUES ('125', 'save_inscribe', '18', '保存短信落款');
INSERT INTO `method` VALUES ('126', 'delete_inscribe', '18', '删除短信落款');
INSERT INTO `method` VALUES ('127', 'revisit_sms_batch', '18', '短信回访群发');
INSERT INTO `method` VALUES ('128', 'send_sms_batch', '18', '短信回访群发发送');
INSERT INTO `method` VALUES ('129', 'index', '19', '系统设置列表');
INSERT INTO `method` VALUES ('130', 'save', '19', '系统设置保存');

-- ----------------------------
-- Table structure for `model`
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) NOT NULL COMMENT '模型名称',
  `info` char(60) DEFAULT NULL COMMENT '模型概述',
  `sort` int(5) NOT NULL DEFAULT '0' COMMENT '序排',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='系统模型表';

-- ----------------------------
-- Records of model
-- ----------------------------
INSERT INTO `model` VALUES ('1', 'home', '系统主页', '1');
INSERT INTO `model` VALUES ('2', 'model', '系统模块', '2');
INSERT INTO `model` VALUES ('3', 'method', '系统方法', '3');
INSERT INTO `model` VALUES ('4', 'gauthority', '系统权限', '5');
INSERT INTO `model` VALUES ('5', 'group', '系统用户组', '6');
INSERT INTO `model` VALUES ('6', 'user', '系统用户', '7');
INSERT INTO `model` VALUES ('7', 'orders', '预约管理', '8');
INSERT INTO `model` VALUES ('8', 'hospital', '医院管理', '9');
INSERT INTO `model` VALUES ('9', 'department', '科室管理', '10');
INSERT INTO `model` VALUES ('10', 'doctor', '专家管理', '11');
INSERT INTO `model` VALUES ('11', 'arriveway', '到诊方式', '12');
INSERT INTO `model` VALUES ('12', 'area', '区域管理', '13');
INSERT INTO `model` VALUES ('13', 'charts', '图表统计', '14');
INSERT INTO `model` VALUES ('14', 'bidding', '数据分析', '15');
INSERT INTO `model` VALUES ('15', 'databackup', '备份/还原', '16');
INSERT INTO `model` VALUES ('16', 'logs', '日志', '19');
INSERT INTO `model` VALUES ('17', 'mcolumn', '系统字段', '4');
INSERT INTO `model` VALUES ('18', 'sms', '短信模块', '17');
INSERT INTO `model` VALUES ('19', 'sysconfig', '系统设置', '18');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '预约ID',
  `name` char(15) NOT NULL COMMENT '患者名字',
  `sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '者患性别（男：1 女：0）',
  `age` int(2) DEFAULT '0' COMMENT '患者年龄',
  `phone` char(15) DEFAULT NULL COMMENT '患者电话',
  `qq` char(15) DEFAULT NULL COMMENT 'QQ',
  `weichat` char(30) DEFAULT NULL COMMENT '微信',
  `revisiter` int(11) DEFAULT '0' COMMENT '访回人员ID',
  `cost` decimal(9,2) DEFAULT '0.00' COMMENT '用费',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '咨询人员ID',
  `hospital_id` int(11) DEFAULT '0' COMMENT '医院ID',
  `doctor_id` int(11) DEFAULT '0' COMMENT '接诊专家ID',
  `class_id` int(11) DEFAULT '0' COMMENT '预约科室ID',
  `area_id` varchar(6) DEFAULT NULL COMMENT '县级码',
  `area` varchar(200) DEFAULT NULL COMMENT '地区（用IP接口录入）',
  `arrive_way` int(11) DEFAULT '0' COMMENT '沟通方式',
  `is_arrive` tinyint(2) DEFAULT '2' COMMENT '是否到院（未到院：0 已到院：1 待定：2）',
  `is_return` tinyint(2) DEFAULT '0' COMMENT '是否回访（未回访：0 已回访：1）',
  `ip` varchar(15) DEFAULT NULL COMMENT 'IP地址',
  `created` int(11) DEFAULT '0' COMMENT '录入时间',
  `order_date` int(11) DEFAULT '0' COMMENT '预约日期',
  `arrive_date` int(11) DEFAULT '0' COMMENT '到诊日期',
  `revisit_date` int(11) DEFAULT '0' COMMENT '访回日期',
  `check_item` varchar(200) DEFAULT NULL COMMENT '查检',
  `operation` varchar(200) DEFAULT NULL COMMENT '手术',
  `medicine` varchar(200) DEFAULT NULL COMMENT '物药',
  `treatment` varchar(200) DEFAULT NULL COMMENT '疗程',
  `booking_num` varchar(10) DEFAULT NULL COMMENT '预约号',
  `level` char(1) DEFAULT 'F' COMMENT '等级',
  `last_revisit` int(11) DEFAULT '0' COMMENT '后最一次回访时间',
  `revisit_count` int(11) DEFAULT '0' COMMENT '访回次数',
  `dialog_file` char(60) DEFAULT NULL COMMENT '对话文件上传路径',
  PRIMARY KEY (`id`),
  KEY `k_name` (`name`),
  KEY `k_phone` (`phone`),
  KEY `k_uid` (`user_id`),
  KEY `k_hid` (`hospital_id`),
  KEY `k_did` (`doctor_id`),
  KEY `k_cid` (`class_id`),
  KEY `k_areaid` (`area_id`),
  KEY `k_aid` (`arrive_way`),
  KEY `k_booknum` (`booking_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='预约表';

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for `ordersdialog`
-- ----------------------------
DROP TABLE IF EXISTS `ordersdialog`;
CREATE TABLE `ordersdialog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(11) NOT NULL COMMENT '预约表ID',
  `dialog` text COMMENT '对话内容（加密）',
  PRIMARY KEY (`id`),
  KEY `fk_orderid_dialog` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='预约对话表';

-- ----------------------------
-- Records of ordersdialog
-- ----------------------------

-- ----------------------------
-- Table structure for `ordersinfo`
-- ----------------------------
DROP TABLE IF EXISTS `ordersinfo`;
CREATE TABLE `ordersinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(11) NOT NULL COMMENT '预约表ID',
  `info` text COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `fk_orderid_info` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='预约备注表';

-- ----------------------------
-- Records of ordersinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `ordersrevisit`
-- ----------------------------
DROP TABLE IF EXISTS `ordersrevisit`;
CREATE TABLE `ordersrevisit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(11) NOT NULL COMMENT '预约表ID',
  `message` text COMMENT '回访信息（加密）',
  `created` int(11) DEFAULT '0' COMMENT '录入时间',
  `userid` int(11) DEFAULT '0' COMMENT '访回人员ID',
  PRIMARY KEY (`id`),
  KEY `fk_orderid_revisit` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='患者回访表';

-- ----------------------------
-- Records of ordersrevisit
-- ----------------------------

-- ----------------------------
-- Table structure for `pwcolumn`
-- ----------------------------
DROP TABLE IF EXISTS `pwcolumn`;
CREATE TABLE `pwcolumn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `method_id` int(11) NOT NULL COMMENT '系统方法ID',
  `group_id` int(11) NOT NULL COMMENT '用户组ID',
  `action` char(40) DEFAULT NULL COMMENT '访问权限动作',
  `columns` text COMMENT '用户组字段',
  PRIMARY KEY (`id`),
  KEY `k_action` (`action`),
  KEY `k_pmeid` (`method_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统方法字段表';

-- ----------------------------
-- Records of pwcolumn
-- ----------------------------

-- ----------------------------
-- Table structure for `pwgroupid`
-- ----------------------------
DROP TABLE IF EXISTS `pwgroupid`;
CREATE TABLE `pwgroupid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(11) NOT NULL DEFAULT '0' COMMENT '用户组ID',
  `view_groupid` int(11) NOT NULL DEFAULT '0' COMMENT '授权用户组ID',
  PRIMARY KEY (`id`),
  KEY `k_gid` (`groupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组授权表';

-- ----------------------------
-- Records of pwgroupid
-- ----------------------------

-- ----------------------------
-- Table structure for `pwhospital`
-- ----------------------------
DROP TABLE IF EXISTS `pwhospital`;
CREATE TABLE `pwhospital` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `hospital_id` int(11) NOT NULL DEFAULT '0' COMMENT '院医ID',
  PRIMARY KEY (`id`),
  KEY `k_uid` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户所属医院表';

-- ----------------------------
-- Records of pwhospital
-- ----------------------------

-- ----------------------------
-- Table structure for `sms_account`
-- ----------------------------
DROP TABLE IF EXISTS `sms_account`;
CREATE TABLE `sms_account` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account` varchar(15) DEFAULT NULL COMMENT '帐号',
  `name` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码 ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sms_account
-- ----------------------------

-- ----------------------------
-- Table structure for `sms_content`
-- ----------------------------
DROP TABLE IF EXISTS `sms_content`;
CREATE TABLE `sms_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `stid` int(10) NOT NULL DEFAULT '0' COMMENT '信息类型ID',
  `info` char(255) DEFAULT NULL COMMENT '信息内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=388 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sms_content
-- ----------------------------
INSERT INTO `sms_content` VALUES ('1', '4', '传说薰衣草拥有四片翠绿的叶子：第一片叶子是信仰，第二片叶子是希望，第三片叶子是爱情，第四片叶子是幸运。送你一棵薰衣草，愿你一生幸福！');
INSERT INTO `sms_content` VALUES ('2', '4', '春风洋溢你；家人关心你；爱滋润你；财神系着你；朋友忠于你；我这儿祝福你；幸运之星永远照着你。');
INSERT INTO `sms_content` VALUES ('3', '4', '春有百花，秋看月，夏有凉风，冬有雪，心中若无烦恼事，便是此生好时节！祝愿你：时时幸福，快乐永远！');
INSERT INTO `sms_content` VALUES ('4', '4', '给你个节日就快乐，给你点阳光就灿烂，给你些问候就温暖，给你顶高帽就发飘。祝生活愉快,万事如意！');
INSERT INTO `sms_content` VALUES ('5', '4', '今天变天,当心着凉;注意身体,吃么么香;凉天添衣,少吃冰棒;吃香睡香,身体倍棒!');
INSERT INTO `sms_content` VALUES ('6', '4', '今天夜间到明天白天，你的手机将出现鹅毛般的祝福，你的心情将以晴为主，受气氛影响，笑声将席卷你周围，预计一周内将不断刮顺风！');
INSERT INTO `sms_content` VALUES ('7', '4', '漫漫长路独自征 幸得与我共途中 携手同行人生路 彼此相挽历磨难 感谢多年共风雨 风雨再度见真心。');
INSERT INTO `sms_content` VALUES ('8', '4', '你还好吗？很久没有联系，工作别太累，注意休息。');
INSERT INTO `sms_content` VALUES ('9', '4', '朋友总是心连心，知心朋友值千金。灯光之下思贤友，小小讯儿传佳音。望友见讯如见人，时刻勿忘朋友心。祝心情愉快！');
INSERT INTO `sms_content` VALUES ('10', '4', '送你一份100%纯情奶糖:成分=真心+思念+快乐,有效期=一生,营养=温馨+幸福+感动,制造商：真心朋友！祝你万事如意！');
INSERT INTO `sms_content` VALUES ('11', '4', '送你一份特制美食，成分：真心、思念、快乐。营养：温馨、幸福。制造商：你的朋友。有效期：一生。祝你万事如意！');
INSERT INTO `sms_content` VALUES ('12', '4', '蔚蓝的天空，壮阔的海洋，带来往日的温馨回忆；乘风破浪，让我们掌握自己生活之舵，开拓远大的前程！');
INSERT INTO `sms_content` VALUES ('13', '4', '我怕明天起的晚，所以现在就预订了明早第一缕阳光给你，祝你平安！预订了第一阵晨风给你，祝你一帆风顺！预订了第一声鸟鸣给你，祝你天天快乐！');
INSERT INTO `sms_content` VALUES ('14', '4', '我托空气为邮差,把热腾腾的问候装订成包裹,印上真心为邮戳,37度恒温快递,收件人是你,真心祝你天天快乐！');
INSERT INTO `sms_content` VALUES ('15', '4', '我托空气为邮差,把热腾腾的问候装订成包裹,印上真心为邮戳,37度恒温快递,收件人是你,真心祝你天天快乐！');
INSERT INTO `sms_content` VALUES ('16', '4', '我问过烦恼了，它根本不爱你，还说永远不理你，让我转告你不要自作多情！还有，健康让我带封情书给你：它对你一生不变！');
INSERT INTO `sms_content` VALUES ('17', '4', '一朵花采了许久，枯萎也舍不得丢；一把伞撑了很久，雨停也想不起收；一条路走了很久，天黑也走不到头；一句话等了好久：祝天天快乐！');
INSERT INTO `sms_content` VALUES ('18', '4', '荧荧的背景灯照耀你的脸颊，虽然微弱，却可以延伸很远，看完这条消息，许个心愿，让满天的星都为你祝福！');
INSERT INTO `sms_content` VALUES ('19', '4', '愿好运像地雷，时常给你踩到；厄运像流星雨，永远淋你不到；财富像垃圾，随处可以捡到；幸福伴你一生像苍蝇一样盯着你不放！');
INSERT INTO `sms_content` VALUES ('20', '4', '愿我的祝福变成你远征时解渴的清泉，烦恼时甜蜜的安慰，胜利时庆功的鲜花。');
INSERT INTO `sms_content` VALUES ('21', '4', '在繁忙的工作中请您接受我最真挚的诚意和祝福；愿我的祝福消除一天工作带来的疲劳；愿幸福和快乐伴随着您生活的每一天。');
INSERT INTO `sms_content` VALUES ('22', '4', '在以前的工作中，贵方给予我们以充分的理解和有力支持，对此表示深深的敬意和真诚的感谢，让我们共创美好的明天！');
INSERT INTO `sms_content` VALUES ('23', '4', '祝你：位高权重责任轻，钱多事少离家近，每日睡到天大亮，工资领到手抽筋，手下花钱你收礼，别人加班你加薪！');
INSERT INTO `sms_content` VALUES ('24', '4', '祝你少吃盐多吃醋；少吃肉多吃菜；少吃糖多水果；少生气多微笑；少忧伤多睡觉。');
INSERT INTO `sms_content` VALUES ('25', '4', '祝你致富踏上万宝路、事业登上红塔山、情人赛过阿诗玛、财源遍布大中华。');
INSERT INTO `sms_content` VALUES ('26', '4', '茶，要喝浓的，直到淡而无味；酒，要喝醉的，直到不能醒来的；人，要深爱的，要下辈子继续爱的；朋友，要像你这样的。');
INSERT INTO `sms_content` VALUES ('27', '10', '“瑞雪兆丰年”。愿片片洁白美丽的雪花，带着我良好的祝愿，飞到您的身边，祝您新年如意，事业发展！');
INSERT INTO `sms_content` VALUES ('28', '10', '春风洋溢着你，家人关心你，爱滋润着你，财神系着你，朋友忠于你，我这祝福你，幸运之星永远照着你，新年快乐！');
INSERT INTO `sms_content` VALUES ('29', '10', '聚喜玛拉雅之阳光,拢天涯海角之清风,拮冈底斯山之祝福,吸比尔盖茨之财气,作为礼物送给你,祝你新年快乐!');
INSERT INTO `sms_content` VALUES ('30', '10', '亲爱的朋友，你现在过得还好吗？在这新春佳节之际，远方的我不能和你共聚互诉往事。仅以此信息真诚祝愿你：新春快乐！爱情，事业双丰收');
INSERT INTO `sms_content` VALUES ('31', '10', '清蒸鱼，糖醋鱼，水煮鱼，酸菜鱼...鱼乐无穷，如鱼得水，鱼目混珠，尔鱼我炸，鱼无伦次，娱乐你我，祝你新年快乐年年有余！');
INSERT INTO `sms_content` VALUES ('32', '10', '请你打开窗，让新春的风吹进你的屋子，让新春的雪飞进你的屋子，让我新春的祝愿，飘进你的心坎，祝你新年快乐！');
INSERT INTO `sms_content` VALUES ('33', '10', '生活是大自然所赐与的精神上的充实丰硕感，何必在意每个挫折，我的朋友，在这辞旧迎新的日子里，我在深深的祝福着你：新年快乐！');
INSERT INTO `sms_content` VALUES ('34', '10', '想念的话，说也说不完；关怀的心，永远不改变；真挚友谊，永远不会忘，愿我的祝福将你围绕，新年快乐，万事如意！');
INSERT INTO `sms_content` VALUES ('35', '10', '新的一年,你将得到爱情养料的滋润,事业芬芳的熏陶,家庭温暖的呵护,亲友关爱的欣慰,财气萦绕的沉醉,运程正好的满足,绽开百事可乐的微笑.');
INSERT INTO `sms_content` VALUES ('36', '10', '新的一年开启新的希望,新的空白承载新的梦想。拂去岁月之尘,让欢笑和泪水。爱与哀愁在心中凝成一颗厚重的晶莹的琥珀，化做一句真挚祝福：新年快乐！');
INSERT INTO `sms_content` VALUES ('37', '10', '星空中点点闪烁的荧光,环绕着缤纷的绮丽梦想,祝福你今年许下的心愿,都能一一实现在你眼前,祝你佳节温馨喜悦!');
INSERT INTO `sms_content` VALUES ('38', '10', '一家和和睦睦，一年开开心心，一生快快乐乐，一世平平安安，天天精神百倍，月月喜气扬扬，年年财源广进，日日笑口常开。');
INSERT INTO `sms_content` VALUES ('39', '10', '有些事并不因时光流逝而褪去,有些人不因不常见面而忘记,记忆里你是我永远朋友.在这迎新之际,恭祝事业蒸蒸日上，新年万事如意！');
INSERT INTO `sms_content` VALUES ('40', '10', '这一季，有我最深的思念。就让风捎去满心的祝福，缀满你甜蜜的梦境，祝你拥有一个更加灿烂更加辉煌的来年。');
INSERT INTO `sms_content` VALUES ('41', '10', '钟声是我的问候，歌声是我的祝福，雪花是我的贺卡，美酒是我的飞吻，清风是我的拥抱，快乐是我的礼物。新年快乐，我的朋友。');
INSERT INTO `sms_content` VALUES ('42', '10', '祝你新年一帆风顺，二龙腾飞，三羊开泰，四季平安，五福临门，六六大顺，七星高照，八方来财，九九同心，十全十美！');
INSERT INTO `sms_content` VALUES ('43', '10', '祝你在新的一年事业正当午，身体壮如虎，金钱不胜数，干活不辛苦，悠闲像老鼠，浪漫似乐谱，快乐莫你属。');
INSERT INTO `sms_content` VALUES ('44', '10', '祝新年快乐，前程似锦，吉星高照，财运亨通，合家欢乐，飞黄腾达，福如东海，寿比南山！');
INSERT INTO `sms_content` VALUES ('45', '10', '祝愿你在新的一年里，所有的希望都能如愿，所有的梦想都能实现，所有的期待都能出现，所有的付出都能兑现！');
INSERT INTO `sms_content` VALUES ('46', '11', '￥￥￥￥￥￥￥￥￥￥￥￥￥当你收到这些钱的符号时，就表示你已接到财神的祝福，这将预示着你来年一定会大大发财！！');
INSERT INTO `sms_content` VALUES ('47', '11', '茶要浓的,细细品尝；酒要香的,痛快畅饮；爱要真的,轰烈无悔；朋友要知心的,互爱互助,嘿,拿手机的这个就很不错!新年快乐!');
INSERT INTO `sms_content` VALUES ('48', '11', '春风吹绿的大地，夏日湛蓝的天空，秋水倒映的圆月，冬季飞舞的雪花……将缤纷的四季，放在我的手 心里，赠予你并深深地祝福你：新春愉快！');
INSERT INTO `sms_content` VALUES ('49', '11', '春节快乐!万事大吉!合家欢乐!财源广进!恭喜发财!');
INSERT INTO `sms_content` VALUES ('50', '11', '春节你要精神放松,快乐在胸,就象盆儿里一棵葱,对忧烦无动于衷,苦闷不在你心中,来年运程一通百通!');
INSERT INTO `sms_content` VALUES ('51', '11', '春节赠你一棵愿望树,上面结满开心果,幸运梅,甜蜜瓜,富贵枣,温馨李,幸福桃,映红你一年通畅的运程!');
INSERT INTO `sms_content` VALUES ('52', '11', '春节祝你乐开花:美丽胜鲜,浪漫如樱花,吉祥似雪花,运气逢桃花,富贵赛牡丹花,打麻将杠开花!');
INSERT INTO `sms_content` VALUES ('53', '11', '堆积365天的想念,凝聚千丝万缕的柔情,拼却春夏秋冬的痴恋，采撷夜空璀璨的星宿,淘尽碧海千年的珠玑,只为传送给你最精髓的祝愿。春节快乐!');
INSERT INTO `sms_content` VALUES ('54', '11', '过年好！喜迎春！祝您今年中大奖。万事顺！合家欢！愿君如意喜满年。');
INSERT INTO `sms_content` VALUES ('55', '11', '花开花谢，此消彼长，云卷云舒，又是一年。愿时间更替带给你美丽心情，新年快乐！');
INSERT INTO `sms_content` VALUES ('56', '11', '今年新年不送礼,发条短信传给你。健康快乐长伴你,幸福美满粘着你,还有我要告诉你,财神已经盯上你!');
INSERT INTO `sms_content` VALUES ('57', '11', '敲响的是钟声，走过的是岁月，留下的是故事，带来的是希望，盼望的是美好，送来的是祝福，愿您新年快乐。');
INSERT INTO `sms_content` VALUES ('58', '11', '清晨曙光初现，幸福在你身边；中午艳阳高照，微笑在你心间；傍晚日落西山，欢乐随你365天。');
INSERT INTO `sms_content` VALUES ('59', '11', '深深祝福,丝丝情谊,串串思念,化作殷殷祝福,留在你的心田间,祝新年愉快！马到成功！');
INSERT INTO `sms_content` VALUES ('60', '11', '送你一盘鸭,吃了会想家,还有一碟菜,天天有人爱,配上一碗汤,一生永健康,再来一杯酒,爱情会长久,加上一碗饭,恋人永相伴.祝春节快乐！');
INSERT INTO `sms_content` VALUES ('61', '11', '为答谢朋友多年对我的关心特在春节前夕举行酬宾活动!凡我心中有一定地位的人将获得我免费提供的价值人民币一毛的迎春短信一条。恭喜获奖');
INSERT INTO `sms_content` VALUES ('62', '11', '我把新世纪的祝福和希望,悄悄地放在将融的雪被下,让它们,沿着春天的秧苗生长,送给你满年的丰硕与芬芳!');
INSERT INTO `sms_content` VALUES ('63', '11', '辛勤工作了一年,迎了新的一年.新的开始,新的希望;把握新的机遇,带来新的生机,更有那薪的升华');
INSERT INTO `sms_content` VALUES ('64', '11', '新1年，好事接2连3，心情4季如春，生活5颜6色，事业兴旺8达，烦恼9宵云外，10心10意祝福你！');
INSERT INTO `sms_content` VALUES ('65', '11', '新春佳节到，向你问个好，身体倍健康，心情特别好；好运天天交，口味顿顿妙；家里出黄金，墙上长钞票。');
INSERT INTO `sms_content` VALUES ('66', '11', '新年到，祝你：百事可乐！万事芬达！天天哇哈哈！月月乐百事！年年高乐高！心情似雪碧！永远都醒目！');
INSERT INTO `sms_content` VALUES ('67', '11', '新年到了，送你五千万：千万要快乐！千万要健康！千万要平安！千万要知足！千万不要忘记我！');
INSERT INTO `sms_content` VALUES ('68', '11', '新年到了，祝福串成一首诗、一段旋律启开一片温馨的新天地－－－心想事成、万事如意，快乐幸福每一天！');
INSERT INTO `sms_content` VALUES ('69', '11', '新年的钟声即将响起,愿这吉祥的钟声能为您及家人带来平安、幸福、健康和快乐！祝新年快乐、万事如意！');
INSERT INTO `sms_content` VALUES ('70', '11', '新年祝你：一马平川两亿资产山前有路四海逢源五星宾馆六碟一碗七喜临门八面威风九品官员十点上班。');
INSERT INTO `sms_content` VALUES ('71', '11', '雪化了，那是因为我的热情；天晴了，那是因为我的真诚；即使结冰了，那也是因为我祝福的永恒！新春快乐，鸡年吉祥！');
INSERT INTO `sms_content` VALUES ('72', '11', '一帆风顺，双龙戏珠；三阳开泰，四季发财；五福临门，六六大顺；七星捧月，八面春风；九运当头，十全十美；百年好合，千发之桃；万事如意， 恭喜恭喜。');
INSERT INTO `sms_content` VALUES ('73', '11', '一家和和睦睦,一年开开心心。一生快快乐乐,一世平平安安,天天精神百倍,月月喜气扬扬,年年财源广进。祝春节快乐！');
INSERT INTO `sms_content` VALUES ('74', '11', '邮差太懒了,休息不送信,今天由我来当义工,将我的祝福分送给我关心的朋友,愿此时正看着简讯的你,永远快乐,鸡年心情好漾!');
INSERT INTO `sms_content` VALUES ('75', '11', '愿我是一枚爆竹,绽裂的快乐为你的脸庞添一抹笑意；愿我是一盏灯笼,曳动的火光映红你的运程温暖你的心!');
INSERT INTO `sms_content` VALUES ('76', '11', '在新世纪第一次响起的钟声里,我举起杯,任晶莹的思绪,悄悄地伴随钟声飘向你身边,深深地祝福你\"春节快乐\"!');
INSERT INTO `sms_content` VALUES ('77', '11', '在这快乐的新春之夜,让我们共同祈求三件事,一个好朋友,一个好胃口,一个好梦。');
INSERT INTO `sms_content` VALUES ('78', '11', '忠心感谢你在过去一年为公司做出的贡献，祝新年快乐，万事如意！');
INSERT INTO `sms_content` VALUES ('79', '11', '钟声划破宁静，欢乐荡漾四方！新年到了，送礼，太土。请吃，太俗。无论远在天涯，还是近在咫尺， 短信送福：万水千山总见情！事事顺心总如意！');
INSERT INTO `sms_content` VALUES ('80', '11', '祝君新年好！新年新面貌！新年新心情！新年新开始！新年新运气！新朋旧友齐愿你，万事总如意，钱途千万里');
INSERT INTO `sms_content` VALUES ('81', '11', '祝你一家瑞气，二气雍和，三星拱户，四季平安，五星高照，六畜兴旺，总之新年快乐，万事如意！');
INSERT INTO `sms_content` VALUES ('82', '11', '祝你在新的一年里：事业正当午，身体壮如虎，金钱不胜数，干活不辛苦，悠闲像老鼠，浪漫似乐谱，快乐非你莫属！');
INSERT INTO `sms_content` VALUES ('83', '11', '祝愿你在新的一年里，所有的希望都能如愿，所有的梦想都能实现，所有的期待都能出现，所有的付出都能兑现！');
INSERT INTO `sms_content` VALUES ('84', '12', '“橘灯”、“绢灯”、“五彩羊皮灯”、“无骨麦秸灯”、“走马灯”、“孔明灯”灯灯照亮你的未来道路，祝你事事顺心，万事如意！');
INSERT INTO `sms_content` VALUES ('85', '12', '春夜灯花，几处笙歌腾朗月；良宵美景，万家箫管乐丰年。');
INSERT INTO `sms_content` VALUES ('86', '12', '灯火万家，良宵美景；笙歌一曲，盛世佳音。');
INSERT INTO `sms_content` VALUES ('87', '12', '肥藤藤,脚震震,买老猪肉去拜神,吃了猪肉变寿神,看短信息的--祝你元宵吃嘛嘛香,工作愉快!');
INSERT INTO `sms_content` VALUES ('88', '12', '花好月圆,群灯争艳。但这一切都填补不了你的空缺,愿轻风寄去我的相思和祝愿,祝你一生平安,快乐。');
INSERT INTO `sms_content` VALUES ('89', '12', '你是馅我是面不如作个大元宵；你是灯我是纸不如作个大灯笼；你情我愿庆佳节!欢欢喜喜过一生!');
INSERT INTO `sms_content` VALUES ('90', '12', '敲响是钟声，走过的是岁月，留下的是故事，带来的是希望，盼望的是美好送来的是祝福，愿你幸福快乐。');
INSERT INTO `sms_content` VALUES ('91', '12', '三五良宵,花灯吐艳映新春；一年初望,明月生辉度佳节。元宵节快乐!');
INSERT INTO `sms_content` VALUES ('92', '12', '特别的日子，特别的想你，特别灵验的祝福，送给你，祝你万事圆圆，财源广进。');
INSERT INTO `sms_content` VALUES ('93', '12', '天上月儿圆,地上人团圆:元宵佳节过,你我同努力,共创事业辉煌!');
INSERT INTO `sms_content` VALUES ('94', '12', '万户春灯报元夜，一天瑞雪兆丰年。');
INSERT INTO `sms_content` VALUES ('95', '12', '我要用：一缕（情思）一棵（红豆）一勺（蜜糖），月圆十分我会让玉兔送去（*^v^*）我特制的元宵！');
INSERT INTO `sms_content` VALUES ('96', '12', '遥祝你:日圆,月圆,团团圆圆!官源,财源,左右逢源!人缘,福缘,缘缘不断!情愿,心愿,愿愿随心!');
INSERT INTO `sms_content` VALUES ('97', '12', '用呵护做濡米，揉捏进一颗真心，裹住美满与甜蜜，粘稠的浆汁是我的良苦用心，愿它品出你节日什锦的心情！');
INSERT INTO `sms_content` VALUES ('98', '12', '玉树银花，万户当门观瑞雪；欢歌笑语，千家把酒赏花灯。');
INSERT INTO `sms_content` VALUES ('99', '12', '玉兔呈祥！万马奔月！合家团圆！万事吉祥！庆佳节！欢欢喜喜闹花灯！');
INSERT INTO `sms_content` VALUES ('100', '12', '元宵圆,月儿圆,许个心愿圆又圆,祝你甜甜蜜蜜快快乐乐健健康康到永远!');
INSERT INTO `sms_content` VALUES ('101', '12', '圆圆的圆圆的月亮的脸,甜甜的甜甜的鲜灵的汤圆,满满的满满的盛给你一碗,装上我美美的美美的祝愿,元宵夜你要笑开颜,好运好梦伴一年!');
INSERT INTO `sms_content` VALUES ('102', '12', '正怜火树千春妍，忽见清辉映月阑。出海鲛珠犹带水，满堂罗袖欲生寒。烛花不碍空中影，晕气疑从月里看。为语东风暂相借，来宵还得尽馀欢。');
INSERT INTO `sms_content` VALUES ('103', '12', '正月十五月儿圆那，祝福的话倍儿甜啊，愿你漂亮一年胜一年呀，好运好事常连连啊，元宵节快乐！');
INSERT INTO `sms_content` VALUES ('104', '12', '祝元宵节快乐，身体健康，万事如意！');
INSERT INTO `sms_content` VALUES ('105', '13', '爱加爱等于非常的爱，爱减爱等于爱的起点，爱乘爱等于无限的爱，爱除爱等于爱的唯一。或许对于你来说，我的出现只是你生命中的100＋1＝101。但对于我来说，你的出现在我生命中却是0＋1＝1的算式。');
INSERT INTO `sms_content` VALUES ('106', '13', '对你的思念太重,压断了电话线,烧坏了手机卡,掏尽了钱包袋,吃光了安眠药,哎!可是我还是思念你。');
INSERT INTO `sms_content` VALUES ('107', '13', '没有你的天,不蓝!没有你的花,不艳!没有你的饭,不香!没有你的眠,不甜,亲爱的,情人节快乐!');
INSERT INTO `sms_content` VALUES ('108', '13', '每一个人的缘分不同,相爱的时间也会有长短,只有尽心尽力的去做,我能够做到的就是:我会让我的爱陪你慢慢的老去。');
INSERT INTO `sms_content` VALUES ('109', '13', '你，对于整个世界，似一颗尘埃，但，对于我，却是整个世界！');
INSERT INTO `sms_content` VALUES ('110', '13', '让我亲手给你沏杯茶,加进一块冰糖,再注入一腔热情,把我的爱恋,一点点地溶进茶中。');
INSERT INTO `sms_content` VALUES ('111', '13', '人生总免不了老去,但我永远会记起与你的美好时光和温情岁月。人生路上祝你拥有灿烂的心情和长长的未来。');
INSERT INTO `sms_content` VALUES ('112', '13', '生活可以是平淡的,犹如蓝天下碧蓝的湖水。生活也可以是诗,在一路的奔腾中高歌。只要我们牵着手,每一个日。');
INSERT INTO `sms_content` VALUES ('113', '13', '世间本无沙漠，我每想你一次，上帝就落下一粒沙，从此便有了撒哈拉！这世界本来没有海，只因为我每想你一次，上帝就掉下一滴眼泪，于是就有了太平洋。');
INSERT INTO `sms_content` VALUES ('114', '13', '世界上只有一个名字,使我这样牵肠挂肚,像有一根看不见的线,一头牢牢系在我心尖上,一头攥在你手中。');
INSERT INTO `sms_content` VALUES ('115', '13', '送你的玫瑰花是我用爱浇灌出来的,希望你用心去呵护她,你是我心中永远盛开的玫瑰。');
INSERT INTO `sms_content` VALUES ('116', '13', '我对你的爱如滔滔江水川流不息,又如黄河泛滥一发不可收拾,再如日落西山灿烂辉煌,我想你爱你,我不能没有你,我一定要得到你。');
INSERT INTO `sms_content` VALUES ('117', '13', '我欲与君相知，长命无绝衰。山无陵，江水为竭，冬雷震震，夏雨雪，天地合，乃敢与君绝！');
INSERT INTO `sms_content` VALUES ('118', '13', '仰头看明月 寄情千里光 渊冰厚三尺 素雪覆千里 我心如松柏 君情复何似。');
INSERT INTO `sms_content` VALUES ('119', '13', '悠悠的云里有淡淡的诗,淡淡的诗里有绵绵的情,绵绵的情里有我轻轻的问候!!');
INSERT INTO `sms_content` VALUES ('120', '13', '鱼对水说:你看不见我的眼泪,因为我在水里。水说:我能感觉到你的眼泪,因为你在我心里。');
INSERT INTO `sms_content` VALUES ('121', '13', '遇到你之前,世界是一片荒原,遇到你之后,世界是一个乐园,过去的许多岁月,对我象一缕轻烟,未来的无限生涯,因你而幸福无边。');
INSERT INTO `sms_content` VALUES ('122', '13', '原谅我将你的手机号码告诉了一个陌生人,他叫丘比特,他要帮我告诉你；我心喜欢你,我心在乎你,我心等待你。');
INSERT INTO `sms_content` VALUES ('123', '13', '祝情人节快乐!愿情人和快乐永远伴随你身边!!');
INSERT INTO `sms_content` VALUES ('124', '14', '38祝福！祝今年的你沉鱼落燕.明年的你闭月羞花.愿你年年美丽.日日如花.');
INSERT INTO `sms_content` VALUES ('125', '14', 'Lovelylady,节日快乐，开心永永远远！');
INSERT INTO `sms_content` VALUES ('126', '14', '今天是三八妇女节,愿天上的每一颗星星,都为你而在天空闪耀……');
INSERT INTO `sms_content` VALUES ('127', '14', '没有太阳，花朵不会开；没有爱，幸福不会来；没有妇女，也就没有爱；没有你我不知道什么叫未来，祝福你，妇女节快乐！');
INSERT INTO `sms_content` VALUES ('128', '14', '你的一笑，使我心跳！你的一看，世界震撼！你的一站，交通瘫痪！你不打扮，已很好看！你一打扮，宇宙惊叹！美女，三八节快乐啊！');
INSERT INTO `sms_content` VALUES ('129', '14', '女人不必太美，只要有人深爱；女人不必太富，只要过得幸福；女人不必太强，只要活得尊贵；祝看短信的漂亮女人永远幸福快乐！');
INSERT INTO `sms_content` VALUES ('130', '14', '勤劳善良的妇女们，节日快乐！');
INSERT INTO `sms_content` VALUES ('131', '14', '时间因祝福而流光溢彩，空气因祝福而芬芳袭人，心情因祝福而花开灿烂，当你打开信息时，我愿你开心此时此刻，幸福今生今世，预祝您女人节快乐！！！');
INSERT INTO `sms_content` VALUES ('132', '14', '世界因为有了女人，而显得分外美丽！问候只是短短的几行，却是一个浓浓的真意！祝三八节快乐，永远年轻漂亮！');
INSERT INTO `sms_content` VALUES ('133', '14', '我代表所有男员工感谢您平日辛勤的工作，真诚的祝您愉快。');
INSERT INTO `sms_content` VALUES ('134', '14', '我用一缕春风，二滴夏雨，三片秋叶，四朵冬梅，织成五颜六色的礼盒，结着七彩八飘的丝带，用九分真诚十分热情装进永恒的祝福：祝你妇女节快乐！');
INSERT INTO `sms_content` VALUES ('135', '15', '爱幽幽两情难却，情幽幽相聚无时！没有你的时候，你就是我的世界；和你在一起时，世界就是你的。');
INSERT INTO `sms_content` VALUES ('136', '15', '春风已解千层雪；后辈难忘先烈恩');
INSERT INTO `sms_content` VALUES ('137', '15', '何为缘也，古人云：“缘，源自圆，乃命中注定，即缘份”。百年修得同船渡，千年共得同床枕，珍惜！');
INSERT INTO `sms_content` VALUES ('138', '15', '寂寞游荡网间，戏语漫入眼帘。怎会有情人，叙述心结千千。寻寻，觅觅，世间万事皆缘。');
INSERT INTO `sms_content` VALUES ('139', '15', '暮至清风阁楼，幽月残瘦。佳人倍显娇柔，万分清秀。谈笑之间，山盟海誓苍天。万年守侯，我心依旧！');
INSERT INTO `sms_content` VALUES ('140', '15', '年年祭扫先人墓；处处犹存长者风');
INSERT INTO `sms_content` VALUES ('141', '15', '清明时节，杨柳依依，古人有“折柳赠别”的习俗，我无柳可折，给你发条短信：期盼早日再相逢');
INSERT INTO `sms_content` VALUES ('142', '15', '清明时节雨纷纷，路上行人欲断魂；借问酒家何处有，牧童遥指杏花村。');
INSERT INTO `sms_content` VALUES ('143', '15', '山清水秀风光好；月明星稀祭扫多');
INSERT INTO `sms_content` VALUES ('144', '15', '烟云洒落情一片，雨雾茫然段一年。林飞郁郁情飘然，情海冲冲段开岩。');
INSERT INTO `sms_content` VALUES ('145', '15', '又到清明时节，你在何处寄托哀思');
INSERT INTO `sms_content` VALUES ('146', '16', '感谢您对我工作的支持，“五.一”到来之际，为您送上一份衷心的祝福，诚祝您与您的家人渡过一个愉快的节日！');
INSERT INTO `sms_content` VALUES ('147', '16', '劳动节祝你劳有所获，劳应所获。愿靠咱们劳动者养活的老板们真正感激咱们养活的恩情，--加薪，加薪……');
INSERT INTO `sms_content` VALUES ('148', '16', '朋友,生活虽然是由烦恼组成的一串念珠,但我们得微笑着数完它不是吗?在这轻松美好的假日里,祝你及亲爱的家人快乐!');
INSERT INTO `sms_content` VALUES ('149', '16', '身在异乡为异客，每逢佳节倍思亲。远方的亲人，献上最真挚的祝福，愿你们平安如意。');
INSERT INTO `sms_content` VALUES ('150', '16', '踏上旅途，平安祥和；随便乱说，轻松快活；搞点娱乐，大福自摸；安全归家，还要工作。祝劳动节快乐！');
INSERT INTO `sms_content` VALUES ('151', '16', '伟大的劳动人民，祝你心情舒畅，节日愉快，多多劳动，创造美好生活，注意身体健康，千万别创造出人类！！');
INSERT INTO `sms_content` VALUES ('152', '16', '闻您重担在肩，夙夜匪懈，谨愿百忙之中，起居有节，身心长健，事事常顺。');
INSERT INTO `sms_content` VALUES ('153', '16', '五一到来之际，为你送上一份衷心的祈祷与祝福，祝你与家人过一个愉快而祥和的劳动节！');
INSERT INTO `sms_content` VALUES ('154', '16', '五一节快乐！祝大家吃好、玩好、心情好！');
INSERT INTO `sms_content` VALUES ('155', '16', '五一五一我爱你，就像老鼠爱大米！长假放松好心情，劳动最光荣');
INSERT INTO `sms_content` VALUES ('156', '16', '衷心感谢你在过去一年为公司做出的贡献,祝五一快乐,万事如意！');
INSERT INTO `sms_content` VALUES ('157', '16', '祝你：事业正当午，身体壮如虎，金钱不胜数，干活不辛苦，浪漫似乐谱，快乐非你莫属！五一快乐！');
INSERT INTO `sms_content` VALUES ('158', '16', '祝你的努力和汗水尽快变成明天成功的果实。劳动节快乐！');
INSERT INTO `sms_content` VALUES ('159', '16', '祝你劳动节愉快！心想事成！工作开心！我会永远支持你的！');
INSERT INTO `sms_content` VALUES ('160', '16', '祝您身体健康、精神愉快、事业发达、万事顺意。节日快乐');
INSERT INTO `sms_content` VALUES ('161', '17', '把爱全给了我，把世界给了我，从此不知你心中苦与乐；多想靠近你，告诉你其实我一直都懂你。妈妈，我长大了！祝您母亲节快乐！');
INSERT INTO `sms_content` VALUES ('162', '17', '并不是只有在母亲节这天才要“特别”去关心母亲，365天里，每一天都是母亲节。希望母亲能天天快乐，日日幸福！');
INSERT INTO `sms_content` VALUES ('163', '17', '慈母手中线，游子身上衣，临行密密缝，意恐迟迟归，谁言寸草心，报得三春晖。');
INSERT INTO `sms_content` VALUES ('164', '17', '看着母亲一丝一丝的白发，一条一条逐日渐深的皱纹，多年含辛茹苦哺育我成人的母亲，在这属于您的节日里请接受我对您最深切的祝愿');
INSERT INTO `sms_content` VALUES ('165', '17', '历经风雨洗礼，盼你始终坚强如昔。我把思念化为祝福，伴随你三百六十五天。');
INSERT INTO `sms_content` VALUES ('166', '17', '妈妈，感谢您！在我跌跌撞撞的时候，是您一直在支持着我。今天是您的节日，衷心祝您节日快乐！');
INSERT INTO `sms_content` VALUES ('167', '17', '妈妈：祝您健康长寿！永远年轻！天天快乐！');
INSERT INTO `sms_content` VALUES ('168', '17', '千里试问平安否？且把思念遥相寄。绵绵爱意与关怀，浓浓情意与祝福，母亲节快乐！');
INSERT INTO `sms_content` VALUES ('169', '17', '世界上只有一位最好的女性，她便是慈爱的母亲；世界上只有一种最美丽的声音，那便是母亲的呼唤。妈妈，祝您母亲节快乐！');
INSERT INTO `sms_content` VALUES ('170', '17', '天,没有母亲的爱广阔,地，没有母亲的爱包容,太阳,没有母亲的爱温暖,云朵,没有母亲的爱洁白,花朵,没有母亲的爱灿烂。节日快乐!');
INSERT INTO `sms_content` VALUES ('171', '17', '我是从故乡屋檐下飞出的一只小鸟，每一根羽毛成长都凝结着您的深情抚爱和谆谆教导。愿妈妈永远快乐！');
INSERT INTO `sms_content` VALUES ('172', '17', '五月的康乃馨，没有雍容华丽的姿态，没有浓香四溢的味道，只是清清淡淡的样子，就象母亲。祝妈妈母亲节快乐！');
INSERT INTO `sms_content` VALUES ('173', '17', '希望今天，所有的母亲都会从心里微笑，为了儿女，为了所有，只要妈妈快乐，我们就快乐！');
INSERT INTO `sms_content` VALUES ('174', '17', '下雨时，你是为我遮雨的伞，下雪时，你是为我挡寒的衣，你总是给我最贴心、最温暖的呵护。妈妈，祝您节日快乐轻轻地一声祝福，道不尽心中的千言万语，短短的一条短讯送去我衷心的问候，妈妈祝您健康快乐!');
INSERT INTO `sms_content` VALUES ('175', '17', '一年又一年，风风雨雨，一日又一日，日落日起，母亲的厚爱渗入我的心底，在这节日之际，敬上一杯真挚的酒，祝母亲安康长寿，欢欣无比。');
INSERT INTO `sms_content` VALUES ('176', '17', '愿欢快的歌声，时刻萦绕着您。愿欢乐年华，永远伴随您。祝您节日愉快！');
INSERT INTO `sms_content` VALUES ('177', '17', '在这个世界上，我们永远需要报答的最美好的人－－这就是母亲。');
INSERT INTO `sms_content` VALUES ('178', '17', '在这个特别的日子里，我想对妈妈您说声：妈妈节日快乐！愿妈妈在今后的日子里更加健康快乐！');
INSERT INTO `sms_content` VALUES ('179', '17', '在这个特殊的节日里我衷心祝福我的妈妈节日快乐！道一声你辛苦了！');
INSERT INTO `sms_content` VALUES ('180', '17', '摘一束美丽的鲜花，采一束清晨的阳光。送给你，亲爱的妈妈！');
INSERT INTO `sms_content` VALUES ('181', '18', '把无数的思念化做心中无限的祝福，默默的为你祈祷，祝你健康快乐！');
INSERT INTO `sms_content` VALUES ('182', '18', '爸爸,献上我的谢意,为了这么多年来您对我付出的耐心和爱心.父亲节快乐 子孝父心宽。');
INSERT INTO `sms_content` VALUES ('183', '18', '爸爸,在这特殊的日子里,所有的祝福都带着我们的爱,挤在您的酒杯里,红红深深的,直到心底.父亲节快乐');
INSERT INTO `sms_content` VALUES ('184', '18', '爸爸的教诲像一盏灯，为我照亮前程；爸爸的关怀像一把伞，为我遮蔽风雨。');
INSERT INTO `sms_content` VALUES ('185', '18', '敬爱的爸爸，祝福您岁岁愉快，年年如意。');
INSERT INTO `sms_content` VALUES ('186', '18', '每当想起你我就无比的自豪，是你时刻在激励我不断奋进。在这个特殊的节日里我祝福你!');
INSERT INTO `sms_content` VALUES ('187', '18', '您常在给我理解的注视，您常说快乐是孩子的礼物。所以今天，我送上一个笑，温暖您的心。');
INSERT INTO `sms_content` VALUES ('188', '18', '您是一棵大树，春天倚着您幻想，夏天倚着你繁茂，秋天倚着您成熟，冬天倚着您沉思。');
INSERT INTO `sms_content` VALUES ('189', '18', '虽然您不轻易表露，但我知道您一直都在关心着我。谢谢您，爸爸！');
INSERT INTO `sms_content` VALUES ('190', '18', '一年一度您的日子，在没有我在身边的时候希望也能快快乐乐过每一分每一秒。老爸，辛苦了');
INSERT INTO `sms_content` VALUES ('191', '19', '艾叶香，香满堂。桃枝插在大门上，出门一望麦儿黄。这儿端阳，那儿端阳，处处都端阳。祝您端阳节快乐！：）');
INSERT INTO `sms_content` VALUES ('192', '19', '端午节，家家户户都悬起了钟馗像，挂上了艾叶菖蒲，赛龙舟，吃粽子，饮雄黄酒，游百病，佩香囊，备牲醴。热热闹闹真好玩。');
INSERT INTO `sms_content` VALUES ('193', '19', '工作者是美丽的。当你以勤勉奉献社会时，犒劳一下自己吧，多多吃粽子。');
INSERT INTO `sms_content` VALUES ('194', '19', '葫芦收五毒，平安过端午！');
INSERT INTO `sms_content` VALUES ('195', '19', '每逢佳节倍思亲，祝你端午节平安快乐！！！');
INSERT INTO `sms_content` VALUES ('196', '19', '送个香囊带个荷包，自制几斤粽子，托人到山里采了艾叶，街头买了瓶雄黄酒，加上内心深处的几许关怀，作为礼物送给你，祝端午节快乐！');
INSERT INTO `sms_content` VALUES ('197', '19', '万水千山“棕”是情，屈原说声谢谢您，端午齐齐看龙舟，亲情维系无远近。');
INSERT INTO `sms_content` VALUES ('198', '19', '我是粽叶你是米一层一层裹住你，你是牙齿我是米香香甜甜粘住你，粽子里有多少米代表我有多想你，记得给我发信息不然粽子噎死你！端午节快乐！');
INSERT INTO `sms_content` VALUES ('199', '19', '五月初五端午节；雄黄烧酒菖蒲剑；三角棕子裹糯米，各色香袋挂胸前。端午节快乐！');
INSERT INTO `sms_content` VALUES ('200', '19', '五月节，扒龙船，龙鼓响，大江边，呵呵，你那儿可以看到赛龙舟吗？祝你端午节快乐！');
INSERT INTO `sms_content` VALUES ('201', '19', '五月五，是端午。吃粽子，看龙舟。齐欢聚，贺佳节。祝你节日快乐！');
INSERT INTO `sms_content` VALUES ('202', '19', '一颗心迁挂着你，一份爱祝福着你，一份真感情在等待着你的回应。祝端午节快乐！');
INSERT INTO `sms_content` VALUES ('203', '19', '粽子该是透入大海的，因为你的胸怀像大海一样的宽广，别忘了给自己投一个粽子！祝端午节快乐！');
INSERT INTO `sms_content` VALUES ('204', '20', '哺育学子慈祥心，师恩难忘刻骨铭，深深祝福谢师情：健康长寿福如海！');
INSERT INTO `sms_content` VALUES ('205', '20', '好大一棵树，绿色的祝福。老师，在你的绿色的爱下，我们成长。走到天涯海角，我们永远谢谢你绿色的爱！！！');
INSERT INTO `sms_content` VALUES ('206', '20', '呵，敬爱的老师，又到了该祝福您的季节，可我对您的思念和感激啊，早浸润在每个离开您的日日夜夜里。');
INSERT INTO `sms_content` VALUES ('207', '20', '将来，无论我成为参天大树，还是低矮的灌木，我都将以生命的翠绿向您祝福，我的老师！');
INSERT INTO `sms_content` VALUES ('208', '20', '老师您是伟大的，像一支蜡烛照亮别人燃烧自己。祝您节日快乐，保重身体！');
INSERT INTO `sms_content` VALUES ('209', '20', '人生旅程上 您为我点燃希望的光芒 丰富我的心灵，增添我的智慧 谢谢您！老师 愿您永远 健康！愉快！幸福');
INSERT INTO `sms_content` VALUES ('210', '20', '如今，天空已经成为我们的领地，而我们永远都不会忘记，是您给了我们飞翔的信念和力量。老师！向您致十二万分的敬意');
INSERT INTO `sms_content` VALUES ('211', '20', '送个短信祝福您，深深表达我心意。桃李天下漫花雨，幸福常在您心底！');
INSERT INTO `sms_content` VALUES ('212', '20', '虽然我不是您最出色的学生，但您却是我心目中最出色的老师！亲爱的老师，节日快乐！');
INSERT INTO `sms_content` VALUES ('213', '20', '所有的思念，更融合着不尽的感激与敬仰，愿您的节日里洋溢着璀璨、平安。');
INSERT INTO `sms_content` VALUES ('214', '20', '天底下的老师们，您们是天上耀眼的星星，用您们那明亮的星光照亮每一位学生的心灵，祝福您们，感谢您们！');
INSERT INTO `sms_content` VALUES ('215', '20', '天涯海角有尽处，只有师恩无穷期。祝福您，老师！');
INSERT INTO `sms_content` VALUES ('216', '20', '顽强的毅力可以征服世界上任何一座高峰”，当年您凭此教导劣徒，今天我以此驾驭人生。老师，您辛苦啦！');
INSERT INTO `sms_content` VALUES ('217', '20', '无论我走到天之涯、海之角 永远难忘老师给我的温暖和爱心 愿蓝天、白云捎去我虔诚的祝福 还有深深的敬意');
INSERT INTO `sms_content` VALUES ('218', '20', '夏日送杯冰红茶，让它带走您的炎热；冬日送杯热露露，让它给您温暖；此时送杯高兴就好，祝福您百事可乐！');
INSERT INTO `sms_content` VALUES ('219', '20', '献给敬爱的老师：象天空一样高远的是您的胸怀，象大山一样深重的是您的恩情！老师！请接爱我诚挚的祝福。');
INSERT INTO `sms_content` VALUES ('220', '20', '想念您，怀念您－－老师！对您的怀念与祝福将与日俱增，让一幕幕脉脉深情与祝福盈满，好人一生平安！');
INSERT INTO `sms_content` VALUES ('221', '20', '愿您 我最爱的老师 分分秒秒都平安 时时刻刻都称心 日日夜夜都快乐');
INSERT INTO `sms_content` VALUES ('222', '20', '悦耳的铃声，妖艳的鲜花，都受时间的限制。只有我的祝福永恒，永远永远祝福您，给我智慧之泉的老师！');
INSERT INTO `sms_content` VALUES ('223', '20', '这一天，是你的自豪；桃李满天下是你的骄傲；纯洁的师生情是你的最大财富。');
INSERT INTO `sms_content` VALUES ('224', '21', '才下眉头，却上心头，分开也许能给我们增添一些酸甜苦辣的感受，聚首能让我们更加珍惜对方的深情和温柔。想你在心头。');
INSERT INTO `sms_content` VALUES ('225', '21', '独上西楼，观月。寂寞梧桐，锁秋。问天上人，见鹊否？发个短信给情人，祝你节日快乐！');
INSERT INTO `sms_content` VALUES ('226', '21', '多少痴心风雨中，多少泪莹划夜空。痴情原是有情心，相逢一笑落梦中。');
INSERT INTO `sms_content` VALUES ('227', '21', '今夕是何夕，古来有七夕。一对相思鸟，梦圆鹊桥会。');
INSERT INTO `sms_content` VALUES ('228', '21', '青丝寸寸愁年长，七月七日鹊桥上，对月形单望相互，不羡牛郎鸳鸯。今天是中国人的情人节，愿有情人终成眷属');
INSERT INTO `sms_content` VALUES ('229', '21', '人生峥嵘几度秋，岁月悠悠情悠悠。十年音容宛在今，思忆无尽何时休。');
INSERT INTO `sms_content` VALUES ('230', '21', '柔情似水，佳期如梦，忍顾鹊桥归路。两情若是久长时，又岂在朝朝暮暮。');
INSERT INTO `sms_content` VALUES ('231', '21', '丝丝清风缠着你心情万缕，绵绵的夏雨拌着我思念如潮！寄语白云朵朵，与你共赏七夕。');
INSERT INTO `sms_content` VALUES ('232', '21', '天上七夕鹊桥见，新月如钩境缠绵。人间今宵喜团圆，良宵美景莫蹉延。');
INSERT INTO `sms_content` VALUES ('233', '21', '天上鹊桥见，人间今宵圆。月上林梢头，人约黄昏后。七夕鹊桥见，情谊两绵绵。无语相见事，尽在不言中。');
INSERT INTO `sms_content` VALUES ('234', '21', '天上人间，岁岁年年，今宵团圆，唯愿永远。对你的那种特别的感情，只想告诉你，今生不变！');
INSERT INTO `sms_content` VALUES ('235', '21', '我将用我一生的柔情，开启你尘封的记忆。愿你心随所想，事成所望。');
INSERT INTO `sms_content` VALUES ('236', '21', '喜欢看著你如春花般灿烂的笑容，喜欢看著你恬雅娴静的身影。节日过得好吗？可有想起我！');
INSERT INTO `sms_content` VALUES ('237', '21', '银燕穿梭腾空舞，伊人只影独归蜀，仰首远眺西归燕，望断君郎思卿肠。');
INSERT INTO `sms_content` VALUES ('238', '21', '由相知而相爱，由相爱而更加相知。人们常说的神仙眷侣就是你们了！祝相爱年年岁岁，相知岁岁年年！');
INSERT INTO `sms_content` VALUES ('239', '21', '织女绣云锦，牛郎河西盼。鹊桥河间架，七夕终短暂。愿爱长相依，月儿永无缺。我欲银河逝，予两星永洁！');
INSERT INTO `sms_content` VALUES ('240', '21', '织云弄巧，飞星传恨，银汉昭昭暗渡。金凤玉露一相逢，便胜却人间无数。');
INSERT INTO `sms_content` VALUES ('242', '22', '八月十五将至送你一只月饼，含量：100％关心，配料：甜蜜＋快乐＋开心＋宽容＋忠诚＝幸福；保质期：一辈子；保存方法：珍惜。');
INSERT INTO `sms_content` VALUES ('243', '22', '八月中秋不送礼，发条短信祝福你，健康快乐长伴你，好运和你不分离，还有让我告诉你，财神已经跟随你。');
INSERT INTO `sms_content` VALUES ('244', '22', '国庆巧遇中秋万家欢,人生适逢盛世精神爽.祝您节日愉快,合家团圆,与时俱进,心想事成!');
INSERT INTO `sms_content` VALUES ('245', '22', '国庆日，中秋夜，同庆同圆。寄相思，共祝愿，同缘同愿。');
INSERT INTO `sms_content` VALUES ('246', '22', '海上生明月，天涯共此时！愿今夜的月光照亮您所有的梦想，衷心祝愿美梦成真！');
INSERT INTO `sms_content` VALUES ('247', '22', '海上生明月，天涯共此时。举杯邀明月，共贺中秋时。');
INSERT INTO `sms_content` VALUES ('248', '22', '今夜月明人尽望，不知秋思落谁家。送上香甜的月饼，连同一颗祝福的心！');
INSERT INTO `sms_content` VALUES ('249', '22', '谨此中秋佳节之际，衷心祝愿您和家人团圆美满，幸福安康');
INSERT INTO `sms_content` VALUES ('250', '22', '明月，一闪一闪，挂天边；思念，一丝一丝，连成线；回忆，一幕一幕，在眼前；但愿，一年一年，人圆全。');
INSERT INTO `sms_content` VALUES ('251', '22', '明月本无价，高山皆有情。愿你的生活就像这十五的月亮一样，圆圆满满！');
INSERT INTO `sms_content` VALUES ('252', '22', '千好万好事事好，月圆情圆人团圆。祝：中秋节快乐，万事如意，心想事成！');
INSERT INTO `sms_content` VALUES ('253', '22', '清风带去我的祝福，明月捎走我的问候，送你一丝风儿，赠你一缕月儿，风月无边，人间有情，中秋快乐~');
INSERT INTO `sms_content` VALUES ('254', '22', '身在异乡为异客，每逢佳节倍思亲。远方的亲人，献上最真挚的祝福，愿你们平安如意。');
INSERT INTO `sms_content` VALUES ('255', '22', '思念如绿叶，渐渐舒展，又是中秋月圆夜，与月亮星星相望醉眼，想你的心化作梦呓，祝福你！');
INSERT INTO `sms_content` VALUES ('256', '22', '送你一份中秋月饼，成份：真心＋快乐；保质期：一生；营养：温馨＋幸福＋真情；制造：想念你的人。');
INSERT INTO `sms_content` VALUES ('257', '22', '送一个圆圆的饼，献一颗圆圆的心，寄一份圆圆的情，圆一个圆圆的梦。中秋节快乐！');
INSERT INTO `sms_content` VALUES ('258', '22', '同望当空月，月圆梦未圆。天涯情切切，拭泪两相思。中秋无佳期，各自怨遥夜。闻音忆亲容，千里牵情丝。');
INSERT INTO `sms_content` VALUES ('259', '22', '我们的距离虽然远，但是你永远挂在我心中，就如八月十五这一天，希望永远记的我，中秋节快乐。');
INSERT INTO `sms_content` VALUES ('260', '22', '又是一年落叶黄,一层秋雨一层凉.整日工作挺辛苦,天凉别忘加衣裳.保重身体多餐饭,珍惜友情常想想.信短情长言未尽,唯愿朋友多安康.中秋快乐,合家团圆.');
INSERT INTO `sms_content` VALUES ('261', '22', '又是一年月圆夜，月下为你许三愿：一愿美梦好似月儿圆，二愿日子更比月饼甜，三愿心地犹如月光明。：）');
INSERT INTO `sms_content` VALUES ('262', '22', '又是中秋又是圆，每年中秋夜见明，穿梭灯笼快乐夜，祝君健康永团圆！');
INSERT INTO `sms_content` VALUES ('263', '22', '月到双节分外明，节日喜气伴你行。人逢喜事精神爽，人团家圆事业成。节日愉快身体硬，心想事成您准赢。');
INSERT INTO `sms_content` VALUES ('264', '22', '月缺时我想你，月圆时我念你，无论月圆月缺，我的心如那恒古不变的月光默默的追随着你的每一次微笑！');
INSERT INTO `sms_content` VALUES ('265', '22', '月是中秋分外明，我把问候遥相寄；皓月当空洒清辉，中秋良宵念挚心；祝愿佳节多好运，月圆人圆事事圆！');
INSERT INTO `sms_content` VALUES ('266', '22', '月圆家圆人圆团团圆圆，国和家和人和和气满堂。华夏九州同祝福，中秋两岸盼团圆。');
INSERT INTO `sms_content` VALUES ('267', '22', '云淡天青，一轮明月廊照人家，时蓬中秋，三杯美酒，绕膝亲情。祝：家庭幸福，中秋节快乐！');
INSERT INTO `sms_content` VALUES ('268', '22', '中秋将至,奉上一个月饼配料:五克快乐枣,一把关心米,三钱友情水,用幽默扎捆,用手机送达,保质期农历八月十五前,保存方法按保存键.');
INSERT INTO `sms_content` VALUES ('269', '22', '中秋就快到了我要送你一个月饼。第一层体贴！第二层关怀！第三层浪漫！中间夹层甜蜜！愿你喜欢！');
INSERT INTO `sms_content` VALUES ('270', '23', '“我爱北京天安门，天安门上太阳升，伟大领袖毛主席，指引我们向前进”，唱起熟悉的儿歌，祝祖国生日快乐，也祝你节日快乐！');
INSERT INTO `sms_content` VALUES ('271', '23', '当你看到我给你的这份祝福，请将头用力撞墙，看到没有，你眼前无数的星星是我无限的祝福，国庆快乐！');
INSERT INTO `sms_content` VALUES ('272', '23', '国庆节之际，不想给你太多，只给你五千万:千万要快乐,千万要健康,千万要平安,千万要知足,千万莫忘记我！');
INSERT INTO `sms_content` VALUES ('273', '23', '国庆又逢仲秋月圆，伟大祖国大好河山，蒸蒸日上繁荣富强，神州共奔富丽康庄。');
INSERT INTO `sms_content` VALUES ('274', '23', '金秋的岁月，丰收的季节，愿我最真诚的笑容伴随你，深深的祝福你，国庆节快快乐乐，事业辉煌腾达！！！');
INSERT INTO `sms_content` VALUES ('275', '23', '年年国庆，庆祝新胜利；处处笙歌，歌唱大丰收。让我们龙的子孙，共同欢庆伟大祖国的节日！');
INSERT INTO `sms_content` VALUES ('276', '23', '神州齐奋进，祖国共飞腾。游子望故乡，祝亲人安康。祝祖国母亲生日快乐！');
INSERT INTO `sms_content` VALUES ('277', '23', '万紫千红迎国庆，片片红叶舞秋风。举国上下齐欢畅，家和国盛万事兴。愿这盛大的节日带给你永远的幸运！');
INSERT INTO `sms_content` VALUES ('278', '23', '我将满满的祝福塞在信里，在国庆节之际，寄与远方的您。祝您国庆节快乐，心想事成，事业蒸蒸日上！');
INSERT INTO `sms_content` VALUES ('279', '23', '欣望江山千里秀，欢颂祖国万年春。祝福你，国庆节快乐！');
INSERT INTO `sms_content` VALUES ('280', '23', '在这馥郁芬芳的季节，举国欢腾的日子，有一种心情叫牵挂，有一种思维叫想念。衷心祝你，国庆快乐。');
INSERT INTO `sms_content` VALUES ('281', '23', '在这普天同庆的日子里，送给你我最真挚的祝福，也祝全天下所有的人幸福快乐！也祝愿我们的国家繁荣昌盛！');
INSERT INTO `sms_content` VALUES ('282', '23', '祝福您：国庆、家庆、普天同庆，官源、财源、左右逢源，人缘、福缘、缘缘不断，情愿、心愿、愿愿随心。');
INSERT INTO `sms_content` VALUES ('283', '23', '祝愿祖国繁荣昌盛富强，早日实现统一。也祝你幸福安康如意，早日达成心愿。');
INSERT INTO `sms_content` VALUES ('284', '23', '走遍祖国最想母亲，走遍世界最想祖国。举国上下共庆贺，祝愿祖国更强大。');
INSERT INTO `sms_content` VALUES ('285', '24', '步步登高开视野,年年重九胜春光');
INSERT INTO `sms_content` VALUES ('286', '24', '故人具鸡黍，邀我至田家。绿树村边合，青山郭外斜。开轩面场圃，把酒话桑麻。待到重阳日，还来就菊花。');
INSERT INTO `sms_content` VALUES ('287', '24', '三三令节春时松更高　　九九芳辰重阳鹤添寿');
INSERT INTO `sms_content` VALUES ('288', '24', '赏菊饮酒，登高遥望，祝您健康长寿！');
INSERT INTO `sms_content` VALUES ('289', '24', '双喜临门，佳期欣逢佳日；三阳播彩，小阳春叠重阳');
INSERT INTO `sms_content` VALUES ('290', '24', '岁岁重阳，今又重阳，不似春光，胜似春光');
INSERT INTO `sms_content` VALUES ('291', '24', '与天地兮比寿，与日月兮同光');
INSERT INTO `sms_content` VALUES ('292', '24', '重阳节到了，秋高气爽，让我们放风筝去！');
INSERT INTO `sms_content` VALUES ('293', '25', '大家好，为答谢朋友多年来对我的关心支持在圣诞前举行酬宾活动，凡在我心中有一定地位的人都将获得由我免费提供的价值人民币一毛钱的圣诞短信一条。');
INSERT INTO `sms_content` VALUES ('294', '25', '暖风里飘着醉人的钟声，在这圣洁的日子里，祝愿你平安、欢乐、心想事成！');
INSERT INTO `sms_content` VALUES ('295', '25', '深深的情谊与祝福，绵绵的思念与问候，在这特别的日子里，把祝愿随着短信带给远方的你');
INSERT INTO `sms_content` VALUES ('296', '25', '圣诞的祝福、愉快的记忆、人间的亲情、天堂的温馨，都在今天走近了我们大家。');
INSERT INTO `sms_content` VALUES ('297', '25', '我是平安之夜的使者，向你报一声平安，让这祥和的旋律，伴随你度过今晚。');
INSERT INTO `sms_content` VALUES ('298', '25', '以真诚为半径，以尊重为圆心，送你一个圆圆的祝福给你，愿爱你的人更爱你，你爱的人更懂你！圣诞快乐！');
INSERT INTO `sms_content` VALUES ('299', '25', '又逢圣诞，寄上我一份诚挚的祝福，愿你拥有更将康、快乐、幸福的未来，祝你圣诞快乐！');
INSERT INTO `sms_content` VALUES ('300', '25', '这节日犹如一把钥匙，开启了这些日子里的想念。祝福的云朵，正细细说起我们曾有的期盼---祝你圣诞快乐');
INSERT INTO `sms_content` VALUES ('301', '25', '这是分享快乐的节日，是祝福、给予的节日，是友情、梦幻成真的节日，愿你享有一个快乐的圣诞！');
INSERT INTO `sms_content` VALUES ('302', '25', '知道你会被铺天盖地的祝福短信包围，英明有远见的我一早就让祝福跨过高山大海，越过高楼大厦，穿过大街小巷，闪过卖茶蛋的老大娘，钻进你的耳朵：圣诞快乐！');
INSERT INTO `sms_content` VALUES ('303', '25', '祝福的细语轻敲耳畔，让幸福伴着圣诞老人悄悄地降临，永远环绕着你。');
INSERT INTO `sms_content` VALUES ('304', '25', '祝福圣诞！愿教堂银白色的合唱，轻拂你娴雅的裙摆，让你感受其中我的一份安谧平和的爱意');
INSERT INTO `sms_content` VALUES ('305', '6', '酒越久越醇，朋友相交越久越真；水越流越清，世间沧桑越流越淡。祝生日快乐，时时好心情');
INSERT INTO `sms_content` VALUES ('306', '6', '没有声音， 但有祝福；没有鲜花， 但有真情，有来自内心的祝愿：生日快乐， 心想事成！');
INSERT INTO `sms_content` VALUES ('307', '6', '某年某月的某一天，你悄悄地来到这世上；于是，每年?月的这一天，都是你独有的节日，祝你生日快乐!');
INSERT INTO `sms_content` VALUES ('308', '6', '你是大树，为我们遮蔽风风雨雨；你是太阳，为我们的生活戴来光明。亲爱的父亲，祝你健康，长寿。生日快乐！');
INSERT INTO `sms_content` VALUES ('309', '6', '你是哈蜜我是瓜，生日你不笨瓜瓜，看了短信笑哈哈，不愧是个哈蜜瓜！祝你：看了短信笑哈哈，生日快乐！');
INSERT INTO `sms_content` VALUES ('310', '6', '请接受我的礼物，它带给你温存的爱慕和深情的思念，祝愿你生日快乐，欢欢喜喜又一年！永远快乐！');
INSERT INTO `sms_content` VALUES ('311', '6', '日月轮转永不断，情若真挚长相伴，不论你身在天涯海角，我将永远记住这一天。祝你生辰快乐！');
INSERT INTO `sms_content` VALUES ('312', '6', '如果我有一百万，我将送你999999，我有一百万吗？没有，所以我只能发个短信祝你生日快乐！');
INSERT INTO `sms_content` VALUES ('313', '6', '生日祝福你，好事追着你，主管重视你，病魔躲着你，情人深爱你，痛苦远离你，开心跟着你，万事顺着你！');
INSERT INTO `sms_content` VALUES ('314', '6', '送你一杯我精心特调的果汁，里面包含100cc的心想事成，200cc的天天开心，300cc的活力十足，祝生日快乐');
INSERT INTO `sms_content` VALUES ('315', '6', '一笑烦恼跑，二笑怒憎消，三笑憾事了，四笑病魔逃，五笑永不老，六笑乐逍遥，时常开笑口，寿比彭祖高。');
INSERT INTO `sms_content` VALUES ('316', '6', '愿我的祝福萦绕你，在你缤纷的人生之旅，在你飞翔的彩虹天空里。祝：生日快乐！天天好心情！永远靓丽！');
INSERT INTO `sms_content` VALUES ('317', '6', '在你生日来临之即，祝你百事可乐，万事芬达，天天哇哈哈，月月乐百事，年年高乐高，心情似雪碧，永远都醒目');
INSERT INTO `sms_content` VALUES ('318', '6', '在我记忆的画面上增添了许多美好的怀念，似锦如织，我亲爱的朋友请接受我深深的祝愿，愿所有的欢乐都陪伴着你！');
INSERT INTO `sms_content` VALUES ('319', '6', '这一刻，有我最深的思念。让云捎去满心的祝福，点缀你甜蜜的梦，愿你度过一个温馨浪漫的生日！');
INSERT INTO `sms_content` VALUES ('320', '6', '只有懂得生活的人,才能领略鲜花的娇艳.只有懂得爱的人,才能领略到心中芬芳。祝您有一个特别的生日！');
INSERT INTO `sms_content` VALUES ('321', '6', '祝你生日快乐，你的善良使这个世界变得更加美好，愿这完全属于你的一天带给你快乐，愿未来的日子锦上添花！');
INSERT INTO `sms_content` VALUES ('322', '7', '茶，要喝浓的，直到淡而无味；酒，要喝醉的，直到不能醒来的；人，要深爱的，要下辈子继续爱的；朋友，要像你这样的。');
INSERT INTO `sms_content` VALUES ('323', '7', '大蟹小蟹都是谢，浓情厚意常驻心！');
INSERT INTO `sms_content` VALUES ('324', '7', '感谢你的关怀，感谢你的帮助，感谢你对我做的一切……');
INSERT INTO `sms_content` VALUES ('325', '7', '感谢你派人帮忙，事情已完成，特对你表示感谢。');
INSERT INTO `sms_content` VALUES ('326', '7', '感谢您对我们工作的大力支持！我谨代表公司全体同仁表示感谢！');
INSERT INTO `sms_content` VALUES ('327', '7', '漫漫长路独自征 幸得与我共途中 携手同行人生路 彼此相挽历磨难 感谢多年共风雨 风雨再度见真心');
INSERT INTO `sms_content` VALUES ('328', '7', '你的诚意我心领！将你的真心放我的手心，隆冬它将火一般滚烫！盛夏它将雪一般清凉！谢谢！！！');
INSERT INTO `sms_content` VALUES ('329', '7', '你的引领，使我从小插上理想的翅膀。不管明天会怎样，还是从心底说声：谢谢你！');
INSERT INTO `sms_content` VALUES ('330', '7', '你的支持和帮助让我学了不少东西，谢谢！');
INSERT INTO `sms_content` VALUES ('331', '7', '你对我的帮助，我会铭记于心的。真诚地感谢你！');
INSERT INTO `sms_content` VALUES ('332', '7', '朋友，是你在我最困难的时候，伸出温暖的手援助我，让我感激至极，心意无法表达，只有祝福你');
INSERT INTO `sms_content` VALUES ('333', '7', '任何时间，请接受我最真心的感谢！');
INSERT INTO `sms_content` VALUES ('334', '7', '任何言语已无法表达心中对您的感激。由衷感谢！');
INSERT INTO `sms_content` VALUES ('335', '7', '是您为我引来一条清亮的小溪，使我的前景充满生机，衷心地感谢您！');
INSERT INTO `sms_content` VALUES ('336', '7', '托一片云霞带一份祝福给你，同时由衷地向你说声：谢谢！');
INSERT INTO `sms_content` VALUES ('337', '7', '我的语言是苍白的,但我的致谦是真诚的.我不在作别的解释,希望您能接受我心中最真诚的谢意!!!');
INSERT INTO `sms_content` VALUES ('338', '7', '谢谢盛情款待，欢迎来我这里做客，恭候光临！');
INSERT INTO `sms_content` VALUES ('339', '7', '在我处于人生最灰暗的日子里，是你的鼓励和帮助让我重新振作，真心地说声：谢谢！');
INSERT INTO `sms_content` VALUES ('340', '8', '付出总会有回报，要做就做最好的，我相信你，你一定行！');
INSERT INTO `sms_content` VALUES ('341', '8', '记得有人说过，人生有两大欢乐，一是拥有后可以细细品味，二就是追求之中的备感充实。');
INSERT INTO `sms_content` VALUES ('342', '8', '加油干，你一定能成功的！');
INSERT INTO `sms_content` VALUES ('343', '8', '开业之际送上我诚挚祝贺，情深意重，祝你在未来的岁月，事业蒸蒸日上，财源广进！');
INSERT INTO `sms_content` VALUES ('344', '8', '你面对挑战总是那么自信！祝贺你，又成功向前迈了一步。');
INSERT INTO `sms_content` VALUES ('345', '8', '朋友，久未联络，一切可好？祝您生意兴隆，身体健康，事事顺心！');
INSERT INTO `sms_content` VALUES ('346', '8', '一纸信笺，一份真情，一份信念，祝开业吉祥，大富启源');
INSERT INTO `sms_content` VALUES ('347', '8', '拥有的细细品，祈求的再努力。祝生意顺利！宏图大展！今日有喜。');
INSERT INTO `sms_content` VALUES ('348', '8', '幽香拂面，紫气兆祥，庆开业典礼，祝生意如春浓，财源似水来！');
INSERT INTO `sms_content` VALUES ('349', '8', '有了钱人会得意，有了事业人会充实，有了公司人会自在，有了股东人会上进，愿你开张大吉！');
INSERT INTO `sms_content` VALUES ('350', '8', '正确的方向，积极的思想，环境的栽培，坚持不懈的行动。成功就在您手中！祝福您！！！');
INSERT INTO `sms_content` VALUES ('351', '8', '祝您事事顺心！发展顺利！宏图大展！');
INSERT INTO `sms_content` VALUES ('352', '9', '给我一个机会，还你一个惊喜！相信我们一定能合作愉快！！！');
INSERT INTO `sms_content` VALUES ('353', '9', '合作愉快！以后还请多多指教！');
INSERT INTO `sms_content` VALUES ('354', '9', '很高兴能够与您共享工作的乐趣！');
INSERT INTO `sms_content` VALUES ('355', '9', '你的诚意我心领！将你的真心放我的手心，隆冬它将火一般滚烫！盛夏它将雪一般清凉！谢谢！！！');
INSERT INTO `sms_content` VALUES ('356', '9', '你们好！在繁忙的商业中我需要你们给我提供信息服务，我能和你们联络我很高兴。');
INSERT INTO `sms_content` VALUES ('357', '9', '你托的事已经办好，能为你效劳是我的荣幸。');
INSERT INTO `sms_content` VALUES ('358', '9', '你愿意安排一次个别会谈吗？');
INSERT INTO `sms_content` VALUES ('359', '9', '请将合同传真给我确认，如无其他问题，马上就可签署。 你托的事已经办好，能为你效劳是我的荣幸。');
INSERT INTO `sms_content` VALUES ('360', '9', '人说商如风雨。。。，我有一把伞-撑出的是优质和诚意！');
INSERT INTO `sms_content` VALUES ('361', '9', '虽然相隔遥远，但友谊长存；精诚合作，我们的前程辉煌永久！');
INSERT INTO `sms_content` VALUES ('362', '9', '我觉得与您合作，是您给我的一个非常好的学习机会！！！');
INSERT INTO `sms_content` VALUES ('363', '9', '相信我，跟我合作，您会非常愉快！选择我，没有错！：）');
INSERT INTO `sms_content` VALUES ('364', '3', '不管天多高,海多深,钢多硬,风多大,尺多长,河多宽,酒多烈,冰多冷,火多热……我只想告诉你,这些都不关你的事！');
INSERT INTO `sms_content` VALUES ('365', '3', '不是因为这样寒冷地夜晚才想起你，是因为这样寒冷地夜晚想起的只有你，难道你看不出我是真心的吗？我依恋你温柔的怀抱，一刻也不能离开，亲爱的棉被。');
INSERT INTO `sms_content` VALUES ('366', '3', '饭后七戒：一戒吸烟，二戒马上吃水果，三戒放松裤带，四戒立即喝茶，五戒百步走，六戒立即洗澡，七戒立即睡觉！八戒：... （你说吧！）');
INSERT INTO `sms_content` VALUES ('367', '3', '飞机上，乌鸦对乘务员说：给爷来杯水！猪听后也学道：给爷也来杯水！乘务员把猪和乌鸦扔出机舱，乌鸦笑着对猪说：傻了吧？爷会飞~~！');
INSERT INTO `sms_content` VALUES ('368', '3', '阁下莫非就是风流倜傥、玉树临风、学富五车、才高八斗，人称风流唐伯虎……家的那只小狗--旺才！');
INSERT INTO `sms_content` VALUES ('369', '3', '给点阳光你就灿烂，给点洪水你就泛滥，给点温暖你就腐烂，给点小酒你就捣蛋，给个眉眼你就添乱。');
INSERT INTO `sms_content` VALUES ('370', '3', '广阔的天空任你高飞，美丽的故事由你发挥，善良的女孩应该去追，幽默的短消息发给小乌龟！');
INSERT INTO `sms_content` VALUES ('371', '3', '禁止假装工作忙不理我；禁止发了财忘了我；禁止有难不帮我；禁止吃饭不叫我；禁止闲下时候不想我；禁止有快乐不告诉我。');
INSERT INTO `sms_content` VALUES ('372', '3', '你比镜子还能反映人的缺点　比庄子还博学多才　比孙子还有谋略　所以大家都亲切地称你：镜庄孙子。');
INSERT INTO `sms_content` VALUES ('373', '3', '你长得很有创意，活着是你的勇气，丑并非是你的本意，只是上帝发了一点脾气，你要勇敢的活下去，如果没有了你，谁能衬托世界的美丽。');
INSERT INTO `sms_content` VALUES ('374', '3', '你是书本我是包,你是耗子我是猫,你是木头我是胶,你是猪肉我是刀,我们关系这么好,今晚饭钱你来掏！');
INSERT INTO `sms_content` VALUES ('375', '3', '如果你是恒星，追定你，如果你是慧星，等着你，如果你是流星，懒理你，可是为什么你偏偏是……猩猩。');
INSERT INTO `sms_content` VALUES ('376', '3', '上帝送我个宝盆，想啥就变啥。我不小心想了你，它就变出一个你，我止不住想，就止不住变，最后满屋都是你。我就愁：这么多小猪叫我咋喂呀！');
INSERT INTO `sms_content` VALUES ('377', '3', '送你十二生肖：祝你聪明如鼠，强壮如牛，胆大如虎，可爱如兔，自信如龙，魅力如蛇，浪漫如马，温顺如羊，顽皮如猴，美丽如鸡，忠诚如狗，长的像猪。');
INSERT INTO `sms_content` VALUES ('378', '3', '跳楼须知:痛快到七楼,喘气到六楼,挣扎到五楼,残废到四楼,住院到三楼,吓人到二楼,看热闹到一楼。');
INSERT INTO `sms_content` VALUES ('379', '3', '为什么天这么黑，因为牛在天上飞，为什么牛在飞，因为你在地上吹。');
INSERT INTO `sms_content` VALUES ('380', '3', '希望你每天都快乐的像炉子上的茶壶一样，虽然小屁屁被烧得滚烫，但依然吹着开心的口哨，冒着幸福的小泡！');
INSERT INTO `sms_content` VALUES ('381', '3', '一滴水在海洋中渺小，在沙漠中伟大；丹顶鹤在鹤群中渺小，在鸡群中伟大；你在人群中渺小，在猪圈伟大！');
INSERT INTO `sms_content` VALUES ('382', '3', '有人说你是头笨驴，我严肃地批评了他：太不像话了！总不能人家长得像什么就说人家是什么吧！');
INSERT INTO `sms_content` VALUES ('383', '3', '有一颗豆，跌倒了，它气馁，情绪低落，有什么能鼓励它站起来？答案就是“你”！因为有一样东西，叫做“猪鼓励豆”。');
INSERT INTO `sms_content` VALUES ('384', '3', '有一种默契叫做心照不宣，有一种感觉叫做妙不可言，有一种思念叫做望眼欲穿，有一种白痴会把短信看完！');
INSERT INTO `sms_content` VALUES ('385', '3', '再惹我，就经济上封锁你，政治上孤立你，精神上折磨你，肉体上摧残你，生活中遗弃你，发动全国人民谴责你！看你还嚣张');
INSERT INTO `sms_content` VALUES ('386', '3', '这星期休息要注意身体，趁这段时间一定要加强锻炼。目标:在零度以下静坐2小时无异常反应，并保持笑容！');
INSERT INTO `sms_content` VALUES ('387', '3', '做家具的是木材，懂诗词是秀才，众人想的是钱财，被培养是人才，女人要的是身材，发消息的是天才，看消息的是蠢材。');

-- ----------------------------
-- Table structure for `sms_inscribe`
-- ----------------------------
DROP TABLE IF EXISTS `sms_inscribe`;
CREATE TABLE `sms_inscribe` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `hospital_id` int(11) NOT NULL DEFAULT '0' COMMENT '院医ID',
  `name` char(10) NOT NULL COMMENT '款落名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sms_inscribe
-- ----------------------------

-- ----------------------------
-- Table structure for `sms_type`
-- ----------------------------
DROP TABLE IF EXISTS `sms_type`;
CREATE TABLE `sms_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `reid` int(10) NOT NULL DEFAULT '0' COMMENT '上级',
  `name` char(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sms_type
-- ----------------------------
INSERT INTO `sms_type` VALUES ('1', '0', '祝福短语');
INSERT INTO `sms_type` VALUES ('2', '0', '商务用语');
INSERT INTO `sms_type` VALUES ('3', '0', '幽默短语');
INSERT INTO `sms_type` VALUES ('4', '1', '日常祝福');
INSERT INTO `sms_type` VALUES ('5', '1', '节日祝福');
INSERT INTO `sms_type` VALUES ('6', '1', '生日祝福');
INSERT INTO `sms_type` VALUES ('7', '2', '感谢');
INSERT INTO `sms_type` VALUES ('8', '2', '开业大吉');
INSERT INTO `sms_type` VALUES ('9', '2', '合作愉快');
INSERT INTO `sms_type` VALUES ('10', '5', '元旦节');
INSERT INTO `sms_type` VALUES ('11', '5', '春节');
INSERT INTO `sms_type` VALUES ('12', '5', '元宵节');
INSERT INTO `sms_type` VALUES ('13', '5', '情人节');
INSERT INTO `sms_type` VALUES ('14', '5', '妇女节');
INSERT INTO `sms_type` VALUES ('15', '5', '清明节');
INSERT INTO `sms_type` VALUES ('16', '5', '劳动节');
INSERT INTO `sms_type` VALUES ('17', '5', '母亲节');
INSERT INTO `sms_type` VALUES ('18', '5', '父亲节');
INSERT INTO `sms_type` VALUES ('19', '5', '端午节');
INSERT INTO `sms_type` VALUES ('20', '5', '教师节');
INSERT INTO `sms_type` VALUES ('21', '5', '七夕节');
INSERT INTO `sms_type` VALUES ('22', '5', '中秋节');
INSERT INTO `sms_type` VALUES ('23', '5', '国庆节');
INSERT INTO `sms_type` VALUES ('24', '5', '重阳节');
INSERT INTO `sms_type` VALUES ('25', '5', '圣诞节');

-- ----------------------------
-- Table structure for `sysconfig`
-- ----------------------------
DROP TABLE IF EXISTS `sysconfig`;
CREATE TABLE `sysconfig` (
  `id` smallint(8) NOT NULL,
  `varname` varchar(20) NOT NULL DEFAULT '' COMMENT '变量名',
  `cname` varchar(60) DEFAULT NULL COMMENT '量变中文名',
  `info` varchar(100) DEFAULT NULL COMMENT '变量说明',
  `value` varchar(200) NOT NULL DEFAULT '0' COMMENT '变量值',
  `type` varchar(6) NOT NULL DEFAULT 'text' COMMENT '辑编类型',
  PRIMARY KEY (`id`,`varname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysconfig
-- ----------------------------
INSERT INTO `sysconfig` VALUES ('1', 'openlogs', '是否开启系统日志', '1为开启； 0为关闭', '1', 'radio');
INSERT INTO `sysconfig` VALUES ('2', 'smsrecord', '是否开启短信发送记录', '1为开启； 0为关闭', '0', 'radio');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_id` int(11) NOT NULL COMMENT '用户组ID',
  `username` varchar(15) NOT NULL COMMENT '用户名称',
  `password` char(50) NOT NULL COMMENT '用户密码',
  `ip` char(15) DEFAULT NULL COMMENT '用户IP',
  `login_time` int(11) DEFAULT '0' COMMENT '登录时间',
  `sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '性别（默认1为男 0为女）',
  `phone` varchar(15) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(80) DEFAULT NULL COMMENT '地址',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `created` int(11) NOT NULL COMMENT '创建时间',
  `updated` int(11) DEFAULT '0' COMMENT '修改时间',
  `rank` tinyint(1) NOT NULL DEFAULT '5' COMMENT '级等',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否禁用（默认1为正常 2为待审核 0为禁用）',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', 'admin', '21232f297a57a5a743894a0e4a801fc3', null, '0', '1', null, null, null, '0', '0', '0', '10', '1');
