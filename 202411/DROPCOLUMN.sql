-- 删除 MySQL 数据库中的 'award_activity' 表的指定字段
ALTER TABLE `award_activity`
-- 删除 'version' 字段
DROP COLUMN version,
-- 删除 'isLimit2' 字段
DROP COLUMN isLimit2,
-- 删除 'type' 字段
DROP COLUMN type,
-- 删除 'month' 字段
DROP COLUMN month,
-- 删除 'isPublish' 字段
DROP COLUMN isPublish,
-- 删除 'pictureOne' 字段
DROP COLUMN pictureOne,
-- 删除 'pictureTwo' 字段
DROP COLUMN pictureTwo;
