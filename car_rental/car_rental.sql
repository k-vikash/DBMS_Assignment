-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cabs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cabs` (
  `cab_No` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cab_model` VARCHAR(45) NULL,
  `number_of_seat` INT(10) NOT NULL,
  PRIMARY KEY (`cab_No`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `customer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_firstname` VARCHAR(45) NOT NULL,
  `customer_lastname` VARCHAR(45) NULL,
  `customer_mobileNo` INT(10) NOT NULL,
  `email_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Driver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Driver` (
  `driver_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `driver_firstname` VARCHAR(45) NOT NULL,
  `driver_lastname` VARCHAR(45) NULL,
  `driver_mobileNo` INT(10) NOT NULL,
  PRIMARY KEY (`driver_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Journey`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Journey` (
  `Cabs_cab_No` INT NOT NULL,
  `Customer_customer_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Cabs_cab_No`, `Customer_customer_id`),
  INDEX `fk_Journey_Cabs1_idx` (`Cabs_cab_No` ASC),
  INDEX `fk_Journey_Customer1_idx` (`Customer_customer_id` ASC),
  CONSTRAINT `fk_Journey_Cabs1`
    FOREIGN KEY (`Cabs_cab_No`)
    REFERENCES `mydb`.`Cabs` (`cab_No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Journey_Customer1`
    FOREIGN KEY (`Customer_customer_id`)
    REFERENCES `mydb`.`Customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cab_driver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cab_driver` (
  `cab_No` INT NOT NULL,
  `Driver_driver_id` INT NOT NULL,
  PRIMARY KEY (`cab_No`, `Driver_driver_id`),
  INDEX `fk_cab_driver_Cabs1_idx` (`cab_No` ASC),
  INDEX `fk_cab_driver_Driver1_idx` (`Driver_driver_id` ASC),
  UNIQUE INDEX `cab_No_UNIQUE` (`cab_No` ASC),
  UNIQUE INDEX `Driver_driver_id_UNIQUE` (`Driver_driver_id` ASC),
  CONSTRAINT `fk_cab_driver_Cabs1`
    FOREIGN KEY (`cab_No`)
    REFERENCES `mydb`.`Cabs` (`cab_No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cab_driver_Driver1`
    FOREIGN KEY (`Driver_driver_id`)
    REFERENCES `mydb`.`Driver` (`driver_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
