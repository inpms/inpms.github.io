# 模块说明

1.o2o-affair         报事报修
2.o2o-assets         资产管理(房屋出租，房屋出售)
3.o2o-assetsv2       物业缴费
4.o2o-caa			   收房验房
5.o2o-club           会所
6.o2o-common         公告模块，登录，注册，房产等
7.o2o-commonV2		 web端公用
8.o2o-fileserver     文件上传
9.o2o-flea           跳蚤市场
10.o2o-hk            专业保洁
11.o2o-lottery       抽奖活动
12.o2o-notice        通知公告，活动，广告
13.o2o-reno          微装服务
14.o2o-session       关于系统token的管理
15.o2o-shop          品质生活
16.o2o-suggest       投诉建议
17.o2o-travel        旅游服务
18.o2o-medical       金融服务
19.o2o-house         收房验房
20.o2o-parking       停车服务
21.o2o-question      抽奖服务

# 2017-12-10版本更新说明

1.红包活动项目  
2.web端UI改版及后端代码相关调整  
3.支付精度损失  
4.物业缴费使用红包
5.物业缴费成功，但是查询不到记录问题  
6.工单在o2o端指派  
7.添加web端用户绑定功能  
8.添加权限管理

# 2018-02-12版本更新说明

1.丰城品质生活新增活动控制，页面数据展示修改，以及支付方式修改

# 2022-09-07版本更新说明

1、本次更新瑞安荟优惠券的对接 
2、新增表village_ruianyun 
3、瑞安荟优惠券核销，新增字段： 

# 2023-9-6版本更新说明

1.需求范围、简述：主要是对物业缴费进行全面的改版，涉及到app、微信、web三端。 
2.主要影响的模块有o2o-assetsv2和o2o-common
3.影响数据库的字段变更如下：

------

CREATE TABLE `assets_call` (
`id` bigint NOT NULL AUTO_INCREMENT,
`vid` int DEFAULT NULL COMMENT '小区id',
`hid` int DEFAULT NULL COMMENT '房号',
`userid` int DEFAULT NULL COMMENT '管家id',
`call_time` datetime DEFAULT NULL COMMENT '催缴时间',
`cycle` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '催缴周期，总的',
`cycle_detail` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '催缴周期，明细',
`validity` datetime DEFAULT NULL COMMENT '二维码的截止有效日期',
`total_cost` decimal(10,2) DEFAULT NULL COMMENT '管家所选的费用总金额',
`costids` longtext COLLATE utf8mb4_general_ci COMMENT '管家所选的费用id，逗号隔开',
`qrcode_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '二维码地址',
`published` int DEFAULT '0' COMMENT '是否发布，0未发布，1已发布',
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='催缴记录表'

------

assets_detail表增加缴费来源字段，缴费来源：1，线上；2，线下。默认线上

------

CREATE TABLE `assets_mail_type` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`mail_name` varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱后缀名称',
`sort` int(11) DEFAULT NULL COMMENT '排序码',
`create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`last_update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='邮箱后缀维护表，支持页面的邮箱后缀自动补全动态维护'

------

assets_pay_order表增加字段openid，主要是非系统人员也能缴费，所以需要openid作为用户识别

------

sys_menu表增加了新的菜单，同步最新的菜单表数据即可

------

sys_user表增加表字段，wx_login_time，主要是解决管家端用户登录可直接进入

------

CREATE TABLE `assets_type` (
`id` int NOT NULL AUTO_INCREMENT,
`type` int DEFAULT NULL COMMENT '费用类型枚举字段',
`typ_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '费用类型名称',
`creat_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`last_update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

------

CREATE TABLE `asset_call_notice_set` (
`id` int NOT NULL AUTO_INCREMENT,
`vid` int DEFAULT NULL COMMENT '小区id',
`switch_status` tinyint DEFAULT '0' COMMENT '推送开关，0关闭，1开启',
`cost_types` varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '条件：欠费类型，多个逗号隔开',
`owed_month` int DEFAULT NULL COMMENT '条件：欠费多少个月',
`push_dates` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '推送日期，多个日逗号隔开。如：1,2,3,30',
`push_time` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '推送时间，如12:00',
`pay_enable_type` tinyint DEFAULT '0' COMMENT '缴费链接有效期，默认0今天，1明天，2后天。用于管家端催缴默认设置',
`create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
`creat_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`last_update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
`last_update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

------

 o2o-commonV2 ，改动httprequestutils 的路由配置，加大并发处理   

### 2023-1-16 新增访客需求

```
本次需求是年前进行开发完毕，年后上线，所以怕时间久了，在此记录一下代码及SQL改动
```

------

变更涉及的功能模块：o2o-common-android

------

```
1、小区增加是否支持访客邀请
ALTER TABLE `village` ADD COLUMN `enable_visit_invi` TINYINT(5) DEFAULT 0 NULL COMMENT '是否开启访客邀请，0默认不开启，1开启' AFTER `repast_area`;
2、小区增加是否显示通行车辆显示
ALTER TABLE `village` ADD COLUMN `enable_display_car` TINYINT DEFAULT 0 NULL COMMENT '是否显示通行车辆，0默认不显示，1显示' AFTER `enable_visit_invi`; 
```

http://localhost:8080/o2o-question-webAndroid/swagger/index.html#/wx


- `o2o-activity/` - 活动模块 (Activity Module)  
- `o2o-affair/` - 事务模块 (Affair Module)  
- `o2o-assets/` - 资产模块 (Assets Module)  
- `o2o-assetsv2/` - 资产模块V2 (Assets Module V2)  
- `o2o-caa/` - CAA模块 (CAA Module)  
- `o2o-club/` - 俱乐部模块 (Club Module)  
- `o2o-common/` - 公共模块 (Common Module)  
- `o2o-commonV2/` - 公共模块V2 (Common Module V2)  
- `o2o-fileserver/` - 文件服务器模块 (File Server Module)  
- `o2o-finance/` - 财务模块 (Finance Module)  
- `o2o-flea/` - 跳蚤市场模块 (Flea Market Module)  
- `o2o-generate/` - 生成模块 (Generate Module)  
- `o2o-hk/` - 香港模块 (Hong Kong Module)  
- `o2o-house/` - 房产模块 (House Module)  
- `o2o-lottery/` - 抽奖模块 (Lottery Module)  
- `o2o-medical/` - 医疗模块 (Medical Module)  
- `o2o-notice/` - 通知模块 (Notice Module)  
- `o2o-parking/` - 停车模块 (Parking Module)  
- `o2o-question/` - 问答模块 (Question Module)  
- `o2o-recycling/` - 回收模块 (Recycling Module)  
- `o2o-reno/` - 翻新模块 (Renovation Module)  
- `o2o-session/` - 会话模块 (Session Module)  
- `o2o-shop/` - 商店模块 (Shop Module)  
- `o2o-suggest/` - 建议模块 (Suggest Module)  
- `o2o-travel/` - 旅游模块 (Travel Module)  
- `o2o-value-added/` - 增值服务模块 (Value-Added Module)  