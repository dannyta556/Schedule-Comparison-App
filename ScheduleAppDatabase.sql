CREATE DATABASE IF NOT EXISTS `ScheduleApp` DEFAULT CHARACTER SET latin1;
USE `ScheduleApp`;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS; 
SET FOREIGN_KEY_CHECKS=0;  

DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
  `name` varchar(100) NOT NULL,
  `UserID` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`UserID`)
);

DROP TABLE IF EXISTS `Schedule`;
CREATE TABLE `Schedule` (
	`ScheduleID` int unsigned NOT NULL AUTO_INCREMENT,
    `ScheduleName` varchar(100) NOT NULL,
    PRIMARY KEY (`ScheduleID`)
    );

DROP TABLE IF EXISTS `GroupSchedule`;
CREATE TABLE `GroupSchedule` (
	`GroupScheduleID` int unsigned NOT NULL AUTO_INCREMENT,
    `GroupScheduleName` varchar(100) NOT NULL,
    `ScheduleID` int unsigned NOT NULL,
    PRIMARY KEY (`GroupScheduleID`),
    FOREIGN KEY (`ScheduleID`) REFERENCES `Schedule`(`ScheduleID`)
		ON UPDATE CASCADE
);    

DROP TABLE IF EXISTS `Event`;
CREATE TABLE `Event` (
	`EventID` int unsigned NOT NULL AUTO_INCREMENT,
    `StartTime` timestamp NOT NULL,
    `EndTime` timestamp NOT NULL,
    `Days` varchar(50) NOT NULL CHECK (`Days` IN (`Mon`, `Tues`, `Wed`, `Thurs`, `Fri`, `Sat`, `Sun`)),
    PRIMARY KEY (`EventID`)
);

DROP TABLE IF EXISTS `Class`;
CREATE TABLE `Class` (
	`ClassName` varchar(100) NOT NULL,
    `EventID` int unsigned NOT NULL,
    FOREIGN KEY (`EventID`) REFERENCES `EVENT`(`EventID`)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS `Club`;
CREATE TABLE `Club` (
	`ClubName` varchar(100) NOT NULL,
    `EventID` int unsigned NOT NULL,
    FOREIGN KEY (`EventID`) REFERENCES `Event`(`EventID`)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS `Work`;
CREATE TABLE `Work` (
	`WorkName` varchar(100) NOT NULL,
    `EventID` int unsigned NOT NULL,
    FOREIGN KEY (`EventID`) REFERENCES `Event`(`EventID`)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS `Other`;
CREATE TABLE `Other` (
	`OtherName` varchar(100) NOT NULL,
    `EventID` int unsigned NOT NULL,
    FOREIGN KEY (`EventID`) REFERENCES `Event`(`EventID`)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);