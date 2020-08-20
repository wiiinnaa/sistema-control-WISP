-- MySQL Script generated by MySQL Workbench
-- Tue Aug 18 21:55:03 2020
-- Model: Sakila Full    Version: 2.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema bdsistpago
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bdsistpago
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bdsistpago` ;
USE `bdsistpago` ;

-- -----------------------------------------------------
-- Table `bdsistpago`.`tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsistpago`.`tarifa` (
  `idTarifa` INT NOT NULL AUTO_INCREMENT,
  `nombreTarifa` VARCHAR(45) NOT NULL,
  `descargarTarifa` VARCHAR(45) NULL,
  `subidaTarifa` VARCHAR(45) NULL,
  `precioTarifa` DECIMAL(6,2) NULL,
  PRIMARY KEY (`idTarifa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdsistpago`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsistpago`.`usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `usuarioUsuario` VARCHAR(45) NOT NULL,
  `claveUsuario` VARCHAR(45) NOT NULL,
  `nombreUsuario` VARCHAR(45) NOT NULL,
  `apellidoUsuario` VARCHAR(45) NULL,
  `telefonoUsuario` INT(9) NULL,
  `cargoUsuario` VARCHAR(45) NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdsistpago`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsistpago`.`cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nombreCliente` VARCHAR(45) NOT NULL,
  `apellidoCliente` VARCHAR(45) NULL,
  `telefonoCliente` INT(9) NULL,
  `provinciaCliente` VARCHAR(45) NULL,
  `distritoCliente` VARCHAR(45) NULL,
  `direccionCliente` VARCHAR(45) NULL,
  `rucCliente` INT(11) NULL,
  `razonSocialCliente` VARCHAR(45) NULL,
  `fechInicPerioCliente` DATETIME NULL,
  `fechFinPerioCliente` DATETIME NULL,
  `diasPendientes` DATETIME NULL,
  `comentarioCliente` TEXT(100) NULL,
  `apCliente` VARCHAR(45) NULL,
  `tarifa_idTarifa` INT NOT NULL,
  `usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_cliente_tarifa1_idx` (`tarifa_idTarifa` ASC),
  INDEX `fk_cliente_usuario1_idx` (`usuario_idUsuario` ASC),
  CONSTRAINT `fk_cliente_tarifa1`
    FOREIGN KEY (`tarifa_idTarifa`)
    REFERENCES `bdsistpago`.`tarifa` (`idTarifa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_usuario1`
    FOREIGN KEY (`usuario_idUsuario`)
    REFERENCES `bdsistpago`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdsistpago`.`antena`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsistpago`.`antena` (
  `idAntena` INT NOT NULL AUTO_INCREMENT,
  `nombreAntena` VARCHAR(45) NOT NULL,
  `modeloAntena` VARCHAR(45) NULL,
  `modoAntena` VARCHAR(45) NULL,
  `ipAntena` VARCHAR(20) NOT NULL,
  `usuarioAntena` VARCHAR(45) NULL,
  `claveAntena` VARCHAR(45) NULL,
  `macAntena` VARCHAR(17) NULL,
  `ubicacionAntena` VARCHAR(45) NULL,
  `cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idAntena`),
  UNIQUE INDEX `idAntena_UNIQUE` (`idAntena` ASC),
  INDEX `fk_antena_cliente_idx` (`cliente_idCliente` ASC),
  CONSTRAINT `fk_antena_cliente`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `bdsistpago`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdsistpago`.`comprobante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsistpago`.`comprobante` (
  `idComprobante` INT NOT NULL AUTO_INCREMENT,
  `fechaComprobante` DATETIME NOT NULL,
  `periodoComprobante` VARCHAR(45) NULL,
  `montoComprobante` DECIMAL(6,2) NULL,
  `saldoComprobante` DECIMAL(6,2) NULL,
  `usuario_idUsuario` INT NOT NULL,
  `cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idComprobante`),
  INDEX `fk_comprobante_cliente1_idx` (`cliente_idCliente` ASC),
  CONSTRAINT `fk_comprobante_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `bdsistpago`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
