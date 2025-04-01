-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-06-2024 a las 19:09:10
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `workflowp2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicional`
--

CREATE TABLE `condicional` (
  `proceso` varchar(50) DEFAULT NULL,
  `POSITIVO` varchar(50) DEFAULT NULL,
  `NEGATIVO` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `condicional`
--

INSERT INTO `condicional` (`proceso`, `POSITIVO`, `NEGATIVO`) VALUES
('P5', 'P6', 'P8'),
('P6', 'P7', 'P9');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procesos`
--

CREATE TABLE `procesos` (
  `flujo` varchar(20) NOT NULL,
  `procesoactual` varchar(20) NOT NULL,
  `procesosiguiente` varchar(20) NOT NULL,
  `pantalla` varchar(20) NOT NULL,
  `usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `procesos`
--

INSERT INTO `procesos` (`flujo`, `procesoactual`, `procesosiguiente`, `pantalla`, `usuario`) VALUES
('F1', 'P1', 'P2', 'inicio', 'estudiante'),
('F1', 'P2', 'P3', 'actualizardatos', 'estudiante'),
('F1', 'P3', 'P4', 'generarcodigo', 'estudiante'),
('F1', 'P4', 'P5', 'pagarbanco', 'estudiante'),
('F1', 'P5', '', 'verificarpago', 'kardex'),
('F1', 'P6', '', 'habilitarmatricula', 'kardex'),
('F1', 'P7', '', 'imprimirmatricula', 'estudiante'),
('F1', 'P8', '', 'errorenelpago', 'estudiante'),
('F1', 'P9', '', 'nohabilitado', 'estudiante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguimiento`
--

CREATE TABLE `seguimiento` (
  `ticket` int(11) DEFAULT NULL,
  `flujo` varchar(4) DEFAULT NULL,
  `proceso` varchar(4) DEFAULT NULL,
  `fechaini` datetime DEFAULT NULL,
  `fechafin` datetime DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `seguimiento`
--

INSERT INTO `seguimiento` (`ticket`, `flujo`, `proceso`, `fechaini`, `fechafin`, `usuario`) VALUES
(1, 'F1', 'P1', '2024-05-29 06:00:15', '2024-05-29 06:00:19', 1),
(1, 'F1', 'P2', '2024-05-29 06:00:19', '2024-05-29 06:00:22', 1),
(1, 'F1', 'P3', '2024-05-29 06:00:22', '2024-05-29 06:00:23', 1),
(1, 'F1', 'P4', '2024-05-29 06:00:23', '2024-05-29 06:00:25', 1),
(1, 'F1', 'P5', '2024-05-29 06:00:25', '2024-05-29 06:00:46', 1),
(1, 'F1', 'P8', '2024-05-29 06:00:46', NULL, 1),
(2, 'F1', 'P1', '2024-05-29 06:08:28', '2024-05-29 06:08:34', 3),
(2, 'F1', 'P2', '2024-05-29 06:08:34', '2024-05-29 06:08:47', 3),
(2, 'F1', 'P3', '2024-05-29 06:08:47', '2024-05-29 06:08:52', 3),
(2, 'F1', 'P4', '2024-05-29 06:08:52', '2024-05-29 06:08:54', 3),
(2, 'F1', 'P5', '2024-05-29 06:08:54', '2024-05-29 06:09:08', 3),
(2, 'F1', 'P6', '2024-05-29 06:09:08', '2024-05-29 06:09:12', 3),
(2, 'F1', 'P9', '2024-05-29 06:09:12', NULL, 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
