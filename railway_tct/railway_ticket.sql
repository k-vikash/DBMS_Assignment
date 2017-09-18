-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema railway_ticket
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema railway_ticket
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `railway_ticket` DEFAULT CHARACTER SET utf8 ;
USE `railway_ticket` ;

-- -----------------------------------------------------
-- Table `railway_ticket`.`train`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `railway_ticket`.`train` (
  `train_no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `departure_place` VARCHAR(45) NOT NULL,
  `departure_time` VARCHAR(45) NOT NULL,
  `destination` VARCHAR(45) NOT NULL,
  `arrival_time` VARCHAR(45) NOT NULL,
  `total seat` VARCHAR(45) NOT NULL,
  `seat_no` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`train_no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `railway_ticket`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `railway_ticket`.`customer` (
  `customer_id` INT(45) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_Name` VARCHAR(45) NOT NULL,
  `age` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `phone_no` INT(10) NOT NULL,
  `address` VARCHAR(80) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `railway_ticket`.`ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `railway_ticket`.`ticket` (
  `ticket_no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket_price` FLOAT NOT NULL,
  `unreserved_tct` TINYINT NOT NULL,
  `time_of_booking` DATETIME NOT NULL,
  `customer_customer_id` INT(45) NOT NULL,
  PRIMARY KEY (`ticket_no`, `customer_customer_id`),
  INDEX `fk_ticket_customer1_idx` (`customer_customer_id` ASC),
  UNIQUE INDEX `time_of_booking_UNIQUE` (`time_of_booking` ASC),
  CONSTRAINT `fk_ticket_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `railway_ticket`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
PACK_KEYS = DEFAULT;


-- -----------------------------------------------------
-- Table `railway_ticket`.`Reserved_ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `railway_ticket`.`Reserved_ticket` (
  `ticket_ticket_no` INT NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `age` TINYINT NOT NULL,
  `journey_date` DATETIME NOT NULL,
  `train_train_no` INT NOT NULL,
  PRIMARY KEY (`ticket_ticket_no`, `train_train_no`),
  INDEX `fk_Reserved_ticket_ticket1_idx` (`ticket_ticket_no` ASC),
  INDEX `fk_Reserved_ticket_train1_idx` (`train_train_no` ASC),
  CONSTRAINT `fk_Reserved_ticket_ticket1`
    FOREIGN KEY (`ticket_ticket_no`)
    REFERENCES `railway_ticket`.`ticket` (`ticket_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserved_ticket_train1`
    FOREIGN KEY (`train_train_no`)
    REFERENCES `railway_ticket`.`train` (`train_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `railway_ticket`.`Unreserved ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `railway_ticket`.`Unreserved ticket` (
  `ticket_ticket_no` INT NOT NULL,
  `train_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ticket_ticket_no`),
  INDEX `fk_Unreserved ticket_ticket1_idx` (`ticket_ticket_no` ASC),
  CONSTRAINT `fk_Unreserved ticket_ticket1`
    FOREIGN KEY (`ticket_ticket_no`)
    REFERENCES `railway_ticket`.`ticket` (`ticket_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
