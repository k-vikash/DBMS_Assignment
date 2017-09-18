-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema IMDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema IMDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `IMDB` DEFAULT CHARACTER SET utf8 ;
USE `IMDB` ;

-- -----------------------------------------------------
-- Table `IMDB`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMDB`.`actor` (
  `actor_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NULL,
  `age` TINYINT NULL,
  PRIMARY KEY (`actor_id`),
  UNIQUE INDEX `actor_id_UNIQUE` (`actor_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`tv_series`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMDB`.`tv_series` (
  `tv_series_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tv_series_name` VARCHAR(45) NOT NULL,
  `imdb_rating` VARCHAR(45) NULL,
  `language` VARCHAR(45) NOT NULL,
  `actor_actor_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`tv_series_id`, `actor_actor_id`),
  INDEX `fk_tv_series_actor1_idx` (`actor_actor_id` ASC),
  UNIQUE INDEX `tv_series_id_UNIQUE` (`tv_series_id` ASC),
  CONSTRAINT `fk_tv_series_actor1`
    FOREIGN KEY (`actor_actor_id`)
    REFERENCES `IMDB`.`actor` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMDB`.`movie` (
  `movie_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_name` VARCHAR(45) NOT NULL,
  `movie_category` VARCHAR(45) NULL,
  `imdb_rating` VARCHAR(45) NULL,
  `description` VARCHAR(200) NULL,
  `movieActor_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`movie_id`, `movieActor_id`),
  INDEX `fk_movie_1_idx` (`movieActor_id` ASC),
  UNIQUE INDEX `movie_id_UNIQUE` (`movie_id` ASC),
  CONSTRAINT `fk_movie_1`
    FOREIGN KEY (`movieActor_id`)
    REFERENCES `IMDB`.`actor` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
