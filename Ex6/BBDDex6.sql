-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER6` ;
USE `MER6` ;

-- -----------------------------------------------------
-- Table `MER6`.`AVIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`AVIO` (
  `ID` INT NOT NULL,
  `marca` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `capacitat` VARCHAR(45) NULL,
  `autonomia` VARCHAR(45) NULL,
  `data_fabricacio` DATE NULL,
  `data_mort` DATE NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER6`.`VOL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`VOL` (
  `ID` INT NOT NULL,
  `num_vol` VARCHAR(45) NULL,
  `origen` VARCHAR(45) NULL,
  `desti` VARCHAR(45) NULL,
  `data_sortida` DATE NULL,
  `hora_sortida` VARCHAR(45) NULL,
  `hora_arribada` VARCHAR(45) NULL,
  `AVIO_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_VOL_AVIO_idx` (`AVIO_ID` ASC) VISIBLE,
  CONSTRAINT `fk_VOL_AVIO`
    FOREIGN KEY (`AVIO_ID`)
    REFERENCES `MER6`.`AVIO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER6`.`PASSATGER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`PASSATGER` (
  `ID` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `nom` VARCHAR(45) NULL,
  `cognom` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `direccio` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER6`.`RESERVA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`RESERVA` (
  `ID` INT NOT NULL,
  `data` DATE NULL,
  `import` VARCHAR(45) NULL,
  `num_asiento` VARCHAR(45) NULL,
  `necesitats_especials` VARCHAR(50) NULL,
  `VOL_ID` INT NOT NULL,
  `PASSATGER_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_RESERVA_VOL1_idx` (`VOL_ID` ASC) VISIBLE,
  INDEX `fk_RESERVA_PASSATGER1_idx` (`PASSATGER_ID` ASC) VISIBLE,
  CONSTRAINT `fk_RESERVA_VOL1`
    FOREIGN KEY (`VOL_ID`)
    REFERENCES `MER6`.`VOL` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RESERVA_PASSATGER1`
    FOREIGN KEY (`PASSATGER_ID`)
    REFERENCES `MER6`.`PASSATGER` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
