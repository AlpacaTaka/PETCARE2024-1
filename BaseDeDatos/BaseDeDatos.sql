-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BaseDeDatosTele
-- -----------------------------------------------------
DROP DATABASE if  exists `BaseDeDatosTele`;
-- -----------------------------------------------------
-- Schema BaseDeDatosTele
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BaseDeDatosTele` DEFAULT CHARACTER SET utf8mb3 ;
USE `BaseDeDatosTele` ;

-- -----------------------------------------------------
-- Table `BaseDeDatosTele`.`administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostele`.`administrador` (
  `administradorID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombreUsuario` VARCHAR(100) NOT NULL,
  `contrasenia` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`administradorID`),
  UNIQUE INDEX `NombreUsuario_UNIQUE` (`nombreUsuario` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `basededatostele`.`zona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostele`.`zona` (
  `zonaID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombreZona` ENUM('Norte', 'Sur', 'Este', 'Oeste') NOT NULL,
  PRIMARY KEY (`zonaID`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `basededatostele`.`distrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostele`.`distrito` (
  `distritoID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombreDistrito` VARCHAR(45) NOT NULL,
  `zonaID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`distritoID`),
  INDEX `fk_Distrito_Zona1_idx` (`zonaID` ASC) VISIBLE,
  CONSTRAINT `fk_Distrito_Zona1`
    FOREIGN KEY (`zonaID`)
    REFERENCES `basededatostele`.`zona` (`zonaID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `basededatostele`.`fotos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostele`.`fotos` (
  `fotoID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `rutaFoto` VARCHAR(700) NOT NULL,
  `ubicacion` ENUM('PerfilUsuario', 'PerfilAlbergue', 'SolicitudTemporal', 'SolicitudMascota', 'PerfilCoordinador', 'Eventos', 'Donaciones', 'Denuncia', 'MascotaTemporal', 'LugarEvento') NULL DEFAULT NULL,
  PRIMARY KEY (`fotoID`),
  UNIQUE INDEX `RutaFoto_UNIQUE` (`rutaFoto` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 52
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `basededatostele`.`albergue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostele`.`albergue` (
  `albergueID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombreAlbergue` VARCHAR(80) NOT NULL,
  `nombreEncargado` VARCHAR(50) NOT NULL,
  `apellidoEncargado` VARCHAR(70) NOT NULL,
  `espaciosDisponibles` INT NOT NULL,
  `anioCreacion` YEAR NOT NULL,
  `correoElectronico` VARCHAR(150) NOT NULL,
  `contrasenia` VARCHAR(255) NOT NULL,
  `cantidadAnimales` INT UNSIGNED NOT NULL,
  `urlFacebook` VARCHAR(255) NOT NULL,
  `urlInstagram` VARCHAR(255) NOT NULL,
  `direccion` TEXT NOT NULL,
  `distritoID` INT UNSIGNED NOT NULL,
  `puntoAcopioDonaciones` TEXT NOT NULL,
  `direccionDonaciones` TEXT NOT NULL,
  `nombreContactoDonaciones` VARCHAR(80) NOT NULL,
  `numeroContactoDonaciones` CHAR(9) NOT NULL,
  `numeroYape` CHAR(9) NOT NULL,
  `numeroPlin` CHAR(9) NOT NULL,
  `codigoQR` VARCHAR(255) NOT NULL,
  `estado` ENUM('Aprobado', 'Desaprobado') NOT NULL,
  `Fotos_fotoID` INT UNSIGNED NOT NULL,
  `mensaje` VARCHAR(200) NOT NULL,
  `flag` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`albergueID`),
  UNIQUE INDEX `CorreoElectrónico_UNIQUE` (`correoElectronico` ASC) VISIBLE,
  UNIQUE INDEX `CódigoQR_UNIQUE` (`codigoQR` ASC) VISIBLE,
  UNIQUE INDEX `NúmeroPlin_UNIQUE` (`numeroPlin` ASC) VISIBLE,
  UNIQUE INDEX `NúmeroYape_UNIQUE` (`numeroYape` ASC) VISIBLE,
  UNIQUE INDEX `URL_Facebook_UNIQUE` (`urlFacebook` ASC) VISIBLE,
  UNIQUE INDEX `URLInstagram_UNIQUE` (`urlInstagram` ASC) VISIBLE,
  INDEX `fk_Albergue_Distrito1_idx` (`distritoID` ASC) VISIBLE,
  INDEX `fk_Albergue_Fotos1_idx` (`Fotos_fotoID` ASC) VISIBLE,
  CONSTRAINT `fk_Albergue_Distrito1`
    FOREIGN KEY (`distritoID`)
    REFERENCES `basededatostele`.`distrito` (`distritoID`),
  CONSTRAINT `fk_Albergue_Fotos1`
    FOREIGN KEY (`Fotos_fotoID`)
    REFERENCES `basededatostele`.`fotos` (`fotoID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `basededatostele`.`coordinadorzona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostele`.`coordinadorzona` (
  `coordinadorID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido` VARCHAR(70) NOT NULL,
  `dni` INT UNSIGNED NOT NULL,
  `contrasenia` VARCHAR(300) NOT NULL,
  `correoElectronico` VARCHAR(150) NOT NULL,
  `celular` VARCHAR(9) NOT NULL,
  `fechaNacimiento` DATE NOT NULL,
  `Fotos_fotoID` INT UNSIGNED NOT NULL,
  `estado` ENUM('Activo', 'Inactivo') NOT NULL,
  `Zona_zonaID` INT UNSIGNED NOT NULL,
  `flag` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`coordinadorID`),
  UNIQUE INDEX `DNI_UNIQUE` (`dni` ASC) VISIBLE,
  UNIQUE INDEX `CorreoElectrónico_UNIQUE` (`correoElectronico` ASC) VISIBLE,
  UNIQUE INDEX `Teléfono_UNIQUE` (`celular` ASC) VISIBLE,
  INDEX `fk_CoordinadorZona_Fotos1_idx` (`Fotos_fotoID` ASC) VISIBLE,
  INDEX `fk_CoordinadorZona_Zona1_idx` (`Zona_zonaID` ASC) VISIBLE,
  CONSTRAINT `fk_CoordinadorZona_Fotos1`
    FOREIGN KEY (`Fotos_fotoID`)
    REFERENCES `basededatostele`.`fotos` (`fotoID`),
  CONSTRAINT `fk_CoordinadorZona_Zona1`
    FOREIGN KEY (`Zona_zonaID`)
    REFERENCES `basededatostele`.`zona` (`zonaID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `basededatostele`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostele`.`usuario` (
  `usuarioID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido` VARCHAR(70) NOT NULL,
  `dni` VARCHAR(8) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `correoElectronico` VARCHAR(150) NOT NULL,
  `contrasenia` VARCHAR(255) NOT NULL,
  `estado` ENUM('Activo', 'Baneado') NOT NULL,
  `distritoID` INT UNSIGNED NOT NULL,
  `Fotos_fotoID` INT UNSIGNED NOT NULL,
  `flag` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`usuarioID`),
  UNIQUE INDEX `DNI_UNIQUE` (`dni` ASC) VISIBLE,
  UNIQUE INDEX `Correo_Electrónico_UNIQUE` (`correoElectronico` ASC) VISIBLE,
  INDEX `fk_Usuario_Distrito_idx` (`distritoID` ASC) VISIBLE,
  INDEX `fk_Usuario_Fotos1_idx` (`Fotos_fotoID` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_Distrito`
    FOREIGN KEY (`distritoID`)
    REFERENCES `basededatostele`.`distrito` (`distritoID`),
  CONSTRAINT `fk_Usuario_Fotos1`
    FOREIGN KEY (`Fotos_fotoID`)
    REFERENCES `basededatostele`.`fotos` (`fotoID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `basededatostele`.`publicacionmascotaperdida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostele`.`publicacionmascotaperdida` (
  `PublicacionID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `usuarioID` INT UNSIGNED NOT NULL,
  `descripcion` TEXT NULL DEFAULT NULL,
  `nombreContacto` VARCHAR(50) NOT NULL,
  `edad` INT UNSIGNED NOT NULL,
  `raza` VARCHAR(30) NOT NULL,
  `tamanio` ENUM('Pequeño', 'Mediano', 'Grande') NOT NULL,
  `distintivo` VARCHAR(30) NULL DEFAULT NULL,
  `descripcionAdicional` TEXT NULL DEFAULT NULL,
  `lugarPerdida` TEXT NOT NULL,
  `horaPerdida` TIME NOT NULL,
  `telefonoContacto` CHAR(9) NOT NULL,
  `recompensa` INT UNSIGNED NULL DEFAULT NULL,
  `estado` ENUM('Pendiente', 'Aceptado', 'Rechazado') NOT NULL,
  `Fotos_fotoID` INT UNSIGNED NOT NULL,
  `fechaPerdida` VARCHAR(45) NOT NULL,
  `especie` VARCHAR(45) NOT NULL,
  `fecha` DATE NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `estadoMascota` ENUM('Encontrado', 'Perdido') NULL DEFAULT NULL,
  `comentario` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`PublicacionID`),
  UNIQUE INDEX `Teléfono_UNIQUE` (`telefonoContacto` ASC) VISIBLE,
  INDEX `fk_PublicacionMascotaPerdida_Usuario1_idx` (`usuarioID` ASC) VISIBLE,
  INDEX `fk_PublicacionMascotaPerdida_Fotos1_idx` (`Fotos_fotoID` ASC) VISIBLE,
  CONSTRAINT `fk_PublicacionMascotaPerdida_Fotos1`
    FOREIGN KEY (`Fotos_fotoID`)
    REFERENCES `basededatostele`.`fotos` (`fotoID`),
  CONSTRAINT `fk_PublicacionMascotaPerdida_Usuario1`
    FOREIGN KEY (`usuarioID`)
    REFERENCES `basededatostele`.`usuario` (`usuarioID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `basededatostele`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostele`.`comentarios` (
  `idComentarios` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `comentarios` VARCHAR(100) NOT NULL,
  `CoordinadorZona_coordinadorID` INT UNSIGNED NOT NULL,
  `PublicacionMascotaPerdida_PublicacionID` INT UNSIGNED NOT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`idComentarios`),
  INDEX `fk_Comentarios_CoordinadorZona1_idx` (`CoordinadorZona_coordinadorID` ASC) VISIBLE,
  INDEX `fk_Comentarios_PublicacionMascotaPerdida1_idx` (`PublicacionMascotaPerdida_PublicacionID` ASC) VISIBLE,
  CONSTRAINT `fk_Comentarios_CoordinadorZona1`
    FOREIGN KEY (`CoordinadorZona_coordinadorID`)
    REFERENCES `basededatostele`.`coordinadorzona` (`coordinadorID`),
  CONSTRAINT `fk_Comentarios_PublicacionMascotaPerdida1`
    FOREIGN KEY (`PublicacionMascotaPerdida_PublicacionID`)
    REFERENCES `basededatostele`.`publicacionmascotaperdida` (`PublicacionID`))
ENGINE = InnoDB
AUTO_INCREMENT = 51
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `basededatostele`.`denunciamaltrato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostele`.`denunciamaltrato` (
  `denunciaID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `usuarioID` INT UNSIGNED NOT NULL,
  `tamanio` ENUM('Pequenio', 'Mediano', 'Grande') NOT NULL,
  `raza` VARCHAR(45) NOT NULL,
  `tipoMaltrato` VARCHAR(50) NOT NULL,
  `nombreApellidoMaltratador` VARCHAR(50) NULL DEFAULT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `realizoDenuncia` TINYINT NOT NULL,
  `especie` VARCHAR(45) NOT NULL,
  `fecha` DATE NOT NULL,
  `fotos_fotoID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`denunciaID`),
  INDEX `fk_DenunciaMaltrato_Usuario1_idx` (`usuarioID` ASC) VISIBLE,
  INDEX `fk_denunciamaltrato_fotos1_idx` (`fotos_fotoID` ASC) VISIBLE,
  CONSTRAINT `fk_denunciamaltrato_fotos1`
    FOREIGN KEY (`fotos_fotoID`)
    REFERENCES `basededatostele`.`fotos` (`fotoID`),
  CONSTRAINT `fk_DenunciaMaltrato_Usuario1`
    FOREIGN KEY (`usuarioID`)
    REFERENCES `basededatostele`.`usuario` (`usuarioID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `basededatostele`.`donacionmonetaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostele`.`donacionmonetaria` (
  `donacionMonetariaID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `usuarioID` INT UNSIGNED NULL DEFAULT NULL,
  `albergueID` INT UNSIGNED NOT NULL,
  `cantidadMonetaria` INT UNSIGNED NOT NULL,
  `fechaRecepcion` DATE NOT NULL,
  `horaRecepcion` TIME NOT NULL,
  `fecha` DATE NOT NULL,
  `fotos_fotoID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`donacionMonetariaID`),
  INDEX `fk_Donacion_Usuario1_idx` (`usuarioID` ASC) VISIBLE,
  INDEX `fk_Donacion_Albergue1_idx` (`albergueID` ASC) VISIBLE,
  INDEX `fk_donacion_fotos1_idx` (`fotos_fotoID` ASC) VISIBLE,
  CONSTRAINT `fk_Donacion_Albergue1`
    FOREIGN KEY (`albergueID`)
    REFERENCES `basededatostele`.`albergue` (`albergueID`),
  CONSTRAINT `fk_donacion_fotos1`
    FOREIGN KEY (`fotos_fotoID`)
    REFERENCES `basededatostele`.`fotos` (`fotoID`),
  CONSTRAINT `fk_Donacion_Usuario1`
    FOREIGN KEY (`usuarioID`)
    REFERENCES `basededatostele`.`usuario` (`usuarioID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `basededatostele`.`donacionsuministros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostele`.`donacionsuministros` (
  `donacionSuministrosID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `usuarioID` INT UNSIGNED NULL DEFAULT NULL,
  `albergueID` INT UNSIGNED NOT NULL,
  `fechaRecepcion` DATE NOT NULL,
  `nombreSuministro` VARCHAR(60) NOT NULL,
  `marcaSuministro` VARCHAR(30) NOT NULL,
  `horaRecepcion` TIME NOT NULL,
  `fecha` DATE NOT NULL,
  `fotos_fotoID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`donacionSuministrosID`),
  INDEX `fk_Donacion_Usuario1_idx` (`usuarioID` ASC) VISIBLE,
  INDEX `fk_Donacion_Albergue1_idx` (`albergueID` ASC) VISIBLE,
  INDEX `fk_donacion_fotos1_idx` (`fotos_fotoID` ASC) VISIBLE,
  CONSTRAINT `fk_Donacion_Albergue10`
    FOREIGN KEY (`albergueID`)
    REFERENCES `basededatostele`.`albergue` (`albergueID`),
  CONSTRAINT `fk_donacion_fotos10`
    FOREIGN KEY (`fotos_fotoID`)
    REFERENCES `basededatostele`.`fotos` (`fotoID`),
  CONSTRAINT `fk_Donacion_Usuario10`
    FOREIGN KEY (`usuarioID`)
    REFERENCES `basededatostele`.`usuario` (`usuarioID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `basededatostele`.`lugarevento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostele`.`lugarevento` (
  `lugarID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombreLugar` VARCHAR(60) NOT NULL,
  `direccionLugar` TEXT NOT NULL,
  `aforoMax` INT UNSIGNED NOT NULL,
  `administradorID` INT UNSIGNED NOT NULL,
  `Fotos_fotoID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`lugarID`),
  INDEX `fk_LugarEvento_Administrador1_idx` (`administradorID` ASC) VISIBLE,
  INDEX `fk_LugarEvento_Fotos1_idx` (`Fotos_fotoID` ASC) VISIBLE,
  CONSTRAINT `fk_LugarEvento_Administrador1`
    FOREIGN KEY (`administradorID`)
    REFERENCES `basededatostele`.`administrador` (`administradorID`),
  CONSTRAINT `fk_LugarEvento_Fotos1`
    FOREIGN KEY (`Fotos_fotoID`)
    REFERENCES `basededatostele`.`fotos` (`fotoID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `basededatostele`.`eventobenefico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostele`.`eventobenefico` (
  `EventoAlbergueID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `fechaEvento` DATE NOT NULL,
  `horaInicio` TIME NOT NULL,
  `horaFin` TIME NOT NULL,
  `albergueID` INT UNSIGNED NULL DEFAULT NULL,
  `tipoDonacion` ENUM('Suministros', 'Monetario') NOT NULL,
  `descripcionEvento` VARCHAR(300) NOT NULL,
  `invitados` VARCHAR(300) NULL DEFAULT NULL,
  `razonEvento` VARCHAR(200) NOT NULL,
  `estado` ENUM('Aprobado', 'Desaprobado') NOT NULL,
  `lugarID` INT UNSIGNED NOT NULL,
  `aforo` INT NOT NULL,
  `entradaMonetaria` INT NULL DEFAULT NULL,
  `entradaSuministro` VARCHAR(50) NULL DEFAULT NULL,
  `fotos_fotoID` INT UNSIGNED NOT NULL,
  `fechaPublicacion` DATE NOT NULL,
  `distrito_distritoID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`EventoAlbergueID`, `distrito_distritoID`),
  INDEX `fk_EventoBeneficoAlbergue_Albergue1_idx` (`albergueID` ASC) VISIBLE,
  INDEX `fk_EventoBenefico_LugarEvento1_idx` (`lugarID` ASC) VISIBLE,
  INDEX `fk_eventobenefico_fotos1_idx` (`fotos_fotoID` ASC) VISIBLE,
  INDEX `fk_eventobenefico_distrito1_idx` (`distrito_distritoID` ASC) VISIBLE,
  CONSTRAINT `fk_eventobenefico_fotos1`
    FOREIGN KEY (`fotos_fotoID`)
    REFERENCES `basededatostele`.`fotos` (`fotoID`),
  CONSTRAINT `fk_EventoBenefico_LugarEvento1`
    FOREIGN KEY (`lugarID`)
    REFERENCES `basededatostele`.`lugarevento` (`lugarID`),
  CONSTRAINT `fk_EventoBeneficoAlbergue_Albergue1`
    FOREIGN KEY (`albergueID`)
    REFERENCES `basededatostele`.`albergue` (`albergueID`),
  CONSTRAINT `fk_eventobenefico_distrito1`
    FOREIGN KEY (`distrito_distritoID`)
    REFERENCES `basededatostele`.`distrito` (`distritoID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 61
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `basededatostele`.`inscripcionevento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostele`.`inscripcionevento` (
  `inscripcionID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `usuarioID` INT UNSIGNED NOT NULL,
  `eventoID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`inscripcionID`),
  INDEX `fk_InscripcionEvento_Usuario1_idx` (`usuarioID` ASC) VISIBLE,
  INDEX `fk_InscripcionEvento_EventoBeneficoAlbergue1_idx` (`eventoID` ASC) VISIBLE,
  CONSTRAINT `fk_InscripcionEvento_EventoBeneficoAlbergue1`
    FOREIGN KEY (`eventoID`)
    REFERENCES `basededatostele`.`eventobenefico` (`EventoAlbergueID`),
  CONSTRAINT `fk_InscripcionEvento_Usuario1`
    FOREIGN KEY (`usuarioID`)
    REFERENCES `basededatostele`.`usuario` (`usuarioID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `basededatostele`.`mascotasadopcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostele`.`mascotasadopcion` (
  `idAdopcion` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `raza` VARCHAR(50) NOT NULL,
  `lugarEncontrado` TEXT NOT NULL,
  `descripcionGeneral` TEXT NOT NULL,
  `edadAprox` INT NOT NULL,
  `seEncuentraTemporal` TINYINT NOT NULL,
  `condicionesAdopcion` TEXT NOT NULL,
  `usuarioID` INT UNSIGNED NULL DEFAULT NULL,
  `albergueID` INT UNSIGNED NOT NULL,
  `sexo` ENUM('Macho', 'Hembra') NOT NULL,
  `fotos_fotoID` INT UNSIGNED NOT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`idAdopcion`),
  INDEX `fk_MascotasAdopcion_Usuario1_idx` (`usuarioID` ASC) VISIBLE,
  INDEX `fk_MascotasAdopcion_Albergue1_idx` (`albergueID` ASC) VISIBLE,
  INDEX `fk_mascotasadopcion_fotos1_idx` (`fotos_fotoID` ASC) VISIBLE,
  CONSTRAINT `fk_MascotasAdopcion_Albergue1`
    FOREIGN KEY (`albergueID`)
    REFERENCES `basededatostele`.`albergue` (`albergueID`),
  CONSTRAINT `fk_mascotasadopcion_fotos1`
    FOREIGN KEY (`fotos_fotoID`)
    REFERENCES `basededatostele`.`fotos` (`fotoID`),
  CONSTRAINT `fk_MascotasAdopcion_Usuario1`
    FOREIGN KEY (`usuarioID`)
    REFERENCES `basededatostele`.`usuario` (`usuarioID`))
ENGINE = InnoDB
AUTO_INCREMENT = 51
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `basededatostele`.`mascotastemporal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostele`.`mascotastemporal` (
  `idMascotasTemporal` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `estadoUsuario` ENUM('Aceptado', 'Rechazado', 'Pendiente') NOT NULL,
  `Usuario_usuarioID` INT UNSIGNED NOT NULL,
  `Albergue_albergueID` INT UNSIGNED NOT NULL,
  `estado` ENUM('Activo', 'Inactivo') NULL DEFAULT NULL,
  `raza` VARCHAR(50) NOT NULL,
  `especie` VARCHAR(50) NOT NULL,
  `tamanio` VARCHAR(45) NOT NULL,
  `peso` INT NOT NULL,
  `edad` INT NOT NULL,
  `sexo` ENUM('Macho', 'Hembra') NOT NULL,
  `poseeDiscapacidad` TINYINT NOT NULL,
  `descripcionDiscapacidad` VARCHAR(100) NULL DEFAULT NULL,
  `Fotos_fotoID` INT UNSIGNED NOT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`idMascotasTemporal`),
  INDEX `fk_MascotasTemporal_Usuario1_idx` (`Usuario_usuarioID` ASC) VISIBLE,
  INDEX `fk_MascotasTemporal_Albergue1_idx` (`Albergue_albergueID` ASC) VISIBLE,
  INDEX `fk_MascotasTemporal_Fotos1_idx` (`Fotos_fotoID` ASC) VISIBLE,
  CONSTRAINT `fk_MascotasTemporal_Albergue1`
    FOREIGN KEY (`Albergue_albergueID`)
    REFERENCES `basededatostele`.`albergue` (`albergueID`),
  CONSTRAINT `fk_MascotasTemporal_Fotos1`
    FOREIGN KEY (`Fotos_fotoID`)
    REFERENCES `basededatostele`.`fotos` (`fotoID`),
  CONSTRAINT `fk_MascotasTemporal_Usuario1`
    FOREIGN KEY (`Usuario_usuarioID`)
    REFERENCES `basededatostele`.`usuario` (`usuarioID`))
ENGINE = InnoDB
AUTO_INCREMENT = 61
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `basededatostele`.`solicitudtemporal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basededatostele`.`solicitudtemporal` (
  `solicitudID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `usuarioID` INT UNSIGNED NOT NULL,
  `edad` INT UNSIGNED NOT NULL,
  `genero` ENUM('Masculino', 'Femenino', 'Otro') NOT NULL,
  `celular` CHAR(9) NOT NULL,
  `cantidadCuartos` INT UNSIGNED NOT NULL,
  `metrajeVivienda` INT UNSIGNED NOT NULL,
  `tieneMascotas` TINYINT NOT NULL,
  `cantidadMascota` INT UNSIGNED NULL DEFAULT NULL,
  `tipoMascota` VARCHAR(10) NULL DEFAULT NULL,
  `tieneHijos` TINYINT NOT NULL,
  `viveSolo` TINYINT NOT NULL,
  `trabajaRemoto` TINYINT NOT NULL,
  `nombrePersonaReferencia` VARCHAR(50) NOT NULL,
  `numeroContactoPR` CHAR(9) NOT NULL,
  `tiempoTemporal` INT UNSIGNED NOT NULL,
  `inicioTemporal` DATE NOT NULL,
  `finTemporal` DATE NOT NULL,
  `estado` ENUM('Aprobado', 'Rechazado', 'Pendiente') NOT NULL,
  `Fotos_fotoID` INT UNSIGNED NOT NULL,
  `fecha` DATE NOT NULL,
  `estadoTemporal` ENUM('Activo', 'Inactivo') NULL DEFAULT NULL,
  `comentario` TEXT NULL DEFAULT NULL,
  `numeroRechazos` INT NULL DEFAULT NULL,
  PRIMARY KEY (`solicitudID`),
  UNIQUE INDEX `Celular_UNIQUE` (`celular` ASC) VISIBLE,
  UNIQUE INDEX `NúmeroContactoPR_UNIQUE` (`numeroContactoPR` ASC) VISIBLE,
  INDEX `fk_SolicitudTemporal_Usuario1_idx` (`usuarioID` ASC) VISIBLE,
  INDEX `fk_SolicitudTemporal_Fotos1_idx` (`Fotos_fotoID` ASC) VISIBLE,
  CONSTRAINT `fk_SolicitudTemporal_Fotos1`
    FOREIGN KEY (`Fotos_fotoID`)
    REFERENCES `basededatostele`.`fotos` (`fotoID`),
  CONSTRAINT `fk_SolicitudTemporal_Usuario1`
    FOREIGN KEY (`usuarioID`)
    REFERENCES `basededatostele`.`usuario` (`usuarioID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;




# Insertando datos en la tabla Fotos
INSERT INTO fotos ( rutaFoto, ubicacion)
VALUES 
( "ruta1", NULL),
( "ruta2", "PerfilUsuario"),
( "ruta3", "PerfilUsuario"),
( "ruta4", "PerfilUsuario"),
("ruta5", "PerfilUsuario"),
( "ruta6", "PerfilUsuario"),
( "ruta7", "PerfilAlbergue"),
("ruta8", "PerfilAlbergue"),
( "ruta9", "PerfilAlbergue"),
( "ruta10", "PerfilAlbergue"),
( "ruta11", "PerfilAlbergue"),
( "ruta12", "SolicitudTemporal"),
( "ruta13", "SolicitudTemporal"),
( "ruta14", "SolicitudTemporal"),
( "ruta15", "SolicitudTemporal"),
( "ruta16", "SolicitudTemporal"),
( "ruta17", "SolicitudMascota"),
( "ruta18", "SolicitudMascota"),
( "ruta19", "SolicitudMascota"),
( "ruta20", "SolicitudMascota"),
( "ruta21", "SolicitudMascota"),
( "ruta22", "PerfilCoordinador"),
( "ruta23", "PerfilCoordinador"),
( "ruta24", "PerfilCoordinador"),
( "ruta25", "PerfilCoordinador"),
( "ruta26", "PerfilCoordinador"),
( "ruta27", "Eventos"),
( "ruta28", "Eventos"),
( "ruta29", "Eventos"),
( "ruta30", "Eventos"),
( "ruta31", "Eventos"),
( "ruta32", "Donaciones"),
( "ruta33", "Donaciones"),
( "ruta34", "Donaciones"),
( "ruta35", "Donaciones"),
( "ruta36", "Donaciones"),
( "ruta37", "Denuncia"),
( "ruta38", "Denuncia"),
( "ruta39", "Denuncia"),
( "ruta40", "Denuncia"),
( "ruta41", "Denuncia"),
( "ruta42", "MascotaTemporal"),
( "ruta43", "MascotaTemporal"),
("ruta44", "MascotaTemporal"),
( "ruta45", "MascotaTemporal"),
( "ruta46", "MascotaTemporal"),
( "ruta47", "lugarEvento"),
( "ruta48", "lugarEvento"),
( "ruta49", "lugarEvento"),
( "ruta50", "lugarEvento"),
( "ruta51", "lugarEvento");


INSERT INTO zona (zonaID, nombreZona)
VALUES (1, "Este"), (2, "Oeste"), (3, "Norte"), (4, "Sur");  


# Insertando datos en la tabla CoordinadorZona
INSERT INTO CoordinadorZona ( nombre, apellido, dni, contrasenia, correoElectronico, celular, fechaNacimiento, estado, Zona_zonaID, Fotos_fotoID)
VALUES 
( "Daniel", "Gomez", "45612378", SHA2("ContraseñaIndecifrable1", 256), "daniel.gomez@correo.com", "987654321", "1985-06-15", "Inactivo", 1, 22),
( "Sofia", "Lopez", "78945612", SHA2("ContraseñaIndecifrable2", 256), "sofia.lopez@correo.com", "987123456", "1990-03-22", "Activo", 2, 23),
( "Juan", "Perez", "12378945", SHA2("ContraseñaIndecifrable3", 256), "juan.perez@correo.com", "976543210", "1978-11-05", "Activo", 3, 24),
( "Maria", "Vega", "74125896", SHA2("ContraseñaIndecifrable4", 256), "maria.vega@correo.com", "912345678", "1982-01-20", "Activo", 4, 25),
( "Luis", "Torres", "96385274", SHA2("ContraseñaIndecifrable5", 256), "luis.torres@correo.com", "923456789", "1995-07-18", "Activo", 1, 26);


INSERT INTO distrito (distritoID, nombreDistrito, zonaID)
VALUES
  (1, 'Ancón', 3),
  (2, 'Santa Rosa', 3),
  (3, 'Carabayllo', 3),
  (4, 'Comas', 3),
  (5, 'Los Olivos', 3),
  (6, 'San Martín de Porres', 3),
  (7, 'Independencia', 3),
  (8, 'San Juan de Miraflores', 4),
  (9, 'Villa María del Triunfo', 4),
  (10, 'Villa El Salvador', 4),
  (11, 'Pachacámac', 4),
  (12, 'Lurín', 4),
  (13, 'Punta Hermosa', 4),
  (14, 'Punta Negra', 4),
  (15, 'San Bartolo', 4),
  (16, 'Santa María del Mar', 4),
  (17, 'Pucusana', 4),
  (18, 'San Juan de Lurigancho', 1),
  (19, 'Lurigancho-Chosica', 1),
  (20, 'Ate', 1),
  (21, 'El Agustino', 1),
  (22, 'Santa Anita', 1),
  (23, 'La Molina', 1),
  (24, 'Cieneguilla', 1),
  (25, 'Rímac', 2),
  (26, 'Cercado de Lima', 2),
  (27, 'Breña', 2),
  (28, 'Pueblo Libre', 2),
  (29, 'Magdalena', 2),
  (30, 'Jesús María', 2),
  (31, 'La Victoria', 2),
  (32, 'Lince', 2),
  (33, 'San Isidro', 2),
  (34, 'San Miguel', 2),
  (35, 'Surquillo', 2),
  (36, 'San Borja', 2),
  (37, 'Santiago de Surco', 2),
  (38, 'Barranco', 2),
  (39, 'Chorrillos', 2),
  (40, 'San Luis', 2),
  (41, 'Miraflores', 2);


INSERT INTO administrador ( nombreUsuario, contrasenia)
VALUES
("Daniel Vargas",SHA2("ContrasenaAdministrador1",256)),  
("Raul Soto",SHA2("ContrasenaAdministrador2",256)),  
("Emily Flores",SHA2("ContrasenaAdministrador3",256)), 
("Dario Hemin",SHA2("ContrasenaAdministrador4",256)),  
("Vinicius Segundo",SHA2("ContrasenaAdministrador5",256));  


# Insertando datos en la tabla LugarEvento
INSERT INTO lugarEvento (lugarID, nombreLugar, direccionLugar, aforoMax, administradorID,Fotos_fotoID)
VALUES 
(1,"Estadio Lolo Fernandez", "Av Zorritos 123", 500, 2,47),
(2,"Estadio Nacional","Av Zorritos 456", 300,4,48),
(3,"Estadio No Tan Nacional","Av Zorritos 789", 200,4,49),
(4,"Estadio Lolo","Av Bolivar 123", 800,1,50),
(5,"Estadio Internacional","Av Bolivar 456", 500,1,51);


# Insertando datos en la tabla Usuario
INSERT INTO usuario (usuarioID, nombre, apellido, dni, direccion, correoElectronico, contrasenia,estado, distritoID, Fotos_fotoID)
VALUES 
(1,"Gerardo Jose","Rabanal Callirgos","70901759","Av. Aguarico 133","fhcwib@gmial.com",SHA2("aE334vbvkjve5org67",256),"Activo",3, 1),
(2,"Mathias Enrique","Tirado Medina","70456978","Av. El Sol 293","matht@gmail.com",SHA2("contra123seña",256),"Activo",1, 2),
(3,"Gilmar Daniel","Vargas Llosa","70025791","Calle Lagunas de la Molina 654","danielgilmar@gmail.com",SHA2("danigilmar",256),"Activo",2, 3),
(4,"Ariana Carmen","Zuñiga Villaverde","70368972","Av. Monte Umbroso 286","karsam17@gmail.com",SHA2("leclercnorris71",256),"Activo",4, 4),
(5,"JeanPier Gustavo","Gutierrez Hurtado","78261544","Jiron Huánuco 1586","gustavo31@gmail.com",SHA2("gustavomxv13",256),"Baneado",5, 5);


# Insertando datos en la tabla PublicacionMascotaPerdida
INSERT INTO PublicacionMascotaPerdida (publicacionID, usuarioID, nombre, descripcion, nombreContacto, edad, raza, tamanio, distintivo, descripcionAdicional, lugarPerdida, horaPerdida, telefonoContacto, recompensa, estado, fotos_fotoID, fechaPerdida, especie,fecha)
VALUES 
(1, 1, "Marcus","Perro perdido en el parque central", "Carlos", 5, "Labrador", "Grande", "Collar rojo", "Se perdió mientras corría", "Parque Central", "14:00", "12345678", 200, "Pendiente", 17, "2024-10-27", "Perro","2024-10-26"),
(2, 2, "Pablo", "Gato extraviado cerca del mercado", "Maria", 2, "Siames", "Mediano", "Ojo azul", "Se asustó por un perro", "Mercado Central", "10:00", "87654321", 100, "Pendiente", 18, "2024-10-26", "Gato","2024-10-25"),
(3, 3, "Pedro","Perrito marrón perdido", "Juan", 4, "Pug", "Pequeño", "Sin collar", "Salió corriendo detrás de una pelota", "Parque Norte", "16:30", "11223344", 150, "Pendiente", 19, "2024-10-25", "Perro","2024-10-24"),
(4, 4, "Mat","Ave perdida", "Ana", 1, "Perico", "Pequeño", "Plumas verdes", "Se escapó de la jaula", "Calle Primavera", "09:00", "44332211", 50, "Pendiente", 20, "2024-10-24", "Ave","2024-10-23"),
(5, 5, "Luna","Conejo perdido", "Luis", 3, "Enano", "Pequeño", "Orejas largas", "Se asustó por un ruido fuerte", "Av. Sol", "11:00", "99887766", 0, "Pendiente", 21, "2024-10-23", "Mamífero","2024-10-22");


# Insertando datos en la tabla DenunciaMaltrato
INSERT INTO DenunciaMaltrato (denunciaID, usuarioID, tamanio, raza, tipoMaltrato, nombreApellidoMaltratador, direccion, realizoDenuncia, fotos_fotoID, especie,fecha)
VALUES 
(1, 1, "Grande", "Labrador", "Riesgo alimentario", "Juan Perez", "Psj. Geraneos 578", 1, 37, "perro","2024-10-26"),
(2, 2, "Mediano", "Labrador", "Riesgo de abandono", "María Gomez", "Av. Siempre Viva 456", 1, 38, "perro","2024-10-25"),
(3, 3, "Pequenio", "Labrador", "Riesgo alimentario", "Carlos Sanchez", "Jr. Libertad 789", 0, 39, "perro","2024-10-24"),
(4, 4, "Grande", "Labrador", "Riesgo de abandono", null, "Calle Primavera 101", 0, 40, "perro","2024-10-23"),
(5, 5, "Mediano", "Labrador", "Riesgo alimentario", "Luis Vargas", "Av. Solecito 242", 1, 41, "perro","2024-10-22");


# Insertando datos en la tabla SolicitudTemporal
INSERT INTO SolicitudTemporal (solicitudID, usuarioID, edad, genero, celular, cantidadCuartos, metrajeVivienda, tieneMascotas,cantidadMascota, tipoMascota, tieneHijos, viveSolo, trabajaRemoto,nombrePersonaReferencia, numeroContactoPR, tiempoTemporal, inicioTemporal, finTemporal, estado, Fotos_fotoID,fecha,estadoTemporal)
VALUES 
(1, 1, 35, "Masculino", "953166225", 3, 90, 1,1, "Perro", 1, 0, 1, "Andrea Zuñiga Prado","987355482", 3, "2024-11-01", "2024-11-30", "Pendiente", 12,"2024-10-26",null),
(2, 2, 28, "Femenino", "953166224", 2, 80, 0, null,null, 0, 1, 0, "Andrea Zuñiga Prado","987355481", 5, "2024-11-05", "2024-12-05", "Aprobado", 13,"2024-10-25",null),
(3, 3, 45, "Masculino", "953166226", 4, 120, 1,1, "Ave", 1, 0, 1, "Andrea Zuñiga Prado","987355480", 1, "2024-11-10", "2024-12-10", "Rechazado", 14,"2024-10-24","Inactivo"),
(4, 4, 30, "Femenino", "953166229", 1, 50, 0,null, null, 0, 1, 0, "Andrea Zuñiga Prado", "987355483",4, "2024-11-15", "2024-12-15", "Pendiente", 15,"2024-10-23","Activo"),
(5, 5, 22, "Masculino", "953166221", 2, 70, 1,1, "Perro", 0, 0, 1, "Andrea Zuñiga Prado","987355485", 5, "2024-11-20", "2024-12-20", "Pendiente", 16,"2024-10-22", "Activo");


# Insertando datos en la tabla Albergue
INSERT INTO Albergue (albergueID, nombreAlbergue, nombreEncargado, apellidoEncargado, espaciosDisponibles, anioCreacion, correoElectronico, contrasenia, cantidadAnimales, urlFacebook, urlInstagram, direccion, distritoID, puntoAcopioDonaciones, direccionDonaciones, nombreContactoDonaciones,numeroContactoDonaciones,numeroYape,numeroPlin,codigoQR,estado,Fotos_fotoID,mensaje)
VALUES 
(1, "Patitas felices","Humberto","Gutierrez",140,"2020","a20221957@gmail.com",SHA2("contrasenanueva",256),56,"https://www.facebook.com/PatitasFelices","https://www.instagram.com/PatitasFelices","Av. Venezuela 123",1,"Av.Venezuela 456","Av. Venezuela 789","Albert Einstein","123456789","712345762","371234432","fmwlñfmpwefwoflwg","Aprobado", 7,"Somos un alberhue amoroso y ruidoso."),
(2, "Patitas tristes","Alex","Shady",100,"2024","a2023457@gmail.com",SHA2("contrasenavieja",256),12,"https://www.facebook.com/PatitasTristes","https://www.instagram.com/PatitasTristes","Av. Uruguay 123",4,"Av.Uruguay 456","Av. Uruguay 789","Nikolas Tesla","123456788","712345763","371234433","fmwlñfmpwefwoflfdfwewg","Desaprobado", 8,"Somos un alberhue amoroso y ruidoso."),
(3, "Patitas confundidas","Santiago","Vaca",80,"2019","a202467457@gmail.com",SHA2("contrasenaloca",256),70,"https://www.facebook.com/PatitasConfundidas","https://www.instagram.com/PatitasConfundidas","Av. Argentina 123",5,"Av. Argentina 456","Av. Argentina 789","Thomas Edinson","123456787","712345764","371234434","fmwlñfhrhrmpwefwoflwg","Aprobado", 9,"Somos un alberhue amoroso y ruidoso."),
(4, "Patitas distraidas","Diogo","Palomino",60,"2010","a20287757@gmail.com",SHA2("contrasenacontrasena",256),45,"https://www.facebook.com/PatitasDistraidas","https://www.instagram.com/PatitasDistraidas","Av. Brasil 123",3,"Av.Brasil 456","Av. Brasil 789","Abraham Lincoln","123456786","712345765","371234435","fmwlñfmbfnbfbpwefwoflwg","Aprobado", 10,"Somos un alberhue amoroso y ruidoso."),
(5, "Patitas locas","Diego","Cosme",40,"2018","a299897857@gmail.com",SHA2("contrasenaGAAAA",256),2,"https://www.facebook.com/PatitasLocas","https://www.instagram.com/PatitasLocas","Av. Universitaria 123",3,"Av. Universitaria 456","Av. Universitaria 789","Donald Trump","123456785","712345766","371234436","fmwlñfmpwefvedvewewoflwg","Desaprobado", 11,"Somos un alberhue amoroso y ruidoso.");


# Insertando datos en la tabla Donacion Monetaria
INSERT INTO donacionMonetaria (donacionMonetariaID, usuarioID, albergueID, cantidadMonetaria, fechaRecepcion, horaRecepcion, Fotos_fotoID, fecha)
VALUES 
(1, 1, 1,  100, '2024-10-28', '10:30', 32, '2024-10-26'),
(5, 5, 5,  200, '2024-10-28', '12:30', 36, '2024-10-22');

# Insertando datos en la tabla Donacion Suministros
INSERT INTO donacionsuministros (donacionSuministrosID, usuarioID, albergueID, fechaRecepcion, nombreSuministro, marcaSuministro, horaRecepcion, Fotos_fotoID, fecha)
VALUES 
(2, null, 2, '2024-10-28', 'Comida para perro 100kg', 'Purina', '11:00', 33, '2024-10-25'),
(3, 3, 3, '2024-10-28', 'Escoba', 'Sin Marca', '11:30', 34, '2024-10-24'),
(4, null, 4, '2024-10-28', 'Medicinas', 'Pfizer', '12:00', 35, '2024-10-23');

# Insertando datos en la tabla MascotasAdopcion
INSERT INTO MascotasAdopcion ( raza, lugarEncontrado, descripcionGeneral, edadAprox, seEncuentraTemporal, condicionesAdopcion, usuarioID, albergueID, sexo, Fotos_fotoID,fecha)
VALUES 
("Labrador", "Parque Central", "Perro amigable y juguetón", 3, 1, "Necesita espacio amplio", 1, 1, "Macho", 17,"2024-10-26"),
("Siames", "Mercado Central", "Gato curioso y tranquilo", 2, 0, "Ideal para apartamentos", null, 2, "Hembra", 18,"2024-10-25"),
("Pug", "Parque Norte", "Perro pequeño y alegre", 4, 1, "Requiere atención diaria", 3, 3, "Macho", 19,"2024-10-24"),
("Perico", "Calle Primavera", "Ave colorida y activa", 1, 0, "Necesita jaula amplia", null, 4, "Hembra", 20,"2024-10-23"),
("Enano", "Av. Sol", "Conejo tímido pero amistoso", 3, 1, "Requiere espacio seguro", 5, 5, "Hembra", 21,"2024-10-22");


# Insertando datos en la tabla MascotasTemporal
INSERT INTO MascotasTemporal (estadoUsuario, Usuario_usuarioID, Albergue_albergueID, estado,raza, especie, tamanio, peso, edad, sexo, poseeDiscapacidad, descripcionDiscapacidad, Fotos_fotoID,fecha)
VALUES 
("Aceptado", 1, 1, "Activo", "Labrador", "Perro", "Grande", 42, 5, "Macho", 0, NULL, 42,"2024-10-26"),
("Aceptado", 2, 2, "Activo", "Siames", "Gato", "Mediano", 4, 5, "Hembra", 1, "Cojea de una pata", 43,"2024-10-25"),
("Pendiente", 3, 3, null, "Pug", "Perro", "Pequenio", 7, 5, "Macho", 0, NULL, 44,"2024-10-24"),
("Rechazado", 4, 4, null, "Perico", "Ave", "Pequenio", 2, 2, "Macho", 1, "Ala rota", 45,"2024-10-23"),
("Aceptado", 5, 5, "Inactivo", "Enano", "Conejo", "Pequenio", 2, 1, "Hembra", 0, NULL, 46,"2024-10-22");


# Insertando datos en la tabla Comentarios
INSERT INTO Comentarios ( Comentarios, CoordinadorZona_coordinadorID, PublicacionMascotaPerdida_publicacionID,fecha)
VALUES 
("Encontré al perro cerca del parque", 1, 1,"2024-10-26"),
("El gato sigue perdido, pero se le vio en el mercado", 2, 2,"2024-10-27"),
("Vi al perro marrón en la calle principal", 3, 3,"2024-10-28"),
("El perico fue visto volando hacia el norte", 4, 4,"2024-10-29"),
("El conejo fue visto en un jardín cercano", 5, 5,"2024-10-30");


# Insertando datos en la tabla EventosBeneficio
INSERT INTO EventoBenefico (EventoAlbergueID,Nombre, fechaEvento, horaInicio, horaFin,albergueID, tipoDonacion, descripcionEvento, razonEvento,invitados, estado, lugarID, aforo, entradaMonetaria, entradaSuministro, Fotos_fotoID,fechaPublicacion,distrito_distritoID)
VALUES 
(1,"Jornada de Adopción", "2024-11-01", "09:00", "17:00",1, "Suministros", "Evento para adopción de perros y gatos", "Fomentar adopciones", "El lobo y la sociedad","Desaprobado", 1, 100, null, "Ropita para gatitos", 27,"2024-10-30",1),
(2,"Colecta de Alimentos", "2024-11-15", "10:00", "18:00",2, "Monetario", "Recolección de alimentos para albergues", "Ayudar a albergues", "Paolo guerrero","Aprobado", 2, 200, 10, null, 28,"2024-10-29",2),
(3,"Taller de Cuidado de Mascotas", "2024-12-01", "08:00", "14:00",3, "Suministros", "Capacitación sobre el cuidado de mascotas", "Educación comunitaria", null,"Aprobado", 3, 50, null, "Ropita para gatitos", 29,"2024-10-28",3),
(4,"Recaudación de Fondos", "2024-12-10", "12:00", "20:00",4, "Monetario", "Evento para recaudar fondos para albergues", "Apoyo económico", "Dina Boluarte","Aprobado", 4, 300, 10, null, 30,"2024-10-27",4),
(5,"Exposición de Adopción", "2024-12-20", "09:00", "16:00",5, "Suministros", "Exposición de mascotas para adopción", "Promover adopciones", null,"Aprobado", 5, 150, null, "Ropita para gatitos", 31,"2024-10-26",5);


# Insertando datos en la tabla InscripcionEventos
INSERT INTO InscripcionEvento (inscripcionID, usuarioID, eventoID)
VALUES 
(1,2,4),
(2,2,5),
(3,2,2),
(4,1,1),
(5,3,3),
(6,3,1);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;