LOCK TABLES `configurations` WRITE;
INSERT INTO `medical-manager`.`configurations` (`key_col`, `value_col`) VALUES ('maxNoOfProblemBoxes', '4');
INSERT INTO `medical-manager`.`configurations` (`key_col`, `value_col`) VALUES ('timeInMinutes', '15');
INSERT INTO `medical-manager`.`configurations` (`key_col`, `value_col`) VALUES ('genericEmailAddress', 'no-reply@gpmate.co.uk');
UNLOCK TABLES;
