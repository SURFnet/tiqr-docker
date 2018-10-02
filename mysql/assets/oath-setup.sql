CREATE TABLE `secret` (
  `identifier` varchar(100) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `counter` int(10) DEFAULT '0',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB;