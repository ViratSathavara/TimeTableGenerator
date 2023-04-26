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
    KEY `ix_title` (`title`) USING BTREE,
    KEY `ix_delflag` (`delflag`) USING BTREE,
    KEY `ix_createdby` (`createdby`) USING BTREE,
    KEY `ix_ispublished` (`ispublished`) USING BTREE,
	PRIMARY KEY (`id`)
);



-- Do Not Execute on Prod - Only Testing Queries
INSERT INTO banner_master SET title = "test title 1",description = "test description 1 - TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ",createdby =1,modifedby =  1, ispublished = 1;
INSERT INTO banner_master SET title = "test title 2",description = "test description 2 - TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ",createdby =1,modifedby =  1, ispublished = 1;
INSERT INTO banner_master SET title = "test title 3",description = "test description 3 - TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ",createdby =1,modifedby =  1, ispublished = 1;
INSERT INTO banner_master SET title = "test title 4",description = "test description 4 - TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ",createdby =1,modifedby =  1, ispublished = 1;
INSERT INTO banner_master SET title = "test title 4",description = "test description 4 - TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ",createdby =1,modifedby =  1, ispublished = 1;
INSERT INTO banner_master SET title = "test title 5",description = "test description 5 - TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ",createdby =1,modifedby =  1, ispublished = 1;
INSERT INTO banner_master SET title = "test title 6",description = "test description 6 - TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ",createdby =1,modifedby =  1, ispublished = 1;
INSERT INTO banner_master SET title = "test title 7",description = "test description 7 - TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ",createdby =1,modifedby =  1, ispublished = 1;
INSERT INTO banner_master SET title = "test title 8",description = "test description 8 - TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ",createdby =1,modifedby =  1, ispublished = 1;
INSERT INTO banner_master SET title = "test title 9",description = "test description 9 - TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ",createdby =1,modifedby =  1, ispublished = 1;
INSERT INTO banner_master SET title = "test title 10",description = "test description 10 - TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ",createdby =1,modifedby =  1, ispublished = 1;