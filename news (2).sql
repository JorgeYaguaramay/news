-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2024 at 03:16 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacto`
--

CREATE TABLE `contacto` (
  `idcontacto` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mensaje` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacto`
--

INSERT INTO `contacto` (`idcontacto`, `username`, `email`, `mensaje`) VALUES
(1, 'Carlos', 'carlos@example.com', 'Mensaje de contacto de Carlos.'),
(2, 'Maria', 'maria@example.com', 'Mensaje de contacto de Maria.'),
(3, 'Juan', 'juan@example.com', 'Mensaje de contacto de Juan.'),
(4, 'Ana', 'ana@example.com', 'Mensaje de contacto de Ana.'),
(5, 'Luis', 'luis@example.com', 'Mensaje de contacto de Luis.'),
(6, 'Elena', 'elena@example.com', 'Mensaje de contacto de Elena.'),
(7, 'Pedro', 'pedro@example.com', 'Mensaje de contacto de Pedro.');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `idlogin` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`idlogin`, `username`, `password`) VALUES
(1, 'Carlos', 'password123'),
(2, 'Maria', 'password456'),
(3, 'Juan', 'password789'),
(4, 'Ana', 'password101'),
(5, 'Luis', 'password102'),
(6, 'Elena', 'password103'),
(7, 'Pedro', 'password104');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `username`, `date`, `title`, `text`) VALUES
(1, 'Carlos', '27/6/2024', 'Creación de página', 'Vistas HTML creadas usando MVC.'),
(2, 'Maria', '28/6/2024', 'Actualización de página', 'Nuevas características añadidas.'),
(3, 'Juan', '29/6/2024', 'Error corregido', 'Se corrigió un error en el código.'),
(4, 'Ana', '30/6/2024', 'Lanzamiento de producto', 'Nuevo producto lanzado al mercado.'),
(5, 'Luis', '01/7/2024', 'Mantenimiento programado', 'Mantenimiento programado para el servidor.'),
(6, 'Elena', '02/7/2024', 'Nueva alianza', 'Se firmó una nueva alianza estratégica.'),
(7, 'Pedro', '03/7/2024', 'Evento próximo', 'Se anunció un nuevo evento para la próxima semana.');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`idusuario`, `username`, `email`, `password`) VALUES
(1, 'Carlos', 'carlos@example.com', 'password123'),
(2, 'Maria', 'maria@example.com', 'password456'),
(3, 'Juan', 'juan@example.com', 'password789'),
(4, 'Ana', 'ana@example.com', 'password101'),
(5, 'Luis', 'luis@example.com', 'password102'),
(6, 'Elena', 'elena@example.com', 'password103'),
(7, 'Pedro', 'pedro@example.com', 'password104');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`idcontacto`),
  ADD KEY `fk_contacto_usuario_username` (`username`),
  ADD KEY `fk_contacto_usuario_email` (`email`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`idlogin`),
  ADD KEY `fk_login_usuario` (`username`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_news_username` (`username`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacto`
--
ALTER TABLE `contacto`
  MODIFY `idcontacto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `idlogin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contacto`
--
ALTER TABLE `contacto`
  ADD CONSTRAINT `fk_contacto_usuario_email` FOREIGN KEY (`email`) REFERENCES `usuario` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_contacto_usuario_username` FOREIGN KEY (`username`) REFERENCES `usuario` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `fk_login_usuario` FOREIGN KEY (`username`) REFERENCES `usuario` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `fk_news_username` FOREIGN KEY (`username`) REFERENCES `usuario` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
