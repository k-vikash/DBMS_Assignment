-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema hotel_booking
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hotel_booking
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hotel_booking` DEFAULT CHARACTER SET utf8 ;
USE `hotel_booking` ;

-- -----------------------------------------------------
-- Table `hotel_booking`.`hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_booking`.`hotel` (
  `hotel_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `hotel_name` VARCHAR(45) NOT NULL,
  `hotel_aminities` VARCHAR(100) NOT NULL,
  `room_type` VARCHAR(45) NOT NULL,
  `cost_of_room` INT(10) NOT NULL,
  PRIMARY KEY (`hotel_id`),
  UNIQUE INDEX `hotel_id_UNIQUE` (`hotel_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_booking`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_booking`.`customer` (
  `customer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `age` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `first_time` TINYINT NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `customer_id_UNIQUE` (`customer_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_booking`.`booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_booking`.`booking` (
  `booking_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_customer_id` INT NOT NULL,
  `hotel_hotel_id` INT NOT NULL,
  PRIMARY KEY (`booking_id`, `customer_customer_id`, `hotel_hotel_id`),
  INDEX `fk_booking_customer_idx` (`customer_customer_id` ASC),
  INDEX `fk_booking_hotel1_idx` (`hotel_hotel_id` ASC),
  UNIQUE INDEX `booking_id_UNIQUE` (`booking_id` ASC),
  CONSTRAINT `fk_booking_customer`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `hotel_booking`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_booking_hotel1`
    FOREIGN KEY (`hotel_hotel_id`)
    REFERENCES `hotel_booking`.`hotel` (`hotel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
