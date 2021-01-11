DROP DATABASE  IF EXISTS `db_test`;

CREATE DATABASE  IF NOT EXISTS `db_test`;
USE `db_test`;

DROP TABLE IF EXISTS `entity`;
CREATE TABLE `entity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `age` int NOT NULL,
  `hobby` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `entity` 
VALUES 
(1, 'Beep', 'Hive', 15, 'Joke'),
(2,'Drow','Nameless', 34, 'Meditate/Origami');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `users` 
VALUES 
('Beep','{noop}test123',1),
('Drow','{noop}test123',1);

DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `authorities` 
VALUES 
('Beep','ROLE_USER'),
('Drow','ROLE_USER'),
('Drow','ROLE_ADMIN');