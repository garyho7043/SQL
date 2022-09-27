CREATE DATABASE /*!32312 IF NOT EXISTS*/`bus` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bus`;

CREATE TABLE `bus` (
 `Bus_Number` int(3) NOT NULL,
 `Travel_Time` int(3) NOT NULL COMMENT 'unit:min;It means that total time from first stop to last stop',
 `Busy_Time` time NOT NULL COMMENT 'peak',
 `Frequency` float NOT NULL COMMENT 'unit:min;average time you have to wait after  the bus leaves the stop',
 `Start_Time` time NOT NULL COMMENT 'the time that first bus departs.(departure time)',
 `Last_Time` time NOT NULL COMMENT 'the time that last bus depart from first bus stop',
 `SSN` char(9) NOT NULL COMMENT 'driver''s SSN',
 `Experience` float NOT NULL COMMENT 'unit:year; the time that  a driver drives the same type  of bus',
 `Cnumber` int(8) NOT NULL COMMENT 'company business number',
 PRIMARY KEY (`Bus_Number`),
 KEY `SSN` (`SSN`),
 KEY `Cnumber` (`Cnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `bus_stop` (
 `Stop_Number_Other_Stop_Number` char(7) NOT NULL COMMENT 'Format:''xxx xxx'';Different stops are specified with number from 0 to  999 ',
 `Bus_name` varchar(40) NOT NULL COMMENT 'aka Bus number;Bus stop is stopped by what types of buses. ',
 `Location` varchar(40) NOT NULL COMMENT 'Place where bus stop is located in',
 `Busy_Time` time NOT NULL COMMENT 'peak in bus stop',
 `Kilo` float NOT NULL COMMENT 'kilo difference between  bus stop and other bus stop',
 `Stop_Interval` int(1) NOT NULL COMMENT 'number of stops between  bus stop and other bus stop',
 `Spending_Time` int(2) NOT NULL COMMENT 'unit:min;travel time from bus stop to other bus stop(or from other bus stop to bus stop)',
 PRIMARY KEY (`Stop_Number_Other_Stop_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `company` (
 `Cnumber` int(8) NOT NULL,
 `Cname` varchar(20) NOT NULL,
 `Manager_Name` varchar(22) NOT NULL COMMENT 'Fname  Lname(two blank between Fname and  Lname)',
 `Clocation` varchar(10) NOT NULL COMMENT 'City where company is located in  ',
 PRIMARY KEY (`Cnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




CREATE TABLE `driver` (
 `SSN` char(9) NOT NULL,
 `Address` varchar(40) NOT NULL,
 `Fname` varchar(10) NOT NULL,
 `Lname` varchar(10) NOT NULL,
 `Sex` int(1) NOT NULL COMMENT '0:man;1:woman;>1 other',
 `Salary` int(5) NOT NULL COMMENT 'NT dollars',
 `Cnumber` int(8) NOT NULL,
 PRIMARY KEY (`SSN`),
 KEY `Cnumber` (`Cnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `pass_by` (
 `Bus_Number` int(3) NOT NULL,
 `Stop_Number_Other_Stop_Number` char(7) NOT NULL,
 PRIMARY KEY (`Bus_Number`,`Stop_Number_Other_Stop_Number`) USING BTREE,
 KEY `Stop_Number_Other_Stop_Number` (`Stop_Number_Other_Stop_Number`),
 KEY `Bus_Number` (`Bus_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;







INSERT INTO `company` (`Cnumber`, `Cname`, `Manager_Name`, `Clocation`) VALUES ('44440000', 'dragon bus company', 'Smith Wang', 'Sanxia'), ('44441111', 'harmony bus company', 'Tom Chen', 'Wanhua'), ('44442222', 'safety bus company', 'Jhon Hu', 'Songshan'), ('44443333', 'happy bus company', 'Sandy Chen', 'Banqiao'), ('44444444', 'love bus company', 'Gimmy Chang', 'Nangang');


INSERT INTO `driver` (`SSN`, `Address`, `Fname`, `Lname`, `Sex`, `Salary`, `Cnumber`) VALUES ('111111111', 'Genius Rd., Wanhua Dist., Taipei City', 'Luccy', 'Chen', '1', '40000', '44442222'), ('111222111', 'Vodka Rd., Wanhua Dist., Taipei City', 'Vodka', 'Ho', '0', '27000', '44443333'), ('123123123', 'Ant Rd., Sanxia Dist., New Taipei City', 'Wendy', 'Ho', '1', '31000', '44440000'), ('123333120', 'Journey Rd., Linkou Dist., New Taipei Ci', 'Fuchi', 'Chang', '1', '31200', '44444444'), ('123456456', 'Wolf Rd., Banqiao Dist., New Taipei City', 'Jhony', 'Lee', '0', '29900', '44441111'), ('123456789', 'Pig Rd., Sanxia Dist., New Taipei City', 'Yoyo', 'Hu', '1', '30000', '44440000'), ('123789789', 'Awesome Rd., Nangang Dist., Taipei C', 'Tim', 'Lee', '0', '35000', '44444444'), ('222222222', 'Clock Rd., Shilin Dist., Taipei City', 'Denny', 'Lu', '0', '28000', '44443333'), ('333333333', 'Norm Rd., Sanxia Dist., New Taipei City', 'Timmy', 'Lu', '0', '33000', '44444444'), ('555555555', 'Sleep Rd., Wanhua Dist., Taipei City', 'Yolu', 'Hua', '1', '35000', '44441111'), ('666666666', 'Snake Rd., Tucheng Dist., New Taipei Cit', 'Oscar', 'Lin', '0', '33400', '44443333'), ('888888888', 'Speed Rd., Banqiao Dist., New Taipei Cit', 'Ginny', 'Lee', '1', '37700', '44442222'), ('999999999', 'Dragon Rd., Sanxia Dist., New Taipei Cit', 'Gin', 'Lin', '0', '29000', '44442222');
























INSERT INTO `bus` (`Bus_Number`, `Travel_Time`, `Busy_Time`, `Frequency`, `Start_Time`, `Last_Time`, `SSN`, `Experience`, `Cnumber`) VALUES ('38', '65', '17:00:00', '8.5', '07:00:00', '22:00:00', '555555555', '8', '44441111'), ('99', '75', '19:00:00', '6', '06:00:00', '23:00:00', '123456456', '4', '44441111'), ('122', '105', '16:00:00', '20', '06:00:00', '21:00:00', '888888888', '2.5', '44442222'), ('123', '100', '08:00:00', '15', '05:00:00', '22:00:00', '111111111', '2.5', '44442222'), ('234', '70', '19:00:00', '18', '09:00:00', '22:00:00', '666666666', '1.5', '44443333'), ('313', '200', '15:00:00', '30', '05:00:00', '20:00:00', '333333333', '6', '44444444'), ('345', '150', '18:00:00', '10', '07:00:00', '23:00:00', '999999999', '3', '44442222'), ('506', '100', '18:00:00', '10', '04:30:00', '20:00:00', '123456789', '10', '44440000'), ('555', '80', '20:00:00', '5', '05:30:00', '22:30:00', '111222111', '1', '44443333'), ('576', '108', '17:00:00', '13', '05:50:00', '22:00:00', '123789789', '2', '44444444'), ('916', '50', '20:00:00', '15', '04:00:00', '23:00:00', '123123123', '5', '44440000'), ('932', '102', '16:00:00', '10', '07:00:00', '20:00:00', '123333120', '2.5', '44444444'), ('933', '200', '15:00:00', '25', '08:00:00', '20:00:00', '222222222', '5', '44443333');






INSERT INTO `bus_stop` (`Stop_Number_Other_Stop_Number`, `Bus_name`, `Location`, `Busy_Time`, `Kilo`, `Stop_Interval`, `Spending_Time`) VALUES ('101 102', '038 099 234 916', 'Bee Hospital', '08:00:00', '3.2', '1', '15'), ('101 103', '038 099 234 916', 'Bee Hospital', '08:00:00', '7', '2', '32'), ('101 104', '038 099 234 916', 'Bee Hospital', '08:00:00', '11.5', '3', '47'), ('101 105', '038 099 234 916', 'Bee Hospital', '08:00:00', '20', '4', '65'), ('101 106', '038 099 234 916', 'Bee Hospital', '08:00:00', '15', '4', '62'), ('101 107', '038 099 234 916', 'Bee Hospital', '08:00:00', '9.1', '3', '42'), ('101 112', '038 099 234 916', 'Bee Hospital', '08:00:00', '10', '3', '50'), ('102 101', '038 099 234 313 555 916', 'Joy Park', '10:00:00', '3.2', '1', '15'), ('102 103', '038 099 234 313 555 916', 'Joy Park', '10:00:00', '3.8', '1', '17'), ('102 104', '038 099 234 313 555 916', 'Joy Park', '10:00:00', '8.3', '2', '32'), ('102 105', '038 099 234 313 555 916', 'Joy Park', '10:00:00', '16.8', '3', '50'), ('102 106', '038 099 234 313 555 916', 'Joy Park', '10:00:00', '9.8', '3', '47'), ('102 107', '038 099 234 313 555 916', 'Joy Park', '10:00:00', '5.9', '2', '27'), ('102 112', '038 099 234 313 555 916', 'Joy Park', '10:00:00', '8', '2', '30'), ('103 101', '038 099 122 234 313 555 916', 'Fish Pool', '18:00:00', '7', '2', '32'), ('103 102', '038 099 122 234 313 555 916', 'Fish Pool', '18:00:00', '3.8', '1', '17'), ('103 104', '038 099 122 234 313 555 916', 'Fish Pool', '18:00:00', '4.5', '1', '15'), ('103 105', '038 099 122 234 313 555 916', 'Fish Pool', '18:00:00', '13', '2', '33'), ('103 106', '038 099 122 234 313 555 916', 'Fish Pool', '18:00:00', '8', '2', '30'), ('103 107', '038 099 122 234 313 555 916', 'Fish Pool', '18:00:00', '2.1', '1', '10'), ('103 108', '038 099 122 234 313 555 916', 'Fish Pool', '18:00:00', '7', '1', '20'), ('103 109', '038 099 122 234 313 555 916', 'Fish Pool', '18:00:00', '27', '2', '75'), ('104 101', '038 099 123 313 345 506 555 916', 'Enjoy Cafe', '15:00:00', '11.5', '3', '47'), ('104 102', '038 099 123 313 345 506 555 916', 'Enjoy Cafe', '15:00:00', '8.3', '2', '32'), ('104 103', '038 099 123 313 345 506 555 916', 'Enjoy Cafe', '15:00:00', '4.5', '1', '15');



INSERT INTO `bus_stop` (`Stop_Number_Other_Stop_Number`, `Bus_name`, `Location`, `Busy_Time`, `Kilo`, `Stop_Interval`, `Spending_Time`) VALUES ('104 105', '038 099 123 313 345 506 555 916', 'Enjoy Cafe', '15:00:00', '8.5', '1', '18'), ('104 108', '038 099 123 313 345 506 555 916', 'Enjoy Cafe', '15:00:00', '16', '1', '30'), ('104 110', '038 099 123 313 345 506 555 916', 'Enjoy Cafe', '15:00:00', '20', '2', '40'), ('104 111', '038 099 123 313 345 506 555 916', 'Enjoy Cafe', '15:00:00', '38.5', '2', '60'), ('104 113', '038 099 123 313 345 506 555 916', 'Enjoy Cafe', '15:00:00', '14', '2', '30'), ('105 101', '038 099 123 345 313 506 555 916', 'Morning Market', '07:00:00', '20', '4', '65'), ('105 102', '038 099 123 345 313 506 555 916', 'Morning Market', '07:00:00', '16.8', '3', '50'), ('105 103', '038 099 123 345 313 506 555 916', 'Morning Market', '07:00:00', '13', '2', '33'), ('105 104', '038 099 123 345 313 506 555 916', 'Morning Market', '07:00:00', '8.5', '1', '18'), ('105 108', '038 099 123 345 313 506 555 916', 'Morning Market', '07:00:00', '24.5', '2', '48'), ('105 110', '038 099 123 345 313 506 555 916', 'Morning Market', '07:00:00', '28.5', '3', '58'), ('105 111', '038 099 123 345 313 506 555 916', 'Morning Market', '07:00:00', '30', '1', '42'), ('105 113', '038 099 123 345 313 506 555 916', 'Morning Market', '07:00:00', '5.5', '1', '12'), ('106 101', '122 234', 'Bag Shop', '14:00:00', '15', '4', '62'), ('106 102', '122 234', 'Bag Shop', '14:00:00', '9.8', '3', '47'), ('106 103', '122 234', 'Bag Shop', '14:00:00', '8', '2', '30'), ('106 107', '122 234', 'Bag Shop', '14:00:00', '5.9', '1', '20'), ('106 108', '122 234', 'Bag Shop', '14:00:00', '15', '3', '50'), ('106 109', '122 234', 'Bag Shop', '14:00:00', '35', '4', '105'), ('107 101', '122 234', 'Vegetable Shop', '09:00:00', '9.1', '3', '40'), ('107 102', '122 234', 'Vegetable Shop', '09:00:00', '5.9', '2', '27'), ('107 103', '122 234', 'Vegetable Shop', '09:00:00', '2.1', '1', '10'), ('107 106', '122 234', 'Vegetable Shop', '09:00:00', '5.9', '1', '20'), ('107 108', '122 234', 'Vegetable Shop', '09:00:00', '9.1', '2', '30'), ('107 109', '122 234', 'Vegetable Shop', '09:00:00', '29.1', '3', '85');



INSERT INTO `bus_stop` (`Stop_Number_Other_Stop_Number`, `Bus_name`, `Location`, `Busy_Time`, `Kilo`, `Stop_Interval`, `Spending_Time`) VALUES ('108 103', '122 123 345 506', 'GUU Fruit Shop', '11:00:00', '7', '1', '20'), ('108 104', '122 123 345 506', 'GUU Fruit Shop', '11:00:00', '16', '1', '30'), ('108 105', '122 123 345 506', 'GUU Fruit Shop', '11:00:00', '24.5', '2', '48'), ('108 106', '122 123 345 506', 'GUU Fruit Shop', '11:00:00', '15', '3', '50'), ('108 107', '122 123 345 506', 'GUU Fruit Shop', '11:00:00', '9.1', '2', '30'), ('108 109', '122 123 345 506', 'GUU Fruit Shop', '11:00:00', '20', '1', '55'), ('108 110', '122 123 345 506', 'GUU Fruit Shop', '11:00:00', '4', '1', '10'), ('108 111', '122 123 345 506', 'GUU Fruit Shop', '11:00:00', '54.5', '3', '90'), ('108 113', '122 123 345 506', 'GUU Fruit Shop', '11:00:00', '30', '3', '60'), ('109 103', '122', 'Greedy Elementary School', '08:00:00', '27', '2', '75'), ('109 106', '122', 'Greedy Elementary School', '08:00:00', '35', '4', '105'), ('109 107', '122 ', 'Greedy Elementary School', '08:00:00', '29.1', '3', '85'), ('109 108', '122', 'Greedy Elementary School', '08:00:00', '20', '1', '55'), ('110 104', '123', 'Holy Church', '09:00:00', '20', '2', '40'), ('110 105', '123', 'Holy Church', '09:00:00', '28.5', '3', '58'), ('110 108', '123', 'Holy Church', '09:00:00', '4', '1', '10'), ('110 111', '123', 'Holy Church', '09:00:00', '58.5', '4', '100'), ('111 104', '123', 'Evening Market', '18:00:00', '38.5', '2', '60'), ('111 105', '123', 'Evening Market', '18:00:00', '30', '1', '42'), ('111 108', '123', 'Evening Market', '18:00:00', '54.5', '3', '90'), ('111 110', '123', 'Evening Market', '18:00:00', '58.5', '4', '100'), ('113 104', '345 506', 'Ending Night Market', '19:00:00', '14', '2', '30'), ('113 105', '345 506', 'Ending Night Market', '19:00:00', '5.5', '1', '12'), ('113 108', '345 506', 'Ending Night Market', '19:00:00', '30', '3', '60');


INSERT INTO `pass_by` (`Bus_Number`, `Stop_Number_Other_Stop_Number`) VALUES ('38', '101 102'), ('38', '101 103'), ('38', '101 104'), ('38', '101 105'), ('38', '102 101'), ('38', '102 103'), ('38', '102 104'), ('38', '102 105'), ('38', '103 101'), ('38', '103 102'), ('38', '103 104'), ('38', '103 105'), ('38', '104 101'), ('38', '104 102'), ('38', '104 103'), ('38', '104 105'), ('38', '105 101'), ('38', '105 102'), ('38', '105 103'), ('38', '105 104'), ('99', '101 102'), ('99', '101 103'), ('99', '101 104'), ('99', '101 105'), ('99', '102 101');


INSERT INTO `pass_by` (`Bus_Number`, `Stop_Number_Other_Stop_Number`) VALUES ('99', '102 103'), ('99', '102 104'), ('99', '102 105'), ('99', '103 101'), ('99', '103 102'), ('99', '103 104'), ('99', '103 105'), ('99', '104 101'), ('99', '104 102'), ('99', '104 103'), ('99', '104 105'), ('99', '105 101'), ('99', '105 102'), ('99', '105 103'), ('99', '105 104'), ('122', '103 106'), ('122', '103 107'), ('122', '103 108'), ('122', '103 109'), ('122', '106 103'), ('122', '106 107'), ('122', '106 108'), ('122', '106 109'), ('122', '107 103'), ('122', '107 106');


INSERT INTO `pass_by` (`Bus_Number`, `Stop_Number_Other_Stop_Number`) VALUES ('122', '107 108'), ('122', '107 109'), ('122', '108 103'), ('122', '108 106'), ('122', '108 107'), ('122', '108 109'), ('122', '109 103'), ('122', '109 106'), ('122', '109 107'), ('122', '109 108'), ('123', '104 105'), ('123', '104 108'), ('123', '104 110'), ('123', '104 111'), ('123', '105 104'), ('123', '105 108'), ('123', '105 110'), ('123', '105 111'), ('123', '108 104'), ('123', '108 105'), ('123', '108 110'), ('123', '108 111'), ('123', '110 104'), ('123', '110 105'), ('123', '110 108');


INSERT INTO `pass_by` (`Bus_Number`, `Stop_Number_Other_Stop_Number`) VALUES ('123', '110 111'), ('123', '111 104'), ('123', '111 105'), ('123', '111 108'), ('123', '111 110'), ('234', '101 102'), ('234', '101 103'), ('234', '101 106'), ('234', '101 107'), ('234', '102 101'), ('234', '102 103'), ('234', '102 106'), ('234', '102 107'), ('234', '103 101'), ('234', '103 102'), ('234', '103 106'), ('234', '103 107'), ('234', '106 101'), ('234', '106 102'), ('234', '106 103'), ('234', '106 107'), ('234', '107 101'), ('234', '107 102'), ('234', '107 103'), ('234', '107 106');


INSERT INTO `pass_by` (`Bus_Number`, `Stop_Number_Other_Stop_Number`) VALUES ('313', '102 103'), ('313', '102 104'), ('313', '102 105'), ('313', '103 102'), ('313', '103 104'), ('313', '103 105'), ('313', '104 102'), ('313', '104 103'), ('313', '104 105'), ('313', '105 102'), ('313', '105 103'), ('313', '105 104'), ('345', '104 105'), ('345', '104 108'), ('345', '104 113'), ('345', '105 104'), ('345', '105 108'), ('345', '105 113'), ('345', '108 104'), ('345', '108 105'), ('345', '108 113'), ('345', '113 104'), ('345', '113 105'), ('345', '113 108'), ('506', '104 105');

INSERT INTO `pass_by` (`Bus_Number`, `Stop_Number_Other_Stop_Number`) VALUES ('506', '104 108'), ('506', '104 113'), ('506', '105 104'), ('506', '105 108'), ('506', '105 113'), ('506', '108 104'), ('506', '108 105'), ('506', '108 113'), ('506', '113 104'), ('506', '113 105'), ('506', '113 108'), ('555', '102 103'), ('555', '102 104'), ('555', '102 105'), ('555', '103 102'), ('555', '103 104'), ('555', '103 105'), ('555', '104 102'), ('555', '104 103'), ('555', '104 105'), ('555', '105 102'), ('555', '105 103'), ('555', '105 104'), ('916', '101 102'), ('916', '101 103');

INSERT INTO `pass_by` (`Bus_Number`, `Stop_Number_Other_Stop_Number`) VALUES ('916', '101 104'), ('916', '101 105'), ('916', '102 101'), ('916', '102 103'), ('916', '102 104'), ('916', '102 105'), ('916', '103 101'), ('916', '103 102'), ('916', '103 104'), ('916', '103 105'), ('916', '104 101'), ('916', '104 102'), ('916', '104 103'), ('916', '104 105'), ('916', '105 101'), ('916', '105 102'), ('916', '105 103'), ('916', '105 104');