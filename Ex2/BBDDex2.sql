-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mer2a
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mer2a
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mer2a` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mer2a` ;

-- -----------------------------------------------------
-- Table `mer2a`.`METGE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mer2a`.`METGE` (
  `N_colegiat` INT NOT NULL,
  `nom` VARCHAR(20) NOT NULL,
  `cognom` VARCHAR(50) NOT NULL,
  `telefon` INT NULL DEFAULT NULL,
  `DNI` VARCHAR(9) NOT NULL,
  `especialitat` VARCHAR(100) NOT NULL,
  `carrec` VARCHAR(100) NOT NULL,
  `ID` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mer2a`.`PACIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mer2a`.`PACIENT` (
  `DNI` VARCHAR(9) NULL DEFAULT NULL,
  `nom` VARCHAR(20) NOT NULL,
  `cognom` VARCHAR(50) NOT NULL,
  `telefon` INT NULL DEFAULT NULL,
  `dirreccio` VARCHAR(200) NULL DEFAULT NULL,
  `N_SS` INT NULL DEFAULT NULL,
  `ID` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mer2a`.`CONSULTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mer2a`.`CONSULTA` (
  `data_inici` DATE NOT NULL,
  `ubicacio` VARCHAR(100) NOT NULL,
  `edifici` VARCHAR(100) NOT NULL,
  `planta` VARCHAR(100) NOT NULL,
  `diagnostic` VARCHAR(100) NULL DEFAULT NULL,
  `ID` INT NOT NULL AUTO_INCREMENT,
  `PACIENT_ID` INT NOT NULL,
  `METGE_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_CONSULTA_PACIENT_idx` (`PACIENT_ID` ASC) VISIBLE,
  INDEX `fk_CONSULTA_METGE1_idx` (`METGE_ID` ASC) VISIBLE,
  CONSTRAINT `fk_CONSULTA_METGE1`
    FOREIGN KEY (`METGE_ID`)
    REFERENCES `mer2a`.`METGE` (`ID`),
  CONSTRAINT `fk_CONSULTA_PACIENT`
    FOREIGN KEY (`PACIENT_ID`)
    REFERENCES `mer2a`.`PACIENT` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
