-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema food_delivery
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema food_delivery
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `food_delivery` DEFAULT CHARACTER SET utf8 ;
USE `food_delivery` ;

-- -----------------------------------------------------
-- Table `food_delivery`.`resturant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `food_delivery`.`resturant` (
  `resturant_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `location_id` VARCHAR(45) NOT NULL,
  `items` VARCHAR(45) NOT NULL,
  `opening_time` DATETIME NOT NULL,
  `closing_time` DATETIME NOT NULL,
  PRIMARY KEY (`resturant_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `food_delivery`.`delivery_person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `food_delivery`.`delivery_person` (
  `person_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `person_name` VARCHAR(45) NOT NULL,
  `contact_no` INT(10) NOT NULL,
  PRIMARY KEY (`person_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `food_delivery`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `food_delivery`.`customer` (
  `customer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `contact_no` INT(10) NOT NULL,
  `location_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `food_delivery`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `food_delivery`.`order` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `order_type` VARCHAR(45) NULL,
  `items` VARCHAR(45) NOT NULL,
  `delivery_person_person_id` INT NOT NULL,
  `total_bill` VARCHAR(45) NOT NULL,
  `time_of_order` DATETIME NOT NULL,
  `customer_customer_id` INT UNSIGNED NOT NULL,
  `resturant_resturant_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`order_id`, `delivery_person_person_id`, `customer_customer_id`, `resturant_resturant_id`),
  INDEX `fk_order_delivery_person_idx` (`delivery_person_person_id` ASC),
  UNIQUE INDEX `time_of_order_UNIQUE` (`time_of_order` ASC),
  INDEX `fk_order_customer1_idx` (`customer_customer_id` ASC),
  INDEX `fk_order_resturant1_idx` (`resturant_resturant_id` ASC),
  UNIQUE INDEX `customer_customer_id_UNIQUE` (`customer_customer_id` ASC),
  UNIQUE INDEX `resturant_resturant_id_UNIQUE` (`resturant_resturant_id` ASC),
  CONSTRAINT `fk_order_delivery_person`
    FOREIGN KEY (`delivery_person_person_id`)
    REFERENCES `food_delivery`.`delivery_person` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `food_delivery`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_resturant1`
    FOREIGN KEY (`resturant_resturant_id`)
    REFERENCES `food_delivery`.`resturant` (`resturant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
