-- 业务表：
create table if not exists `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) NOT NULL COMMENT '消息组id',
  `message_id` bigint(20) NOT NULL COMMENT '消息id',
  `guid` varchar(50) NOT NULL COMMENT '消息去重guid',
  `sender_id` bigint(20) NOT NULL COMMENT '发送者id',
  `sender_role` tinyint(4) NOT NULL COMMENT '发送者角色',
  `sender` varchar(30) NOT NULL COMMENT '发送者',
  `message_source` tinyint(4) NOT NULL COMMENT '消息来源',
  `content` varchar(10000) NOT NULL DEFAULT '' COMMENT '消息内容',
  `status` tinyint(4) NOT NULL COMMENT '消息状态',
  `visible_roles` int(11) NOT NULL DEFAULT '1' COMMENT '消息可见性',
  `extra` varchar(2000) NOT NULL DEFAULT '' COMMENT '附加消息',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_message_id` (`message_id`),
  UNIQUE KEY `unq_guid` (`guid`),
  KEY `idx_group_id` (`group_id`),
  KEY `idx_sender_id` (`sender_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_message_source` (`message_source`),
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='消息表';