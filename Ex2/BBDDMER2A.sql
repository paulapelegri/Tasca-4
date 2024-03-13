-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mer2a
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mer2a
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mer2a` ;
USE `mer2a` ;

-- -----------------------------------------------------
-- Table `mer2a`.`PACIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mer2a`.`PACIENT` (
  `DNI` VARCHAR(9) NULL,
  `nom` VARCHAR(20) NOT NULL,
  `cognom` VARCHAR(50) NOT NULL,
  `telefon` INT(13) NULL,
  `dirreccio` VARCHAR(200) NULL,
  `N_SS` INT(10) NULL,
  `ID` INT(100) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mer2a`.`METGE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mer2a`.`METGE` (
  `N_colegiat` INT(10) NOT NULL,
  `nom` VARCHAR(20) NOT NULL,
  `cognom` VARCHAR(50) NOT NULL,
  `telefon` INT(10) NULL,
  `DNI` VARCHAR(9) NOT NULL,
  `especialitat` VARCHAR(100) NOT NULL,
  `carrec` VARCHAR(100) NOT NULL,
  `ID` INT(100) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mer2a`.`CONSULTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mer2a`.`CONSULTA` (
  `data_inici` DATE NOT NULL,
  `ubicacio` VARCHAR(100) NOT NULL,
  `edifici` VARCHAR(100) NOT NULL,
  `planta` VARCHAR(100) NOT NULL,
  `diagnostic` VARCHAR(100) NULL,
  `ID` INT(100) NOT NULL AUTO_INCREMENT,
  `PACIENT_ID` INT(100) NOT NULL,
  `METGE_ID` INT(100) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_CONSULTA_PACIENT_idx` (`PACIENT_ID` ASC) VISIBLE,
  INDEX `fk_CONSULTA_METGE1_idx` (`METGE_ID` ASC) VISIBLE,
  CONSTRAINT `fk_CONSULTA_PACIENT`
    FOREIGN KEY (`PACIENT_ID`)
    REFERENCES `mer2a`.`PACIENT` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONSULTA_METGE1`
    FOREIGN KEY (`METGE_ID`)
    REFERENCES `mer2a`.`METGE` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
