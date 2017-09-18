-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ProjectAndEmployee
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ProjectAndEmployee
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ProjectAndEmployee` ;
USE `ProjectAndEmployee` ;

-- -----------------------------------------------------
-- Table `ProjectAndEmployee`.`Project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjectAndEmployee`.`Project` (
  `project_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_name` VARCHAR(100) NOT NULL,
  `project_description` VARCHAR(200) NULL,
  `no_of_employee` INT NOT NULL,
  PRIMARY KEY (`project_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjectAndEmployee`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjectAndEmployee`.`Employee` (
  `employee_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `frist_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `address` VARCHAR(100) NULL,
  `Project_project_id` INT NOT NULL,
  `manager_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `fk_Employee_Project_idx` (`Project_project_id` ASC),
  INDEX `fk_Employee_Employee1_idx` (`manager_id` ASC),
  UNIQUE INDEX `employee_id_UNIQUE` (`employee_id` ASC),
  UNIQUE INDEX `Project_project_id_UNIQUE` (`Project_project_id` ASC),
  CONSTRAINT `fk_Employee_Project`
    FOREIGN KEY (`Project_project_id`)
    REFERENCES `ProjectAndEmployee`.`Project` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Employee1`
    FOREIGN KEY (`manager_id`)
    REFERENCES `ProjectAndEmployee`.`Employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
