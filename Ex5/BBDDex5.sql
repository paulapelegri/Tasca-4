-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER5` ;
USE `MER5` ;

-- -----------------------------------------------------
-- Table `MER5`.`TIPUS_VEHICLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`TIPUS_VEHICLE` (
  `ID` INT NOT NULL,
  `nom` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`VEHICLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`VEHICLE` (
  `num_bastidor` VARCHAR(20) NOT NULL,
  `matricula` VARCHAR(10) NOT NULL,
  `model_vehicle` VARCHAR(45) NOT NULL,
  `marca_fabricant` INT NOT NULL,
  `TIPUS_VEHICLE_ID` INT NOT NULL,
  PRIMARY KEY (`num_bastidor`),
  INDEX `fk_VEHICLE_TIPUS_VEHICLE1_idx` (`TIPUS_VEHICLE_ID` ASC) VISIBLE,
  CONSTRAINT `fk_VEHICLE_TIPUS_VEHICLE1`
    FOREIGN KEY (`TIPUS_VEHICLE_ID`)
    REFERENCES `MER5`.`TIPUS_VEHICLE` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`CLIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`CLIENT` (
  `DNI` VARCHAR(9) NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `cognom` VARCHAR(45) NOT NULL,
  `direccio` VARCHAR(45) NOT NULL,
  `municipi` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `user` VARCHAR(45) NOT NULL,
  `pwd` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`CLIENT_VEHICLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`CLIENT_VEHICLE` (
  `any_compra` INT NOT NULL,
  `any_venta` VARCHAR(45) NOT NULL,
  `data_darrera_revisio` VARCHAR(45) NOT NULL,
  `CLIENT_DNI` VARCHAR(9) NOT NULL,
  `VEHICLE_num_bastidor` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`any_compra`),
  INDEX `fk_CLIENT_VEHICLE_CLIENT_idx` (`CLIENT_DNI` ASC) VISIBLE,
  INDEX `fk_CLIENT_VEHICLE_VEHICLE1_idx` (`VEHICLE_num_bastidor` ASC) VISIBLE,
  CONSTRAINT `fk_CLIENT_VEHICLE_CLIENT`
    FOREIGN KEY (`CLIENT_DNI`)
    REFERENCES `MER5`.`CLIENT` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CLIENT_VEHICLE_VEHICLE1`
    FOREIGN KEY (`VEHICLE_num_bastidor`)
    REFERENCES `MER5`.`VEHICLE` (`num_bastidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`CITA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`CITA` (
  `ID` INT NOT NULL,
  `data` DATE NOT NULL,
  `lloc` VARCHAR(100) NOT NULL,
  `CLIENT_VEHICLE_any_compra` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_CITA_CLIENT_VEHICLE1_idx` (`CLIENT_VEHICLE_any_compra` ASC) VISIBLE,
  CONSTRAINT `fk_CITA_CLIENT_VEHICLE1`
    FOREIGN KEY (`CLIENT_VEHICLE_any_compra`)
    REFERENCES `MER5`.`CLIENT_VEHICLE` (`any_compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
