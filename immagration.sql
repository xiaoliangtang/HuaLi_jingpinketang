-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 12 月 21 日 04:19
-- 服务器版本: 5.6.12-log
-- PHP 版本: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `immagration`
--
CREATE DATABASE IF NOT EXISTS `immagration` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `immagration`;

-- --------------------------------------------------------

--
-- 表的结构 `sp_access`
--

CREATE TABLE IF NOT EXISTS `sp_access` (
  `id` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(5) unsigned NOT NULL COMMENT '状态',
  `name` varchar(30) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `age` int(5) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `qq` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `marry` varchar(20) NOT NULL,
  `destination` varchar(30) NOT NULL COMMENT '最高学历',
  `child` varchar(20) NOT NULL,
  `child_age` int(5) unsigned NOT NULL,
  `en_level` varchar(20) NOT NULL,
  `place` varchar(50) NOT NULL,
  `relatives` varchar(20) NOT NULL,
  `pei_age` int(5) NOT NULL,
  `pei_destination` varchar(30) NOT NULL,
  `pei_relatives` varchar(20) NOT NULL,
  `pei_en_level` varchar(20) NOT NULL,
  `colleage` varchar(200) NOT NULL,
  `majar` varchar(30) NOT NULL,
  `degree` varchar(50) NOT NULL,
  `graduate_time` varchar(50) NOT NULL,
  `qz_year` varchar(50) NOT NULL,
  `company` varchar(200) NOT NULL,
  `duty` varchar(200) NOT NULL,
  `way` varchar(255) NOT NULL,
  `commit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '信息提交事件',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='评估信息' AUTO_INCREMENT=100 ;

--
-- 转存表中的数据 `sp_access`
--

INSERT INTO `sp_access` (`id`, `status`, `name`, `sex`, `age`, `phone`, `qq`, `email`, `marry`, `destination`, `child`, `child_age`, `en_level`, `place`, `relatives`, `pei_age`, `pei_destination`, `pei_relatives`, `pei_en_level`, `colleage`, `majar`, `degree`, `graduate_time`, `qz_year`, `company`, `duty`, `way`, `commit_time`) VALUES
(98, 0, '彭辉', '男', 35, '13568917691', '128005687', '128005687@qq.com', '已婚', '博士', '有', 12, '优秀', '广东省广州市', '有', 32, '博士', '有', '优秀', '广东工业大学', '英语专业', '博士', '2000-07-15', '2000.08-2015。08', '国际外贸公司', '外交经理', '广东华立移民留学服务公司官方网站', '2015-12-02 07:32:30');

-- --------------------------------------------------------

--
-- 表的结构 `sp_ad`
--

CREATE TABLE IF NOT EXISTS `sp_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL,
  `ad_content` text,
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sp_asset`
--

CREATE TABLE IF NOT EXISTS `sp_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) NOT NULL,
  `filename` varchar(50) DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `filepath` varchar(200) NOT NULL,
  `uploadtime` int(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  `meta` text,
  `suffix` varchar(50) DEFAULT NULL,
  `download_times` int(6) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sp_auth_access`
--

CREATE TABLE IF NOT EXISTS `sp_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `sp_auth_rule`
--

CREATE TABLE IF NOT EXISTS `sp_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='权限规则表' AUTO_INCREMENT=164 ;

--
-- 转存表中的数据 `sp_auth_rule`
--

INSERT INTO `sp_auth_rule` (`id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition`) VALUES
(1, 'Admin', 'admin_url', 'admin/content/default', NULL, '内容管理', 1, ''),
(2, 'Api', 'admin_url', 'api/guestbookadmin/index', NULL, '所有留言', 1, ''),
(3, 'Api', 'admin_url', 'api/guestbookadmin/delete', NULL, '删除网站留言', 1, ''),
(4, 'Comment', 'admin_url', 'comment/commentadmin/index', NULL, '评论管理', 1, ''),
(5, 'Comment', 'admin_url', 'comment/commentadmin/delete', NULL, '删除评论', 1, ''),
(6, 'Comment', 'admin_url', 'comment/commentadmin/check', NULL, '评论审核', 1, ''),
(7, 'Portal', 'admin_url', 'portal/adminpost/index', NULL, '文章管理', 1, ''),
(8, 'Portal', 'admin_url', 'portal/adminpost/listorders', NULL, '文章排序', 1, ''),
(9, 'Portal', 'admin_url', 'portal/adminpost/top', NULL, '文章置顶', 1, ''),
(10, 'Portal', 'admin_url', 'portal/adminpost/recommend', NULL, '文章推荐', 1, ''),
(11, 'Portal', 'admin_url', 'portal/adminpost/move', NULL, '批量移动', 1, ''),
(12, 'Portal', 'admin_url', 'portal/adminpost/check', NULL, '文章审核', 1, ''),
(13, 'Portal', 'admin_url', 'portal/adminpost/delete', NULL, '删除文章', 1, ''),
(14, 'Portal', 'admin_url', 'portal/adminpost/edit', NULL, '编辑文章', 1, ''),
(15, 'Portal', 'admin_url', 'portal/adminpost/edit_post', NULL, '提交编辑', 1, ''),
(16, 'Portal', 'admin_url', 'portal/adminpost/add', NULL, '添加文章', 1, ''),
(17, 'Portal', 'admin_url', 'portal/adminpost/add_post', NULL, '提交添加', 1, ''),
(18, 'Portal', 'admin_url', 'portal/adminterm/index', NULL, '分类管理', 1, ''),
(19, 'Portal', 'admin_url', 'portal/adminterm/listorders', NULL, '文章分类排序', 1, ''),
(20, 'Portal', 'admin_url', 'portal/adminterm/delete', NULL, '删除分类', 1, ''),
(21, 'Portal', 'admin_url', 'portal/adminterm/edit', NULL, '编辑分类', 1, ''),
(22, 'Portal', 'admin_url', 'portal/adminterm/edit_post', NULL, '提交编辑', 1, ''),
(23, 'Portal', 'admin_url', 'portal/adminterm/add', NULL, '添加分类', 1, ''),
(24, 'Portal', 'admin_url', 'portal/adminterm/add_post', NULL, '提交添加', 1, ''),
(25, 'Portal', 'admin_url', 'portal/adminpage/index', NULL, '页面管理', 1, ''),
(26, 'Portal', 'admin_url', 'portal/adminpage/listorders', NULL, '页面排序', 1, ''),
(27, 'Portal', 'admin_url', 'portal/adminpage/delete', NULL, '删除页面', 1, ''),
(28, 'Portal', 'admin_url', 'portal/adminpage/edit', NULL, '编辑页面', 1, ''),
(29, 'Portal', 'admin_url', 'portal/adminpage/edit_post', NULL, '提交编辑', 1, ''),
(30, 'Portal', 'admin_url', 'portal/adminpage/add', NULL, '添加页面', 1, ''),
(31, 'Portal', 'admin_url', 'portal/adminpage/add_post', NULL, '提交添加', 1, ''),
(32, 'Admin', 'admin_url', 'admin/recycle/default', NULL, '回收站', 1, ''),
(33, 'Portal', 'admin_url', 'portal/adminpost/recyclebin', NULL, '文章回收', 1, ''),
(34, 'Portal', 'admin_url', 'portal/adminpost/restore', NULL, '文章还原', 1, ''),
(35, 'Portal', 'admin_url', 'portal/adminpost/clean', NULL, '彻底删除', 1, ''),
(36, 'Portal', 'admin_url', 'portal/adminpage/recyclebin', NULL, '页面回收', 1, ''),
(37, 'Portal', 'admin_url', 'portal/adminpage/clean', NULL, '彻底删除', 1, ''),
(38, 'Portal', 'admin_url', 'portal/adminpage/restore', NULL, '页面还原', 1, ''),
(39, 'Admin', 'admin_url', 'admin/extension/default', NULL, '扩展工具', 1, ''),
(40, 'Admin', 'admin_url', 'admin/backup/default', NULL, '备份管理', 1, ''),
(41, 'Admin', 'admin_url', 'admin/backup/restore', NULL, '数据还原', 1, ''),
(42, 'Admin', 'admin_url', 'admin/backup/index', NULL, '数据备份', 1, ''),
(43, 'Admin', 'admin_url', 'admin/backup/index_post', NULL, '提交数据备份', 1, ''),
(44, 'Admin', 'admin_url', 'admin/backup/download', NULL, '下载备份', 1, ''),
(45, 'Admin', 'admin_url', 'admin/backup/del_backup', NULL, '删除备份', 1, ''),
(46, 'Admin', 'admin_url', 'admin/backup/import', NULL, '数据备份导入', 1, ''),
(47, 'Admin', 'admin_url', 'admin/plugin/index', NULL, '插件管理', 1, ''),
(48, 'Admin', 'admin_url', 'admin/plugin/toggle', NULL, '插件启用切换', 1, ''),
(49, 'Admin', 'admin_url', 'admin/plugin/setting', NULL, '插件设置', 1, ''),
(50, 'Admin', 'admin_url', 'admin/plugin/setting_post', NULL, '插件设置提交', 1, ''),
(51, 'Admin', 'admin_url', 'admin/plugin/install', NULL, '插件安装', 1, ''),
(52, 'Admin', 'admin_url', 'admin/plugin/uninstall', NULL, '插件卸载', 1, ''),
(53, 'Admin', 'admin_url', 'admin/slide/default', NULL, '幻灯片', 1, ''),
(54, 'Admin', 'admin_url', 'admin/slide/index', NULL, '幻灯片管理', 1, ''),
(55, 'Admin', 'admin_url', 'admin/slide/listorders', NULL, '幻灯片排序', 1, ''),
(56, 'Admin', 'admin_url', 'admin/slide/toggle', NULL, '幻灯片显示切换', 1, ''),
(57, 'Admin', 'admin_url', 'admin/slide/delete', NULL, '删除幻灯片', 1, ''),
(58, 'Admin', 'admin_url', 'admin/slide/edit', NULL, '编辑幻灯片', 1, ''),
(59, 'Admin', 'admin_url', 'admin/slide/edit_post', NULL, '提交编辑', 1, ''),
(60, 'Admin', 'admin_url', 'admin/slide/add', NULL, '添加幻灯片', 1, ''),
(61, 'Admin', 'admin_url', 'admin/slide/add_post', NULL, '提交添加', 1, ''),
(62, 'Admin', 'admin_url', 'admin/slidecat/index', NULL, '幻灯片分类', 1, ''),
(63, 'Admin', 'admin_url', 'admin/slidecat/delete', NULL, '删除分类', 1, ''),
(64, 'Admin', 'admin_url', 'admin/slidecat/edit', NULL, '编辑分类', 1, ''),
(65, 'Admin', 'admin_url', 'admin/slidecat/edit_post', NULL, '提交编辑', 1, ''),
(66, 'Admin', 'admin_url', 'admin/slidecat/add', NULL, '添加分类', 1, ''),
(67, 'Admin', 'admin_url', 'admin/slidecat/add_post', NULL, '提交添加', 1, ''),
(68, 'Admin', 'admin_url', 'admin/ad/index', NULL, '网站广告', 1, ''),
(69, 'Admin', 'admin_url', 'admin/ad/toggle', NULL, '广告显示切换', 1, ''),
(70, 'Admin', 'admin_url', 'admin/ad/delete', NULL, '删除广告', 1, ''),
(71, 'Admin', 'admin_url', 'admin/ad/edit', NULL, '编辑广告', 1, ''),
(72, 'Admin', 'admin_url', 'admin/ad/edit_post', NULL, '提交编辑', 1, ''),
(73, 'Admin', 'admin_url', 'admin/ad/add', NULL, '添加广告', 1, ''),
(74, 'Admin', 'admin_url', 'admin/ad/add_post', NULL, '提交添加', 1, ''),
(75, 'Admin', 'admin_url', 'admin/link/index', NULL, '友情链接', 1, ''),
(76, 'Admin', 'admin_url', 'admin/link/listorders', NULL, '友情链接排序', 1, ''),
(77, 'Admin', 'admin_url', 'admin/link/toggle', NULL, '友链显示切换', 1, ''),
(78, 'Admin', 'admin_url', 'admin/link/delete', NULL, '删除友情链接', 1, ''),
(79, 'Admin', 'admin_url', 'admin/link/edit', NULL, '编辑友情链接', 1, ''),
(80, 'Admin', 'admin_url', 'admin/link/edit_post', NULL, '提交编辑', 1, ''),
(81, 'Admin', 'admin_url', 'admin/link/add', NULL, '添加友情链接', 1, ''),
(82, 'Admin', 'admin_url', 'admin/link/add_post', NULL, '提交添加', 1, ''),
(83, 'Api', 'admin_url', 'api/oauthadmin/setting', NULL, '第三方登陆', 1, ''),
(84, 'Api', 'admin_url', 'api/oauthadmin/setting_post', NULL, '提交设置', 1, ''),
(85, 'Admin', 'admin_url', 'admin/menu/default', NULL, '菜单管理', 1, ''),
(86, 'Admin', 'admin_url', 'admin/navcat/default1', NULL, '前台菜单', 1, ''),
(87, 'Admin', 'admin_url', 'admin/nav/index', NULL, '菜单管理', 1, ''),
(88, 'Admin', 'admin_url', 'admin/nav/listorders', NULL, '前台导航排序', 1, ''),
(89, 'Admin', 'admin_url', 'admin/nav/delete', NULL, '删除菜单', 1, ''),
(90, 'Admin', 'admin_url', 'admin/nav/edit', NULL, '编辑菜单', 1, ''),
(91, 'Admin', 'admin_url', 'admin/nav/edit_post', NULL, '提交编辑', 1, ''),
(92, 'Admin', 'admin_url', 'admin/nav/add', NULL, '添加菜单', 1, ''),
(93, 'Admin', 'admin_url', 'admin/nav/add_post', NULL, '提交添加', 1, ''),
(94, 'Admin', 'admin_url', 'admin/navcat/index', NULL, '菜单分类', 1, ''),
(95, 'Admin', 'admin_url', 'admin/navcat/delete', NULL, '删除分类', 1, ''),
(96, 'Admin', 'admin_url', 'admin/navcat/edit', NULL, '编辑分类', 1, ''),
(97, 'Admin', 'admin_url', 'admin/navcat/edit_post', NULL, '提交编辑', 1, ''),
(98, 'Admin', 'admin_url', 'admin/navcat/add', NULL, '添加分类', 1, ''),
(99, 'Admin', 'admin_url', 'admin/navcat/add_post', NULL, '提交添加', 1, ''),
(100, 'Admin', 'admin_url', 'admin/menu/index', NULL, '后台菜单', 1, ''),
(101, 'Admin', 'admin_url', 'admin/menu/add', NULL, '添加菜单', 1, ''),
(102, 'Admin', 'admin_url', 'admin/menu/add_post', NULL, '提交添加', 1, ''),
(103, 'Admin', 'admin_url', 'admin/menu/listorders', NULL, '后台菜单排序', 1, ''),
(104, 'Admin', 'admin_url', 'admin/menu/export_menu', NULL, '菜单备份', 1, ''),
(105, 'Admin', 'admin_url', 'admin/menu/edit', NULL, '编辑菜单', 1, ''),
(106, 'Admin', 'admin_url', 'admin/menu/edit_post', NULL, '提交编辑', 1, ''),
(107, 'Admin', 'admin_url', 'admin/menu/delete', NULL, '删除菜单', 1, ''),
(108, 'Admin', 'admin_url', 'admin/menu/lists', NULL, '所有菜单', 1, ''),
(109, 'Admin', 'admin_url', 'admin/setting/default', NULL, '设置', 1, ''),
(110, 'Admin', 'admin_url', 'admin/setting/userdefault', NULL, '个人信息', 1, ''),
(111, 'Admin', 'admin_url', 'admin/user/userinfo', NULL, '修改信息', 1, ''),
(112, 'Admin', 'admin_url', 'admin/user/userinfo_post', NULL, '修改信息提交', 1, ''),
(113, 'Admin', 'admin_url', 'admin/setting/password', NULL, '修改密码', 1, ''),
(114, 'Admin', 'admin_url', 'admin/setting/password_post', NULL, '提交修改', 1, ''),
(115, 'Admin', 'admin_url', 'admin/setting/site', NULL, '网站信息', 1, ''),
(116, 'Admin', 'admin_url', 'admin/setting/site_post', NULL, '提交修改', 1, ''),
(117, 'Admin', 'admin_url', 'admin/route/index', NULL, '路由列表', 1, ''),
(118, 'Admin', 'admin_url', 'admin/route/add', NULL, '路由添加', 1, ''),
(119, 'Admin', 'admin_url', 'admin/route/add_post', NULL, '路由添加提交', 1, ''),
(120, 'Admin', 'admin_url', 'admin/route/edit', NULL, '路由编辑', 1, ''),
(121, 'Admin', 'admin_url', 'admin/route/edit_post', NULL, '路由编辑提交', 1, ''),
(122, 'Admin', 'admin_url', 'admin/route/delete', NULL, '路由删除', 1, ''),
(123, 'Admin', 'admin_url', 'admin/route/ban', NULL, '路由禁止', 1, ''),
(124, 'Admin', 'admin_url', 'admin/route/open', NULL, '路由启用', 1, ''),
(125, 'Admin', 'admin_url', 'admin/route/listorders', NULL, '路由排序', 1, ''),
(126, 'Admin', 'admin_url', 'admin/mailer/default', NULL, '邮箱配置', 1, ''),
(127, 'Admin', 'admin_url', 'admin/mailer/index', NULL, 'SMTP配置', 1, ''),
(128, 'Admin', 'admin_url', 'admin/mailer/index_post', NULL, '提交配置', 1, ''),
(129, 'Admin', 'admin_url', 'admin/mailer/active', NULL, '邮件模板', 1, ''),
(130, 'Admin', 'admin_url', 'admin/mailer/active_post', NULL, '提交模板', 1, ''),
(131, 'Admin', 'admin_url', 'admin/setting/clearcache', NULL, '清除缓存', 1, ''),
(132, 'User', 'admin_url', 'user/indexadmin/default', NULL, '用户管理', 1, ''),
(133, 'User', 'admin_url', 'user/indexadmin/default1', NULL, '用户组', 1, ''),
(134, 'User', 'admin_url', 'user/indexadmin/index', NULL, '本站用户', 1, ''),
(135, 'User', 'admin_url', 'user/indexadmin/ban', NULL, '拉黑会员', 1, ''),
(136, 'User', 'admin_url', 'user/indexadmin/cancelban', NULL, '启用会员', 1, ''),
(137, 'User', 'admin_url', 'user/oauthadmin/index', NULL, '第三方用户', 1, ''),
(138, 'User', 'admin_url', 'user/oauthadmin/delete', NULL, '第三方用户解绑', 1, ''),
(139, 'User', 'admin_url', 'user/indexadmin/default3', NULL, '管理组', 1, ''),
(140, 'Admin', 'admin_url', 'admin/rbac/index', NULL, '角色管理', 1, ''),
(141, 'Admin', 'admin_url', 'admin/rbac/member', NULL, '成员管理', 1, ''),
(142, 'Admin', 'admin_url', 'admin/rbac/authorize', NULL, '权限设置', 1, ''),
(143, 'Admin', 'admin_url', 'admin/rbac/authorize_post', NULL, '提交设置', 1, ''),
(144, 'Admin', 'admin_url', 'admin/rbac/roleedit', NULL, '编辑角色', 1, ''),
(145, 'Admin', 'admin_url', 'admin/rbac/roleedit_post', NULL, '提交编辑', 1, ''),
(146, 'Admin', 'admin_url', 'admin/rbac/roledelete', NULL, '删除角色', 1, ''),
(147, 'Admin', 'admin_url', 'admin/rbac/roleadd', NULL, '添加角色', 1, ''),
(148, 'Admin', 'admin_url', 'admin/rbac/roleadd_post', NULL, '提交添加', 1, ''),
(149, 'Admin', 'admin_url', 'admin/user/index', NULL, '管理员', 1, ''),
(150, 'Admin', 'admin_url', 'admin/user/delete', NULL, '删除管理员', 1, ''),
(151, 'Admin', 'admin_url', 'admin/user/edit', NULL, '管理员编辑', 1, ''),
(152, 'Admin', 'admin_url', 'admin/user/edit_post', NULL, '编辑提交', 1, ''),
(153, 'Admin', 'admin_url', 'admin/user/add', NULL, '管理员添加', 1, ''),
(154, 'Admin', 'admin_url', 'admin/user/add_post', NULL, '添加提交', 1, ''),
(155, 'Admin', 'admin_url', 'admin/plugin/update', NULL, '插件更新', 1, ''),
(156, 'Admin', 'admin_url', 'admin/storage/index', NULL, '文件存储', 1, ''),
(157, 'Admin', 'admin_url', 'admin/storage/setting_post', NULL, '文件存储设置提交', 1, ''),
(158, 'Admin', 'admin_url', 'admin/slide/ban', NULL, '禁用幻灯片', 1, ''),
(159, 'Admin', 'admin_url', 'admin/slide/cancelban', NULL, '启用幻灯片', 1, ''),
(160, 'Admin', 'admin_url', 'admin/user/ban', NULL, '禁用管理员', 1, ''),
(161, 'Admin', 'admin_url', 'admin/user/cancelban', NULL, '启用管理员', 1, ''),
(162, 'Admin', 'admin_url', 'admin/access/index', NULL, '评估管理', 1, ''),
(163, 'Admin', 'admin_url', 'admin/access/display', NULL, '评估详细资料', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `sp_comments`
--

CREATE TABLE IF NOT EXISTS `sp_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sp_common_action_log`
--

CREATE TABLE IF NOT EXISTS `sp_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55 ;

--
-- 转存表中的数据 `sp_common_action_log`
--

INSERT INTO `sp_common_action_log` (`id`, `user`, `object`, `action`, `count`, `last_time`, `ip`) VALUES
(1, 0, 'posts7', 'Portal-Article-index', 23, 1447419966, '127.0.0.1'),
(2, 0, 'posts8', 'Portal-Article-index', 23, 1447483070, '127.0.0.1'),
(3, 0, 'posts9', 'Portal-Article-index', 29, 1447483073, '127.0.0.1'),
(4, 0, 'posts10', 'Portal-Article-index', 29, 1447483388, '127.0.0.1'),
(5, 0, 'posts11', 'Portal-Article-index', 165, 1447554406, '127.0.0.1'),
(6, 0, 'posts13', 'Portal-Article-index', 31, 1447495773, '127.0.0.1'),
(7, 0, 'posts12', 'Portal-Article-index', 50, 1447479476, '127.0.0.1'),
(8, 0, 'posts14', 'Portal-Article-index', 43, 1447483394, '127.0.0.1'),
(9, 0, 'posts16', 'Portal-Article-index', 3, 1447486258, '127.0.0.1'),
(10, 0, 'posts15', 'Portal-Article-index', 4, 1447486254, '127.0.0.1'),
(11, 0, 'posts17', 'Portal-Article-index', 6, 1447563236, '127.0.0.1'),
(12, 0, 'posts18', 'Portal-Article-index', 2, 1447496606, '127.0.0.1'),
(13, 0, 'posts24', 'Portal-Article-index', 3, 1447571076, '127.0.0.1'),
(14, 0, 'posts28', 'Portal-Article-index', 1, 1447547086, '127.0.0.1'),
(15, 0, 'posts25', 'Portal-Article-index', 1, 1447547363, '127.0.0.1'),
(16, 0, 'posts32', 'Portal-Article-index', 14, 1448440165, '127.0.0.1'),
(17, 0, 'posts53', 'Portal-Article-index', 2, 1447836845, '127.0.0.1'),
(18, 0, 'posts55', 'Portal-Article-index', 3, 1447836852, '127.0.0.1'),
(19, 0, 'posts56', 'Portal-Article-index', 8, 1447862758, '127.0.0.1'),
(20, 0, 'posts54', 'Portal-Article-index', 2, 1447836836, '127.0.0.1'),
(21, 0, 'posts60', 'Portal-Article-index', 1, 1447846181, '127.0.0.1'),
(22, 0, 'posts89', 'Portal-Article-index', 1, 1447853600, '127.0.0.1'),
(23, 0, 'posts99', 'Portal-Article-index', 1, 1447853613, '127.0.0.1'),
(24, 0, 'posts100', 'Portal-Article-index', 9, 1448160103, '127.0.0.1'),
(25, 0, 'posts71', 'Portal-Article-index', 1, 1448160074, '127.0.0.1'),
(26, 0, 'posts59', 'Portal-Article-index', 1, 1448160089, '127.0.0.1'),
(27, 0, 'posts101', 'Portal-Article-index', 1, 1448160113, '127.0.0.1'),
(28, 0, 'posts103', 'Portal-Article-index', 1, 1448160782, '127.0.0.1'),
(29, 0, 'posts106', 'Portal-Article-index', 15, 1448778655, '127.0.0.1'),
(30, 0, 'posts108', 'Portal-Article-index', 2, 1448253426, '127.0.0.1'),
(31, 0, 'posts109', 'Portal-Article-index', 5, 1448373075, '127.0.0.1'),
(32, 0, 'posts110', 'Portal-Article-index', 4, 1448439988, '127.0.0.1'),
(33, 0, 'posts105', 'Portal-Article-index', 3, 1448373195, '127.0.0.1'),
(34, 0, 'posts112', 'Portal-Article-index', 2, 1448372716, '127.0.0.1'),
(35, 0, 'posts113', 'Portal-Article-index', 2, 1448440010, '127.0.0.1'),
(36, 0, 'posts114', 'Portal-Article-index', 1, 1448440020, '127.0.0.1'),
(37, 0, 'posts115', 'Portal-Article-index', 2, 1449463903, '127.0.0.1'),
(38, 0, 'posts121', 'Portal-Article-index', 7, 1449567444, '127.0.0.1'),
(39, 0, 'posts122', 'Portal-Article-index', 6, 1449493838, '127.0.0.1'),
(40, 0, 'posts123', 'Portal-Article-index', 8, 1449463808, '127.0.0.1'),
(41, 0, 'posts124', 'Portal-Article-index', 13, 1449493726, '127.0.0.1'),
(42, 0, 'posts125', 'Portal-Article-index', 11, 1449550197, '127.0.0.1'),
(43, 0, 'posts127', 'Portal-Article-index', 5, 1449134754, '127.0.0.1'),
(44, 0, 'posts126', 'Portal-Article-index', 5, 1450346662, '127.0.0.1'),
(45, 0, 'posts128', 'Portal-Article-index', 10, 1449487480, '127.0.0.1'),
(46, 0, 'posts129', 'Portal-Article-index', 20, 1449567393, '127.0.0.1'),
(47, 0, 'posts130', 'Portal-Article-index', 4, 1449493793, '127.0.0.1'),
(48, 0, 'posts119', 'Portal-Article-index', 1, 1449149892, '127.0.0.1'),
(49, 0, 'posts131', 'Portal-Article-index', 13, 1449493835, '127.0.0.1'),
(50, 0, 'posts134', 'Portal-Article-index', 5, 1449567101, '127.0.0.1'),
(51, 0, 'posts136', 'Portal-Article-index', 1, 1449464134, '127.0.0.1'),
(52, 0, 'posts135', 'Portal-Article-index', 8, 1449579385, '127.0.0.1'),
(53, 0, 'posts133', 'Portal-Article-index', 2, 1449579240, '127.0.0.1'),
(54, 0, 'posts145', 'Portal-Article-index', 1, 1450346656, '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `sp_guestbook`
--

CREATE TABLE IF NOT EXISTS `sp_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL,
  `status` smallint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sp_links`
--

CREATE TABLE IF NOT EXISTS `sp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT '',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `sp_links`
--

INSERT INTO `sp_links` (`link_id`, `link_url`, `link_name`, `link_image`, `link_target`, `link_description`, `link_status`, `link_rating`, `link_rel`, `listorder`) VALUES
(3, 'http://www.hualixy.com/', '广工华立学院', '', '_blank', '', 1, 0, '', 0),
(4, 'http://www.baidu.com', '百度一下', '', '_blank', '', 1, 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sp_menu`
--

CREATE TABLE IF NOT EXISTS `sp_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(20) NOT NULL COMMENT '控制器',
  `action` char(20) NOT NULL COMMENT '操作名称',
  `data` char(50) NOT NULL COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=164 ;

--
-- 转存表中的数据 `sp_menu`
--

INSERT INTO `sp_menu` (`id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder`) VALUES
(1, 0, 'Admin', 'Content', 'default', '', 0, 1, '内容管理', 'th', '', 30),
(2, 1, 'Api', 'Guestbookadmin', 'index', '', 1, 1, '所有留言', '', '', 0),
(3, 2, 'Api', 'Guestbookadmin', 'delete', '', 1, 0, '删除网站留言', '', '', 0),
(4, 1, 'Comment', 'Commentadmin', 'index', '', 1, 1, '评论管理', '', '', 0),
(5, 4, 'Comment', 'Commentadmin', 'delete', '', 1, 0, '删除评论', '', '', 0),
(6, 4, 'Comment', 'Commentadmin', 'check', '', 1, 0, '评论审核', '', '', 0),
(7, 1, 'Portal', 'AdminPost', 'index', '', 1, 1, '文章管理', '', '', 1),
(8, 7, 'Portal', 'AdminPost', 'listorders', '', 1, 0, '文章排序', '', '', 0),
(9, 7, 'Portal', 'AdminPost', 'top', '', 1, 0, '文章置顶', '', '', 0),
(10, 7, 'Portal', 'AdminPost', 'recommend', '', 1, 0, '文章推荐', '', '', 0),
(11, 7, 'Portal', 'AdminPost', 'move', '', 1, 0, '批量移动', '', '', 1000),
(12, 7, 'Portal', 'AdminPost', 'check', '', 1, 0, '文章审核', '', '', 1000),
(13, 7, 'Portal', 'AdminPost', 'delete', '', 1, 0, '删除文章', '', '', 1000),
(14, 7, 'Portal', 'AdminPost', 'edit', '', 1, 0, '编辑文章', '', '', 1000),
(15, 14, 'Portal', 'AdminPost', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(16, 7, 'Portal', 'AdminPost', 'add', '', 1, 0, '添加文章', '', '', 1000),
(17, 16, 'Portal', 'AdminPost', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(18, 1, 'Portal', 'AdminTerm', 'index', '', 0, 1, '分类管理', '', '', 2),
(19, 18, 'Portal', 'AdminTerm', 'listorders', '', 1, 0, '文章分类排序', '', '', 0),
(20, 18, 'Portal', 'AdminTerm', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(21, 18, 'Portal', 'AdminTerm', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(22, 21, 'Portal', 'AdminTerm', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(23, 18, 'Portal', 'AdminTerm', 'add', '', 1, 0, '添加分类', '', '', 1000),
(24, 23, 'Portal', 'AdminTerm', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(25, 1, 'Portal', 'AdminPage', 'index', '', 1, 1, '页面管理', '', '', 3),
(26, 25, 'Portal', 'AdminPage', 'listorders', '', 1, 0, '页面排序', '', '', 0),
(27, 25, 'Portal', 'AdminPage', 'delete', '', 1, 0, '删除页面', '', '', 1000),
(28, 25, 'Portal', 'AdminPage', 'edit', '', 1, 0, '编辑页面', '', '', 1000),
(29, 28, 'Portal', 'AdminPage', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(30, 25, 'Portal', 'AdminPage', 'add', '', 1, 0, '添加页面', '', '', 1000),
(31, 30, 'Portal', 'AdminPage', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(32, 1, 'Admin', 'Recycle', 'default', '', 1, 1, '回收站', '', '', 4),
(33, 32, 'Portal', 'AdminPost', 'recyclebin', '', 1, 1, '文章回收', '', '', 0),
(34, 33, 'Portal', 'AdminPost', 'restore', '', 1, 0, '文章还原', '', '', 1000),
(35, 33, 'Portal', 'AdminPost', 'clean', '', 1, 0, '彻底删除', '', '', 1000),
(36, 32, 'Portal', 'AdminPage', 'recyclebin', '', 1, 1, '页面回收', '', '', 1),
(37, 36, 'Portal', 'AdminPage', 'clean', '', 1, 0, '彻底删除', '', '', 1000),
(38, 36, 'Portal', 'AdminPage', 'restore', '', 1, 0, '页面还原', '', '', 1000),
(39, 0, 'Admin', 'Extension', 'default', '', 0, 1, '扩展工具', 'cloud', '', 40),
(40, 39, 'Admin', 'Backup', 'default', '', 1, 1, '备份管理', '', '', 0),
(41, 40, 'Admin', 'Backup', 'restore', '', 1, 1, '数据还原', '', '', 0),
(42, 40, 'Admin', 'Backup', 'index', '', 1, 1, '数据备份', '', '', 0),
(43, 42, 'Admin', 'Backup', 'index_post', '', 1, 0, '提交数据备份', '', '', 0),
(44, 40, 'Admin', 'Backup', 'download', '', 1, 0, '下载备份', '', '', 1000),
(45, 40, 'Admin', 'Backup', 'del_backup', '', 1, 0, '删除备份', '', '', 1000),
(46, 40, 'Admin', 'Backup', 'import', '', 1, 0, '数据备份导入', '', '', 1000),
(47, 39, 'Admin', 'Plugin', 'index', '', 1, 1, '插件管理', '', '', 0),
(48, 47, 'Admin', 'Plugin', 'toggle', '', 1, 0, '插件启用切换', '', '', 0),
(49, 47, 'Admin', 'Plugin', 'setting', '', 1, 0, '插件设置', '', '', 0),
(50, 49, 'Admin', 'Plugin', 'setting_post', '', 1, 0, '插件设置提交', '', '', 0),
(51, 47, 'Admin', 'Plugin', 'install', '', 1, 0, '插件安装', '', '', 0),
(52, 47, 'Admin', 'Plugin', 'uninstall', '', 1, 0, '插件卸载', '', '', 0),
(53, 39, 'Admin', 'Slide', 'default', '', 1, 1, '幻灯片', '', '', 1),
(54, 53, 'Admin', 'Slide', 'index', '', 1, 1, '幻灯片管理', '', '', 0),
(55, 54, 'Admin', 'Slide', 'listorders', '', 1, 0, '幻灯片排序', '', '', 0),
(56, 54, 'Admin', 'Slide', 'toggle', '', 1, 0, '幻灯片显示切换', '', '', 0),
(57, 54, 'Admin', 'Slide', 'delete', '', 1, 0, '删除幻灯片', '', '', 1000),
(58, 54, 'Admin', 'Slide', 'edit', '', 1, 0, '编辑幻灯片', '', '', 1000),
(59, 58, 'Admin', 'Slide', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(60, 54, 'Admin', 'Slide', 'add', '', 1, 0, '添加幻灯片', '', '', 1000),
(61, 60, 'Admin', 'Slide', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(62, 53, 'Admin', 'Slidecat', 'index', '', 1, 1, '幻灯片分类', '', '', 0),
(63, 62, 'Admin', 'Slidecat', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(64, 62, 'Admin', 'Slidecat', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(65, 64, 'Admin', 'Slidecat', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(66, 62, 'Admin', 'Slidecat', 'add', '', 1, 0, '添加分类', '', '', 1000),
(67, 66, 'Admin', 'Slidecat', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(68, 39, 'Admin', 'Ad', 'index', '', 1, 1, '网站广告', '', '', 2),
(69, 68, 'Admin', 'Ad', 'toggle', '', 1, 0, '广告显示切换', '', '', 0),
(70, 68, 'Admin', 'Ad', 'delete', '', 1, 0, '删除广告', '', '', 1000),
(71, 68, 'Admin', 'Ad', 'edit', '', 1, 0, '编辑广告', '', '', 1000),
(72, 71, 'Admin', 'Ad', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(73, 68, 'Admin', 'Ad', 'add', '', 1, 0, '添加广告', '', '', 1000),
(74, 73, 'Admin', 'Ad', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(75, 39, 'Admin', 'Link', 'index', '', 0, 1, '友情链接', '', '', 3),
(76, 75, 'Admin', 'Link', 'listorders', '', 1, 0, '友情链接排序', '', '', 0),
(77, 75, 'Admin', 'Link', 'toggle', '', 1, 0, '友链显示切换', '', '', 0),
(78, 75, 'Admin', 'Link', 'delete', '', 1, 0, '删除友情链接', '', '', 1000),
(79, 75, 'Admin', 'Link', 'edit', '', 1, 0, '编辑友情链接', '', '', 1000),
(80, 79, 'Admin', 'Link', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(81, 75, 'Admin', 'Link', 'add', '', 1, 0, '添加友情链接', '', '', 1000),
(82, 81, 'Admin', 'Link', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(83, 39, 'Api', 'Oauthadmin', 'setting', '', 1, 1, '第三方登陆', 'leaf', '', 4),
(84, 83, 'Api', 'Oauthadmin', 'setting_post', '', 1, 0, '提交设置', '', '', 0),
(85, 0, 'Admin', 'Menu', 'default', '', 1, 1, '菜单管理', 'list', '', 20),
(86, 85, 'Admin', 'Navcat', 'default1', '', 1, 1, '前台菜单', '', '', 0),
(87, 86, 'Admin', 'Nav', 'index', '', 1, 1, '菜单管理', '', '', 0),
(88, 87, 'Admin', 'Nav', 'listorders', '', 1, 0, '前台导航排序', '', '', 0),
(89, 87, 'Admin', 'Nav', 'delete', '', 1, 0, '删除菜单', '', '', 1000),
(90, 87, 'Admin', 'Nav', 'edit', '', 1, 0, '编辑菜单', '', '', 1000),
(91, 90, 'Admin', 'Nav', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(92, 87, 'Admin', 'Nav', 'add', '', 1, 0, '添加菜单', '', '', 1000),
(93, 92, 'Admin', 'Nav', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(94, 86, 'Admin', 'Navcat', 'index', '', 1, 1, '菜单分类', '', '', 0),
(95, 94, 'Admin', 'Navcat', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(96, 94, 'Admin', 'Navcat', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(97, 96, 'Admin', 'Navcat', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(98, 94, 'Admin', 'Navcat', 'add', '', 1, 0, '添加分类', '', '', 1000),
(99, 98, 'Admin', 'Navcat', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(100, 85, 'Admin', 'Menu', 'index', '', 1, 1, '后台菜单', '', '', 0),
(101, 100, 'Admin', 'Menu', 'add', '', 1, 0, '添加菜单', '', '', 0),
(102, 101, 'Admin', 'Menu', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(103, 100, 'Admin', 'Menu', 'listorders', '', 1, 0, '后台菜单排序', '', '', 0),
(104, 100, 'Admin', 'Menu', 'export_menu', '', 1, 0, '菜单备份', '', '', 1000),
(105, 100, 'Admin', 'Menu', 'edit', '', 1, 0, '编辑菜单', '', '', 1000),
(106, 105, 'Admin', 'Menu', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(107, 100, 'Admin', 'Menu', 'delete', '', 1, 0, '删除菜单', '', '', 1000),
(108, 100, 'Admin', 'Menu', 'lists', '', 1, 0, '所有菜单', '', '', 1000),
(109, 0, 'Admin', 'Setting', 'default', '', 0, 1, '设置', 'cogs', '', 0),
(110, 109, 'Admin', 'Setting', 'userdefault', '', 0, 1, '个人信息', '', '', 0),
(111, 110, 'Admin', 'User', 'userinfo', '', 1, 1, '修改信息', '', '', 0),
(112, 111, 'Admin', 'User', 'userinfo_post', '', 1, 0, '修改信息提交', '', '', 0),
(113, 110, 'Admin', 'Setting', 'password', '', 1, 1, '修改密码', '', '', 0),
(114, 113, 'Admin', 'Setting', 'password_post', '', 1, 0, '提交修改', '', '', 0),
(115, 109, 'Admin', 'Setting', 'site', '', 1, 1, '网站信息', '', '', 0),
(116, 115, 'Admin', 'Setting', 'site_post', '', 1, 0, '提交修改', '', '', 0),
(117, 115, 'Admin', 'Route', 'index', '', 1, 0, '路由列表', '', '', 0),
(118, 115, 'Admin', 'Route', 'add', '', 1, 0, '路由添加', '', '', 0),
(119, 118, 'Admin', 'Route', 'add_post', '', 1, 0, '路由添加提交', '', '', 0),
(120, 115, 'Admin', 'Route', 'edit', '', 1, 0, '路由编辑', '', '', 0),
(121, 120, 'Admin', 'Route', 'edit_post', '', 1, 0, '路由编辑提交', '', '', 0),
(122, 115, 'Admin', 'Route', 'delete', '', 1, 0, '路由删除', '', '', 0),
(123, 115, 'Admin', 'Route', 'ban', '', 1, 0, '路由禁止', '', '', 0),
(124, 115, 'Admin', 'Route', 'open', '', 1, 0, '路由启用', '', '', 0),
(125, 115, 'Admin', 'Route', 'listorders', '', 1, 0, '路由排序', '', '', 0),
(126, 109, 'Admin', 'Mailer', 'default', '', 1, 1, '邮箱配置', '', '', 0),
(127, 126, 'Admin', 'Mailer', 'index', '', 1, 1, 'SMTP配置', '', '', 0),
(128, 127, 'Admin', 'Mailer', 'index_post', '', 1, 0, '提交配置', '', '', 0),
(129, 126, 'Admin', 'Mailer', 'active', '', 1, 1, '邮件模板', '', '', 0),
(130, 129, 'Admin', 'Mailer', 'active_post', '', 1, 0, '提交模板', '', '', 0),
(131, 109, 'Admin', 'Setting', 'clearcache', '', 1, 1, '清除缓存', '', '', 1),
(132, 0, 'User', 'Indexadmin', 'default', '', 1, 1, '用户管理', 'group', '', 10),
(133, 132, 'User', 'Indexadmin', 'default1', '', 1, 1, '用户组', '', '', 0),
(134, 133, 'User', 'Indexadmin', 'index', '', 1, 1, '本站用户', 'leaf', '', 0),
(135, 134, 'User', 'Indexadmin', 'ban', '', 1, 0, '拉黑会员', '', '', 0),
(136, 134, 'User', 'Indexadmin', 'cancelban', '', 1, 0, '启用会员', '', '', 0),
(137, 133, 'User', 'Oauthadmin', 'index', '', 1, 1, '第三方用户', 'leaf', '', 0),
(138, 137, 'User', 'Oauthadmin', 'delete', '', 1, 0, '第三方用户解绑', '', '', 0),
(139, 132, 'User', 'Indexadmin', 'default3', '', 1, 1, '管理组', '', '', 0),
(140, 139, 'Admin', 'Rbac', 'index', '', 1, 1, '角色管理', '', '', 0),
(141, 140, 'Admin', 'Rbac', 'member', '', 1, 0, '成员管理', '', '', 1000),
(142, 140, 'Admin', 'Rbac', 'authorize', '', 1, 0, '权限设置', '', '', 1000),
(143, 142, 'Admin', 'Rbac', 'authorize_post', '', 1, 0, '提交设置', '', '', 0),
(144, 140, 'Admin', 'Rbac', 'roleedit', '', 1, 0, '编辑角色', '', '', 1000),
(145, 144, 'Admin', 'Rbac', 'roleedit_post', '', 1, 0, '提交编辑', '', '', 0),
(146, 140, 'Admin', 'Rbac', 'roledelete', '', 1, 1, '删除角色', '', '', 1000),
(147, 140, 'Admin', 'Rbac', 'roleadd', '', 1, 1, '添加角色', '', '', 1000),
(148, 147, 'Admin', 'Rbac', 'roleadd_post', '', 1, 0, '提交添加', '', '', 0),
(149, 139, 'Admin', 'User', 'index', '', 1, 1, '管理员', '', '', 0),
(150, 149, 'Admin', 'User', 'delete', '', 1, 0, '删除管理员', '', '', 1000),
(151, 149, 'Admin', 'User', 'edit', '', 1, 0, '管理员编辑', '', '', 1000),
(152, 151, 'Admin', 'User', 'edit_post', '', 1, 0, '编辑提交', '', '', 0),
(153, 149, 'Admin', 'User', 'add', '', 1, 0, '管理员添加', '', '', 1000),
(154, 153, 'Admin', 'User', 'add_post', '', 1, 0, '添加提交', '', '', 0),
(155, 47, 'Admin', 'Plugin', 'update', '', 1, 0, '插件更新', '', '', 0),
(156, 39, 'Admin', 'Storage', 'index', '', 1, 1, '文件存储', '', '', 0),
(157, 156, 'Admin', 'Storage', 'setting_post', '', 1, 0, '文件存储设置提交', '', '', 0),
(158, 54, 'Admin', 'Slide', 'ban', '', 1, 0, '禁用幻灯片', '', '', 0),
(159, 54, 'Admin', 'Slide', 'cancelban', '', 1, 0, '启用幻灯片', '', '', 0),
(160, 149, 'Admin', 'User', 'ban', '', 1, 0, '禁用管理员', '', '', 0),
(161, 149, 'Admin', 'User', 'cancelban', '', 1, 0, '启用管理员', '', '', 0),
(162, 1, 'Admin', 'Access', 'index', '', 1, 1, '评估管理', '', '评估管理首页', 0),
(163, 1, 'Admin', 'Access', 'display', '', 1, 0, '评估详细资料', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sp_nav`
--

CREATE TABLE IF NOT EXISTS `sp_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `parentid` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `target` varchar(50) DEFAULT NULL,
  `href` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  `listorder` int(6) DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- 转存表中的数据 `sp_nav`
--

INSERT INTO `sp_nav` (`id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path`) VALUES
(6, 1, 0, '美国移民', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"3";}}', '', 1, 2, '0-6'),
(7, 1, 0, '移民资讯', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"7";}}', '', 1, 3, '0-7'),
(4, 1, 0, '首页', '_blank', 'home', '', 1, 1, '0-4'),
(5, 1, 0, 'EB-5投资项目', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:2:"19";}}', '', 1, 5, '0-5'),
(9, 1, 0, '移民项目', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"6";}}', '', 1, 5, '0-9'),
(10, 1, 0, '专家团队', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"4";}}', '', 1, 6, '0-10'),
(11, 1, 0, '新闻资讯', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"11";}}', '', 1, 8, '0-11'),
(12, 1, 0, '精彩瞬间', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"9";}}', '', 1, 7, '0-12'),
(13, 1, 0, '关于我们', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"2";}}', '', 1, 9, '0-13'),
(14, 1, 13, '公司简介', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"2";}}', '', 1, 0, '0-13-14'),
(15, 1, 13, '公司优势', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"3";}}', '', 1, 0, '0-13-15'),
(16, 1, 13, '公司荣誉', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"4";}}', '', 1, 0, '0-13-16'),
(17, 1, 13, '公司活动', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"5";}}', '', 1, 0, '0-13-17'),
(18, 1, 13, '联系我们', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"6";}}', '', 1, 0, '0-13-18'),
(20, 1, 7, '移民专题', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"15";}}', '', 1, 0, '0-7-20'),
(21, 1, 7, '移民攻略', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"16";}}', '', 1, 0, '0-7-21'),
(22, 1, 7, '移民就业', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"17";}}', '', 1, 0, '0-7-22'),
(23, 1, 7, '海外生活', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"18";}}', '', 1, 0, '0-7-23'),
(24, 1, 5, 'EB-5项目简介', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:2:"19";}}', '', 1, 0, '0-5-24'),
(25, 1, 5, 'EB-5项目优势', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:2:"20";}}', '', 1, 0, '0-5-25'),
(26, 1, 5, 'EB-5申请条件', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:2:"21";}}', '', 1, 0, '0-5-26'),
(27, 1, 5, 'EB-5申办流程', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:2:"22";}}', '', 1, 0, '0-5-27'),
(28, 1, 5, 'EB-5项目推荐', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:2:"23";}}', '', 1, 0, '0-5-28'),
(29, 2, 0, '在线咨询', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"20";}}', '', 1, 1, '0-29'),
(30, 2, 0, '个人评估', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"10";}}', '', 1, 2, '0-30'),
(31, 1, 9, '林氏集团', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"12";}}', '', 1, 0, '0-9-31'),
(32, 1, 9, '汤姆森', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"13";}}', '', 1, 0, '0-9-32'),
(33, 1, 9, '新帝国', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"14";}}', '', 1, 0, '0-9-33'),
(35, 1, 12, '精彩视频', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"21";}}', '', 1, 0, '0-12-35'),
(36, 1, 12, '精彩图片', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"22";}}', '', 1, 0, '0-12-36');

-- --------------------------------------------------------

--
-- 表的结构 `sp_nav_cat`
--

CREATE TABLE IF NOT EXISTS `sp_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  `remark` text,
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `sp_nav_cat`
--

INSERT INTO `sp_nav_cat` (`navcid`, `name`, `active`, `remark`) VALUES
(1, '主导航', 1, '主导航'),
(2, '咨询评估', 0, '该导航是在线咨询和个人评估');

-- --------------------------------------------------------

--
-- 表的结构 `sp_oauth_user`
--

CREATE TABLE IF NOT EXISTS `sp_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(60) NOT NULL,
  `expires_date` int(12) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sp_options`
--

CREATE TABLE IF NOT EXISTS `sp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `sp_options`
--

INSERT INTO `sp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'member_email_active', '{"title":"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.","template":"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea\\u67d0\\u67d0\\u516c\\u53f8<br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662f\\u67d0\\u67d0\\u516c\\u53f8\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\"\\" href=\\"http:\\/\\/#link#\\" target=\\"_self\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; \\u67d0\\u67d0\\u516c\\u53f8.<\\/p>"}', 1),
(2, 'site_options', '{"site_name":"\\u5e7f\\u4e1c\\u534e\\u7acb\\u79fb\\u6c11\\u7559\\u5b66\\u670d\\u52a1\\u516c\\u53f8","site_host":"http:\\/\\/localhost\\/","site_tpl":"immagration","site_adminstyle":"flat","site_icp":"\\u5e7f\\u4e1c\\u534e\\u7acb\\u79fb\\u6c11\\u7559\\u5b66\\u670d\\u52a1\\u516c\\u53f8","site_admin_email":"","site_tongji":"","site_copyright":"\\u5e7f\\u4e1c\\u534e\\u7acb\\u79fb\\u6c11\\u7559\\u5b66\\u670d\\u52a1\\u516c\\u53f8","site_seo_title":"\\u5e7f\\u4e1c\\u534e\\u7acb\\u79fb\\u6c11 \\u7559\\u5b66\\u670d\\u52a1\\u516c\\u53f8","site_seo_keywords":"","site_seo_description":"","urlmode":"1","html_suffix":".html","comment_time_interval":60}', 1),
(3, 'cmf_settings', '{"banned_usernames":""}', 1);

-- --------------------------------------------------------

--
-- 表的结构 `sp_plugins`
--

CREATE TABLE IF NOT EXISTS `sp_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `sp_plugins`
--

INSERT INTO `sp_plugins` (`id`, `name`, `title`, `description`, `type`, `status`, `config`, `hooks`, `has_admin`, `author`, `version`, `createtime`, `listorder`) VALUES
(14, 'Share', '分享插件', '网站分享', 0, 1, '{"share_code":"<div class=\\"bshare-custom icon-medium-plus\\"><a title=\\"\\u5206\\u4eab\\u5230\\" href=\\"http:\\/\\/www.bShare.cn\\/\\" id=\\"bshare-shareto\\" class=\\"bshare-more\\">\\u5206\\u4eab\\u5230<\\/a><a title=\\"\\u5206\\u4eab\\u5230QQ\\u7a7a\\u95f4\\" class=\\"bshare-qzone\\"><\\/a><a title=\\"\\u5206\\u4eab\\u5230\\u65b0\\u6d6a\\u5fae\\u535a\\" class=\\"bshare-sinaminiblog\\"><\\/a><a title=\\"\\u5206\\u4eab\\u5230\\u4eba\\u4eba\\u7f51\\" class=\\"bshare-renren\\"><\\/a><a title=\\"\\u5206\\u4eab\\u5230\\u817e\\u8baf\\u5fae\\u535a\\" class=\\"bshare-qqmb\\"><\\/a><a title=\\"\\u5206\\u4eab\\u5230\\u7f51\\u6613\\u5fae\\u535a\\" class=\\"bshare-neteasemb\\"><\\/a><a title=\\"\\u66f4\\u591a\\u5e73\\u53f0\\" class=\\"bshare-more bshare-more-icon more-style-addthis\\"><\\/a><span class=\\"BSHARE_COUNT bshare-share-count\\">0<\\/span><\\/div><script type=\\"text\\/javascript\\" charset=\\"utf-8\\" src=\\"http:\\/\\/static.bshare.cn\\/b\\/buttonLite.js#style=-1&amp;uuid=fbfba546-befb-4904-ae03-8e92c5a59a03&amp;pophcol=2&amp;lang=zh\\"><\\/script><script type=\\"text\\/javascript\\" charset=\\"utf-8\\" src=\\"http:\\/\\/static.bshare.cn\\/b\\/bshareC0.js\\"><\\/script>"}', 'share', 1, 'xlt', '1.0', 0, 0),
(13, 'Weixin', '微信插件', '网站微信平台', 0, 1, '{"weixin_img":"564691bdd8f89.png","weixin_info":"\\u3010\\u5fae\\u4fe1\\u3011\\n\\u5fae\\u4fe1\\u626b\\u63cf\\u5de6\\u4fa7\\u4e8c\\u7ef4\\u7801\\n\\u8ba2\\u9605\\u201c\\u5e7f\\u4e1c\\u534e\\u7acb\\u7559\\u5b66\\u79fb\\u6c11\\u670d\\u52a1\\u516c\\u53f8\\u201d\\u8d44\\u8baf"}', 'weixin', 1, 'xlt', '1.0', 0, 0),
(37, 'Config', '全局配置', '网站全局设置', 0, 1, '{"model1_slide":"home_slide","model7_slide":"article_slide","model4_ymslide":"ym_slide","model4_usymslide":"usym_slide","model11_slide":"ymproject_slide","model18_reputationslide":"company_reputation","model2_menu":1,"model3_menu":2,"model5_aboutmenu":"13","model6_activitymenuid":5,"model6_activityid":17,"model8_newsid":"11","model10_projectid":"9","model10_projectcid":"6","model12_eb5menu":"5","model13_ymzxid":"7","model13_ymzxtid":"7","model15_teamid":"10","model15_teamcid":"4","model16_usymid":"6","model19_wonderfulid":"12","model19_videoid":"21","model19_imagesid":"22"}', '', 1, 'xlt', '1.0', 0, 0),
(38, 'Weibo', '微博插件', '官方微博', 0, 0, '{"weibo_url":"","weibo_info":"\\u5e7f\\u4e1c\\u534e\\u7acb\\u7559\\u5b66\\u79fb\\u6c11\\u670d\\u52a1\\u516c\\u53f8\\u6bcf\\u65e5\\u7b2c\\u4e00\\u65f6\\u95f4\\u63a8\\u9001\\u53ca\\u65f6\\u8d44\\u8baf\\uff0c\\u6c47\\u96c6\\u884c\\u4e1a\\u6743\\u5a01\\u4e13\\u5bb6\\uff0c\\u641c\\u7f57\\u79fb\\u6c11\\u5929\\u4e0b\\u6545\\u4e8b\\uff0c\\u6253\\u9020\\u79fb\\u6c11\\u884c\\u4e1a\\u5e7f\\u9614\\u5e73\\u53f0"}', 'weibo', 1, 'xlt', '1.0', 0, 0),
(31, 'Image', '图片插件', '图片的修改', 0, 1, '{"team_img":"565a936c79d80.jpg","access_img":"565aa7c518e63.jpg","logo_img":"565116bfb9e60.png"}', '', 1, 'xlt', '1.0', 0, 0),
(30, 'Consultation', '咨询插件', '在线咨询插件', 0, 0, '{"consultation_code1":"<script type=\\"text\\/javascript\\" charset=\\"utf-8\\">\\r\\nvar qqcode_dg_cfg={\\"root\\":\\"http:\\/\\/www.sunkf.net\\/codes\\/three\\/default\\/\\",\\"qq\\":\\"2895573873\\",\\"cname\\":\\"%u5E7F%u4E1C%u534E%u7ACB%u79FB%u6C11%u7559%u5B66%u670D%u52A1%u516C%u53F8\\",\\"msg\\":\\"%u5C0A%u656C%u7684%u7528%u6237%uFF1A%0A%u60A8%u597D%uFF0C%u8BF7%u95EE%u6709%u4EC0%u4E48%u53EF%u4EE5%u5E2E%u52A9%u60A8%uFF1F\\",\\"side\\":\\"right\\",\\"topfix\\":\\"100\\",\\"time\\":\\"3000\\"};\\r\\n<\\/script><script type=\\"text\\/javascript\\" charset=\\"utf-8\\" src=\\"http:\\/\\/www.sunkf.net\\/codes\\/three\\/default\\/kf.js?v=1125\\"><\\/script>","consultation_code2":"<script type=\\"text\\/javascript\\">var parent_id=10163;m_id=2144;<\\/script>\\r\\n<script type=\\"text\\/javascript\\" src=\\"http:\\/\\/login.liuyanbao.net\\/newmb\\/code.js\\" charset=\\"utf-8\\"><\\/script>"}', 'consultation1,consultation2', 1, 'xlt', '1.0', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sp_posts`
--

CREATE TABLE IF NOT EXISTS `sp_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=175 ;

--
-- 转存表中的数据 `sp_posts`
--

INSERT INTO `sp_posts` (`id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`) VALUES
(1, 1, '', NULL, '2015-11-12 23:12:47', '<p class="p5">广东华立移民留学服务公司设在广州增城华立科技园内，环境优雅，适宜工作、学习和生活。其涉足教育产业、房地产开发建设、电子商务科技、餐饮管理服务、百货超市运营、物业管理、商务印刷等多项经营领域。华立移民公司志在成功协助申请者顺利移民，同时助力学生成功申请赴境外留学，享受世界一流的教育资源。在未来的发展中，其将进一步集中境内外各方面优势资源，结合自身多年办理经验，致力于保持移民申请最高获签率以及行业领先地位，为更多有意出国深造或海外定居的精英人士实现愿望！</p>', '关于我们', '', 1, 1, '2015-11-12 23:12:23', NULL, 0, 2, '', 0, '{"thumb":"","template":"c_about"}', 0, 0, 0, 0),
(2, 1, '', NULL, '2015-11-13 16:20:39', '<p class="p5">广东华立移民留学服务公司设在广州增城华立科技园内，环境优雅，适宜工作、学习和生活。其涉足教育产业、房地产开发建设、电子商务科技、餐饮管理服务、百货超市运营、物业管理、商务印刷等多项经营领域。华立移民公司志在成功协助申请者顺利移民，同时助力学生成功申请赴境外留学，享受世界一流的教育资源。在未来的发展中，其将进一步集中境内外各方面优势资源，结合自身多年办理经验，致力于保持移民申请最高获签率以及行业领先地位，为更多有意出国深造或海外定居的精英人士实现愿望！</p>', '公司简介', '', 1, 1, '2015-11-13 16:20:16', NULL, 0, 2, '', 0, '{"thumb":"","template":"c_about"}', 0, 0, 0, 0),
(3, 1, '', NULL, '2015-11-13 16:20:55', '<p><span style="font-size: 18px;"><strong>一、公司</strong></span></p><p>公司优势</p>', '公司优势', '', 1, 1, '2015-11-13 16:20:41', NULL, 0, 2, '', 0, '{"thumb":"","template":"c_about"}', 0, 0, 0, 0),
(4, 1, '', NULL, '2015-11-13 16:21:17', '<p><img src="http://localhost/data/upload/ueditor/20151113/5645a40eac25e.jpg" title="rongyu01_1.jpg"/><img src="http://localhost/data/upload/ueditor/20151113/5645a40eb9939.jpg" title="rongyu01_2.jpg"/><img src="http://localhost/data/upload/ueditor/20151113/5645a40ec7fb5.jpg" title="rongyu01_3.jpg"/></p><p><br/></p>', '公司荣誉', '', 1, 1, '2015-11-13 16:20:56', NULL, 0, 2, '', 0, '{"thumb":"","template":"c_about"}', 0, 0, 0, 0),
(6, 1, '', NULL, '2015-11-13 16:21:42', '<p><span style="font-size: 18px;"><strong>一、地址：</strong></span></p><p><span style="font-size: 18px;">&nbsp;&nbsp;&nbsp;&nbsp;1、广东省广州市增城华立科技园华立路1号行政楼105室；</span></p><p><span style="font-size: 18px;">&nbsp;&nbsp;&nbsp;&nbsp;2、广州市越秀区中山一路57号南方铁道大厦十五层1501-1502室</span></p><p><span style="font-size: 18px;"><strong>二、咨询电话</strong><strong>：</strong>020-82905849 &nbsp;&nbsp;&nbsp;020-37634589</span></p>', '联系我们', '', 1, 1, '2015-11-13 16:21:31', NULL, 0, 2, '', 0, '{"thumb":"","template":"c_about"}', 0, 0, 0, 0),
(125, 1, '广东华立移民留学服务公司', '广东华立移民留学服务公司', '2015-11-29 14:58:04', '<p>广东华立移民留学服务公司，最新新闻动态，请关注官方网站和扫描官方微信。</p>', '广东华立移民留学服务公司', '广东华立移民留学服务公司，最新新闻动态，请关注官方网站。', 1, 1, '2015-11-29 14:56:58', NULL, 0, NULL, '', 0, '{"thumb":""}', 1, 0, 1, 1),
(126, 1, 'EB-5投资移民', '华立移民', '2015-11-29 15:05:17', '<p style="margin-top: 0;margin-bottom: 0;padding: 0px;line-height: 28px;font-size: 14px;white-space: normal;font-stretch: normal;font-family: 宋体;background-color: rgb(255, 255, 255)"><span style=";padding: 0px;font-size: 19px">&nbsp; 大西洋美国机会基金（<span style="font-family:Times New Roman">AAOF</span><span style="font-family:宋体">），</span></span><span style=";padding: 0px;font-size: 19px">是在美国特拉华州注册的有限合伙企业，是由美国移民局（USCIS）正式批准的EB-5投资项目，有佛罗里达海外投资中心赞助</span><span style=";padding: 0px;font-size: 19px">。</span></p><p style="margin-top: 0;margin-bottom: 0;padding: 0px;line-height: 28px;font-size: 14px;white-space: normal;font-stretch: normal;font-family: 宋体;background-color: rgb(255, 255, 255)"><span style=";padding: 0px;font-size: 19px">美国</span><span style=";padding: 0px;font-size: 19px">EB-5<span style="font-family:宋体">，是美国一个签证类别的代码，意思是“第五类优先就业型移民签证”。</span><span style="font-family:Times New Roman">EB-5</span><span style="font-family:宋体">项目又称“美国投资移民”项目，</span></span><span style=";padding: 0px;font-size: 19px">于</span><span style=";padding: 0px;font-size: 19px">1990<span style="font-family:宋体">年起实行，目的是吸引海外投资以民者来美国投资及创造就业机会。此类签证每年有</span><span style="font-family:Times New Roman">10000</span><span style="font-family:宋体">个名额，</span></span><span style=";padding: 0px;font-size: 19px">后经美国政府和美国移民局分别于&nbsp;<span style="font-family:Times New Roman">1993&nbsp;</span><span style="font-family:宋体">年和</span><span style="font-family:Times New Roman">1996</span><span style="font-family:宋体">年放宽了该法案，从投资的方式和聘用工人的计算方式等方面，使投资者可以透过美国现有的投资基金进行投资，可以用借款的方式减少真正投资的数额等。使</span><span style="font-family:Times New Roman">EB-5&nbsp;</span><span style="font-family:宋体">成为美国所有移民类别中，申请核准时间最短、资格条件限制最少的一条便捷通道</span></span><span style=";padding: 0px;font-size: 19px">。</span></p><p style="margin-top: 0;margin-bottom: 0;padding: 0px;line-height: 28px;font-size: 14px;white-space: normal;font-stretch: normal;font-family: 宋体;background-color: rgb(255, 255, 255)"><span style=";padding: 0px;font-family: Arial;font-size: 19px">EB-5<span style="font-family:宋体">对申请人的要求相当宽松，没有商业背景、年龄、教育程度及语言能力的限制，只要证明其投资资金为合法取得（包括个人累积所得、赠与、继承等多种途径）。一人申请，全家（配偶及</span><span style="font-family:Arial">21</span><span style="font-family:宋体">岁以下未婚子女）均可同时获得</span></span><span style=";padding: 0px"><a href="http://zhidao.baidu.com/search?word=%C2%CC%BF%A8&fr=qb_search_exp&ie=utf8" style=";padding: 0px;outline: none;cursor: pointer;color: rgb(51, 51, 51)"><span style=";padding: 0px;font-family: Arial;font-size: 19px"><span style="color:#0000ff">绿卡</span></span></a></span><span style=";padding: 0px;font-family: Arial;font-size: 19px">。申请成功后可自由选择美国任何城市居住，或继续留在中国工作和生活。</span></p><p style="margin-top: 0;margin-bottom: 0;padding: 0px;line-height: 28px;font-size: 14px;white-space: normal;font-stretch: normal;font-family: 宋体;background-color: rgb(255, 255, 255)"><span style=";padding: 0px;font-size: 19px">美国<span style="font-family:Times New Roman">EB-5</span><span style="font-family:宋体">投资移民的共同优点：</span></span></p><p style="margin-top: 0;margin-bottom: 0;padding: 0px;line-height: 28px;font-size: 14px;white-space: normal;font-stretch: normal;font-family: 宋体;background-color: rgb(255, 255, 255)"><span style=";padding: 0px;font-size: 19px">1、</span><span style=";padding: 0px;font-size: 19px">申请时间短，一年内取得绿卡。</span></p><p style="margin-top: 0;margin-bottom: 0;padding: 0px;line-height: 28px;font-size: 14px;white-space: normal;font-stretch: normal;font-family: 宋体;background-color: rgb(255, 255, 255)"><span style=";padding: 0px;font-size: 19px">2、</span><span style=";padding: 0px;font-size: 19px">申请人</span><span style=";padding: 0px;font-size: 19px">可帮亲戚申请绿卡</span><span style=";padding: 0px;font-size: 19px">。</span></p><p style="margin-top: 0;margin-bottom: 0;padding: 0px;line-height: 28px;font-size: 14px;white-space: normal;font-stretch: normal;font-family: 宋体;background-color: rgb(255, 255, 255)"><span style=";padding: 0px;font-size: 19px">3<span style="font-family:宋体">、申请人</span></span><span style=";padding: 0px;font-size: 19px">可在美国任何地方居住或工作。</span></p><p style="margin-top: 0;margin-bottom: 0;padding: 0px;line-height: 28px;font-size: 14px;white-space: normal;font-stretch: normal;font-family: 宋体;background-color: rgb(255, 255, 255)"><span style=";padding: 0px;font-size: 19px">4<span style="font-family:宋体">、申请人</span></span><span style=";padding: 0px;font-size: 19px">可各处旅行。</span></p><p style="margin-top: 0;margin-bottom: 0;padding: 0px;line-height: 28px;font-size: 14px;white-space: normal;font-stretch: normal;font-family: 宋体;background-color: rgb(255, 255, 255)"><span style=";padding: 0px;font-size: 19px">5<span style="font-family:宋体">、申请人</span></span><span style=";padding: 0px;font-size: 19px">不须要会说写英文。</span></p><p style="margin-top: 0;margin-bottom: 0;padding: 0px;line-height: 28px;font-size: 14px;white-space: normal;font-stretch: normal;font-family: 宋体;background-color: rgb(255, 255, 255)"><span style=";padding: 0px;font-size: 19px">6<span style="font-family:宋体">、申请人</span></span><span style=";padding: 0px;font-size: 19px">没有年龄限制。</span></p><p style="margin-top: 0;margin-bottom: 0;padding: 0px;line-height: 28px;font-size: 14px;white-space: normal;font-stretch: normal;font-family: 宋体;background-color: rgb(255, 255, 255)"><span style=";padding: 0px;font-size: 19px">7<span style="font-family:宋体">、申请人</span></span><span style=";padding: 0px;font-size: 19px">不须要有商务经验或专门技术。</span></p><p style="margin-top: 0;margin-bottom: 0;padding: 0px;line-height: 28px;font-size: 14px;white-space: normal;font-stretch: normal;font-family: 宋体;background-color: rgb(255, 255, 255)"><span style=";padding: 0px;font-size: 19px">8<span style="font-family:宋体">、申请人</span></span><span style=";padding: 0px;font-size: 19px">可买卖做生意、上学、及养老。</span></p><p style="margin-top: 0;margin-bottom: 0;padding: 0px;line-height: 28px;font-size: 14px;white-space: normal;font-stretch: normal;font-family: 宋体;background-color: rgb(255, 255, 255)"><span style=";padding: 0px;font-size: 19px">9<span style="font-family:宋体">、申请人</span></span><span style=";padding: 0px;font-size: 19px">可在五年之后申请成为美国公民。</span></p><p style="margin-top: 0;margin-bottom: 0;padding: 0px;line-height: 28px;font-size: 14px;white-space: normal;font-stretch: normal;font-family: 宋体;background-color: rgb(255, 255, 255)"><span style=";padding: 0px;font-size: 19px">澳加百利移民认为，由于国人对美国的法律、经商环境、经营成本、生活习惯等并不了解，因此在申请前的风险评估上要非常谨慎。</span><br/>&nbsp;</p><p style="margin-top: 0px;margin-bottom: 0px;padding: 0px;line-height: 25px;white-space: normal;min-height: 1em;font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, 微软雅黑, Arial, sans-serif;max-width: 100%;word-wrap: normal;color: rgb(62, 62, 62);box-sizing: border-box !important;background-color: rgb(255, 255, 255)"><span style=";padding: 0px;max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important"><span style="color:#3e3e3e;font-family:Helvetica;font-size:16px">美国EB-5投资移民素以快捷的优势受到申请人的青睐，但其申请流程并不简单，作为当事人只有了解美国EB-5投资移民才能更好的操控全局，维护好自身的利益。以上这些问题您是不是都已知晓呢？</span></span></p><p><br/></p>', '大西洋美国机会基金EB-5投资移民', '大西洋美国机会基金（AAOF），是在美国特拉华州注册的有限合伙企业，是由美国移民局（USCIS）正式批准的EB-5投资项目，有佛罗里达海外投资中心赞助。', 1, 1, '2015-11-29 15:03:55', NULL, 0, NULL, '', 0, '{"thumb":"565aa3a91c081.jpg"}', 1, 0, 1, 1),
(123, 1, '林氏集团', '广东华立移民留学服务公司', '2015-11-29 14:48:12', '<p><span style="font-family: 华文细黑;font-size: 16px">&nbsp; 林氏纽约区域中心由纽约市最成功的酒店开发商林氏集团开发，为投资者成功移民提供最大的可能性。</span></p><p><span style=";font-family:FZDHTJW--GB1-0;color:rgb(209,18,27);font-size:17px">(1)&nbsp;历史悠久、声誉卓著：</span><span style="font-family: 华文细黑;font-size: 16px">集团成立43&nbsp;年，享誉美国，43&nbsp;年來投资所有项目都是成功的。开发商在过去的30&nbsp;年间已成功建成50&nbsp;多幢大厦，开发了28&nbsp;家酒店，总值数十亿美元。是唯一被中央电视台、求是杂志等官方报导的EB-5&nbsp;投资移民项目。社会地位崇高、民间评价超群。</span></p><p><span style=";font-family:FZDHTJW--GB1-0;color:rgb(209,18,27);font-size:17px">(2)&nbsp;雄厚的经济实力：</span><span style="font-family: 华文细黑;font-size: 16px">在房地产行业拥有数十亿美元的资产，全资拥有有16&nbsp;间运营良好的酒店，年租金收入2&nbsp;亿美元。还有５家在建中，是美国唯一一家集酒店建造、管理、拥有于一体的集团。</span></p><p><span style=";font-family:FZDHTJW--GB1-0;color:rgb(209,18,27);font-size:17px">(3)&nbsp;丰富的经营管理经验：</span><span style="font-family: 华文细黑;font-size: 16px">20&nbsp;多年酒店开发经营，无一失败记录，为投资成功提供最好的保证；酒店建造排名全美100&nbsp;强第25&nbsp;名；酒店经营管理排名全美100&nbsp;强&nbsp;第19&nbsp;名。旗下皇家酒店管理集团，有超过1200&nbsp;名员工，管理６0&nbsp;多间酒店，20&nbsp;多亿资产，2.5&nbsp;亿美元营业额。</span></p><p><span style=";font-family:FZDHTJW--GB1-0;color:rgb(209,18,27);font-size:17px">(4)&nbsp;债权人身份：</span><span style="font-family: 华文细黑;font-size: 16px">无论项目成功与否，5&nbsp;年内必须偿还投资款，EB-5&nbsp;投资者风险大幅降低。股东身份风险大，90%&nbsp;项目不佳，5&nbsp;年后可能只拿回少量投资款。</span></p><p><span style=";font-family:FZDHTJW--GB1-0;color:rgb(209,18,27);font-size:17px">(5)&nbsp;资金比例：</span><span style="font-family: 华文细黑;font-size: 16px">EB-5&nbsp;资金在总预算中的比重低，只占总投资的27%。EB-5&nbsp;投资者资金越低越好，低于30%&nbsp;都属于安全，保证投资者创造就业数据高，项目对EB-5&nbsp;投资者资金依赖程度低。银行资金比例在50%&nbsp;至60%&nbsp;左右最好，银行是全世界最精明的金融投资商，银行肯高额贷款意味着项目好、实力足、信誉高。</span></p><p><span style=";font-family:FZDHTJW--GB1-0;color:rgb(209,18,27);font-size:17px">(6)&nbsp;绝佳地段：</span><span style="font-family: 华文细黑;font-size: 16px">地产投资的核心条件是地点、地点、还是地点，曼哈顿是全球范围内评价最高、租金最稳定、升值最快的市场，地产强硬，安全可靠。金融风暴也只跌15%，其它许多地方则跌70%。</span></p><p><span style=";font-family:FZDHTJW--GB1-0;color:rgb(209,18,27);font-size:17px">(7)&nbsp;监管账户：</span><span style="font-family: 华文细黑;font-size: 16px">55&nbsp;万投资款全部放在监管账户。</span></p><p><span style=";font-family:FZDHTJW--GB1-0;color:rgb(209,18,27);font-size:17px">(8)&nbsp;项目先动工再招商：</span><span style="font-family: 华文细黑;font-size: 16px">动工说明资金到位，手续完备，保障项目能按计划完工。</span></p><p><span style=";font-family:FZDHTJW--GB1-0;color:rgb(209,18,27);font-size:17px">(9)&nbsp;项目前景美好现金流大：</span><span style="font-family: 华文细黑;font-size: 16px">曼哈顿酒店平均入住率86%，林氏集团旗下管理的酒店平均入住率92%，是一个非常赚钱的行业，且每天有大量现金进账。之前每年有6000&nbsp;多万游客到曼哈顿，现在每年有8000&nbsp;多万游客到曼哈顿，以现在曼哈顿酒店的建造速度再建十年，曼哈顿的酒店仍然供不应求。</span></p><p><span style=";font-family:FZDHTJW--GB1-0;color:rgb(209,18,27);font-size:17px">(10)&nbsp;项目保证：</span><span style="font-family: 华文细黑;font-size: 16px">林氏集团EB-5&nbsp;投资移民项目以项目土地、林氏集团的投资及土地上的建筑为项目投资者提供保证。</span></p><p><br/></p>', '林氏纽约区域中心投资亮点', '林氏纽约区域中心投资亮点 HHHDDJDJ ', 1, 1, '2015-11-29 14:47:19', NULL, 0, NULL, '', 0, '{"thumb":"565aa2a1c7a5d.jpg"}', 1, 0, 1, 1),
(19, 1, '', NULL, '2015-11-14 19:22:36', '<p><span style="font-size: 18px; color: rgb(255, 0, 0);">最便捷的绿卡通道</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;美国EB-5投资移民方案是美国移民法中针对海外投资移民者所设立的移民签证类别，简称“EB-5” (Employment Based Fifth Preference)。此类签证从1991 年起实行，美国政府并于 1993 年在 EB-5 移民法规中特别增设了一种“区域中心”移民方案 (Regional Center Pilot Program), 将移民申请条件中对“须直接创造十个就业机会”的规定放宽为“直接或间接创造十个就业机会”，使EB-5 成为美国所有美国移民类别中，申请核准时间最短、资格条件限制最少的一条便捷通道。 &nbsp; &nbsp;<br/></p>', 'EB-5项目简介', '', 1, 1, '2015-11-14 19:22:08', NULL, 0, 2, '', 0, '{"thumb":"","template":"eb-5"}', 0, 0, 0, 0),
(20, 1, '', NULL, '2015-11-14 19:29:58', '<p>1、申请条件宽松：无年龄、经商、学历、英语能力等要求&nbsp;</p><p>2、快捷：约12-15个月办成，是获得美国永久移民身份的最快方式&nbsp;</p><p>3、无移民监：申请人只需每半年入境美国一次，便可维持绿卡的有效性&nbsp;</p><p>4、材料准备简单、快捷&nbsp;</p><p>5、子女免费就读美国公立名校&nbsp;</p><p>6、可自由选择居住地&nbsp;</p><p>7、投资50万美元，5年期满返还本金</p>', 'EB-5项目优势', '', 1, 1, '2015-11-14 19:28:52', NULL, 0, 2, '', 0, '{"thumb":"","template":"eb-5"}', 0, 0, 0, 0),
(21, 1, '', NULL, '2015-11-14 20:21:53', '<p>1、申请人需年满18周岁，申请排期2年&nbsp;</p><p>2、证明申请人有足够的资金（可包括配偶的资产，继承、赠与、博彩也被认可）&nbsp;</p><p>3、通过官方文件，证明资金的合法来源&nbsp;</p><p>4、应有相关部门的健康和无犯罪记录的证明</p>', 'EB-5申请条件', '', 1, 1, '2015-11-14 20:20:00', NULL, 0, 2, '', 0, '{"thumb":"","template":"eb-5"}', 0, 0, 0, 0),
(22, 1, '', NULL, '2015-11-14 20:22:25', '<p>认购项目——存入投资款到监管账户——律师递交I-526移民申请表——美国移民局批准I-526——广州领事馆面试或免面试——登录（得到签证后的180天内）——由一般合伙人监督并向移民局报告进度——由律师向移民局提出I-829申请取消签证条件——投资人可申请成为美国公民</p>', 'EB-5的申办流程', '', 1, 1, '2015-11-14 20:21:55', NULL, 0, 2, '', 0, '{"thumb":"","template":"eb-5"}', 0, 0, 0, 0),
(23, 1, '', NULL, '2015-11-14 20:23:16', '<p>1、New Empire Development LLC 新帝国</p><p></p><p>2、Thompson B EB-5 Manager, LLC.汤姆森教育中心项目</p><p>&nbsp;</p><p>3、Lam’s American Dream美国林氏酒店投资项目</p>', 'EB-5项目推荐', '', 1, 1, '2015-11-14 20:22:26', NULL, 0, 2, '', 0, '{"thumb":"","template":"eb-5"}', 0, 0, 0, 0),
(124, 1, '汤姆森', '广东华立移民留学服务公司', '2015-11-29 14:54:49', '<p style="text-indent:40px"><span style=";font-family:宋体;font-size:16px"><img src="http://localhost/data/upload/ueditor/20151129/565aa11a5c600.png" title="图片2.png" alt="图片2.png" width="653" height="457" style="width: 653px; height: 457px;"/></span></p><p style="text-indent:40px"><span style=";font-family:宋体;font-size:16px">首先开发汤姆森B-1地块教育中心及其附属设施，占地为575英亩，我们将会打造一个全智能化高端社区，该社区会建设两所大学。一所可以容纳3000名商学院，另一所可容纳5000名学生的电影学院。将建设学校的设施和不同的户型包括酒店式公寓、联排别墅，及不同款式独栋别墅，汤姆森B-1项目6期共分开发。总公司已经完成项目的新增投资额平均为1.5亿美元，计划每期的项目结构为20%、40%、40%；股权投资人3000万美元，BEF资金6000万美元，建筑贷款6000万美元。已经得到当地政府给我们的支持条件是每一期投资总额的15%-20%的部分现金和部分税收优惠。</span></p><p style="text-indent:24px"><span style=";font-family:宋体;font-size:16px">&nbsp; 一期商学院及其附属设施包括酒店式公寓、联排别墅，完成所需项目的新增投资为1.5亿美元。</span></p><p><br/></p>', '汤姆森B-1教育中心房产 (Thompson B-1 Education Center Real  Estate )', '汤姆森B-1教育中心房产 (Thompson B-1 Education Center Real  Estate )', 1, 1, '2015-11-29 14:53:04', NULL, 0, NULL, '', 0, '{"thumb":"565aa2467fd0f.png"}', 1, 0, 1, 1),
(115, 1, '', '', '2015-11-24 21:52:01', '<p><embed type="application/x-shockwave-flash" class="edui-faked-video" pluginspage="http://www.macromedia.com/go/getflashplayer" src="http://player.youku.com/player.php/sid/XMTMxNzcyMzA1Ng==/v.swf" width="400" height="300" wmode="transparent" play="true" loop="false" menu="false" allowscriptaccess="never" allowfullscreen="true"/></p>', '精彩视频', '精彩视频', 1, 1, '2015-11-24 21:49:06', NULL, 0, NULL, '', 0, '{"thumb":""}', 1, 0, 0, 0),
(117, 1, '', '', '2015-11-29 14:34:55', '', 'wonderful1', 'wonderful1', 1, 1, '2015-11-29 14:34:09', NULL, 0, NULL, '', 0, '{"thumb":"565a9c8c1eec6.jpg"}', 0, 0, 0, 0),
(118, 1, '', '', '2015-11-29 14:35:42', '', 'wonderful2', 'wonderful2', 1, 1, '2015-11-29 14:34:56', NULL, 0, NULL, '', 0, '{"thumb":"565a9cb8c60d2.jpg"}', 0, 0, 0, 0),
(119, 1, '', '', '2015-11-29 14:36:21', '', 'wonderful3', 'wonderful3', 1, 1, '2015-11-29 14:35:43', NULL, 0, NULL, '', 0, '{"thumb":"565a9ce1d063d.jpg"}', 1, 0, 0, 0),
(120, 1, '', '', '2015-11-29 14:36:45', '', 'wonderful4', 'wonderful4', 1, 1, '2015-11-29 14:36:22', NULL, 0, NULL, '', 0, '{"thumb":"565a9cfacec93.jpg"}', 0, 0, 0, 0),
(121, 1, '公司活动', '广东华立移民留学服务公司', '2015-11-29 14:41:04', '<p>广东华立移民留学服务公司活动策划。</p><p><br/></p><p><img src="http://localhost/data/upload/ueditor/20151129/565a9d9fac778.jpg" title="565463d2c5caa.jpg" alt="565463d2c5caa.jpg"/>&nbsp;&nbsp;&nbsp;&nbsp;<img src="http://localhost/data/upload/ueditor/20151129/565a9dbd20fc4.jpg" title="5654647f49bc4.jpg" alt="5654647f49bc4.jpg"/></p><p><br/></p><p>最新广东华立移民留学服务公司活动，请关注官方网站。</p>', '广东华立移民留学服务公司活动', '广东华立移民留学服务公司活动', 1, 1, '2015-11-29 14:37:33', NULL, 0, NULL, '', 0, '{"thumb":"565a9dfdbcac5.jpg"}', 1, 0, 1, 1),
(122, 1, '林氏集团', '', '2015-11-29 14:45:40', '<p style="margin-left:20px;text-indent:30px;text-autospace:none;line-height:25px"><span style=";font-family:宋体;font-size:16px">林氏集团是美国纽约市的私营企业</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">，</span><span style=";font-family:宋体;font-size:16px">自</span><span style=";font-family:Arial;font-size:16px">20</span><span style=";font-family:宋体;font-size:16px">世纪</span><span style=";font-family:Arial;font-size:16px">70</span><span style=";font-family:宋体;font-size:16px">年代起就成功经营</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">，</span><span style=";font-family:宋体;font-size:16px">至今已<img src="http://localhost/data/upload/ueditor/20151129/565a9eecee27e.png" title="图片1.png" alt="图片1.png" style="float: left; width: 155px; height: 173px;" width="155" height="173"/>有四十多年。从制衣业起家</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">，</span><span style=";font-family:宋体;font-size:16px">曾为纽约制衣行业创造了万多个工作岗位</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">；</span><span style=";font-family:宋体;font-size:16px">如今</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">，</span><span style=";font-family:宋体;font-size:16px">该公司的投资核心是以酒店开发为主的房地产业。在这一领域中</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">，</span><span style=";font-family:宋体;font-size:16px">创造了更多的就业机会。&nbsp;作为纽约市酒店业开发的龙头</span><span style=";font-family:宋体;font-size:16px">,</span><span style=";font-family:宋体;font-size:16px">在过去的</span><span style=";font-family:Arial;font-size:16px">10</span><span style=";font-family:宋体;font-size:16px">年间已建成总值近二十亿美元的项目</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">，</span><span style=";font-family:宋体;font-size:16px">并正在建造</span><span style=";font-family:Arial;font-size:16px">5</span><span style=";font-family:宋体;font-size:16px">间新酒店。通过他们的酒店管理平台</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">，</span><span style=";font-family:宋体;font-size:16px">现在管理超过</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">６</span><span style=";font-family:Arial;font-size:16px">0</span><span style=";font-family:宋体;font-size:16px">间酒店</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">，</span><span style=";font-family:宋体;font-size:16px">每年有</span><span style=";font-family:Arial;font-size:16px">2.5</span><span style=";font-family:宋体;font-size:16px">亿美金的营业额。</span></p><p style="line-height: 21px"><span style=";font-family:&#39;Times New Roman&#39;;font-size:16px">&nbsp;</span></p><p style="margin-right:9px;text-indent:30px;text-autospace:none;line-height:24px"><span style=";font-family:宋体;font-size:16px">&nbsp;</span></p><p style="margin-right:9px;text-indent:30px;text-autospace:none;line-height:24px"><span style=";font-family:宋体;font-size:16px">该公司的主管业务是酒店开发与管理</span><span style=";font-family:宋体;font-size:16px">,</span><span style=";font-family:宋体;font-size:16px">一直提供最佳的产品和服务。作为投资移民区域中心与富有经验的开发商</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">，</span><span style=";font-family:宋体;font-size:16px">他们深知投资移民流程应与项目开发时间表紧密配合。正是他们作为开发商的骄人成绩和雄厚的经济实力</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">，</span><span style=";font-family:宋体;font-size:16px">他们的投资移民产品在市场中受到欢迎。</span></p><p style="line-height: 20px"><span style=";font-family:&#39;Times New Roman&#39;;font-size:16px">&nbsp;</span></p><p style="margin-right:8px;text-indent:30px;text-autospace:none;line-height:23px"><span style=";font-family:宋体;font-size:16px">中国和美国都有着光明的发展前景。该公司在协助以中国为主的投资人来美移民定居、开创崭&nbsp;新事业</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">，</span><span style=";font-family:宋体;font-size:16px">亦憧憬与投资我们项目的行业精英</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">，</span><span style=";font-family:宋体;font-size:16px">共同参与中美优质项目的合作。</span></p><p><br/></p>', '林氏集团', '林氏集团', 1, 1, '2015-11-29 14:43:24', NULL, 0, NULL, '', 0, '{"thumb":"565aa2e05f0d8.jpg"}', 1, 0, 1, 1),
(127, 1, '董事会主席及首席执行官林建中', '', '2015-11-29 15:07:59', '<p style="text-align:center"><img src="http://localhost/data/upload/ueditor/20151129/565aa48970b51.png" title="图片1.png" alt="图片1.png"/></p><p style="margin-left:2px;text-indent:30px;text-autospace:none;line-height:25px"><span style=";font-family:宋体;font-size:16px">林氏集团是美国纽约市的私营企业</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">，</span><span style=";font-family:宋体;font-size:16px">自</span><span style=";font-family:Arial;font-size:16px">20</span><span style=";font-family:宋体;font-size:16px">世纪</span><span style=";font-family:Arial;font-size:16px">70</span><span style=";font-family:宋体;font-size:16px">年代起就成功经营</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">，</span><span style=";font-family:宋体;font-size:16px">至今已有四十多年。从制衣业起家</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">，</span><span style=";font-family:宋体;font-size:16px">曾为纽约制衣行业创造了万多个工作岗位</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">；</span><span style=";font-family:宋体;font-size:16px">如今</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">，</span><span style=";font-family:宋体;font-size:16px">该公司的投资核心是以酒店开发为主的房地产业。在这一领域中</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">，</span><span style=";font-family:宋体;font-size:16px">创造了更多的就业机会。&nbsp;作为纽约市酒店业开发的龙头</span><span style=";font-family:宋体;font-size:16px">,</span><span style=";font-family:宋体;font-size:16px">在过去的</span><span style=";font-family:Arial;font-size:16px">10</span><span style=";font-family:宋体;font-size:16px">年间已建成总值近二十亿美元的项目</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">，</span><span style=";font-family:宋体;font-size:16px">并正在建造</span><span style=";font-family:Arial;font-size:16px">5</span><span style=";font-family:宋体;font-size:16px">间新酒店。通过他们的酒店管理平台</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">，</span><span style=";font-family:宋体;font-size:16px">现在管理超过</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">６</span><span style=";font-family:Arial;font-size:16px">0</span><span style=";font-family:宋体;font-size:16px">间酒店</span><span style=";font-family:&#39;MS PGothic&#39;;font-size:16px">，</span><span style=";font-family:宋体;font-size:16px">每年有</span><span style=";font-family:Arial;font-size:16px">2.5</span><span style=";font-family:宋体;font-size:16px">亿美金的营业额。</span></p><p><br/></p>', '林建中', '董事会主席及首席执行官林建中', 1, 1, '2015-11-29 15:07:18', NULL, 0, NULL, '', 0, '{"thumb":"565aa449c38ef.png"}', 1, 0, 0, 0),
(128, 1, '美国,移民,权威', '', '2015-12-01 22:01:35', '<p><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; line-height: 25px; background-color: rgb(255, 255, 255);">&nbsp;&nbsp;&nbsp;&nbsp;美国EB-5投资移民的区域中心法案将于2015年9月30日到期，美国时间9月22日，美国参议院提出临时财政动议案，好消息是，该临时议案中将包含将目前的美国EB-5投资移民区域中心计划按原样延续72天，延期至12月11日。</span></p><p><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; line-height: 25px; background-color: rgb(255, 255, 255);"></span></p><h2 style="margin: 0px auto; padding: 0px; color: rgb(51, 51, 51); white-space: normal; list-style: none; font-size: 25px; border: none; font-family: 微软雅黑; font-weight: normal; line-height: 25px; background-color: rgb(255, 255, 255);"><span style="margin: 0px auto; padding: 0px; list-style: none; font-size: 16px; border: none; display: inline-block;">1.美国EB-5投资移民延期详情：</span></h2><p><span style="margin: 0px auto; padding: 0px; color: rgb(51, 51, 51); list-style: none; border: none; font-family: 微软雅黑; display: inline-block; line-height: 25px; background-color: rgb(255, 255, 255);">1.在联邦新预算尚未获得国会批准的前提下，为确保美国联邦政府在2015年10月1日新的2016联邦财政年度第一天照常运转，参议院提出临时财政动议案(Continuing&nbsp;Resolution)保证联邦政府能够正常运行至今年12月11日。</span><span style="color: rgb(51, 51, 51); font-family: Simsun; font-size: medium; background-color: rgb(255, 255, 255);"></span></p><p><span style="margin: 0px auto; padding: 0px; list-style: none; font-size: 16px; border: none; display: inline-block;">&nbsp;</span></p><p><span style="margin: 0px auto; padding: 0px; color: rgb(51, 51, 51); list-style: none; border: none; font-family: 微软雅黑; display: inline-block; line-height: 25px; background-color: rgb(255, 255, 255);">2.在这个临时议案中将包含将目前的美国EB-5投资移民区域中心计划按原样延续。也就是说，现有美国EB-5投资移民法案将延续至12月11日。<br style="padding: 0px; margin: 0px auto; list-style: none; font-size: 14px; border: none;"/>&nbsp;<br style="padding: 0px; margin: 0px auto; list-style: none; font-size: 14px; border: none;"/>3.目前，这个议案虽然只是一个临时财政动议案，但不管怎样，EB-5区域中心计划的延期，是参众两院的共识，担心9月底EB-5涨价的投资人可以暂时松一口气了!与此同时，一场EB-5变政短暂的临时加时赛，又要拉开紧张序幕了!</span></p><p><span style="margin: 0px auto; padding: 0px; color: rgb(51, 51, 51); list-style: none; border: none; font-family: 微软雅黑; display: inline-block; line-height: 25px; background-color: rgb(255, 255, 255);"></span></p><h2 style="margin: 0px auto; padding: 0px; color: rgb(51, 51, 51); white-space: normal; list-style: none; font-size: 25px; border: none; font-family: 微软雅黑; font-weight: normal; line-height: 25px; background-color: rgb(255, 255, 255);"><span style="margin: 0px auto; padding: 0px; list-style: none; font-size: 16px; border: none; display: inline-block;">2.领富移民专家分析：</span></h2><p><span style="margin: 0px auto; padding: 0px; color: rgb(51, 51, 51); list-style: none; border: none; font-family: 微软雅黑; display: inline-block; line-height: 25px; background-color: rgb(255, 255, 255);">1.若该提案成为正式议案，对美国EB-5投资移民申请人来说是很好的消息，虽然只延期72天（从2015年10月1日至12月11日），但也为目前还未递交申请的EB-5投资人赢得了宝贵的机会，或许这将是美国EB-5投资移民改革涨价前最后一班末班车。<br style="padding: 0px; margin: 0px auto; list-style: none; font-size: 14px; border: none;"/>&nbsp;<br style="padding: 0px; margin: 0px auto; list-style: none; font-size: 14px; border: none;"/>&nbsp;<br style="padding: 0px; margin: 0px auto; list-style: none; font-size: 14px; border: none;"/>2.2015年10月1日开始，新财年（2016年）将会有新的1万个EB-5签证配额发放，对于目前已经获得了移民局I-526批准的客户来说是利好，意味着在面试阶段，不需要由于签证配额问题而被搁置。<br style="padding: 0px; margin: 0px auto; list-style: none; font-size: 14px; border: none;"/><br style="padding: 0px; margin: 0px auto; list-style: none; font-size: 14px; border: none;"/>3.现有区域中心计划若延至12月11日，看似有2个多月，但实际上真正留给投资人的实际时间，并没有表面那么多，此次加时或将是50万美元投资移民美国的最后一趟加班车!有意移民美国的投资人，真的要抓紧这最后一趟加班末班车的最后机会了!领富移民专家强烈建议投资人，早申请早行动、把握最后机会才是关键！<br style="padding: 0px; margin: 0px auto; list-style: none; font-size: 14px; border: none;"/>&nbsp;<br style="padding: 0px; margin: 0px auto; list-style: none; font-size: 14px; border: none;"/>美国EB-5投资移民运行20多年来，最低投资额一直维持在50万美元。总体状况运行良好，已有近55亿美元的EB-5资金注入美国，为美国创造了大量就业。众多申请人蜂拥申请EB-5投资移民，审理会越来越严格，门槛会越来越高，申请难度会越来越大，这也是移民行业的普遍规律。早申请、早受益，避免变数发生！<br style="padding: 0px; margin: 0px auto; list-style: none; font-size: 14px; border: none;"/>&nbsp;<br style="padding: 0px; margin: 0px auto; list-style: none; font-size: 14px; border: none;"/>时间紧迫，刻不容缓，申请人应该尽快做决定，挑选优质项目助自己一臂之力：<br style="padding: 0px; margin: 0px auto; list-style: none; font-size: 14px; border: none;"/><br style="padding: 0px; margin: 0px auto; list-style: none; font-size: 14px; border: none;"/>EB-5项目中已经通过了美国移民局I-924预批准及拥有I-526标准示范项目资质的；<br style="padding: 0px; margin: 0px auto; list-style: none; font-size: 14px; border: none;"/><br style="padding: 0px; margin: 0px auto; list-style: none; font-size: 14px; border: none;"/>EB-5项目已经有批量客户获得了美国移民局I-526批准的；<br style="padding: 0px; margin: 0px auto; list-style: none; font-size: 14px; border: none;"/><br style="padding: 0px; margin: 0px auto; list-style: none; font-size: 14px; border: none;"/>EB-5项目是抵押担保类、风险低的、安全的、优质的移民项目；<br style="padding: 0px; margin: 0px auto; list-style: none; font-size: 14px; border: none;"/><br style="padding: 0px; margin: 0px auto; list-style: none; font-size: 14px; border: none;"/>您的EB-5申请律师是专业、一流的美国律师行；<br style="padding: 0px; margin: 0px auto; list-style: none; font-size: 14px; border: none;"/><br style="padding: 0px; margin: 0px auto; list-style: none; font-size: 14px; border: none;"/>您的EB-5项目开发商实力雄厚，经验丰富。</span></p><p><span style="margin: 0px auto; padding: 0px; color: rgb(51, 51, 51); list-style: none; border: none; font-family: 微软雅黑; display: inline-block; line-height: 25px; background-color: rgb(255, 255, 255);"><br/></span><br/></p><p><span style="margin: 0px auto; padding: 0px; color: rgb(51, 51, 51); list-style: none; border: none; font-family: 微软雅黑; display: inline-block; line-height: 25px; background-color: rgb(255, 255, 255);"><br/></span></p><p><span style="color: rgb(51, 51, 51); font-family: 微软雅黑; line-height: 25px; background-color: rgb(255, 255, 255);"><br/></span><br/></p>', '美国移民新政，投资延期至12月11日', '美国时间9月30日，美国国会通过了旨在维持美国联邦政府各项政策(包括现行EB-5区域中心计划)正常延续至今年12月11日的政府拨款项目决议案。该决议案已经由奥巴马总统签署正式成为法案', 1, 1, '2015-12-01 21:58:30', NULL, 0, NULL, '', 0, '{"thumb":""}', 1, 0, 1, 1),
(129, 1, '移民  投资', '', '2015-12-02 15:18:52', '<p><img src="http://localhost/data/upload/ueditor/20151202/565e9b1630f5c.jpg" title="s4.jpg" alt="s4.jpg"/></p>', '全球投资移民报道', '  ', 1, 1, '2015-12-02 15:15:24', NULL, 0, NULL, '', 0, '{"thumb":""}', 1, 0, 0, 0),
(130, 1, '主管、Lam Generation 的创办人及首席执行官', '', '2015-12-02 15:37:02', '<p><span style="font-family: HYb1gj;font-size: 16px"></span></p><p style="text-align:center"><img src="http://localhost/data/upload/ueditor/20151204/56611d731eb7a.png" title="图片1.png" alt="图片1.png"/></p><p><span style="font-family: HYb1gj;font-size: 16px">&nbsp;&nbsp;&nbsp;&nbsp;</span><br/></p><p><span style="font-family: HYb1gj;font-size: 16px"><br/></span></p><p><span style="font-family: HYb1gj;font-size: 16px">&nbsp;&nbsp;&nbsp;&nbsp;林伟鸿先生是Lam&nbsp;Generation&nbsp;的创办人及首席执行官。Lam</span><span style="font-family: HYb1gj;">Generation&nbsp;专注于酒店地产开发，是林氏集团的一部分。Jeff&nbsp;专攻</span><span style="font-family: HYb1gj;">地产收购和开发，并且经营拓展公司新的业务。其公司目前拥有</span><span style="font-family: HYb1gj;">三家酒店，分别位于曼哈顿苏豪区、第五大道上及金融区&nbsp;，并担</span><span style="font-family: HYb1gj;">负万豪万丽中城项目的开发任务。</span></p><p><br/></p>', '林伟鸿', '林伟鸿先生是Lam Generation 的创办人及首席执行官。Lam\r\nGeneration 专注于酒店地产开发，是林氏集团的一部分。Jeff 专攻\r\n地产收购和开发，并且经营拓展公司新的业务。其公司目前拥有\r\n三家酒店，分别位于曼哈顿苏豪区、第五大道上及金融区 ，并担\r\n负万豪万丽中城项目的开发任务。', 1, 1, '2015-12-02 15:35:10', NULL, 0, NULL, '', 0, '{"thumb":"56611d2a4ffe7.png"}', 1, 0, 1, 1),
(131, 1, '新帝国', '', '2015-12-02 15:56:19', '<p style="text-align:center"><span style="font-family: 宋体; font-size: 18px;"><img src="http://localhost/data/upload/ueditor/20151204/56611e85e2f00.png" title="图片2.png" alt="图片2.png"/></span></p><p style="text-indent:28px"><span style="font-family: 宋体; font-size: 18px;">该项目位于纽约<span style="font-family: &#39;Times New Roman&#39;;">Brooklyn</span>区<span style="font-family: &#39;Times New Roman&#39;;">,&nbsp;</span>附近<span style="font-family: &#39;Times New Roman&#39;;">Prospect</span>公园，可清晰看到曼哈顿、自由女神、接近巴克莱中心。交通方便，距离纽约世界的经济重心—曼哈顿仅需<span style="font-family: &#39;Times New Roman&#39;;">15</span>分钟车程<span style="font-family: &#39;Times New Roman&#39;;">,</span>搭承地铁<span style="font-family: &#39;Times New Roman&#39;;">R,N,D,Q,B,5,4,3,2</span>号线仅需<span style="font-family: &#39;Times New Roman&#39;;">5</span>分钟。</span></p><p style="text-indent:37px"><span style="font-family: 宋体; font-size: 18px;">纽约是美国人口最多的城市，世界最大的城市之一，是纽约都会区的核心。它经常被称为纽约市，以与其所在的纽约州相区分。逾一个世纪以来，纽约在商业和金融的方面发挥巨大的全球影响力。纽约是一座世界级城市，直接影响着全球的经济、金融、媒体、政治、教育、娱乐与时尚界。</span></p><p><br/></p>', '新帝国项目地理位置', '新帝国项目地理位置', 1, 1, '2015-12-02 15:55:45', NULL, 0, NULL, '', 0, '{"thumb":"56611e75a6a6f.png"}', 1, 0, 1, 1),
(132, 1, '', NULL, '2015-12-03 21:15:14', '', '111', '', 0, 1, '2015-12-03 21:15:09', NULL, 0, 2, '', 0, '{"thumb":"","template":"page"}', 0, 0, 0, 0),
(133, 1, '投资移民,美国,草案', '广东华立移民留学服务公司', '2015-12-04 09:43:52', '<p><span style="color: rgb(51, 51, 51); font-family: Simsun; font-size: medium; background-color: rgb(255, 255, 255);">美国时间8月10日，美国移民局发布了关于投资移民的政策细则草案。此次发布的美国投资移民政策细则草案着重移民项目，从递交申请(I-526表格)到批准有条件绿卡(I-495)，再到批准无条件绿卡(I-829)时间变长的情况下，对投资移民创造就业机会，投资持续性，以及项目变更等三个方面进行详细的审批标准指导。</span></p><p>&nbsp;</p><p>　　草案明确规定，要求递交申请I-526表格获批准半年之后，必须开始雇佣全职员工，提出I-829申请前必须达到就业机会数量要求。草案也规定，在满足创造就业条件之前，资金必须一致处于风险状态。另外，凡是申请过程中项目材料出现变化，则需要重新递交526申请。</p><p>&nbsp;</p><p>　　针对此消息，澳加百利投资移民专家表示：在EB-5投资移民出现排期的情况下，对具体审批提供更细节化的指导，美国投资移民的审核将更加严格。另外，草案就投美国资移民申请给出更细致的明文规定，调整并不大，但由于中国公民投资移民出现排期，当中条款使申请难度增大。</p><p>&nbsp;</p><p>　　据悉，该草案将到9月8日征求各界意见，目前申请投资移民的人数增长迅速，EB-5的项目也遍地开花，移民局对投资移民日趋严格是必然趋势。移民局此次公布的关于美国投资移民最新政策备忘录草案没有涉及之前备受关注的投资金额等问题，但是预计9月30日本财年结束时，极有可能会有新政策出台，对投资移民的审核更严格，门槛也会更高。</p><p>&nbsp;</p><p>　　根据上述内容可看出，如今美国投资移民EB-5项目涨价的风波未停，申请排期的政策也已经开始蠢蠢欲动。不过，移民局此次公布的关于投资移民最新政策备忘录草案并没有涉及之前备。<br/>&nbsp; &nbsp; &nbsp;<img alt="\\" src="http://localhost/data/upload/ueditor/20151204/56611f454729a.jpg" style="margin: 0px; padding: 0px; border: none; width: 538px; height: 195px;"/></p><p>&nbsp;</p><p>受关注的投资金额等问题。但从众参两院议员提出的规范运作的议案可以看出，投资移民还是受美国欢迎的，只不过他们希望的是更有钱的投资移民，更加规范的运作。因此，排期、涨价都收紧政策可谓大势所趋。预计9月30日本财年结束时，随着新政策出台，对投资移民的审核更严格，门槛也会更高。</p><p>&nbsp;</p><p>　　所以在此，澳加百利投资移民专家建议有意申请美国投资移民人士，应及早看情局势，果断下手，以免政策瞬息万变，犹豫而酿造遗憾。目前，澳加百利推出的第五大道奢华公寓项目，资金仅占整个项目资本的18.7%，投资风险极低，受到了很多投资者的欢迎。有意了解更多相关信息者，可登陆澳加百利官网。</p><p><br/></p>', '从草案看美国投资移民涨价、排期趋向', '从递交申请(I-526表格)到批准有条件绿卡(I-495)，再到批准无条件绿卡(I-829)时间变长的情况下，对投资移民创造就业机会，投资持续性，以及项目变更等三个方面进行详细的审批标准指导。', 1, 1, '2015-12-05 09:43:00', NULL, 0, NULL, '', 0, '{"thumb":"56611f4d3ff32.jpg"}', 1, 0, 0, 1);
INSERT INTO `sp_posts` (`id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`) VALUES
(134, 1, '新移民,美国,怎么找工作', '', '2015-12-04 10:55:53', '<p><span style="margin: 0px; padding: 0px; color: rgb(90, 90, 90); font-family: 宋体, 微软雅黑, &#39;Arial Narrow&#39;; font-size: 14px; line-height: 25px; background-color: rgb(255, 255, 255);">◆在美国找工作所必需的心态</span><span style="color: rgb(51, 51, 51); font-family: Simsun; font-size: medium; background-color: rgb(255, 255, 255);"></span></p><p>　　1. 自信心：这个东西一定要有，从来到美国开始，你就要相信自己。我们中国人差就差在语言上，无论你怎么练，总体来讲中国人的口语也不可能跟美国人，欧洲人，和印度人相比。但也不要气馁，咱么智力上比他们强，在说话上也一定要大胆，美国人可以听懂你的英语，所以你所需要做的就是大胆的讲出你的见解!大家不要小看了“说”，有效的表达自己和与他人交流是你找工作的最重要环节!某种程度上比你的听力，阅读，和写作要重要百倍。中国人往往在这个环节上面吃很大的亏。记住，你就要认为自己是强人，自己比别人强!<br/>&nbsp;</p><p>　　2. 赶早不赶晚：找实习和工作的最佳时机是从每年的9月份开始。顶尖的金融公司例如JP morgan, UBS, Bank of America等等，都是9月份开始。虽然找到那里的实习或者工作几乎是不可能的事情，但从那里开始大家就可以感受到如何找工作，发现自己的问题，并且不断更正，在不断失败当中寻找成功。<br/>&nbsp;</p><p>　　◆如何起步</p><p>　　1. 首先需要的是RESUME!简历主要分为三部分：一是学历，二是工作以及实习经历，也是最最主要的一部分，三是其他，比如你会的语言，计算机，其他等等。工作经验必须要写得最多，因为这个才是美国人最最看重的。顶级投行以及有名的大公司需要接近完美的分数以及世界上为数不多的好学校出来的精英，所以对我们来说工作经验尤其显得重要。<br/><br/></p><p>2. 其次是COVER LETTER!这个东西就是一份说明，也就是你展示自己的机会。COVER LETTER每个人和每个人的格式都可以不尽相同，但要注意的是一定要有一个收信人(你是写给谁看的)，如果TITLE只写dear sir/madam，那有90%的可能你的COVER LETTER会被直接扔掉。内容方面，必须在紧扣job description and requirements的前提下充分向hr展示你，通过三方面：一是你为什么感兴趣。美国人最注重的就是你的兴趣和背景，所以你不让面试者相信你希望得到工作，你是得不到工作的。二是你为什么认为自己胜任这个工作。三是为什么公司要选择你。当然，有些公司只要求RESUME，但这并不能代表它不重要。<br/>&nbsp;</p><p>　　◆从哪里开始找<br/>&nbsp;</p><p>　　1. 地理位置的选择：首先是新英格兰地区，此地区为美国的发源地，几大城市(纽约，费城，波士顿，哈特福德，新泽西，华盛顿哥伦比亚特区等)都位于这里。想象一下为什么中国人那么想去北京和上海上大学吧，同样道理。其次是加州。再次是南北卡，要知道夏洛特目前是美国第二大金融中心，所以机会颇多。如果大家以后想从事固定收入债券(fixed income securities or real estate)，那不妨去佛罗里达和德州。当然还有芝加哥一带也是很好的选择。<br/>&nbsp;</p><p>　　2. 其他的网站：monster，monstertrack，dootstang，craigslist，yahoo! 等。这些网站上是全美国的范围，所以你可以有各种高级查找。<br/>&nbsp;</p><p>　　3. 还有一个重要途径，就是通过你认识的人内部递简历。美国人找工作有80%都是通过熟人介绍然后面试找到的，是非常非常重要的方式。当然如果没有的话，就要通过前面两个途径了。<br/>&nbsp;</p><p>　　◆找工作时候的态度<br/>&nbsp;</p><p>　　1. 不要那么多毛病，挑三拣四。记住，中国人在美国只有劣势没有任何优势可言!所以我们需要做的就是申请所有我们可以做的工作。<br/>&nbsp;</p><p>　　2. 一定要注意follow up，所谓follow up，就是不要在申请投递resume and cover之后就完事了，如果有收取resume的人的电话号码，一定要在投递2天左右后打电话去询问。或者要发电子邮件去询问。还是落实到一个点上：美国人需要对这个工作有兴趣，热情，渴望的人，所以你的所有行动必须要贯穿一致的像招聘单位表达。<br/>&nbsp;</p><p>　　一定要注意，找工作的精髓就在于信息的获取。</p><p><br/></p>', '美国新移民找工作小编支几招', '美国新移民找工作不要太心急，俗话说“心急吃不了热豆腐”，其实对于找工作的心态也是很适用的，但是如今面临大环境的不景气影响，找工作面临的问题就更多了。', 1, 1, '2015-12-04 10:55:37', NULL, 0, NULL, '', 0, '{"thumb":"56611fcf529c9.jpg"}', 1, 0, 1, 1),
(135, 1, '', '广东华立移民留学服务公司', '2015-12-04 15:38:57', '<p style="text-align: center;">广东华立移民留学服务公司活动2</p><p style="text-align: center;"><img src="http://localhost/data/upload/ueditor/20151204/566142fbd121e.jpg" title="20150824023912506.jpg" alt="20150824023912506.jpg"/></p>', '广东华立移民留学服务公司活动2', '广东华立移民留学服务公司活动2', 1, 1, '2015-12-04 15:37:54', NULL, 0, NULL, '', 0, '{"thumb":""}', 1, 0, 0, 0),
(142, 1, '1', '1', '2015-12-17 17:58:58', '<p>1</p>', '1', '1', 1, 1, '2015-12-17 17:58:40', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(143, 1, '11', '11', '2015-12-17 17:59:26', '<p>11</p>', '11', '11', 1, 1, '2015-12-17 17:58:59', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(144, 1, '1', '1', '2015-12-17 17:59:40', '<p>1</p>', '1', '1', 1, 1, '2015-12-17 17:59:27', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(145, 1, '1', '1', '2015-12-17 17:59:55', '', '1', '1', 1, 1, '2015-12-17 17:59:42', NULL, 0, NULL, '', 0, '{"thumb":""}', 1, 0, 0, 0),
(146, 1, '1', '1', '2015-12-17 18:00:06', '<p>1</p>', '1', '1', 1, 1, '2015-12-17 17:59:57', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(147, 1, '1', '1', '2015-12-17 18:00:20', '<p>1</p>', '1', '1', 1, 1, '2015-12-17 18:00:08', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(148, 1, '1', '1', '2015-12-17 18:00:42', '', '1', '1', 1, 1, '2015-12-17 18:00:21', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(149, 1, '1', '1', '2015-12-17 18:00:53', '', '1', '1', 1, 1, '2015-12-17 18:00:44', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(150, 1, '1', '1', '2015-12-17 18:01:05', '<p>1</p>', '1', '1', 1, 1, '2015-12-17 18:00:55', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(151, 1, '1', '1', '2015-12-17 18:01:16', '<p>1</p>', '1', '1', 1, 1, '2015-12-17 18:01:06', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(152, 1, '1', '1', '2015-12-17 18:01:26', '<p>1</p>', '1', '1', 1, 1, '2015-12-17 18:01:17', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(153, 1, '1', '1', '2015-12-17 18:01:46', '<p>1</p>', '1', '1', 1, 1, '2015-12-17 18:01:27', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(154, 1, '1', '1', '2015-12-17 18:01:56', '<p>1</p>', '1', '1', 1, 1, '2015-12-17 18:01:47', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(155, 1, '1', '1', '2015-12-17 18:02:08', '', '1', '1', 1, 1, '2015-12-17 18:01:58', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(156, 1, '1', '1', '2015-12-17 18:02:31', '<p>1</p>', '1', '1', 1, 1, '2015-12-17 18:02:10', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(157, 1, '1', '1', '2015-12-17 18:02:43', '<p>1</p>', '1', '1', 1, 1, '2015-12-17 18:02:33', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(158, 1, '1', '1', '2015-12-17 18:03:27', '', '1', '1', 1, 1, '2015-12-17 18:02:44', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(159, 1, '1', '1', '2015-12-17 18:06:33', '', '1', '1', 1, 1, '2015-12-17 18:06:23', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(160, 1, '1', '1', '2015-12-17 18:06:44', '', '1', '1', 1, 1, '2015-12-17 18:06:35', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(161, 1, '1', '1', '2015-12-17 18:06:54', '', '1', '1', 1, 1, '2015-12-17 18:06:45', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(162, 1, '1', '1', '2015-12-17 18:07:04', '', '1', '1', 1, 1, '2015-12-17 18:06:56', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(163, 1, '1', '1', '2015-12-17 18:07:28', '<p>1</p>', '1', '1', 1, 1, '2015-12-17 18:07:05', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(164, 1, '1', '1', '2015-12-17 18:07:39', '', '1', '1', 1, 1, '2015-12-17 18:07:29', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(165, 1, '1', '1', '2015-12-17 18:07:52', '', '1', '1', 1, 1, '2015-12-17 18:07:40', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(166, 1, '1', '1', '2015-12-17 18:08:01', '', '1', '1', 1, 1, '2015-12-17 18:07:53', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(167, 1, '1', '1', '2015-12-17 18:08:11', '', '1', '1', 1, 1, '2015-12-17 18:08:02', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(168, 1, '1', '1', '2015-12-17 18:08:20', '', '1', '1', 1, 1, '2015-12-17 18:08:12', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(169, 1, '1', '1', '2015-12-17 18:08:47', '<p>1</p>', '1', '1', 1, 1, '2015-12-17 18:08:21', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(170, 1, '1', '1', '2015-12-17 18:08:57', '<p>1</p>', '1', '1', 1, 1, '2015-12-17 18:08:48', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(171, 1, '1', '1', '2015-12-17 18:09:07', '<p>1</p>', '1', '1', 1, 1, '2015-12-17 18:08:58', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(172, 1, '1', '1', '2015-12-17 18:09:16', '', '1', '1', 1, 1, '2015-12-17 18:09:08', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(173, 1, '1', '1', '2015-12-17 18:09:40', '', '1', '1', 1, 1, '2015-12-17 18:09:17', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(174, 1, '1', '1', '2015-12-17 22:30:21', '', '1', '1', 1, 1, '2015-12-17 22:29:36', NULL, 0, NULL, '', 0, '{"thumb":"5672c6f9141a3.jpg"}', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sp_role`
--

CREATE TABLE IF NOT EXISTS `sp_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sp_role`
--

INSERT INTO `sp_role` (`id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder`) VALUES
(1, '超级管理员', 0, 1, '拥有网站最高管理员权限！', 1329633709, 1329633709, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sp_role_user`
--

CREATE TABLE IF NOT EXISTS `sp_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `sp_route`
--

CREATE TABLE IF NOT EXISTS `sp_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `sp_slide`
--

CREATE TABLE IF NOT EXISTS `sp_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` bigint(20) NOT NULL,
  `slide_name` varchar(255) NOT NULL,
  `slide_pic` varchar(255) DEFAULT NULL,
  `slide_url` varchar(255) DEFAULT NULL,
  `slide_des` varchar(255) DEFAULT NULL,
  `slide_content` text,
  `slide_status` int(2) NOT NULL DEFAULT '1',
  `listorder` int(10) DEFAULT '0',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- 转存表中的数据 `sp_slide`
--

INSERT INTO `sp_slide` (`slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder`) VALUES
(37, 10, 'US Immigration2', '/data/upload/565a9877c9e34.jpg', '', '', '', 1, 0),
(36, 10, 'US Immigration1', '/data/upload/565a986127f33.jpg', '', '', '', 1, 0),
(35, 2, 'Immigration news4', '/data/upload/565a9835065ff.jpg', '', '', '', 1, 0),
(34, 2, 'Immigration news3', '/data/upload/565a981f1c87a.jpg', '', '', '', 1, 0),
(32, 2, 'Immigration news1', '/data/upload/565a97f451e33.jpg', '', '', '', 1, 0),
(33, 2, 'Immigration news2', '/data/upload/565a980aa5350.jpg', '', '', '', 1, 0),
(28, 5, 'Our teams', '/data/upload/565a936c79d80.jpg', '', '', '', 1, 0),
(27, 1, 'Immigration4', '/data/upload/565a92f045d0f.jpg', '', '', '', 1, 0),
(26, 1, 'Immigration3', '/data/upload/565a92c922d88.jpg', '', '', '', 1, 0),
(25, 1, 'Immigration2', '/data/upload/565a92b877160.jpg', '', '', '', 1, 0),
(24, 1, 'Immigration1', '/data/upload/565a92a49af10.png', 'http://www.baidu.com', '', '', 1, 0),
(16, 8, '评估管理系统', '/data/upload/565aa7c518e63.jpg', '', '', '', 1, 0),
(17, 9, 'Logo', '/data/upload/565116bfb9e60.png', '', '', '', 1, 0),
(39, 6, 'Immigration project1', '/data/upload/565a98f37e776.jpg', '', '', '', 1, 0),
(38, 10, 'US Immigration3', '/data/upload/565a988d4bf78.jpg', '', '', '', 1, 0),
(40, 6, 'Immigration project2', '/data/upload/565a9905db021.jpg', '', '', '', 1, 0),
(41, 3, 'EB-5项目1', '/data/upload/565a996ddc376.jpg', 'http://www.baidu.com', '', '', 1, 0),
(42, 3, 'EB-5项目2', '/data/upload/565a9981afd0c.jpg', '', '', '', 1, 0),
(43, 3, 'EB-5项目3', '/data/upload/565a9a17240e7.jpg', '', '', '', 1, 0),
(46, 7, '荣誉一', '/data/upload/5661205d5c686.jpg', '', '', '', 1, 0),
(47, 7, '荣誉二', '/data/upload/5661206fa8d5d.jpg', '', '', '', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sp_slide_cat`
--

CREATE TABLE IF NOT EXISTS `sp_slide_cat` (
  `cid` bigint(20) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL,
  `cat_idname` varchar(255) NOT NULL,
  `cat_remark` text,
  `cat_status` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `sp_slide_cat`
--

INSERT INTO `sp_slide_cat` (`cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status`) VALUES
(1, '首页幻灯片', 'home_slide', '首页轮播的图片', 1),
(2, '移民资讯幻灯片', 'ym_slide', '移民专项的轮播图片', 1),
(3, '内容页幻灯片', 'article_slide', '内容页显示的幻灯片', 1),
(4, '微信图片', 'weixin_img', '微信平台的图片名称', 1),
(5, '专家团队图片', 'team_img', '专家团队栏目下图片', 1),
(6, '移民项目幻灯片', 'ymproject_slide', '移民项目栏目的幻灯片', 1),
(7, '公司荣誉幻灯片', 'company_reputation', '公司荣誉幻灯片', 1),
(8, '个人评估图片', 'access_img', '个人评估栏目下页面封面大图', 1),
(9, 'Logo图片', 'logo_img', 'Logo显示的图片', 1),
(10, '美国移民幻灯片', 'usym_slide', '美国移民栏目下的幻灯片', 1);

-- --------------------------------------------------------

--
-- 表的结构 `sp_terms`
--

CREATE TABLE IF NOT EXISTS `sp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `sp_terms`
--

INSERT INTO `sp_terms` (`term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`) VALUES
(4, '专家团队', '', 'picture', '', 0, 0, '0-4', '', '', '', 'team', 'article', 0, 1),
(3, '美国移民', '', 'article', '', 0, 0, '0-3', '', '', '', 'usimmagration', 'article', 0, 1),
(5, '公司活动', '', 'article', '', 0, 0, '0-5', '', '', '', 'c_activity', 'article', 0, 1),
(6, '移民项目', '', 'article', '', 0, 0, '0-6', '', '', '', 'projects', 'article', 0, 1),
(7, '移民资讯', '', 'article', '', 0, 0, '0-7', '', '', '', 'ymzx', 'article', 0, 1),
(15, '移民专题', '', 'article', '移民专题文章', 7, 0, '0-7-15', '', '', '', 'projectlist', 'article', 0, 1),
(9, '精彩瞬间', '', 'picture', '精彩瞬间融合视频和图片', 0, 0, '0-9', '', '', '', 'wonderful', 'article', 0, 1),
(10, '个人评估', '', 'article', '', 0, 0, '0-10', '', '', '', 'access', 'article', 0, 1),
(11, '新闻资讯', '', 'article', '', 0, 0, '0-11', '', '', '', 'news', 'article', 0, 1),
(12, '林氏集团', '', 'article', '林氏集团项目列表页', 6, 0, '0-6-12', '', '', '', 'projectlist', 'article', 0, 1),
(13, '汤姆森', '', 'article', '汤姆森项目', 6, 0, '0-6-13', '', '', '', 'projectlist', 'article', 0, 1),
(14, '新帝国', '', 'article', '新帝国项目', 6, 0, '0-6-14', '', '', '', 'projectlist', 'article', 0, 1),
(16, '移民攻略', '', 'article', '', 7, 0, '0-7-16', '', '', '', 'projectlist', 'article', 0, 1),
(17, '移民就业', '', 'article', '', 7, 0, '0-7-17', '', '', '', 'projectlist', 'article', 0, 1),
(18, '海外生活', '', 'article', '', 7, 0, '0-7-18', '', '', '', 'projectlist', 'article', 0, 1),
(20, '在线咨询', '', 'article', '在线咨询页面', 0, 0, '0-20', '', '', '', 'consultation', 'article', 0, 1),
(21, '精彩视频', '', 'article', '精彩视频展示页面', 9, 0, '0-9-21', '', '', '', 'projectlist', 'article', 0, 1),
(22, '精彩图片', '', 'picture', '精彩图片展示页', 9, 0, '0-9-22', '', '', '', 'images', 'article', 0, 1),
(23, '网站地图', '', 'article', '', 0, 0, '0-23', '', '', '', 'sitemap', 'article', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `sp_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=166 ;

--
-- 转存表中的数据 `sp_term_relationships`
--

INSERT INTO `sp_term_relationships` (`tid`, `object_id`, `term_id`, `listorder`, `status`) VALUES
(165, 174, 22, 0, 1),
(163, 173, 16, 0, 0),
(162, 172, 16, 0, 0),
(161, 171, 16, 0, 0),
(160, 170, 16, 0, 0),
(159, 169, 16, 0, 0),
(158, 168, 16, 0, 0),
(157, 167, 16, 0, 0),
(156, 166, 16, 0, 0),
(155, 165, 16, 0, 0),
(154, 164, 16, 0, 0),
(153, 163, 16, 0, 0),
(152, 162, 16, 0, 0),
(137, 147, 17, 0, 0),
(119, 128, 3, 0, 1),
(118, 127, 4, 0, 1),
(117, 126, 15, 0, 1),
(116, 125, 11, 0, 1),
(115, 124, 13, 0, 1),
(114, 123, 12, 0, 1),
(113, 122, 12, 0, 1),
(112, 121, 5, 0, 1),
(111, 120, 22, 0, 1),
(110, 119, 22, 0, 1),
(109, 118, 22, 0, 1),
(108, 117, 22, 0, 1),
(151, 161, 16, 0, 0),
(150, 160, 16, 0, 0),
(149, 159, 16, 0, 0),
(148, 158, 15, 0, 0),
(164, 157, 17, 0, 0),
(146, 156, 17, 0, 0),
(145, 155, 17, 0, 0),
(144, 154, 17, 0, 0),
(143, 153, 17, 0, 0),
(142, 152, 17, 0, 0),
(141, 151, 17, 0, 0),
(140, 150, 17, 0, 0),
(139, 149, 17, 0, 0),
(138, 148, 17, 0, 0),
(136, 146, 17, 0, 0),
(106, 115, 21, 0, 1),
(135, 145, 17, 0, 0),
(134, 144, 17, 0, 0),
(133, 143, 17, 0, 0),
(132, 142, 17, 0, 0),
(125, 135, 5, 0, 1),
(124, 134, 17, 0, 1),
(123, 133, 16, 0, 1),
(122, 131, 14, 0, 1),
(121, 130, 4, 0, 1),
(120, 129, 11, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sp_users`
--

CREATE TABLE IF NOT EXISTS `sp_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `sp_users`
--

INSERT INTO `sp_users` (`id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`) VALUES
(1, 'superadmin', 'c535018ee94621232f297a57a5a743894a0e4a801fc389af', 'admin', '1@qq.com', '', NULL, 0, '0000-00-00', '', '127.0.0.1', '2015-12-18 18:31:41', '2015-11-10 03:51:44', '', 1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sp_user_favorites`
--

CREATE TABLE IF NOT EXISTS `sp_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
