-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 08, 2017 at 12:31 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apsonline`
--

-- --------------------------------------------------------

--
-- Table structure for table `CARGA`
--

CREATE TABLE `CARGA` (
  `id` int(11) NOT NULL,
  `descricao` varchar(20) DEFAULT NULL,
  `responsavel` int(11) NOT NULL,
  `transportador` int(11) NOT NULL,
  `tipo_carga` varchar(1) NOT NULL,
  `tempotransporte` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `CARGO`
--

CREATE TABLE `CARGO` (
  `id` char(1) NOT NULL,
  `cargo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CARGO`
--

INSERT INTO `CARGO` (`id`, `cargo`) VALUES
('1', 'Operador'),
('2', 'Cliente');

-- --------------------------------------------------------

--
-- Table structure for table `CONTA_USUARIO`
--

CREATE TABLE `CONTA_USUARIO` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `login` varchar(30) NOT NULL,
  `senha` varchar(30) NOT NULL,
  `tipoacesso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CONTA_USUARIO`
--

INSERT INTO `CONTA_USUARIO` (`matricula`, `nome`, `login`, `senha`, `tipoacesso`) VALUES
(12345, NULL, 'newzko', 'svenska7', 2),
(12350, 'Tomcat', 'tom', 'tom001', 1);

-- --------------------------------------------------------

--
-- Table structure for table `DEPARTAMENTO`
--

CREATE TABLE `DEPARTAMENTO` (
  `id` char(1) NOT NULL,
  `departamento` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `DEPARTAMENTO`
--

INSERT INTO `DEPARTAMENTO` (`id`, `departamento`) VALUES
('1', 'Controle de Cargas'),
('2', 'RH'),
('3', 'Seg da Informação'),
('4', 'Cliente');

-- --------------------------------------------------------

--
-- Table structure for table `EMBARCACAO`
--

CREATE TABLE `EMBARCACAO` (
  `id` int(11) NOT NULL,
  `descricao` varchar(40) NOT NULL,
  `fabricante` varchar(15) NOT NULL,
  `ano_fab` int(11) NOT NULL,
  `tamanho` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `PESSOA`
--

CREATE TABLE `PESSOA` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `rg` varchar(12) DEFAULT NULL,
  `cpf_cnpj` varchar(18) NOT NULL,
  `status` char(1) NOT NULL,
  `tipo` char(1) NOT NULL,
  `tipo_emp` char(1) NOT NULL,
  `depto` char(1) DEFAULT NULL,
  `cargo` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PESSOA`
--

INSERT INTO `PESSOA` (`matricula`, `nome`, `endereco`, `telefone`, `email`, `rg`, `cpf_cnpj`, `status`, `tipo`, `tipo_emp`, `depto`, `cargo`) VALUES
(12345, 'Gabriel Tavares de Souza', 'Avenida Paulista, 900', '+55119876432', 'tavares.gabri@gmail.com', '355034402', '41184754721', '1', '1', '1', '4', '2'),
(12346, 'User 2', 'Avenida Paulista, 900', '+55119876432', 'user@java.sun.com', '450601936', '41184754721', '1', '1', '1', '4', '2'),
(12350, 'Tomcat', 'Avenida Paulista, 900', '+55119876432', 'tom@apache.com', '275466401', '12.293.951/0001-85', '1', '2', '2', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `PORTE_EMBARCACAO`
--

CREATE TABLE `PORTE_EMBARCACAO` (
  `id` int(11) NOT NULL,
  `tamanho` varchar(12) NOT NULL,
  `gasto_combustivel` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PORTE_EMBARCACAO`
--

INSERT INTO `PORTE_EMBARCACAO` (`id`, `tamanho`, `gasto_combustivel`) VALUES
(1, 'Mto Pequeno', 'Pouco ou zero'),
(2, 'Pequeno', 'Pouco a Médio'),
(3, 'Médio', 'Médio a alto'),
(4, 'Grande', 'Alto a Mto Alto'),
(5, 'Muito Grande', 'Extrem Alto');

-- --------------------------------------------------------

--
-- Table structure for table `STATUS`
--

CREATE TABLE `STATUS` (
  `tipo` char(1) NOT NULL,
  `descricao` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `STATUS`
--

INSERT INTO `STATUS` (`tipo`, `descricao`) VALUES
('1', 'Ativo'),
('2', 'Inativo'),
('3', 'Desligado'),
('4', 'Ferias'),
('5', 'Licenca');

-- --------------------------------------------------------

--
-- Table structure for table `TIPO_EMP`
--

CREATE TABLE `TIPO_EMP` (
  `id` char(1) NOT NULL,
  `tipo_emp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TIPO_EMP`
--

INSERT INTO `TIPO_EMP` (`id`, `tipo_emp`) VALUES
('1', 'Cliente'),
('2', 'Funcionario');

-- --------------------------------------------------------

--
-- Table structure for table `TIPO_PESSOA`
--

CREATE TABLE `TIPO_PESSOA` (
  `tipo` char(1) NOT NULL,
  `descricao` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TIPO_PESSOA`
--

INSERT INTO `TIPO_PESSOA` (`tipo`, `descricao`) VALUES
('1', 'PF'),
('2', 'PJ');

-- --------------------------------------------------------

--
-- Table structure for table `TIPO_USUARIO`
--

CREATE TABLE `TIPO_USUARIO` (
  `tipo` int(11) NOT NULL,
  `descricao` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TIPO_USUARIO`
--

INSERT INTO `TIPO_USUARIO` (`tipo`, `descricao`) VALUES
(1, 'Admin'),
(2, 'Usuario');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CARGA`
--
ALTER TABLE `CARGA`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `CARGO`
--
ALTER TABLE `CARGO`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `CONTA_USUARIO`
--
ALTER TABLE `CONTA_USUARIO`
  ADD PRIMARY KEY (`login`),
  ADD KEY `fk_conta_usuario_tipo_usuario` (`tipoacesso`),
  ADD KEY `fk_conta_usuario_pessoa` (`matricula`);

--
-- Indexes for table `DEPARTAMENTO`
--
ALTER TABLE `DEPARTAMENTO`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `EMBARCACAO`
--
ALTER TABLE `EMBARCACAO`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `PESSOA`
--
ALTER TABLE `PESSOA`
  ADD PRIMARY KEY (`matricula`),
  ADD UNIQUE KEY `matricula` (`matricula`),
  ADD UNIQUE KEY `matricula_2` (`matricula`),
  ADD UNIQUE KEY `rg` (`rg`),
  ADD UNIQUE KEY `rg_2` (`rg`),
  ADD KEY `fk_pessoa_status` (`status`),
  ADD KEY `fk_pessoa_tipo` (`tipo`),
  ADD KEY `fk_pessoa_tipo_emp` (`tipo_emp`),
  ADD KEY `fk_pessoa_departamento` (`depto`),
  ADD KEY `fk_pessoa_cargo` (`cargo`);

--
-- Indexes for table `PORTE_EMBARCACAO`
--
ALTER TABLE `PORTE_EMBARCACAO`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `STATUS`
--
ALTER TABLE `STATUS`
  ADD PRIMARY KEY (`tipo`);

--
-- Indexes for table `TIPO_EMP`
--
ALTER TABLE `TIPO_EMP`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `TIPO_PESSOA`
--
ALTER TABLE `TIPO_PESSOA`
  ADD PRIMARY KEY (`tipo`);

--
-- Indexes for table `TIPO_USUARIO`
--
ALTER TABLE `TIPO_USUARIO`
  ADD PRIMARY KEY (`tipo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `PESSOA`
--
ALTER TABLE `PESSOA`
  MODIFY `matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12351;
--
-- AUTO_INCREMENT for table `TIPO_USUARIO`
--
ALTER TABLE `TIPO_USUARIO`
  MODIFY `tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `CONTA_USUARIO`
--
ALTER TABLE `CONTA_USUARIO`
  ADD CONSTRAINT `fk_conta_usuario_pessoa` FOREIGN KEY (`matricula`) REFERENCES `PESSOA` (`matricula`),
  ADD CONSTRAINT `fk_conta_usuario_tipo_usuario` FOREIGN KEY (`tipoacesso`) REFERENCES `TIPO_USUARIO` (`tipo`);

--
-- Constraints for table `PESSOA`
--
ALTER TABLE `PESSOA`
  ADD CONSTRAINT `fk_pessoa_cargo` FOREIGN KEY (`cargo`) REFERENCES `CARGO` (`id`),
  ADD CONSTRAINT `fk_pessoa_departamento` FOREIGN KEY (`depto`) REFERENCES `DEPARTAMENTO` (`id`),
  ADD CONSTRAINT `fk_pessoa_status` FOREIGN KEY (`status`) REFERENCES `STATUS` (`tipo`),
  ADD CONSTRAINT `fk_pessoa_tipo` FOREIGN KEY (`tipo`) REFERENCES `TIPO_PESSOA` (`tipo`),
  ADD CONSTRAINT `fk_pessoa_tipo_emp` FOREIGN KEY (`tipo_emp`) REFERENCES `TIPO_EMP` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
