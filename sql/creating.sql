-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema video_rental_shop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema video_rental_shop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `video_rental_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `video_rental_shop` ;

-- -----------------------------------------------------
-- Table `video_rental_shop`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `video_rental_shop`.`actor` (
  `actor_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `video_rental_shop`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `video_rental_shop`.`category` (
  `category_id` INT NOT NULL,
  `category_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `video_rental_shop`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `video_rental_shop`.`film` (
  `film_id` INT NOT NULL,
  `title` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(10000) NULL DEFAULT NULL,
  `rental_duration_days` INT NULL DEFAULT NULL,
  `rental_rate` DECIMAL(5,0) NULL DEFAULT NULL,
  `length` INT NULL DEFAULT NULL,
  `replacement_cost` DECIMAL(5,0) NULL DEFAULT NULL,
  `rating` VARCHAR(45) NULL DEFAULT NULL,
  `special_features` VARCHAR(200) NULL DEFAULT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`film_id`),
  INDEX `fk_film_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `video_rental_shop`.`category` (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `video_rental_shop`.`actor_film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `video_rental_shop`.`actor_film` (
  `actor_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  PRIMARY KEY (`actor_id`, `film_id`),
  INDEX `fk_actor_has_film_film1_idx` (`film_id` ASC) VISIBLE,
  INDEX `fk_actor_has_film_actor_idx` (`actor_id` ASC) VISIBLE,
  CONSTRAINT `fk_actor_has_film_actor`
    FOREIGN KEY (`actor_id`)
    REFERENCES `video_rental_shop`.`actor` (`actor_id`),
  CONSTRAINT `fk_actor_has_film_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `video_rental_shop`.`film` (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `video_rental_shop`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `video_rental_shop`.`inventory` (
  `inventory_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  `store_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  INDEX `fk_inventory_film1_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `video_rental_shop`.`film` (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `video_rental_shop`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `video_rental_shop`.`rental` (
  `rental_id` INT NOT NULL,
  `rental_date` DATETIME NULL DEFAULT NULL,
  `rental_dow` VARCHAR(45) NULL,
  `inventory_id` INT NOT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `return_date` DATETIME NULL DEFAULT NULL,
  `return_dow` VARCHAR(45) NULL,
  `staff_id` INT NULL DEFAULT NULL,
  `days_kept` VARCHAR(45) NULL,
  PRIMARY KEY (`rental_id`),
  INDEX `fk_rental_inventory1_idx` (`inventory_id` ASC) VISIBLE,
  CONSTRAINT `fk_rental_inventory1`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `video_rental_shop`.`inventory` (`inventory_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
