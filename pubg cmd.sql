CREATE DATABASE `pubg_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

CREATE TABLE `users` (
  `user_id` int(100) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `character_name` varchar(100) DEFAULT NULL,
  `Favorite1` varchar(100) DEFAULT NULL,
  `Favorite2` varchar(100) DEFAULT NULL,
  `Favorite3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `pubg_db`.`users` (`username`, `password`, `character_name`, `Favorite1`, `Favorite2`, `Favorite3`) VALUES ('amu0007', '123', 'minorpains', 'Simiyik', 'Kellidor', 'Tyree');