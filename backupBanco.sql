-- --------------------------------------------------------
-- Servidor:                     localhost
-- Versão do servidor:           5.7.24 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para consultorio
CREATE DATABASE IF NOT EXISTS `consultorio` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `consultorio`;

-- Copiando estrutura para tabela consultorio.consulta
CREATE TABLE IF NOT EXISTS `consulta` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `horario` timestamp NOT NULL,
  `medico_id` bigint(20) unsigned NOT NULL,
  `paciente_id` bigint(20) unsigned NOT NULL,
  `motivo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `historico` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consulta_medico_id_foreign` (`medico_id`),
  KEY `consulta_paciente_id_foreign` (`paciente_id`),
  CONSTRAINT `consulta_medico_id_foreign` FOREIGN KEY (`medico_id`) REFERENCES `pessoa` (`id`),
  CONSTRAINT `consulta_paciente_id_foreign` FOREIGN KEY (`paciente_id`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela consultorio.consulta: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
REPLACE INTO `consulta` (`id`, `horario`, `medico_id`, `paciente_id`, `motivo`, `historico`, `status`, `created_at`, `updated_at`) VALUES
	(2, '2021-06-26 22:16:00', 6, 1, 'TESTANDO', 'eafasfas                  adsegasa', 'Realizado', '2021-06-11 01:13:20', '2021-06-11 01:13:20'),
	(3, '2021-06-23 16:30:00', 7, 8, 'APENAS TESTANDO', 'mais um teste', 'Retorno', '2021-06-11 19:26:12', '2021-06-11 19:26:12'),
	(4, '2021-06-23 16:30:00', 7, 8, 'APENAS TESTANDO', 'mais um teste', 'Retorno', '2021-06-11 19:26:40', '2021-06-11 19:26:40'),
	(5, '2021-06-23 16:30:00', 7, 8, 'APENAS TESTANDO', 'mais um teste', 'Retorno', '2021-06-11 19:27:12', '2021-06-11 19:27:12'),
	(6, '2021-06-23 16:30:00', 7, 8, 'APENAS TESTANDO', 'mais um teste', 'Retorno', '2021-06-11 19:27:34', '2021-06-11 19:27:34'),
	(7, '2021-06-23 16:30:00', 7, 8, 'APENAS TESTANDO', 'mais um teste', 'Retorno', '2021-06-11 19:27:58', '2021-06-11 19:27:58'),
	(8, '2021-06-23 16:30:00', 7, 8, 'APENAS TESTANDO', 'mais um teste', 'Retorno', '2021-06-11 19:28:48', '2021-06-11 19:28:48'),
	(9, '2021-06-23 16:30:00', 7, 8, 'APENAS TESTANDO', 'mais um teste', 'Retorno', '2021-06-11 19:29:17', '2021-06-11 19:29:17');
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela consultorio.failed_jobs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.medico
CREATE TABLE IF NOT EXISTS `medico` (
  `id` bigint(20) unsigned NOT NULL,
  `crm` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `especialidade` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `medico_id_foreign` FOREIGN KEY (`id`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela consultorio.medico: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
REPLACE INTO `medico` (`id`, `crm`, `especialidade`, `created_at`, `updated_at`) VALUES
	(5, '2', 'cardiologista', '2021-06-10 22:06:42', '2021-06-10 22:06:42'),
	(6, '3', 'clinico geral', '2021-06-10 22:06:42', '2021-06-10 22:06:42'),
	(7, '7', 'reumatologista', '2021-06-10 22:06:42', '2021-06-10 22:06:42');
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela consultorio.migrations: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(15, '2014_10_12_000000_create_users_table', 1),
	(16, '2014_10_12_100000_create_password_resets_table', 1),
	(17, '2019_08_19_000000_create_failed_jobs_table', 1),
	(18, '2021_06_10_213814_consulta', 1),
	(19, '2021_06_10_214712_pessoa', 1),
	(20, '2021_06_10_214952_medico', 1),
	(21, '2021_06_10_224750_alter_fk_consulta', 1),
	(22, '2021_06_10_225026_alter_fk_medico', 1),
	(23, '2021_06_10_235623_alter_fk_consulta_paciente', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela consultorio.password_resets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.pessoa
CREATE TABLE IF NOT EXISTS `pessoa` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_nasc` timestamp NOT NULL,
  `senha` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acesso` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela consultorio.pessoa: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
REPLACE INTO `pessoa` (`id`, `nome`, `cpf`, `telefone`, `data_nasc`, `senha`, `acesso`, `created_at`, `updated_at`) VALUES
	(1, 'zezin', '111.111.111-11', '1234-5678', '2001-12-03 00:00:00', '11111111', 'p', '2021-06-10 22:03:55', '2021-06-10 22:03:55'),
	(2, 'pedrin', '111.111.111-11', '1234-5678', '2001-12-03 00:00:00', '11111111', 'p', '2021-06-10 22:03:55', '2021-06-10 22:03:55'),
	(3, 'gui', '111.111.111-11', '1234-5678', '2001-12-03 00:00:00', '11111111', 'a', '2021-06-10 22:03:55', '2021-06-10 22:03:55'),
	(4, 'lice', '111.111.111-11', '1234-5678', '2001-12-03 00:00:00', '11111111', 'a', '2021-06-10 22:03:55', '2021-06-10 22:03:55'),
	(5, 'carla', '111.111.111-11', '1234-5678', '2001-12-03 00:00:00', '11111111', 'm', '2021-06-10 22:03:55', '2021-06-10 22:03:55'),
	(6, 'gel', '111.111.111-11', '1234-5678', '2001-12-03 00:00:00', '11111111', 'm', '2021-06-10 22:03:55', '2021-06-10 22:03:55'),
	(7, 'maria', '111.111.111-11', '1234-5678', '2001-12-03 00:00:00', '11111111', 'm', '2021-06-10 22:03:55', '2021-06-10 22:03:55'),
	(8, 'robert', '111.111.111-11', '1234-5678', '2001-12-03 00:00:00', '11111111', 'p', '2021-06-10 22:03:55', '2021-06-10 22:03:55');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela consultorio.users: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
