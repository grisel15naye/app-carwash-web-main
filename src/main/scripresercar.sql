-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema resercarbd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema resercarbd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `resercarbd` DEFAULT CHARACTER SET utf8mb3 ;
USE `resercarbd` ;

-- -----------------------------------------------------
-- Table `resercarbd`.`acciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resercarbd`.`acciones` (
  `accionesID` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(100) NOT NULL,
  `precio` DECIMAL(10,2) NOT NULL,
  `estadoacc` BIT(1) NOT NULL,
  PRIMARY KEY (`accionesID`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `resercarbd`.`tipo_servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resercarbd`.`tipo_servicio` (
  `tiposervicioID` INT NOT NULL AUTO_INCREMENT,
  `descripciontps` VARCHAR(100) NOT NULL,
  `tipovehiculo` VARCHAR(45) NOT NULL,
  `estadotps` BIT(1) NOT NULL,
  PRIMARY KEY (`tiposervicioID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `resercarbd`.`catalogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resercarbd`.`catalogo` (
  `catalogoID` INT NOT NULL AUTO_INCREMENT,
  `tiposervicioID` INT NULL DEFAULT NULL,
  `foto` BINARY(1) NULL DEFAULT NULL,
  `estadocat` BIT(1) NOT NULL,
  PRIMARY KEY (`catalogoID`),
  INDEX `fk_catalogo_tipo_servicio1_idx` (`tiposervicioID` ASC) VISIBLE,
  CONSTRAINT `fk_catalogo_tipo_servicio1`
    FOREIGN KEY (`tiposervicioID`)
    REFERENCES `resercarbd`.`tipo_servicio` (`tiposervicioID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `resercarbd`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resercarbd`.`cliente` (
  `clienteID` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `apellido` VARCHAR(100) NULL DEFAULT NULL,
  `tipodocumento` BIT(1) NULL DEFAULT NULL,
  `numerodocumento` INT NULL DEFAULT NULL,
  `telefono` INT NULL DEFAULT NULL,
  `direccion` VARCHAR(200) NULL DEFAULT NULL,
  `foto` BINARY(1) NULL DEFAULT NULL,
  `estadocliente` BIT(1) NOT NULL,
  PRIMARY KEY (`clienteID`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `resercarbd`.`detalle_tipo_servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resercarbd`.`detalle_tipo_servicio` (
  `tiposervicioID` INT NOT NULL,
  `accionesID` INT NOT NULL,
  INDEX `fk_acciones_has_tipo_servicio_tipo_servicio1_idx` (`tiposervicioID` ASC) VISIBLE,
  INDEX `fk_acciones_has_tipo_servicio_acciones1_idx` (`accionesID` ASC) VISIBLE,
  CONSTRAINT `fk_acciones_has_tipo_servicio_acciones1`
    FOREIGN KEY (`accionesID`)
    REFERENCES `resercarbd`.`acciones` (`accionesID`),
  CONSTRAINT `fk_acciones_has_tipo_servicio_tipo_servicio1`
    FOREIGN KEY (`tiposervicioID`)
    REFERENCES `resercarbd`.`tipo_servicio` (`tiposervicioID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `resercarbd`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resercarbd`.`marca` (
  `marcaID` INT NOT NULL AUTO_INCREMENT,
  `marcainfo` VARCHAR(45) NOT NULL,
  `tipodevehiculo` VARCHAR(45) NULL,
  PRIMARY KEY (`marcaID`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `resercarbd`.`modelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resercarbd`.`modelo` (
  `modeloID` INT NOT NULL AUTO_INCREMENT,
  `modeloinfo` VARCHAR(45) NOT NULL,
  `marcaID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`modeloID`),
  INDEX `fk_modelo_marca1_idx` (`marcaID` ASC) VISIBLE,
  CONSTRAINT `fk_modelo_marca1`
    FOREIGN KEY (`marcaID`)
    REFERENCES `resercarbd`.`marca` (`marcaID`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `resercarbd`.`sede`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resercarbd`.`sede` (
  `sedeID` INT NOT NULL AUTO_INCREMENT,
  `nombresede` VARCHAR(100) NOT NULL,
  `sedeinfo` VARCHAR(100) NULL DEFAULT NULL,
  `dia` VARCHAR(100) NULL DEFAULT NULL,
  `horaabierto` TIME NULL DEFAULT NULL,
  `horacierre` TIME NULL DEFAULT NULL,
  `estadosede` BIT(1) NOT NULL,
  PRIMARY KEY (`sedeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `resercarbd`.`programacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resercarbd`.`programacion` (
  `programacionID` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL DEFAULT NULL,
  `horaprogramada` VARCHAR(45) NULL DEFAULT NULL,
  `sedeID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`programacionID`),
  INDEX `fk_programacion_sede1_idx` (`sedeID` ASC) VISIBLE,
  CONSTRAINT `fk_programacion_sede1`
    FOREIGN KEY (`sedeID`)
    REFERENCES `resercarbd`.`sede` (`sedeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `resercarbd`.`vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resercarbd`.`vehiculo` (
  `vehiculoID` INT NOT NULL AUTO_INCREMENT,
  `placa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`vehiculoID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `resercarbd`.`reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resercarbd`.`reserva` (
  `reservaID` INT NOT NULL AUTO_INCREMENT,
  `clienteID` INT NOT NULL,
  `catalogoID` INT NOT NULL,
  `programacionID` INT NOT NULL,
  `vehiculoID` INT NOT NULL,
  PRIMARY KEY (`reservaID`),
  INDEX `fk_reserva_vehiculo1_idx` (`vehiculoID` ASC) VISIBLE,
  INDEX `fk_reserva_cliente1_idx` (`clienteID` ASC) VISIBLE,
  INDEX `fk_reserva_programacion1_idx` (`programacionID` ASC) VISIBLE,
  INDEX `fk_reserva_catalogo1_idx` (`catalogoID` ASC) VISIBLE,
  CONSTRAINT `fk_reserva_catalogo1`
    FOREIGN KEY (`catalogoID`)
    REFERENCES `resercarbd`.`catalogo` (`catalogoID`),
  CONSTRAINT `fk_reserva_cliente1`
    FOREIGN KEY (`clienteID`)
    REFERENCES `resercarbd`.`cliente` (`clienteID`),
  CONSTRAINT `fk_reserva_programacion1`
    FOREIGN KEY (`programacionID`)
    REFERENCES `resercarbd`.`programacion` (`programacionID`),
  CONSTRAINT `fk_reserva_vehiculo1`
    FOREIGN KEY (`vehiculoID`)
    REFERENCES `resercarbd`.`vehiculo` (`vehiculoID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `resercarbd`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resercarbd`.`rol` (
  `idrol` INT NOT NULL AUTO_INCREMENT,
  `nomrol` VARCHAR(300) NULL DEFAULT NULL,
  PRIMARY KEY (`idrol`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `resercarbd`.`servicio_realizado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resercarbd`.`servicio_realizado` (
  `serviciorealizadoID` INT NOT NULL AUTO_INCREMENT,
  `calificacion` INT NULL DEFAULT NULL,
  `comentario` VARCHAR(500) NULL DEFAULT NULL,
  `reservaID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`serviciorealizadoID`),
  INDEX `fk_servicio_realizado_reserva1_idx` (`reservaID` ASC) VISIBLE,
  CONSTRAINT `fk_servicio_realizado_reserva1`
    FOREIGN KEY (`reservaID`)
    REFERENCES `resercarbd`.`reserva` (`reservaID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `resercarbd`.`trabajador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resercarbd`.`trabajador` (
  `trabajadorID` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL DEFAULT NULL,
  `apellido` VARCHAR(100) NULL DEFAULT NULL,
  `tipodocumento` BIT(1) NULL DEFAULT NULL,
  `numerodocumento` INT NULL DEFAULT NULL,
  `sedeID` INT NULL DEFAULT NULL,
  `telefono` INT NULL DEFAULT NULL,
  `direccion` VARCHAR(200) NULL DEFAULT NULL,
  `salario` DECIMAL(10,2) NULL DEFAULT NULL,
  `fechacontratacion` DATE NULL DEFAULT NULL,
  `foto` BINARY(1) NULL DEFAULT NULL,
  `estadotrab` BIT(1) NOT NULL,
  PRIMARY KEY (`trabajadorID`),
  INDEX `fk_trabajador_sede1_idx` (`sedeID` ASC) VISIBLE,
  CONSTRAINT `fk_trabajador_sede1`
    FOREIGN KEY (`sedeID`)
    REFERENCES `resercarbd`.`sede` (`sedeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `resercarbd`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resercarbd`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `nomusuario` VARCHAR(100) NULL DEFAULT NULL,
  `email` VARCHAR(200) NULL DEFAULT NULL,
  `password` VARCHAR(300) NULL DEFAULT NULL,
  `nombres` VARCHAR(100) NULL DEFAULT NULL,
  `apellidos` VARCHAR(100) NULL DEFAULT NULL,
  `activo` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `resercarbd`.`usuario_rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resercarbd`.`usuario_rol` (
  `idusuario` INT NOT NULL,
  `idrol` INT NOT NULL,
  PRIMARY KEY (`idusuario`, `idrol`),
  INDEX `fk_usuario_has_rol_rol1_idx` (`idrol` ASC) VISIBLE,
  INDEX `fk_usuario_has_rol_usuario1_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_has_rol_rol1`
    FOREIGN KEY (`idrol`)
    REFERENCES `resercarbd`.`rol` (`idrol`),
  CONSTRAINT `fk_usuario_has_rol_usuario1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `resercarbd`.`usuario` (`idusuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
