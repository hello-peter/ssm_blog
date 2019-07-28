-- phpMyAdmin SQL Dump
-- version 3.0.1.1
-- http://www.phpmyadmin.net
--
-- �������汾: 5.1.29
-- PHP �汾: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a'); 

CREATE TABLE IF NOT EXISTS `t_userInfo` (
  `user_name` varchar(30)  NOT NULL COMMENT 'user_name',
  `password` varchar(30)  NOT NULL COMMENT '��¼����',
  `name` varchar(20)  NOT NULL COMMENT '����',
  `gender` varchar(4)  NOT NULL COMMENT '�Ա�',
  `birthDate` varchar(20)  NULL COMMENT '��������',
  `userPhoto` varchar(60)  NOT NULL COMMENT '�û���Ƭ',
  `telephone` varchar(20)  NOT NULL COMMENT '��ϵ�绰',
  `email` varchar(50)  NOT NULL COMMENT '����',
  `address` varchar(80)  NULL COMMENT '��ͥ��ַ',
  `regTime` varchar(20)  NULL COMMENT 'ע��ʱ��',
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_blogClass` (
  `blogClassId` int(11) NOT NULL AUTO_INCREMENT COMMENT '���ͷ���id',
  `blogClassName` varchar(20)  NOT NULL COMMENT '���ͷ�������',
  `blogClassDesc` varchar(800)  NOT NULL COMMENT '���ͷ������',
  PRIMARY KEY (`blogClassId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_blog` (
  `blogId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `blogClassObj` int(11) NOT NULL COMMENT '���ͷ���',
  `title` varchar(80)  NOT NULL COMMENT '���ͱ���',
  `blogPhoto` varchar(60)  NOT NULL COMMENT '����ͼƬ',
  `content` varchar(5000)  NOT NULL COMMENT '��������',
  `hitNum` int(11) NOT NULL COMMENT '�����',
  `userObj` varchar(30)  NOT NULL COMMENT '�����û�',
  `addTime` varchar(20)  NULL COMMENT '����ʱ��',
  `shzt` varchar(20)  NOT NULL COMMENT '���״̬',
  PRIMARY KEY (`blogId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT COMMENT '�ظ�id',
  `blogObj` int(11) NOT NULL COMMENT '��������',
  `content` varchar(2000)  NOT NULL COMMENT '��������',
  `userObj` varchar(30)  NOT NULL COMMENT '������',
  `commentTime` varchar(20)  NULL COMMENT '����ʱ��',
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_leaveword` (
  `leaveWordId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `leaveTitle` varchar(80)  NOT NULL COMMENT '���Ա���',
  `leaveContent` varchar(2000)  NOT NULL COMMENT '��������',
  `userObj` varchar(30)  NOT NULL COMMENT '������',
  `leaveTime` varchar(20)  NULL COMMENT '����ʱ��',
  `replyContent` varchar(1000)  NULL COMMENT '����ظ�',
  `replyTime` varchar(20)  NULL COMMENT '�ظ�ʱ��',
  PRIMARY KEY (`leaveWordId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_notice` (
  `noticeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `title` varchar(80)  NOT NULL COMMENT '����',
  `content` varchar(5000)  NOT NULL COMMENT '��������',
  `publishDate` varchar(20)  NULL COMMENT '����ʱ��',
  PRIMARY KEY (`noticeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

ALTER TABLE t_blog ADD CONSTRAINT FOREIGN KEY (blogClassObj) REFERENCES t_blogClass(blogClassId);
ALTER TABLE t_blog ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_comment ADD CONSTRAINT FOREIGN KEY (blogObj) REFERENCES t_blog(blogId);
ALTER TABLE t_comment ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_leaveword ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);


