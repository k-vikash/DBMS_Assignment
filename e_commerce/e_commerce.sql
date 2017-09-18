-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema e-commerce
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema e-commerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `e-commerce` DEFAULT CHARACTER SET utf8 ;
USE `e-commerce` ;

-- -----------------------------------------------------
-- Table `e-commerce`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`customer` (
  `account_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NULL,
  `c_address` VARCHAR(45) NOT NULL,
  `contact_no` INT(10) NOT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE INDEX `account_id_UNIQUE` (`account_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`item` (
  `item_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `item_name` VARCHAR(45) NOT NULL,
  `item_category` VARCHAR(45) NULL,
  `item_cost` INT NOT NULL,
  `item_descrption` VARCHAR(200) NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE INDEX `item_id_UNIQUE` (`item_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`supplier` (
  `supplier_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `supplier_name` VARCHAR(45) NOT NULL,
  `supplier_address` VARCHAR(45) NULL,
  `supplier_contact_no` INT(10) NOT NULL,
  PRIMARY KEY (`supplier_id`),
  UNIQUE INDEX `supplier_id_UNIQUE` (`supplier_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`order` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `time_of_order` DATETIME NOT NULL,
  `customer_account_id` INT NOT NULL,
  PRIMARY KEY (`order_id`, `customer_account_id`),
  INDEX `fk_order_customer1_idx` (`customer_account_id` ASC),
  UNIQUE INDEX `time_of_order_UNIQUE` (`time_of_order` ASC),
  UNIQUE INDEX `customer_account_id_UNIQUE` (`customer_account_id` ASC),
  UNIQUE INDEX `order_id_UNIQUE` (`order_id` ASC),
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_account_id`)
    REFERENCES `e-commerce`.`customer` (`account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`item_has_supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`item_has_supplier` (
  `item_item_id` INT NOT NULL,
  `supplier_supplier_id` INT NOT NULL,
  PRIMARY KEY (`item_item_id`, `supplier_supplier_id`),
  INDEX `fk_item_has_supplier_supplier1_idx` (`supplier_supplier_id` ASC),
  INDEX `fk_item_has_supplier_item_idx` (`item_item_id` ASC),
  CONSTRAINT `fk_item_has_supplier_item`
    FOREIGN KEY (`item_item_id`)
    REFERENCES `e-commerce`.`item` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_has_supplier_supplier1`
    FOREIGN KEY (`supplier_supplier_id`)
    REFERENCES `e-commerce`.`supplier` (`supplier_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`order_has_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`order_has_item` (
  `order_order_id` INT NOT NULL,
  `item_item_id` INT NOT NULL,
  PRIMARY KEY (`order_order_id`, `item_item_id`),
  INDEX `fk_order_has_item_item1_idx` (`item_item_id` ASC),
  INDEX `fk_order_has_item_order1_idx` (`order_order_id` ASC),
  CONSTRAINT `fk_order_has_item_order1`
    FOREIGN KEY (`order_order_id`)
    REFERENCES `e-commerce`.`order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_has_item_item1`
    FOREIGN KEY (`item_item_id`)
    REFERENCES `e-commerce`.`item` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
