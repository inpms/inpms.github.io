-- 向 MySQL 数据库中的 'lottery' 表添加新字段
ALTER TABLE `award_activity`
-- 添加 'version' 字段，数据类型为 VARCHAR(10)，存储抽奖版本信息
ADD COLUMN VERSION VARCHAR(10) COMMENT '抽奖版本信息',
-- 添加 'isLimit2' 字段，数据类型为 TINYINT，用于表示中奖限制，0表示不限制，1表示有限制
ADD COLUMN isLimit2 TINYINT COMMENT '中奖限制，0表示不限制，1表示有限制',
-- 添加 'type' 字段，数据类型为 ENUM，用于存储抽奖种类的选项，目前只有两个选项：物业费、车位费
ADD COLUMN TYPE ENUM('物业费', '车位费') COMMENT '抽奖种类选项',
-- 添加 'month' 字段，数据类型为 DATE，用于存储账单的年月日
ADD COLUMN MONTH DATE COMMENT '账单年月日',
-- 添加 'isPublish' 字段，数据类型为 BOOLEAN，用于表示抽奖活动是否已经发布
ADD COLUMN isPublish BOOLEAN COMMENT '抽奖活动是否已发布',
-- 添加 'pictureOne' 字段，数据类型为 VARCHAR(255)，用于存储第一张图片的文件路径或 URL
ADD COLUMN pictureOne VARCHAR(255) COMMENT '第一张图片的文件路径或URL',
-- 添加 'pictureTwo' 字段，数据类型为 VARCHAR(255)，用于存储第二张图片的文件路径或 URL
ADD COLUMN pictureTwo VARCHAR(255) COMMENT '第二张图片的文件路径或URL';
