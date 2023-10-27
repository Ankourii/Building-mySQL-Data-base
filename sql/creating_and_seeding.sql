-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema video_rental_shop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema video_rental_shop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `video_rental_shop` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema video_rental_shop
-- -----------------------------------------------------
USE `video_rental_shop` ;

-- -----------------------------------------------------
-- Table `video_rental_shop`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `video_rental_shop`.`actor` (
  `actor_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `video_rental_shop`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `video_rental_shop`.`category` (
  `category_id` INT NOT NULL,
  `category_name` VARCHAR(45) NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `video_rental_shop`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `video_rental_shop`.`film` (
  `film_id` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `description` VARCHAR(10000) NULL,
  `rental_duration_days` INT NULL,
  `rental_rate` DECIMAL(5) NULL,
  `length` INT NULL,
  `replacement_cost` DECIMAL(5) NULL,
  `rating` VARCHAR(45) NULL,
  `special_features` VARCHAR(200) NULL,
  `category_category_id` INT NOT NULL,
  PRIMARY KEY (`film_id`),
  INDEX `fk_film_category1_idx` (`category_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `video_rental_shop`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `video_rental_shop`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `video_rental_shop`.`inventory` (
  `inventory_id` INT NOT NULL,
  `film_film_id` INT NOT NULL,
  `store_id` INT NULL,
  PRIMARY KEY (`inventory_id`),
  INDEX `fk_inventory_film1_idx` (`film_film_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_film1`
    FOREIGN KEY (`film_film_id`)
    REFERENCES `video_rental_shop`.`film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `video_rental_shop`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `video_rental_shop`.`rental` (
  `rental_id` INT NOT NULL,
  `rental_date` DATETIME NULL,
  `inventory_inventory_id` INT NOT NULL,
  `customer_id` INT NULL,
  `return_date` DATETIME NULL,
  `staff_id` INT NULL,
  PRIMARY KEY (`rental_id`),
  INDEX `fk_rental_inventory1_idx` (`inventory_inventory_id` ASC) VISIBLE,
  CONSTRAINT `fk_rental_inventory1`
    FOREIGN KEY (`inventory_inventory_id`)
    REFERENCES `video_rental_shop`.`inventory` (`inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `video_rental_shop`.`actor_film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `video_rental_shop`.`actor_film` (
  `actor_actor_id` INT NOT NULL,
  `film_film_id` INT NOT NULL,
  PRIMARY KEY (`actor_actor_id`, `film_film_id`),
  INDEX `fk_actor_has_film_film1_idx` (`film_film_id` ASC) VISIBLE,
  INDEX `fk_actor_has_film_actor_idx` (`actor_actor_id` ASC) VISIBLE,
  CONSTRAINT `fk_actor_has_film_actor`
    FOREIGN KEY (`actor_actor_id`)
    REFERENCES `video_rental_shop`.`actor` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_actor_has_film_film1`
    FOREIGN KEY (`film_film_id`)
    REFERENCES `video_rental_shop`.`film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



