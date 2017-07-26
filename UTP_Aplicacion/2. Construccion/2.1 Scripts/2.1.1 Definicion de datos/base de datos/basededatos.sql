-- MySQL Script generated by MySQL Workbench
-- Tue Jul 25 20:41:14 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `Distritos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Distritos` ;

CREATE TABLE IF NOT EXISTS `Distritos` (
  `idDistritos` INT NOT NULL,
  `Distrito` NVARCHAR(60) NULL,
  PRIMARY KEY (`idDistritos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Clientes` ;

CREATE TABLE IF NOT EXISTS `Clientes` (
  `idCliente` INT NOT NULL,
  `Nombres` VARCHAR(45) NULL,
  `Dni` INT NULL,
  `Sexo` VARCHAR(1) NULL,
  `Direccion` NVARCHAR(60) NULL,
  `Referencia` NVARCHAR(100) NULL,
  `Celular` INT NULL,
  `Telefono` INT NULL,
  `Estado` CHAR(1) NULL,
  `Fecha_Registro` DATE NULL,
  `Distritos_idDistritos` INT NOT NULL,
  `latitud` DECIMAL(18,18) NULL,
  `longitud` DECIMAL(18,18) NULL,
  PRIMARY KEY (`idCliente`),
  CONSTRAINT `fk_Cliente_Distritos1`
    FOREIGN KEY (`Distritos_idDistritos`)
    REFERENCES `Distritos` (`idDistritos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Usuario` ;

CREATE TABLE IF NOT EXISTS `Usuario` (
  `idUsuario` INT NOT NULL,
  `CorreoElectronico` NVARCHAR(100) NULL,
  `Contraseņa` NVARCHAR(150) NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
  CONSTRAINT `fk_Usuario_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `Clientes` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TipoEmpleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TipoEmpleado` ;

CREATE TABLE IF NOT EXISTS `TipoEmpleado` (
  `idTipoEmpleado` INT NOT NULL,
  `Rol` NVARCHAR(50) NULL,
  PRIMARY KEY (`idTipoEmpleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Moto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Moto` ;

CREATE TABLE IF NOT EXISTS `Moto` (
  `idPlaca` INT NOT NULL,
  `Marca_Moto` NVARCHAR(50) NULL,
  `Soat` NVARCHAR(40) NULL,
  `Estado` CHAR(1) NULL,
  PRIMARY KEY (`idPlaca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Empleados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Empleados` ;

CREATE TABLE IF NOT EXISTS `Empleados` (
  `idEmpleados` INT NULL,
  `Nombres` NVARCHAR(60) NULL,
  `Apellidos` NVARCHAR(60) NULL,
  `Dni` INT NULL,
  `Fecha_Nacimiento` DATE NULL,
  `Direccion` NVARCHAR(100) NULL,
  `Celular` INT NULL,
  `Sexo` VARCHAR(45) NULL,
  `Fecha_Registro` DATE NULL,
  `Estado` CHAR(1) NULL,
  `Correo_Electronico` NVARCHAR(100) NULL,
  `Usuario` NVARCHAR(50) NULL,
  `Contraseņa` NVARCHAR(70) NULL,
  `TipoEmpleado_idTipoEmpleado` INT NOT NULL,
  `Moto_idPlaca` INT NOT NULL,
  PRIMARY KEY (`idEmpleados`),
  CONSTRAINT `fk_Empleados_TipoEmpleado1`
    FOREIGN KEY (`TipoEmpleado_idTipoEmpleado`)
    REFERENCES `TipoEmpleado` (`idTipoEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empleados_Moto1`
    FOREIGN KEY (`Moto_idPlaca`)
    REFERENCES `Moto` (`idPlaca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CategoriaPlato`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CategoriaPlato` ;

CREATE TABLE IF NOT EXISTS `CategoriaPlato` (
  `idCategoriaPlato` INT NOT NULL,
  `Categoria` NVARCHAR(50) NULL,
  PRIMARY KEY (`idCategoriaPlato`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Platos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Platos` ;

CREATE TABLE IF NOT EXISTS `Platos` (
  `idPlatos` INT NOT NULL,
  `Nombres` NVARCHAR(50) NULL,
  `Descripcion` NVARCHAR(150) NULL,
  `Imagen` NVARCHAR(300) NULL,
  `Precio` DECIMAL(7,2) NULL,
  `Cantidad` INT NULL,
  `Estado` CHAR(1) NULL,
  `CategoriaPlato_idCategoriaPlato` INT NOT NULL,
  PRIMARY KEY (`idPlatos`),
  CONSTRAINT `fk_Platos_CategoriaPlato1`
    FOREIGN KEY (`CategoriaPlato_idCategoriaPlato`)
    REFERENCES `CategoriaPlato` (`idCategoriaPlato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pedidos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pedidos` ;

CREATE TABLE IF NOT EXISTS `Pedidos` (
  `idPedidos` INT NULL,
  `Fecha_y_Hora_Pedido` DATE NULL,
  `Clientes_idCliente` INT NOT NULL,
  `Total` DECIMAL(7,2) NULL,
  `Estado_Administrador` TINYINT NULL,
  `Estado_Cocinero` TINYINT NULL,
  `Estado_Cajero` TINYINT NULL,
  `Empleados_idEmpleados` INT NOT NULL,
  `ComentarioCliente` NVARCHAR(200) NULL,
  `ObservacionAdministrador` NVARCHAR(200) NULL,
  PRIMARY KEY (`idPedidos`),
  CONSTRAINT `fk_Pedidos_Clientes1`
    FOREIGN KEY (`Clientes_idCliente`)
    REFERENCES `Clientes` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedidos_Empleados1`
    FOREIGN KEY (`Empleados_idEmpleados`)
    REFERENCES `Empleados` (`idEmpleados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EstadoBoleta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EstadoBoleta` ;

CREATE TABLE IF NOT EXISTS `EstadoBoleta` (
  `idEstadoPedido` INT NOT NULL,
  `Estado_Boleta` VARCHAR(45) NULL,
  PRIMARY KEY (`idEstadoPedido`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DetallePedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DetallePedido` ;

CREATE TABLE IF NOT EXISTS `DetallePedido` (
  `idDetallePedido` INT NULL,
  `Cantidad` VARCHAR(45) NULL,
  `Pedidos_idPedidos` INT NOT NULL,
  `Platos_idPlatos` INT NOT NULL,
  PRIMARY KEY (`idDetallePedido`),
  CONSTRAINT `fk_DetallePedido_Pedidos1`
    FOREIGN KEY (`Pedidos_idPedidos`)
    REFERENCES `Pedidos` (`idPedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetallePedido_Platos1`
    FOREIGN KEY (`Platos_idPlatos`)
    REFERENCES `Platos` (`idPlatos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DocumentoBoleta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DocumentoBoleta` ;

CREATE TABLE IF NOT EXISTS `DocumentoBoleta` (
  `idDocumentoBoleta` INT NOT NULL,
  `Nombre` NVARCHAR(50) NULL,
  `Dni` INT NULL,
  `Total` DECIMAL(7,2) NULL,
  `Fecha_Emision` DATE NULL,
  `Hora_Emision` VARCHAR(10) NULL,
  `Pedidos_idPedidos` INT NOT NULL,
  `EstadoBoleta_idEstadoPedido` INT NOT NULL,
  `Empleados_idEmpleados` INT NOT NULL,
  PRIMARY KEY (`idDocumentoBoleta`),
  CONSTRAINT `fk_DocumentoBoleta_Pedidos1`
    FOREIGN KEY (`Pedidos_idPedidos`)
    REFERENCES `Pedidos` (`idPedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DocumentoBoleta_EstadoBoleta1`
    FOREIGN KEY (`EstadoBoleta_idEstadoPedido`)
    REFERENCES `EstadoBoleta` (`idEstadoPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DocumentoBoleta_Empleados1`
    FOREIGN KEY (`Empleados_idEmpleados`)
    REFERENCES `Empleados` (`idEmpleados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DetalleDocumentoBoleta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DetalleDocumentoBoleta` ;

CREATE TABLE IF NOT EXISTS `DetalleDocumentoBoleta` (
  `idDetalleDocumentoBoleta` INT NULL,
  `Producto` NVARCHAR(50) NULL,
  `Cantidad` INT NULL,
  `Precio` DECIMAL(7,2) NULL,
  `DocumentoBoleta_idDocumentoBoleta` INT NOT NULL,
  PRIMARY KEY (`idDetalleDocumentoBoleta`),
  CONSTRAINT `fk_DetalleDocumentoBoleta_DocumentoBoleta1`
    FOREIGN KEY (`DocumentoBoleta_idDocumentoBoleta`)
    REFERENCES `DocumentoBoleta` (`idDocumentoBoleta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
