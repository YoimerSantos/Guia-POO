-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-09-2017 a las 16:46:18
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `centromedico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_cita` int(11) NOT NULL,
  `cita_fecha` date NOT NULL,
  `cita_hora` time NOT NULL,
  `cita_paciente` int(11) NOT NULL,
  `cita_medico` int(11) NOT NULL,
  `cita_consultorio` int(11) NOT NULL,
  `cita_estado` enum('Asignado','Atendido') NOT NULL,
  `cita_observaciones` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultorio`
--

CREATE TABLE `consultorio` (
  `Id_consultorio` int(11) NOT NULL,
  `Nombre` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `id_medico` int(11) NOT NULL,
  `Med_identificacion` char(15) NOT NULL,
  `med_nombre` varchar(50) NOT NULL,
  `med_apellido` varchar(50) NOT NULL,
  `med_especialidad` varchar(50) NOT NULL,
  `med_telefono` char(40) NOT NULL,
  `med_correo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id_paciente` int(11) NOT NULL,
  `pac_identificacion` varchar(20) NOT NULL,
  `pac_nombre` varchar(15) NOT NULL,
  `pac_apellido` varchar(50) NOT NULL,
  `pac_fecha_nacimiento` date NOT NULL,
  `pac_sexo` enum('Femenino','Masculino') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id_paciente`, `pac_identificacion`, `pac_nombre`, `pac_apellido`, `pac_fecha_nacimiento`, `pac_sexo`) VALUES
(2, '110234568', 'Sofia', 'Maldonado', '1983-05-04', 'Femenino'),
(3, '22867740', 'Adalberto ', 'Sierra Gomez', '1990-06-12', 'Masculino'),
(4, '21121213132', 'Katya Adalgisa', 'Skynet Vicky', '1990-12-28', 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usu_login` char(15) NOT NULL,
  `usu_password` varchar(60) NOT NULL,
  `usu_estado` enum('Activo','Inactivo') NOT NULL,
  `usu_tipo` enum('Administrador','Medico','Paciente') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `citas` (`cita_paciente`),
  ADD KEY `cita` (`cita_medico`),
  ADD KEY `cit` (`cita_consultorio`);

--
-- Indices de la tabla `consultorio`
--
ALTER TABLE `consultorio`
  ADD PRIMARY KEY (`Id_consultorio`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id_medico`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_paciente`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `consultorio`
--
ALTER TABLE `consultorio`
  MODIFY `Id_consultorio` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `cit` FOREIGN KEY (`cita_consultorio`) REFERENCES `consultorio` (`Id_consultorio`),
  ADD CONSTRAINT `cita` FOREIGN KEY (`cita_medico`) REFERENCES `medicos` (`id_medico`),
  ADD CONSTRAINT `citas` FOREIGN KEY (`cita_paciente`) REFERENCES `pacientes` (`id_paciente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
