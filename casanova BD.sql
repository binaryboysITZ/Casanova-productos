-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-11-2018 a las 22:16:29
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `casanova(2)`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apartado`
--

CREATE TABLE `apartado` (
  `idapartado` int(10) NOT NULL,
  `productos_idproducto` int(10) NOT NULL,
  `cantidadapa` int(10) NOT NULL,
  `nombrecliente` varchar(45) NOT NULL,
  `deposito` float NOT NULL,
  `telefonocliente` varchar(45) NOT NULL,
  `fechaapartado` varchar(45) NOT NULL,
  `fechaentrega` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idcompras` int(10) NOT NULL,
  `productos_idproducto` int(10) NOT NULL,
  `productos_descri` varchar(45) NOT NULL,
  `productos_preciocliente` float NOT NULL,
  `productos_precioproveedor` float NOT NULL,
  `cantidadcomprada` int(10) NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contado`
--

CREATE TABLE `contado` (
  `productos_idproducto` int(10) NOT NULL,
  `productos_descri` varchar(45) NOT NULL,
  `productos_preciocliente` float NOT NULL,
  `cantidad` int(10) NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `productos_idproducto` int(11) NOT NULL,
  `productos_descri` varchar(45) NOT NULL,
  `disponible` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `idpersonal` int(10) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `fechanacimiento` varchar(45) NOT NULL,
  `puesto` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproducto` int(10) NOT NULL,
  `descri` varchar(45) NOT NULL,
  `preciocliente` float NOT NULL,
  `precioproveedor` float NOT NULL,
  `cantidad` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproducto`, `descri`, `preciocliente`, `precioproveedor`, `cantidad`) VALUES
(1, 'Crema cabello', 50, 30, 40);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `apartado`
--
ALTER TABLE `apartado`
  ADD PRIMARY KEY (`idapartado`),
  ADD KEY `fk_apartado_productos` (`productos_idproducto`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idcompras`),
  ADD KEY `fk_compras_productos` (`productos_idproducto`,`productos_descri`,`productos_preciocliente`,`productos_precioproveedor`);

--
-- Indices de la tabla `contado`
--
ALTER TABLE `contado`
  ADD KEY `fk_contado_productos` (`productos_idproducto`,`productos_descri`,`productos_preciocliente`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD KEY `fk_inventario_productos` (`productos_idproducto`,`productos_descri`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`idpersonal`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproducto`,`descri`,`preciocliente`,`precioproveedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `apartado`
--
ALTER TABLE `apartado`
  MODIFY `idapartado` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idcompras` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `idpersonal` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idproducto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `apartado`
--
ALTER TABLE `apartado`
  ADD CONSTRAINT `fk_apartado_productos` FOREIGN KEY (`productos_idproducto`) REFERENCES `productos` (`idproducto`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras` 
ADD CONSTRAINT `fk_compras_productos` FOREIGN KEY (`productos_idproducto`,`productos_descri`,`productos_preciocliente`,`productos_precioproveedor`) REFERENCES `productos` (`idproducto`, `descri`, `preciocliente`, `precioproveedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `contado`
--
ALTER TABLE `contado`
  ADD CONSTRAINT `fk_contado_productos` FOREIGN KEY (`productos_idproducto`,`productos_descri`,`productos_preciocliente`) REFERENCES `productos` (`idproducto`, `descri`, `preciocliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `fk_inventario_productos` FOREIGN KEY (`productos_idproducto`,`productos_descri`) REFERENCES `productos` (`idproducto`, `descri`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
