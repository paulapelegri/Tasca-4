-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema MER4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER4` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `MER4` ;

-- -----------------------------------------------------
-- Table `MER4`.`CLIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`CLIENT` (
  `DNI` VARCHAR(9) NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `cognoms` VARCHAR(45) NOT NULL,
  `direccio` VARCHAR(200) NOT NULL,
  `telefon` INT NOT NULL,
  `VIP` INT NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `MER4`.`TIPUS_POLISSA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`TIPUS_POLISSA` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `MER4`.`VENEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`VENEDOR` (
  `DNI` VARCHAR(9) NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `cognoms` VARCHAR(45) NOT NULL,
  `direccio` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `MER4`.`POLISSA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`POLISSA` (
  `num_polissa` INT NOT NULL,
  `preu_anual` VARCHAR(45) NOT NULL,
  `tipus_pagament` VARCHAR(45) NOT NULL,
  `data_contractacio` DATE NOT NULL,
  `CLIENT_DNI` VARCHAR(9) NOT NULL,
  `TIPUS_POLISSA_ID` INT NOT NULL,
  `VENEDOR_DNI` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`num_polissa`),
  INDEX `fk_POLISSA_CLIENT_idx` (`CLIENT_DNI` ASC) VISIBLE,
  INDEX `fk_POLISSA_TIPUS_POLISSA1_idx` (`TIPUS_POLISSA_ID` ASC) VISIBLE,
  INDEX `fk_POLISSA_VENEDOR1_idx` (`VENEDOR_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_POLISSA_CLIENT`
    FOREIGN KEY (`CLIENT_DNI`)
    REFERENCES `MER4`.`CLIENT` (`DNI`),
  CONSTRAINT `fk_POLISSA_TIPUS_POLISSA1`
    FOREIGN KEY (`TIPUS_POLISSA_ID`)
    REFERENCES `MER4`.`TIPUS_POLISSA` (`ID`),
  CONSTRAINT `fk_POLISSA_VENEDOR1`
    FOREIGN KEY (`VENEDOR_DNI`)
    REFERENCES `MER4`.`VENEDOR` (`DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
