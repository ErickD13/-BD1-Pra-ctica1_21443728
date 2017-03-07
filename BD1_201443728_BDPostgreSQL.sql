SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `BD1Practica1` ;
CREATE SCHEMA IF NOT EXISTS `BD1Practica1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `BD1Practica1` ;

-- -----------------------------------------------------
-- Table `BD1Practica1`.`AEROLINEA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD1Practica1`.`AEROLINEA` (
  `id_aerolinea` INT NOT NULL,
  `aerolinea` VARCHAR(256) NOT NULL,
  PRIMARY KEY (`id_aerolinea`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD1Practica1`.`ESTADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD1Practica1`.`ESTADO` (
  `id_estado` INT NOT NULL,
  `ciudad` VARCHAR(256) NOT NULL,
  `abrev` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`id_estado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD1Practica1`.`CIUDAD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD1Practica1`.`CIUDAD` (
  `id_ciudad` INT NOT NULL,
  `ciudad` VARCHAR(256) NOT NULL,
  `abrev` VARCHAR(3) NOT NULL,
  `ESTADO_id_estado` INT NOT NULL,
  PRIMARY KEY (`id_ciudad`),
  CONSTRAINT `fk_CIUDAD_ESTADO1`
    FOREIGN KEY (`ESTADO_id_estado`)
    REFERENCES `BD1Practica1`.`ESTADO` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_CIUDAD_ESTADO1_idx` ON `BD1Practica1`.`CIUDAD` (`ESTADO_id_estado` ASC);


-- -----------------------------------------------------
-- Table `BD1Practica1`.`AEROPUERTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD1Practica1`.`AEROPUERTO` (
  `id_aeropuerto` INT NOT NULL,
  `aeropuerto` VARCHAR(256) NOT NULL,
  `CIUDAD_id_ciudad` INT NOT NULL,
  PRIMARY KEY (`id_aeropuerto`),
  CONSTRAINT `fk_AEROPUERTO_CIUDAD1`
    FOREIGN KEY (`CIUDAD_id_ciudad`)
    REFERENCES `BD1Practica1`.`CIUDAD` (`id_ciudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_AEROPUERTO_CIUDAD1_idx` ON `BD1Practica1`.`AEROPUERTO` (`CIUDAD_id_ciudad` ASC);


-- -----------------------------------------------------
-- Table `BD1Practica1`.`VUELO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD1Practica1`.`VUELO` (
  `id_vuelo` INT NOT NULL AUTO_INCREMENT,
  `pasajeros` INT NOT NULL,
  `carga` INT NOT NULL,
  `correo` INT NOT NULL,
  `distancia_recorrida` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `AEROLINEA_id_aerolinea` INT NOT NULL,
  `AEROPUERTO_id_aeropuerto` INT NOT NULL,
  `CIUDAD_id_ciudad` INT NOT NULL,
  `CIUDAD_id_ciudad1` INT NOT NULL,
  PRIMARY KEY (`id_vuelo`),
  CONSTRAINT `fk_VUELO_AEROLINEA`
    FOREIGN KEY (`AEROLINEA_id_aerolinea`)
    REFERENCES `BD1Practica1`.`AEROLINEA` (`id_aerolinea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VUELO_AEROPUERTO1`
    FOREIGN KEY (`AEROPUERTO_id_aeropuerto`)
    REFERENCES `BD1Practica1`.`AEROPUERTO` (`id_aeropuerto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VUELO_CIUDAD1`
    FOREIGN KEY (`CIUDAD_id_ciudad`)
    REFERENCES `BD1Practica1`.`CIUDAD` (`id_ciudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VUELO_CIUDAD2`
    FOREIGN KEY (`CIUDAD_id_ciudad1`)
    REFERENCES `BD1Practica1`.`CIUDAD` (`id_ciudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_VUELO_AEROLINEA_idx` ON `BD1Practica1`.`VUELO` (`AEROLINEA_id_aerolinea` ASC);

CREATE INDEX `fk_VUELO_AEROPUERTO1_idx` ON `BD1Practica1`.`VUELO` (`AEROPUERTO_id_aeropuerto` ASC);

CREATE INDEX `fk_VUELO_CIUDAD1_idx` ON `BD1Practica1`.`VUELO` (`CIUDAD_id_ciudad` ASC);

CREATE INDEX `fk_VUELO_CIUDAD2_idx` ON `BD1Practica1`.`VUELO` (`CIUDAD_id_ciudad1` ASC);


-- -----------------------------------------------------
-- Table `BD1Practica1`.`TEMPORAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD1Practica1`.`TEMPORAL` (
  `pasajeros` INT NULL,
  `carga` INT NULL,
  `correo` INT NULL,
  `distancia_recorrida` INT NULL,
  `id_aerolinea` INT NULL,
  `aerolinea` VARCHAR(256) NULL,
  `id_aeropuerto_origen` INT NULL,
  `aeropuerto_origen` VARCHAR(256) NULL,
  `id_ciudad_origen` INT NULL,
  `abrev_ciudad_origen` VARCHAR(3) NULL,
  `ciudad_origen` VARCHAR(256) NULL,
  `abrev_estado_origen` VARCHAR(2) NULL,
  `id_estado_origen` INT NULL,
  `estado_origen` VARCHAR(256) NULL,
  `id_aeropuerto_destino` INT NULL,
  `aeropuerto` VARCHAR(256) NULL,
  `id_ciudad_destino` INT NULL,
  `abrev_ciudad_destino` VARCHAR(3) NULL,
  `ciudad_destino` VARCHAR(256) NULL,
  `abrev_estado_destino` VARCHAR(2) NULL,
  `id_estado_destino` INT NULL,
  `estado_destino` VARCHAR(256) NULL,
  `fecha` DATE NULL)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
