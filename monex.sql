-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE TABLE "actionlog" ------------------------------------
CREATE TABLE `actionlog`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`idBill` Int( 0 ) NOT NULL,
	`billsGiven` Text CHARACTER SET utf8mb4  NOT NULL,
	`date` DateTime NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4

ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "adminlog" -------------------------------------
CREATE TABLE `adminlog`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`idAdmin` Int( 0 ) NOT NULL,
	`date` DateTime NOT NULL,
	`idBill` Int( 0 ) NOT NULL,
	`newQuantityBills` Int( 0 ) NOT NULL,
	`beforeQuantityBills` Int( 0 ) NOT NULL,
	`action` Text CHARACTER SET utf8mb4  NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4

ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "admins" ---------------------------------------
CREATE TABLE `admins`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`username` VarChar( 15 ) CHARACTER SET utf8mb4  NOT NULL,
	`password` VarChar( 56 ) CHARACTER SET utf8mb4  NOT NULL,
	`deleted` TinyInt( 1 ) NOT NULL DEFAULT 0,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `username` UNIQUE( `username` ) )
CHARACTER SET = utf8mb4

ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- -------------------------------------------------------------


-- CREATE TABLE "bills" ----------------------------------------
CREATE TABLE `bills`( 
	`id` Int( 0 ) NOT NULL,
	`quantity` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4

ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "sessions" -------------------------------------
CREATE TABLE `sessions`( 
	`cookie` Char( 43 ) CHARACTER SET utf8mb4  NOT NULL,
	`idAdmin` Int( 0 ) NOT NULL,
	`date` DateTime NOT NULL,
	PRIMARY KEY ( `cookie` ) )
CHARACTER SET = utf8mb4

ENGINE = InnoDB;
-- -------------------------------------------------------------

-- Dump data of "actionlog" --------------------------------
-- ---------------------------------------------------------


-- Dump data of "adminlog" ---------------------------------
-- ---------------------------------------------------------


-- Dump data of "admins" -----------------------------------
BEGIN;

INSERT INTO `admins`(`id`,`username`,`password`,`deleted`) VALUES 
( '1', 'adminMN', 'ac95bebfcdae17e5395ccff3d45f8960435d7734f232cdbbd4b8ab49', '0' );
COMMIT;
-- ---------------------------------------------------------

-- Dump data of "bills" ------------------------------------
BEGIN;

INSERT INTO `bills`(`id`,`quantity`) VALUES 
( '1', '20' ),
( '2', '15' ),
( '5', '10' ),
( '10', '8' ),
( '20', '8' ),
( '50', '6' ),
( '100', '5' ),
( '200', '5' ),
( '500', '4' ),
( '1000', '0' );
COMMIT;
-- ---------------------------------------------------------

-- Dump data of "sessions" ---------------------------------
-- ---------------------------------------------------------

-- CREATE INDEX "fk_actionlog_bills" ---------------------------
CREATE INDEX `fk_actionlog_bills` USING BTREE ON `actionlog`( `idBill` );
-- -------------------------------------------------------------


-- CREATE INDEX "fk_adminlog_admins" ---------------------------
CREATE INDEX `fk_adminlog_admins` USING BTREE ON `adminlog`( `idAdmin` );
-- -------------------------------------------------------------


-- CREATE INDEX "fk_adminlog_bills" ----------------------------
CREATE INDEX `fk_adminlog_bills` USING BTREE ON `adminlog`( `idBill` );
-- -------------------------------------------------------------

-- CREATE INDEX "fk_session_admin" -----------------------------
CREATE INDEX `fk_session_admin` USING BTREE ON `sessions`( `idAdmin` );
-- -------------------------------------------------------------

-- CREATE LINK "fk_actionlog_bills" ----------------------------
ALTER TABLE `actionlog`
	ADD CONSTRAINT `fk_actionlog_bills` FOREIGN KEY ( `idBill` )
	REFERENCES `bills`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "fk_adminlog_admins" ----------------------------
ALTER TABLE `adminlog`
	ADD CONSTRAINT `fk_adminlog_admins` FOREIGN KEY ( `idAdmin` )
	REFERENCES `admins`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "fk_adminlog_bills" -----------------------------
ALTER TABLE `adminlog`
	ADD CONSTRAINT `fk_adminlog_bills` FOREIGN KEY ( `idBill` )
	REFERENCES `bills`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "fk_sessions_admins" ----------------------------
ALTER TABLE `sessions`
	ADD CONSTRAINT `fk_sessions_admins` FOREIGN KEY ( `idAdmin` )
	REFERENCES `admins`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


