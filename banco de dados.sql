-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: belodestino3
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_91fcfd99kg1af67rjv08heu1q` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `Cpf_Cli` varchar(11) NOT NULL,
  `Nome_Cli` varchar(50) NOT NULL,
  `Email_Cli` varchar(50) NOT NULL,
  `Telefone_Cli` varchar(11) NOT NULL,
  PRIMARY KEY (`Cpf_Cli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `Cod_Departamento` int NOT NULL AUTO_INCREMENT,
  `Nome_Departamento` varchar(15) NOT NULL,
  `Cod_Unid` int NOT NULL,
  `nome` varchar(15) NOT NULL,
  PRIMARY KEY (`Cod_Departamento`),
  KEY `Cod_Unid` (`Cod_Unid`),
  CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`Cod_Unid`) REFERENCES `empresa` (`Cod_Unid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destino`
--

DROP TABLE IF EXISTS `destino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destino` (
  `Id_Destino` int NOT NULL AUTO_INCREMENT,
  `Nome_Destino` varchar(20) NOT NULL,
  `Preco_Destino` double NOT NULL,
  `Categoria_Destino` varchar(20) NOT NULL,
  `Qtd_Disponivel` int NOT NULL,
  `Condicao` varchar(20) NOT NULL DEFAULT 'Sem desconto',
  PRIMARY KEY (`Id_Destino`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destino`
--

LOCK TABLES `destino` WRITE;
/*!40000 ALTER TABLE `destino` DISABLE KEYS */;
INSERT INTO `destino` VALUES (1,'RECIFE',500,'NACIONAL',250,'Sem desconto'),(2,'PORTO DE GALINHAS',650,'NACIONAL',300,'Sem desconto'),(3,'SALVADOR',700,'NACIONAL',320,'Sem desconto'),(4,'RIO DE JANEIRO',889,'NACIONAL',155,'Sem desconto'),(5,'SÃO PAULO',729,'NACIONAL',189,'Sem desconto'),(6,'LONDRES',1250,'INTERNACIONAL',50,'Sem desconto'),(7,'PARIS',1559,'INTERNACIONAL',75,'Sem desconto'),(8,'LISBOA',1500,'INTERNACIONAL',120,'Sem desconto');
/*!40000 ALTER TABLE `destino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destinos`
--

DROP TABLE IF EXISTS `destinos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destinos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `categoria` varchar(20) DEFAULT NULL,
  `condicao` varchar(20) DEFAULT NULL,
  `data_ida` date NOT NULL,
  `data_volta` date DEFAULT NULL,
  `destino` varchar(20) NOT NULL,
  `embarque` varchar(20) NOT NULL,
  `preco` decimal(19,2) DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinos`
--

LOCK TABLES `destinos` WRITE;
/*!40000 ALTER TABLE `destinos` DISABLE KEYS */;
/*!40000 ALTER TABLE `destinos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `Cnpj` varchar(14) DEFAULT '11111111111111',
  `Razao_Social` varchar(20) DEFAULT 'Go To Viagens',
  `Nome_Fantasia` varchar(30) DEFAULT 'Agência de Viagens Go To',
  `Cod_Unid` int NOT NULL AUTO_INCREMENT,
  `Unidade` varchar(20) NOT NULL,
  `Telefone` varchar(15) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Endereco` varchar(50) NOT NULL,
  PRIMARY KEY (`Cod_Unid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fale_conosco`
--

DROP TABLE IF EXISTS `fale_conosco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fale_conosco` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `data_contato` date DEFAULT NULL,
  `data_resposta` date DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `mensagem` varchar(200) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fale_conosco`
--

LOCK TABLES `fale_conosco` WRITE;
/*!40000 ALTER TABLE `fale_conosco` DISABLE KEYS */;
/*!40000 ALTER TABLE `fale_conosco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `Mat_Func` int NOT NULL AUTO_INCREMENT,
  `Nome_Func` varchar(50) NOT NULL,
  `Cargo_Func` varchar(20) NOT NULL,
  `Salario_Func` double NOT NULL DEFAULT '0',
  `Cod_Departamento` int NOT NULL,
  `matricula` bigint NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `data_admissao` date NOT NULL,
  `data_demissao` date DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `salario` decimal(19,2) NOT NULL,
  `cargo_id_fk` bigint NOT NULL,
  PRIMARY KEY (`Mat_Func`),
  UNIQUE KEY `UK_rxosr8731eb3gbnlbt2mqfan8` (`cpf`),
  KEY `Cod_Departamento` (`Cod_Departamento`),
  KEY `FKlxfbfx8w9nn3t4rurn74k66r0` (`cargo_id_fk`),
  CONSTRAINT `FKlxfbfx8w9nn3t4rurn74k66r0` FOREIGN KEY (`cargo_id_fk`) REFERENCES `cargo` (`id`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`Cod_Departamento`) REFERENCES `departamento` (`Cod_Departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passagem`
--

DROP TABLE IF EXISTS `passagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passagem` (
  `Id_Passagem` int NOT NULL AUTO_INCREMENT,
  `Quantidade` int NOT NULL,
  `Id_Destino` int NOT NULL,
  PRIMARY KEY (`Id_Passagem`),
  KEY `Id_Destino` (`Id_Destino`),
  CONSTRAINT `passagem_ibfk_1` FOREIGN KEY (`Id_Destino`) REFERENCES `destino` (`Id_Destino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passagem`
--

LOCK TABLES `passagem` WRITE;
/*!40000 ALTER TABLE `passagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `passagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `Num_Pedido` int NOT NULL AUTO_INCREMENT,
  `Data_Pedido` date NOT NULL,
  `Mat_Func` int NOT NULL,
  `idUsuario` int NOT NULL,
  `PrecoTotal` double NOT NULL,
  `Forma_Pag` varchar(20) NOT NULL DEFAULT 'Cartão de Crédito',
  `statusPedido` varchar(20) DEFAULT 'Em processamento',
  `id_pedido` bigint NOT NULL,
  `forma_pagamento` varchar(20) NOT NULL,
  `preco_total` decimal(19,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `destino_id` bigint DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`Num_Pedido`),
  KEY `Mat_Func` (`Mat_Func`),
  KEY `idUsuario` (`idUsuario`),
  KEY `FK7f8a0ruffhmcos4kvtuyylapp` (`destino_id`),
  CONSTRAINT `FK7f8a0ruffhmcos4kvtuyylapp` FOREIGN KEY (`destino_id`) REFERENCES `destinos` (`id`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`Mat_Func`) REFERENCES `funcionario` (`Mat_Func`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabalhe_conosco`
--

DROP TABLE IF EXISTS `trabalhe_conosco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabalhe_conosco` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cargo` varchar(15) NOT NULL,
  `curriculo` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabalhe_conosco`
--

LOCK TABLES `trabalhe_conosco` WRITE;
/*!40000 ALTER TABLE `trabalhe_conosco` DISABLE KEYS */;
/*!40000 ALTER TABLE `trabalhe_conosco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidade`
--

DROP TABLE IF EXISTS `unidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidade` (
  `cod_unidade` bigint NOT NULL AUTO_INCREMENT,
  `bairro` varchar(20) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `cidade` varchar(15) NOT NULL,
  `complemento` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `rua` varchar(20) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  PRIMARY KEY (`cod_unidade`),
  UNIQUE KEY `UK_sybmsv2h2ot3cskn81y82g38a` (`cep`),
  UNIQUE KEY `UK_srkl9l04deftdvdtel96lw5hd` (`email`),
  UNIQUE KEY `UK_qb849dysiaug9hm77b9puawvp` (`nome`),
  UNIQUE KEY `UK_7yk81i8ubkic6q7tlreqjucmb` (`telefone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade`
--

LOCK TABLES `unidade` WRITE;
/*!40000 ALTER TABLE `unidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `telefone` varchar(11) DEFAULT '',
  `email` varchar(50) NOT NULL,
  `senha` varchar(12) NOT NULL,
  `dataCadastro` date DEFAULT NULL,
  `dataAtualizacaoCadastro` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-15 16:53:07
