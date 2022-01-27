/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50643
 Source Host           : localhost:3306
 Source Schema         : forest_blog

 Target Server Type    : MySQL
 Target Server Version : 50643
 File Encoding         : 65001

 Date: 13/04/2021 13:23:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `article_user_id` int(11) unsigned DEFAULT NULL COMMENT '用户ID',
  `article_title` varchar(255) DEFAULT NULL COMMENT '标题',
  `article_content` mediumtext COMMENT '内容',
  `article_view_count` int(11) DEFAULT '0' COMMENT '访问量',
  `article_comment_count` int(11) DEFAULT '0' COMMENT '评论数',
  `article_like_count` int(11) DEFAULT '0' COMMENT '点赞数',
  `article_is_comment` int(1) unsigned DEFAULT NULL COMMENT '是否允许评论',
  `article_status` int(1) unsigned DEFAULT '1' COMMENT '状态',
  `article_order` int(11) unsigned DEFAULT NULL COMMENT '排序值',
  `article_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `article_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `article_summary` text COMMENT '摘要',
  `article_thumbnail` varchar(255) DEFAULT NULL COMMENT '缩略图',
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------


-- ----------------------------
-- Table structure for article_category_ref
-- ----------------------------
DROP TABLE IF EXISTS `article_category_ref`;
CREATE TABLE `article_category_ref` (
  `article_id` int(11) NOT NULL COMMENT '文章ID',
  `category_id` int(11) NOT NULL COMMENT '分类ID',
  PRIMARY KEY (`article_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_category_ref
-- ----------------------------

-- ----------------------------
-- Table structure for article_tag_ref
-- ----------------------------
DROP TABLE IF EXISTS `article_tag_ref`;
CREATE TABLE `article_tag_ref` (
  `article_id` int(11) NOT NULL COMMENT '文章ID',
  `tag_id` int(11) NOT NULL COMMENT '标签ID',
  PRIMARY KEY (`article_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_tag_ref
-- ----------------------------


-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `category_pid` int(11) DEFAULT NULL COMMENT '分类父ID',
  `category_name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `category_description` varchar(255) DEFAULT NULL COMMENT '描述',
  `category_order` int(11) unsigned DEFAULT '1' COMMENT '排序值',
  `category_icon` varchar(20) DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=100000009 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `comment_pid` int(11) unsigned DEFAULT '0' COMMENT '上级评论ID',
  `comment_pname` varchar(255) DEFAULT NULL COMMENT '上级评论名称',
  `comment_article_id` int(11) unsigned NOT NULL COMMENT '文章ID',
  `comment_author_name` varchar(50) DEFAULT NULL COMMENT '评论人名称',
  `comment_author_email` varchar(50) DEFAULT NULL COMMENT '评论人邮箱',
  `comment_author_url` varchar(50) DEFAULT NULL COMMENT '评论人个人主页',
  `comment_author_avatar` varchar(100) DEFAULT NULL COMMENT '评论人头像',
  `comment_content` varchar(1000) DEFAULT NULL COMMENT '内容',
  `comment_agent` varchar(200) DEFAULT NULL COMMENT '浏览器信息',
  `comment_ip` varchar(50) DEFAULT NULL COMMENT 'IP',
  `comment_create_time` datetime DEFAULT NULL COMMENT '评论时间',
  `comment_role` int(1) DEFAULT NULL COMMENT '角色，是否管理员',
  `comment_user_id` int(11) DEFAULT NULL COMMENT '评论ID,可能为空',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `link_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接ID',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'URL',
  `link_name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `link_image` varchar(255) DEFAULT NULL COMMENT '头像',
  `link_description` varchar(255) DEFAULT NULL COMMENT '描述',
  `link_owner_nickname` varchar(40) DEFAULT NULL COMMENT '所属人名称',
  `link_owner_contact` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `link_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `link_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `link_order` int(2) unsigned DEFAULT '1' COMMENT '排序号',
  `link_status` int(1) unsigned DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `link_name` (`link_name`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of link
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `menu_url` varchar(255) DEFAULT NULL COMMENT 'URL',
  `menu_level` int(11) DEFAULT NULL COMMENT '等级',
  `menu_icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `menu_order` int(11) DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `menu_name` (`menu_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
BEGIN;
INSERT INTO `menu` VALUES (1, '留言板', '/message', 2, 'fa fa-comment', 1);
INSERT INTO `menu` VALUES (2, 'LeetCode', 'https://leetcode.com/problemset/all', 2, 'ssss', 3);
INSERT INTO `menu` VALUES (3, '关于本站', '/aboutSite', 1, 'fa fa-info', 1);
INSERT INTO `menu` VALUES (4, '文章归档', '/articleFile', 1, 'fa-list-alt fa', 2);
INSERT INTO `menu` VALUES (5, '申请友链', '/applyLink', 1, 'fa fa-link', 3);
COMMIT;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(255) DEFAULT NULL COMMENT '公告标题',
  `notice_content` varchar(10000) DEFAULT NULL COMMENT '内容',
  `notice_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `notice_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `notice_status` int(1) unsigned DEFAULT '1' COMMENT '状态',
  `notice_order` int(2) DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------


-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `option_id` int(11) NOT NULL,
  `option_site_title` varchar(255) DEFAULT NULL,
  `option_site_descrption` varchar(255) DEFAULT NULL,
  `option_meta_descrption` varchar(255) DEFAULT NULL,
  `option_meta_keyword` varchar(255) DEFAULT NULL,
  `option_aboutsite_avatar` varchar(255) DEFAULT NULL,
  `option_aboutsite_title` varchar(255) DEFAULT NULL,
  `option_aboutsite_content` varchar(255) DEFAULT NULL,
  `option_aboutsite_wechat` varchar(255) DEFAULT NULL,
  `option_aboutsite_qq` varchar(255) DEFAULT NULL,
  `option_aboutsite_github` varchar(255) DEFAULT NULL,
  `option_aboutsite_weibo` varchar(255) DEFAULT NULL,
  `option_tongji` varchar(255) DEFAULT NULL,
  `option_status` int(1) DEFAULT '1',
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of options
-- ----------------------------
BEGIN;
INSERT INTO `options` VALUES (1, 'basicconstructionの博客','研究世界,从代码开始', '开源,开放', '基于言曌博客', '/img/logo.png', '博客初心', '热爱生活', '/uploads/2017/10/20171006224906122.jpg', '2691681743', '18864260492', '18864260492', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for page
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `page_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自定义页面ID',
  `page_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `page_title` varchar(50) DEFAULT NULL COMMENT '标题',
  `page_content` mediumtext COMMENT '内容',
  `page_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `page_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `page_view_count` int(10) unsigned DEFAULT '0' COMMENT '访问量',
  `page_comment_count` int(5) unsigned DEFAULT '0' COMMENT '评论数',
  `page_status` int(1) unsigned DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `page_key` (`page_key`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `tag_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `tag_name` varchar(50) DEFAULT NULL COMMENT '标签名称',
  `tag_description` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `tag_name` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(100) NOT NULL DEFAULT '' COMMENT '密码',
  `user_nickname` varchar(100) NOT NULL DEFAULT '' COMMENT '昵称',
  `user_email` varchar(100) DEFAULT '' COMMENT '邮箱',
  `user_url` varchar(100) DEFAULT '' COMMENT '个人主页',
  `user_avatar` varchar(100) DEFAULT NULL COMMENT '头像',
  `user_last_login_ip` varchar(30) DEFAULT NULL COMMENT '上传登录IP',
  `user_register_time` datetime DEFAULT NULL COMMENT '注册时间',
  `user_last_login_time` datetime DEFAULT NULL COMMENT '上传登录时间',
  `user_status` int(1) unsigned DEFAULT '1' COMMENT '状态',
  `user_role` varchar(20) NOT NULL DEFAULT 'user' COMMENT '角色',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;




insert into user(user_id,user_name,user_pass,user_nickname,user_email,user_role) values(1,'admin','Kbox668@admin',"tianyu",'bethaniebell8474@gmail.com','admin');


