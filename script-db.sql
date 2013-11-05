-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 04-11-2013 a las 21:29:27
-- Versión del servidor: 5.6.12-log
-- Versión de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `gestiontransporte`
--
CREATE DATABASE IF NOT EXISTS `gestiontransporte` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gestiontransporte`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividadeslocales`
--

CREATE TABLE IF NOT EXISTS `actividadeslocales` (
  `correlativo` int(11) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `unidadrequerida` varchar(30) NOT NULL,
  `Estado` varchar(15) NOT NULL,
  `HorasDuracion` time NOT NULL,
  PRIMARY KEY (`correlativo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `actividadeslocales`
--

INSERT INTO `actividadeslocales` (`correlativo`, `Descripcion`, `unidadrequerida`, `Estado`, `HorasDuracion`) VALUES
(1, 'Recoleccion de basura de la zona uno.', 'Camion Recolector 1', 'Pendiente', '04:00:00'),
(2, 'Recoleccion de basura de la zona dos.', 'Camion Recolector 2', 'Pendiente', '05:00:00'),
(3, 'Recoleccion de basura de la zona tres', 'Camion Recolector 3', 'Pendiente', '06:00:00'),
(4, 'Recoleccion de basura de la zona cuatro', 'Camion Recolector 4', 'Pendiente', '07:00:00'),
(5, 'Llevar alumnos a la escuela Simon Bolivar', 'Auto Bus', 'Pendiente', '00:00:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacoraactividades`
--

CREATE TABLE IF NOT EXISTS `bitacoraactividades` (
  `correlativo` varchar(8) NOT NULL,
  `mes` varchar(10) NOT NULL,
  `año` int(11) NOT NULL,
  `equipo` int(11) NOT NULL,
  PRIMARY KEY (`correlativo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacoracombustible`
--

CREATE TABLE IF NOT EXISTS `bitacoracombustible` (
  `correlativo` varchar(8) NOT NULL,
  `fecha` varchar(10) NOT NULL,
  `hora` varchar(10) NOT NULL,
  `gasolinera` varchar(50) NOT NULL,
  PRIMARY KEY (`correlativo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bitacoracombustible`
--

INSERT INTO `bitacoracombustible` (`correlativo`, `fecha`, `hora`, `gasolinera`) VALUES
('BC100001', '10/30/2013', '16:30', 'Alba Opico'),
('BC100002', '10/15/2013', '16:30', 'Alba San Salvador'),
('BC100003', '10/31/2013', '06:30', 'Alba Ciudad Delgado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallebitacoraactividades`
--

CREATE TABLE IF NOT EXISTS `detallebitacoraactividades` (
  `numero` varchar(8) NOT NULL,
  `fecha` date NOT NULL,
  `horasalida` time NOT NULL,
  `kmsalida` int(11) DEFAULT NULL,
  `objetivomision` varchar(100) NOT NULL,
  `lugar` varchar(50) NOT NULL,
  `horaretorno` time NOT NULL,
  `kmretorno` int(11) DEFAULT NULL,
  `kmutilizados` int(11) DEFAULT NULL,
  `motorista` varchar(50) NOT NULL,
  `id_solicitud` varchar(7) NOT NULL,
  `correlativo` varchar(8) NOT NULL,
  `observaciones` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`numero`),
  KEY `id_solicitud` (`id_solicitud`),
  KEY `correlativo` (`correlativo`),
  KEY `motorista` (`motorista`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallebitacoracombustible`
--

CREATE TABLE IF NOT EXISTS `detallebitacoracombustible` (
  `vale` varchar(10) NOT NULL,
  `placa` varchar(8) NOT NULL,
  `num_equipo` int(11) NOT NULL,
  `motorista` varchar(50) NOT NULL,
  `tipo_combustible` varchar(50) NOT NULL,
  `precio_galon` decimal(10,2) NOT NULL,
  `total_galones` decimal(10,3) NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `actividades` varchar(100) NOT NULL,
  `correlativo` varchar(8) NOT NULL,
  PRIMARY KEY (`vale`),
  KEY `correlativo` (`correlativo`),
  KEY `placa` (`placa`),
  KEY `num_equipo` (`num_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detallebitacoracombustible`
--

INSERT INTO `detallebitacoracombustible` (`vale`, `placa`, `num_equipo`, `motorista`, `tipo_combustible`, `precio_galon`, `total_galones`, `valor_total`, `actividades`, `correlativo`) VALUES
('5545', 'N799-833', 5, 'Gabriela Maria Mendoza Henriquez', 'Diesel', '4.50', '10.000', '45.00', 'actividad 1, 2 y 3', 'BC100001'),
('5555', 'N784-545', 4, 'Gabriela Maria Flores Torres', 'Gasolina', '5.00', '25.000', '125.00', '', 'BC100001'),
('5564', 'N784-545', 4, 'Gabriela Maria Flores Torres', 'Regular', '10.00', '20.000', '200.00', 'actividad 4,5 y 6', 'BC100001'),
('5569', 'N784-545', 4, 'Gabriela Maria Flores Torres', 'Super', '6.00', '10.000', '60.00', '', 'BC100001'),
('5584', 'N784-545', 4, 'Gabriela Maria Flores Torres', 'Diesel', '4.25', '15.000', '63.75', '', 'BC100003');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `nivel` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `contraseña` varchar(50) NOT NULL,
  PRIMARY KEY (`contraseña`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`nivel`, `usuario`, `Nombre`, `contraseña`) VALUES
(1, 'Nelsonadmin', 'Nelson Marroquin', '536c0b339345616c1b33caf454454d8b8a190d6c'),
(2, 'Joseger', 'Jose Alexander', '5718f7f8665e717c0870620567c6415e13761141'),
(3, 'Rogeliosubge', 'Rogelio Lopez', '7dee5aff3385805a5db869b29512488227353d58'),
(4, 'Rafaelmot', 'Rafael Campos', '824cfa92504779259757881b889c2a0edfb2f9cc'),
(1, 'Nelsonadmin', 'Nelson Marroquin', '9dbf7c1488382487931d10235fc84a74bff5d2f4'),
(3, 'Rogeliosubge', 'Rogelio Lopez', 'a07a01fc585368d7ea359dffaf595fe259d0d6ed'),
(5, 'Oscarnorm', 'Oscar Martinez', 'd8fd19d11989a64da26d7a0f4d23f2a1f21ce010'),
(1, '01', '01', 'ddfe163345d338193ac2bdc183f8e9dcff904b43'),
(2, 'Joseger', 'Jose 	Alexander Rivas', 'e0ffb90b074691c42ebd7b3cc39771b344c0083b');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motorista`
--

CREATE TABLE IF NOT EXISTS `motorista` (
  `Licencia` varchar(17) NOT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Dui` varchar(10) NOT NULL,
  `Telefono` varchar(9) NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Sexo` varchar(9) NOT NULL,
  `FechaIngreso` date NOT NULL,
  `Estado` varchar(13) NOT NULL DEFAULT 'Disponible',
  PRIMARY KEY (`Licencia`),
  KEY `Nombres` (`Nombres`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `motorista`
--

INSERT INTO `motorista` (`Licencia`, `Nombres`, `Apellidos`, `Dui`, `Telefono`, `Direccion`, `Sexo`, `FechaIngreso`, `Estado`) VALUES
('1101-010101-010-1', 'Mario Antonio', 'Vides Mejia', '38291822-9', '2839-4839', 'Colonia las cumbres la libertad', 'Masculino', '2013-10-30', 'Disponible'),
('1938-382718-273-7', 'Pedro Antonio', 'Flores Aquino', '18283928-3', '7278-3728', 'Residenciales las moras casa 12', 'Masculino', '2013-10-26', 'Eliminado'),
('2937-747382-810-8', 'Victor Arturo', 'Mendez Mejia', '18273827-3', '3272-2881', 'Col. El Progreso casa 8 San Miguel', 'Masculino', '2013-10-26', 'Eliminado'),
('2991-022873-647-2', 'Carolina Adriana', 'Mestizo Huezo', '28394837-1', '2373-4891', 'Casa 12 colonia las flores armenia sonsonate', 'Femenino', '2013-10-19', 'Eliminado'),
('3647-288399-100-2', 'Andres Alberto', 'Batres Benites', '83748819-0', '1728-3839', 'Residenciales Jiboa casa 23 Gerardo Barrios San Salvador', 'Masculino', '2013-10-31', 'Eliminado'),
('6183-740183-819-3', 'Daniel Agustin', 'Valles Rodriguez', '79249910-2', '1223-3021', 'Col. El rosal casa 12 armenia Sonsonate', 'Masculino', '2013-10-26', 'Eliminado'),
('6282-872737-488-3', 'Jorge Pablo', 'Hernandez Martinez', '73728378-2', '9485-7382', 'Carretera troncal del norte Km 11 y medio Colonia Santa Marta Pasaje 3 Poligono G casa 12G', 'Masculino', '2013-10-26', 'Eliminado'),
('6482-746473-298-4', 'Miguel Enrique', 'Mena Rivas', '76112938-1', '2536-4910', 'Col. Las veraneras pasaje 2 poligono C casa 4C', 'Masculino', '2013-10-30', 'Asignado'),
('7364-739293-847-4', 'Oscar Noe', 'Ramos Rivas', '91829382-9', '2736-2736', 'Colonia el porvenir armenia sonsonate casa 21', 'Masculino', '2013-10-30', 'Asignado'),
('7366-573998-374-3', 'Blanca Maria', 'Rivas Rodriguez', '81176372-6', '2536-4362', 'Barrio las cruces pasaje agua fria casa 14', 'Femenino', '2013-10-26', 'Eliminado'),
('9283-748771-973-9', 'Emilia Estela', 'Garcia Valles', '19283743-8', '2364-7282', 'Col. El rosal', 'Femenino', '2013-10-26', 'Eliminado'),
('9287-126337-199-2', 'Beatriz Alicia', 'Gonzalez Martinez', '29839189-2', '2938-9928', 'Colonia los girasoles casa 14 apopa san salvador', 'Femenino', '2013-10-29', 'Disponible'),
('9302-948290-293-2', 'Manuel Gustavo', 'Galdamez Bonilla', '18298483-8', '7283-7289', 'Col. El Progreso casa 13 San Salvador', 'Masculino', '2013-10-26', 'Disponible'),
('9338-477288-374-8', 'Lorena Alicia', 'Flores Garcia', '93829182-8', '3828-3991', 'Col. El rosal', 'Femenino', '2013-10-08', 'Disponible'),
('9384-928392-839-2', 'Julio Cesar', 'Neron Aguirrez', '94291829-1', '3394-9501', 'Carretera troncal del norte Km 11 y medio Colonia Santa Marta Pasaje 3 Poligono G casa 12G', 'Masculino', '2013-10-29', 'Disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programaciones`
--

CREATE TABLE IF NOT EXISTS `programaciones` (
  `idsolicitud` int(7) NOT NULL,
  `idmotorista` varchar(5) NOT NULL,
  `idunidad` varchar(11) NOT NULL,
  PRIMARY KEY (`idsolicitud`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programacionlocal`
--

CREATE TABLE IF NOT EXISTS `programacionlocal` (
  `correlativo` varchar(10) NOT NULL DEFAULT '',
  `Motorista` varchar(50) NOT NULL,
  `Unidad` varchar(30) NOT NULL,
  `numequipo` varchar(11) NOT NULL,
  `Actividad` varchar(200) NOT NULL,
  `FechaActividad` varchar(10) NOT NULL,
  `DuracionActividad` varchar(9) NOT NULL,
  `unidadreq` varchar(30) NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `FechaProgramacion` varchar(35) NOT NULL,
  PRIMARY KEY (`correlativo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `programacionlocal`
--

INSERT INTO `programacionlocal` (`correlativo`, `Motorista`, `Unidad`, `numequipo`, `Actividad`, `FechaActividad`, `DuracionActividad`, `unidadreq`, `Estado`, `FechaProgramacion`) VALUES
('PAL100001', 'Andres Alberto Batres Benites', 'Camion Recolector', '7', 'Recoleccion de basura de la zona tres', '2013-10-30', '06:00:00', 'Camion Recolector 3', 'Programada', 'Tue Oct 29 23:51:48 CST 2013'),
('PAL100002', 'Manuel Gustavo Galdamez Bonilla', 'Camion Recolector', '2', 'Recoleccion de basura de la zona uno.', '2013-10-31', '04:00:00', 'Camion Recolector 1', 'Programada', 'Tue Oct 29 23:52:21 CST 2013'),
('PAL100003', 'Manuel Gustavo Galdamez Bonilla', 'Camion Recolector', '2', 'Recoleccion de basura de la zona tres', '2013-11-07', '06:00:00', 'Camion Recolector 3', 'Programada', 'Tue Oct 29 23:55:53 CST 2013'),
('PAL100004', 'Julio Cesar Neron Aguirrez', 'Camion Recolector', '8', 'Recoleccion de basura de la zona cuatro', '2013-11-12', '07:00:00', 'Camion Recolector 4', 'Programada', 'Wed Oct 30 00:15:13 CST 2013'),
('PAL100005', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null'),
('PAL100006', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null'),
('PAL100007', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null'),
('PAL100008', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null'),
('PAL100009', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null'),
('PAL100010', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null'),
('PAL100011', 'Beatriz Alicia Gonzalez Martinez', 'Auto Bus', '5', 'Recoleccion de basura de la zona uno.', '2013-11-14', '04:00:00', 'Camion Recolector 1', 'Programada', 'Wed Oct 30 16:34:27 CST 2013'),
('PAL100012', 'Manuel Gustavo Galdamez Bonilla', 'Auto Bus', '5', 'Llevar alumnos a la escuela Simon Bolivar', '2013-10-17', '00:00:05', 'Auto Bus', 'Programada', 'Wed Oct 30 16:37:22 CST 2013'),
('PAL100013', 'Beatriz Alicia Gonzalez Martinez', 'Auto Bus', '5', 'Recoleccion de basura de la zona uno.', '2013-10-30', '04:00:00', 'Camion Recolector 1', 'Programada', 'Wed Oct 30 23:15:30 CST 2013');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudtransporte`
--

CREATE TABLE IF NOT EXISTS `solicitudtransporte` (
  `idsolicitud` int(7) NOT NULL AUTO_INCREMENT,
  `Solicitante` varchar(100) NOT NULL,
  `EncargadoTransporte` varchar(100) NOT NULL,
  `Fechasolicitud` date NOT NULL,
  `Descripcion` varchar(250) NOT NULL,
  `hora` time NOT NULL,
  `diarealizar` date NOT NULL,
  `DireccionLugar` varchar(250) NOT NULL,
  `tipoUnidad` varchar(50) NOT NULL,
  `tiempoAprox` varchar(5) NOT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`idsolicitud`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Volcado de datos para la tabla `solicitudtransporte`
--

INSERT INTO `solicitudtransporte` (`idsolicitud`, `Solicitante`, `EncargadoTransporte`, `Fechasolicitud`, `Descripcion`, `hora`, `diarealizar`, `DireccionLugar`, `tipoUnidad`, `tiempoAprox`, `estado`) VALUES
(1, 'DFFDDFFDFD', 'Nelson Marroquin', '2013-09-30', 'DFDFDFDFD', '18:00:00', '2013-10-03', 'Centro del municipio de Mejicanos', '', '0', 'Aprobada'),
(2, 'Gilmer Manfredi Bonilla Amaya', 'Nelson Marroquin', '2013-09-30', 'traslado de personal de la Alcaldia Municipal de Apopa', '09:00:00', '2013-10-05', 'Centro de Apopa', '', '0', 'Aprobada'),
(3, 'Elmer Menjivar', 'Nelson Marroquin', '2013-09-30', 'Capacitacion del centro de San Salvador', '10:30:00', '2013-10-05', 'San Salvador', '', '0', 'Aprobada'),
(4, 'BONILLA AMAYA', 'Nelson Marroquin', '2013-10-01', 'TRASLADO DE PERSONAS DESDE EL CENTRO DE LA CIUDAD', '10:00:00', '2013-10-05', 'CORINTO MORAZAN', '', '0', 'Aprobada'),
(5, 'GILMER MANFREDI', 'Nelson Marroquin', '2013-10-08', 'traslado', '08:00:00', '2013-10-26', 'Mejicanos', '', '0', 'Pendiente'),
(6, 'Glmeri Manfredi Bonilla Amaya', 'Nelson', '2013-10-01', 'Traslado', '12:30:00', '2013-10-31', 'San Salvador', '', '0', 'Aprobada'),
(7, 'MANFREDI BONILLA', 'Nelson Marroquin', '2013-10-08', 'Equipo de sonido', '08:59:00', '2013-10-26', 'CORINTO MORAZAN', '', '0', 'Pendiente'),
(8, 'Jorge Luis', 'Nelson Marroquin', '2013-10-13', 'traslado', '14:55:00', '2013-10-31', 'san salvador', 'Ambulancia', '0', 'Aprobada'),
(9, 'Jorge Luis', 'Nelson Marroquin', '2013-10-13', 'traslado', '01:55:00', '2013-10-31', 'san salvador', '', '0', 'Pendiente'),
(10, 'Jorge Luis', 'Nelson Marroquin', '2013-10-13', 'traslado', '01:55:00', '2013-10-31', 'san salvador', '', '0', 'Aprobada'),
(11, 'Jorge Luis', 'Nelson Marroquin', '2013-10-13', 'traslado', '13:55:00', '2013-10-31', 'san salvador', '', '0', 'Aprobada'),
(12, 'Manfredi', 'Nelson Marroquin', '2013-10-16', 'Cambio de local de la casa comunal', '12:50:00', '2013-10-19', 'San Francisco Gotera', '3', '8', 'Pendiente'),
(13, 'Manfredi', 'Nelson Marroquin', '2013-10-16', 'Cambio de local', '17:00:00', '2013-10-20', 'San Miguel', '1', '8', 'Pendiente'),
(14, 'Yesica Bonilla', 'Nelson Marroquin', '2013-10-16', 'concurso de danza', '14:50:00', '2013-10-25', 'Soyapango', '', '5', 'Pendiente'),
(15, '', 'Nelson Marroquin', '2013-10-17', 'Capacitacion en San Salvador', '22:50:00', '2013-10-19', 'San Salvador', 'Camion', '8', 'Pendiente'),
(16, 'Eva Guadalupe', 'Nelson Marroquin', '2013-10-17', 'Capacitacion en San Salvador', '22:50:00', '2013-10-19', 'San Salvador', 'Ambulancia', '8', 'Pendiente'),
(17, 'frfrf', 'Nelson Marroquin', '2013-10-19', 'jjjhh', '21:09:00', '2013-10-16', 'hhhh', '1', '5', 'Aprobada'),
(18, 'jorge', 'Nelson Marroquin', '2013-10-19', 'traslado', '14:01:00', '2013-10-31', 'san miguel', '', '4', 'Pendiente'),
(19, 'Marina Esther', 'Nelson Marroquin', '2013-10-21', 'Excursion', '18:00:00', '2013-10-31', 'San Francisco Gotera', 'Bus', '5', 'Aprobada'),
(20, 'jjdjd', 'Nelson Marroquin', '2013-10-22', 'jjdnf', '20:00:00', '2013-10-24', 'kkkdkdki', 'Camion', '5', 'Pendiente'),
(21, 'Gloria Bonilla', 'Nelson Marroquin', '2013-10-22', 'Viaje a las playas', '08:00:00', '2013-10-26', 'Corinto Morazan', 'Pickhut', '8', 'Aprobada'),
(22, 'Aslhy Lisseth', 'Nelson Marroquin', '2013-12-30', 'Capacitacion', '17:00:00', '2014-01-03', 'San Salvador', 'Bus', '4', 'Aprobada'),
(23, 'jjhsdf', 'Nelson Marroquin', '2013-10-30', 'fdgfdgfg', '17:00:00', '2013-11-03', 'kuigy', 'Camion', '8', 'Aprobada'),
(24, 'xfdfvd', 'Nelson Marroquin', '2013-10-30', 'gfgfgf', '12:00:00', '2013-11-14', 'jkjhkj', 'Camion', '5', 'Pendiente'),
(25, 'cssxcxc', 'Nelson Marroquin', '2013-10-30', 'dggg', '01:00:00', '2013-11-05', 'dfdfdfd', 'Bus', '8', 'Pendiente'),
(26, 'kkdkdd', 'Nelson Marroquin', '2013-10-30', 'ppoe', '02:00:00', '2013-11-08', 'kkjsdsd', 'Ambulancia', '8', 'Pendiente'),
(27, 'gilmer', 'Nelson Marroquin', '2013-10-30', 'ues', '03:00:00', '2013-11-06', 'Universidad de el salvador', 'Pickhut', '7', 'Pendiente'),
(28, 'miguel', 'Nelson Marroquin', '2013-10-30', 'Capacitacion', '17:00:00', '2013-11-27', 'Universidad de el salvador', 'Camion', '7', 'Pendiente'),
(29, 'miguel', 'Nelson Marroquin', '2013-10-30', 'Capacitacion', '17:00:00', '2013-11-27', 'Universidad de el salvador', 'Camion', '7', 'Pendiente'),
(30, 'miguel', 'Nelson Marroquin', '2013-10-30', 'Capacitacion', '17:00:00', '2013-11-27', 'Universidad de el salvador', 'Camion', '7', 'Pendiente'),
(31, 'miguel', 'Nelson Marroquin', '2013-10-30', 'Capacitacion', '17:00:00', '2013-11-27', 'Universidad de el salvador', 'Camion', '7', 'Pendiente'),
(32, 'yugvh', 'Nelson Marroquin', '2013-10-30', 'hgvhgv', '13:40:00', '2013-11-08', 'uhuyv', 'Camion', '7', 'Pendiente'),
(33, 'yugvh', 'Nelson Marroquin', '2013-10-30', 'hgvhgv', '13:40:00', '2013-11-08', 'uhuyv', 'Camion', '7', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad`
--

CREATE TABLE IF NOT EXISTS `unidad` (
  `placa` varchar(8) NOT NULL,
  `num_equipo` int(11) NOT NULL,
  `clase` varchar(30) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `color` varchar(30) NOT NULL,
  `anio` int(11) NOT NULL,
  `capacidad` varchar(30) NOT NULL,
  `dominio` varchar(30) NOT NULL,
  `num_motor` varchar(22) NOT NULL,
  `num_chasis_grabado` varchar(17) NOT NULL,
  `num_chasis_vin` varchar(17) NOT NULL,
  `en_calidad` varchar(30) NOT NULL,
  `estado` varchar(30) NOT NULL DEFAULT 'Disponible',
  PRIMARY KEY (`placa`),
  KEY `num_equipo` (`num_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`placa`, `num_equipo`, `clase`, `marca`, `modelo`, `color`, `anio`, `capacidad`, `dominio`, `num_motor`, `num_chasis_grabado`, `num_chasis_vin`, `en_calidad`, `estado`) VALUES
('N784-545', 4, 'AUTOMOVIL', 'HYUNDAI', 'ELANTRA', 'NEGRO', 2007, '5.00ASS', 'PROPIEDAD', 'G4GC4813652', 'MHHD65D78U179532', 'MHHD65D78U179532', 'PROPIEDAD', 'Eliminada'),
('N799-833', 5, 'AUTOMOVIL', 'MAZDA', 'G323', 'BLANCO', 2000, '2.00ASS', 'PROPIEDAD', 'K4DU4813652', 'RKHD65D78C1120323', 'RKHD65D78C1120323', 'PROPIEDAD', 'Eliminada');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallebitacoraactividades`
--
ALTER TABLE `detallebitacoraactividades`
  ADD CONSTRAINT `detallebitacoraactividades_ibfk_1` FOREIGN KEY (`motorista`) REFERENCES `motorista` (`Nombres`),
  ADD CONSTRAINT `detallebitacoraactividades_ibfk_3` FOREIGN KEY (`correlativo`) REFERENCES `bitacoraactividades` (`correlativo`);

--
-- Filtros para la tabla `detallebitacoracombustible`
--
ALTER TABLE `detallebitacoracombustible`
  ADD CONSTRAINT `detallebitacoracombustible_ibfk_1` FOREIGN KEY (`correlativo`) REFERENCES `bitacoracombustible` (`correlativo`),
  ADD CONSTRAINT `detallebitacoracombustible_ibfk_2` FOREIGN KEY (`placa`) REFERENCES `unidad` (`placa`),
  ADD CONSTRAINT `detallebitacoracombustible_ibfk_3` FOREIGN KEY (`num_equipo`) REFERENCES `unidad` (`num_equipo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--
-- Estructura de tabla para la tabla `filtro`
--

CREATE TABLE IF NOT EXISTS `filtro` (
  `Equipo` int(11) NOT NULL DEFAULT '0',
  `Aceite` varchar(50) DEFAULT NULL,
  `Aire` varchar(100) DEFAULT NULL,
  `Combustible` varchar(50) DEFAULT NULL,
  `Diesel` varchar(45) DEFAULT NULL,
  `Estado` varchar(15) DEFAULT 'Disponible',
  `Fecha_Revision` varchar(10) DEFAULT '27/10/2013',
  `Codigo_Aceite` varchar(45) NOT NULL,
  PRIMARY KEY (`Equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 PACK_KEYS=1;

--
-- Volcado de datos para la tabla `filtro`
--

INSERT INTO `filtro` (`Equipo`, `Aceite`, `Aire`, `Combustible`, `Diesel`, `Estado`, `Fecha_Revision`, `Codigo_Aceite`) VALUES
(1, 'PH', 'JA-705', 'P-4160', '', 'Disponible', '31/1/2014', 'A2/B2'),
(5, 'PH', 'r', '', '', 'No Disponible', '29/4/2014', ''),
(6, 'PH', '', '', '', 'Disponible', '29/4/2014', ''),
(11, 'PH 2849A', 'BA-K12', '', 'F-120', 'Disponible', '29/1/2014', ''),
(12, 'MB 22090', 'OK 72C', 'FO 5001', '', 'Disponible', '29/1/2014', ''),
(15, 'PH 3593', 'JA-705', 'P-4160', '', 'Disponible', '29/1/2014', ''),
(16, 'C-294', 'A 6156B', '', 'F 65166', 'Disponible', '29/1/2014', ''),
(17, 'PH', 'JA-705', 'P-4160', '', 'Disponible', '29/4/2014', ''),
(18, 'PH', '', 'P-4102', '', 'Disponible', '29/4/2014', ''),
(19, 'PH 49A', '', '', '33358/F 50359', 'Disponible', '29/1/2014', ''),
(20, '', '', '', '', 'Disponible', '29/1/2014', ''),
(21, '', '', '', '', 'Disponible', '29/1/2014', ''),
(24, '', '', '', '', 'Disponible', '29/1/2014', ''),
(25, '', '', '', '', 'Disponible', '29/1/2014', ''),
(26, '', '', '', '', 'Disponible', '29/1/2014', ''),
(27, '', '', '', '', 'Disponible', '29/1/2014', ''),
(29, 'PH', '', '', 'P-4160', 'No Disponible', '29/4/2014', '');