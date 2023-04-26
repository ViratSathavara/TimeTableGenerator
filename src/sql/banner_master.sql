CREATE TABLE `banner_master` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(255),
	`description` TEXT,
	`ispublished` INT DEFAULT '0',
	`createdby` INT,
	`createdon` DATETIME DEFAULT CURRENT_TIMESTAMP,
	`modifedby` INT,
	`modifiedon` DATETIME DEFAULT CURRENT_TIMESTAMP,
	`delflag` INT DEFAULT '0',
	KEY `ix_id` (`id`) USING BTREE,
    KEY `ix_title` (`title`) USING BTREE,
    KEY `ix_delflag` (`delflag`) USING BTREE,
    KEY `ix_createdby` (`createdby`) USING BTREE,
    KEY `ix_ispublished` (`ispublished`) USING BTREE,
	PRIMARY KEY (`id`)
);