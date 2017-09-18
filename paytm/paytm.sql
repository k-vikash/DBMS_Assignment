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
-- Table `mydb`.`branches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`branches` (
  `branch_code` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `branch_name` VARCHAR(45) NOT NULL,
  `branch_location` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`branch_code`),
  UNIQUE INDEX `branch_code_UNIQUE` (`branch_code` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`account` (
  `account_no` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_type` VARCHAR(45) NOT NULL,
  `account_balance` VARCHAR(45) NOT NULL,
  `branches_branch_code` INT NOT NULL,
  PRIMARY KEY (`account_no`, `branches_branch_code`),
  INDEX `fk_account_branches1_idx` (`branches_branch_code` ASC),
  UNIQUE INDEX `account_no_UNIQUE` (`account_no` ASC),
  CONSTRAINT `fk_account_branches1`
    FOREIGN KEY (`branches_branch_code`)
    REFERENCES `mydb`.`branches` (`branch_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customer` (
  `customer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `f_name` VARCHAR(45) NOT NULL,
  `l_name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `contact_no` INT(10) NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `customer_id_UNIQUE` (`customer_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`branches_has_customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`branches_has_customer` (
  `branches_branch_code` INT NOT NULL,
  `customer_customer_id` INT NOT NULL,
  PRIMARY KEY (`branches_branch_code`, `customer_customer_id`),
  INDEX `fk_branches_has_customer_customer1_idx` (`customer_customer_id` ASC),
  INDEX `fk_branches_has_customer_branches1_idx` (`branches_branch_code` ASC),
  UNIQUE INDEX `customer_customer_id_UNIQUE` (`customer_customer_id` ASC),
  UNIQUE INDEX `branches_branch_code_UNIQUE` (`branches_branch_code` ASC),
  CONSTRAINT `fk_branches_has_customer_branches1`
    FOREIGN KEY (`branches_branch_code`)
    REFERENCES `mydb`.`branches` (`branch_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_branches_has_customer_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `mydb`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`account_has_customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`account_has_customer` (
  `account_account_no` INT(11) UNSIGNED NOT NULL,
  `account_branches_branch_code` INT NOT NULL,
  `customer_customer_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`account_account_no`, `account_branches_branch_code`, `customer_customer_id`),
  INDEX `fk_account_has_customer_customer1_idx` (`customer_customer_id` ASC),
  INDEX `fk_account_has_customer_account1_idx` (`account_account_no` ASC, `account_branches_branch_code` ASC),
  CONSTRAINT `fk_account_has_customer_account1`
    FOREIGN KEY (`account_account_no` , `account_branches_branch_code`)
    REFERENCES `mydb`.`account` (`account_no` , `branches_branch_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_account_has_customer_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `mydb`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
