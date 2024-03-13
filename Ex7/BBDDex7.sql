-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER7` ;
USE `MER7` ;

-- -----------------------------------------------------
-- Table `MER7`.`EMPLEAT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`EMPLEAT` (
  `ID` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `nom` VARCHAR(45) NULL,
  `cognom` VARCHAR(45) NULL,
  `direccio` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER7`.`CLIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`CLIENT` (
  `ID` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `nom` VARCHAR(45) NULL,
  `cognom` VARCHAR(45) NULL,
  `direccio` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER7`.`TICKET`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`TICKET` (
  `num` INT NOT NULL,
  `num_factura` VARCHAR(45) NOT NULL,
  `nom_empresa` VARCHAR(45) NULL,
  `NIF` VARCHAR(45) NULL,
  `domicili_fiscal` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `web` VARCHAR(45) NULL,
  `correu` VARCHAR(45) NULL,
  `data` DATE NULL,
  `forma_pagament` VARCHAR(45) NULL,
  `EMPLEAT_ID` INT NOT NULL,
  `CLIENT_ID` INT NOT NULL,
  PRIMARY KEY (`num`, `num_factura`),
  INDEX `fk_TICKET_EMPLEAT_idx` (`EMPLEAT_ID` ASC) VISIBLE,
  INDEX `fk_TICKET_CLIENT1_idx` (`CLIENT_ID` ASC) VISIBLE,
  CONSTRAINT `fk_TICKET_EMPLEAT`
    FOREIGN KEY (`EMPLEAT_ID`)
    REFERENCES `MER7`.`EMPLEAT` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TICKET_CLIENT1`
    FOREIGN KEY (`CLIENT_ID`)
    REFERENCES `MER7`.`CLIENT` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER7`.`PRODUCTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`PRODUCTE` (
  `ID` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `descripcio` VARCHAR(45) NULL,
  `IVA` VARCHAR(45) NULL,
  `preu_unitari` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER7`.`LINIA_TICKET`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`LINIA_TICKET` (
  `ID` INT NOT NULL,
  `quantitat` INT NULL,
  `descompte` VARCHAR(45) NULL,
  `TICKET_num` INT NOT NULL,
  `TICKET_num_factura` VARCHAR(45) NOT NULL,
  `PRODUCTE_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_LINIA_TICKET_TICKET1_idx` (`TICKET_num` ASC, `TICKET_num_factura` ASC) VISIBLE,
  INDEX `fk_LINIA_TICKET_PRODUCTE1_idx` (`PRODUCTE_ID` ASC) VISIBLE,
  CONSTRAINT `fk_LINIA_TICKET_TICKET1`
    FOREIGN KEY (`TICKET_num` , `TICKET_num_factura`)
    REFERENCES `MER7`.`TICKET` (`num` , `num_factura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LINIA_TICKET_PRODUCTE1`
    FOREIGN KEY (`PRODUCTE_ID`)
    REFERENCES `MER7`.`PRODUCTE` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
