-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Maio-2022 às 18:50
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `order_management`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `client`
--

CREATE TABLE `client` (
  `client_id` int(10) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `postcode` varchar(6) DEFAULT NULL,
  `phonenumber` varchar(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `client`
--

INSERT INTO `client` (`client_id`, `firstname`, `lastname`, `address`, `postcode`, `phonenumber`, `email`) VALUES
(1, 'Yuri', 'Amorim', '200 Drive Road', 'WN12NV', '7893251469', 'yuri@gmail.com'),
(2, 'Fernando', 'Passaia', '201 Drive Road', 'WN13NV', '7223251412', 'fernando@gmail.com'),
(3, 'Maria', 'Madalena', '202 Drive Road', 'WN14NV', '7553251410', 'maria@gmail.com'),
(4, 'Joao', 'Azevedo', '203 Drive Road', 'WN15NV', '7443251455', 'joao@gmail.com'),
(5, 'Pedro', 'Henrique', '204 Drive Road', 'WN16NV', '7663251488', 'pedro@gmail.com'),
(6, 'Thiago', 'Silva', '205 Drive Road', 'WN17NV', '7883251499', 'thiago@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `order_client`
--

CREATE TABLE `order_client` (
  `order_id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `price` decimal(9,2) DEFAULT 0.00,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `order_client`
--

INSERT INTO `order_client` (`order_id`, `client_id`, `date`, `price`, `quantity`) VALUES
(1, 2, '2022-05-08 14:58:13', '15.00', 1),
(2, 1, '2022-05-08 14:58:13', '45.00', 2),
(3, 3, '2022-05-08 14:58:13', '600.00', 1),
(4, 4, '2022-05-08 14:58:13', '10.00', 5),
(5, 5, '2022-05-08 14:58:13', '30.00', 2),
(6, 6, '2022-05-08 14:58:13', '250.00', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `order_items`
--

CREATE TABLE `order_items` (
  `order_items_id` int(11) NOT NULL,
  `client_order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `value` decimal(9,2) DEFAULT 0.00,
  `quantity` int(11) DEFAULT NULL,
  `total` decimal(9,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `order_items`
--

INSERT INTO `order_items` (`order_items_id`, `client_order_id`, `product_id`, `value`, `quantity`, `total`) VALUES
(1, 1, 1, '15.00', 1, '15.00'),
(2, 2, 2, '45.00', 2, '90.00'),
(3, 3, 3, '600.00', 1, '600.00'),
(4, 4, 4, '10.00', 5, '50.00'),
(5, 5, 5, '30.00', 2, '60.00'),
(6, 6, 6, '250.00', 1, '250.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `price` decimal(9,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `product`
--

INSERT INTO `product` (`product_id`, `description`, `price`) VALUES
(1, 'keyboard', '15.00'),
(2, 'printer', '45.00'),
(3, 'notbook', '600.00'),
(4, 'mouse', '10.00'),
(5, 'headfone', '30.00'),
(6, 'monitor', '250.00');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`);

--
-- Índices para tabela `order_client`
--
ALTER TABLE `order_client`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Índices para tabela `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_items_id`),
  ADD KEY `client_order_id` (`client_order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Índices para tabela `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `order_client`
--
ALTER TABLE `order_client`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `order_client`
--
ALTER TABLE `order_client`
  ADD CONSTRAINT `order_client_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`);

--
-- Limitadores para a tabela `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`client_order_id`) REFERENCES `order_client` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
