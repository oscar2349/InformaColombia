CREATE DATABASE  IF NOT EXISTS `db_backend_users` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_backend_users`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_backend_users
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tareas`
--

DROP TABLE IF EXISTS `tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tareas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('PENDIENTE','EN_PROGRESO','COMPLETADA') NOT NULL,
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tareas_usuario` (`usuario_id`),
  CONSTRAINT `fk_tareas_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareas`
--

LOCK TABLES `tareas` WRITE;
/*!40000 ALTER TABLE `tareas` DISABLE KEYS */;
INSERT INTO `tareas` VALUES (1,'Actualizar documentación','Actualizar los manuales de usuario del sistema.','2025-06-18 18:28:08','PENDIENTE',NULL),(2,'Revisar incidencias','Revisión del backlog de bugs reportados por QA.','2025-06-18 18:28:08','EN_PROGRESO',2),(3,'Crear endpoint /api/tareas','Desarrollar el nuevo endpoint REST para tareas.','2025-06-18 18:28:08','COMPLETADA',NULL),(4,'Diseñar base de datos','Esquema para módulo de tareas y comentarios.','2025-06-18 18:28:08','PENDIENTE',3),(5,'Reunión con cliente','Agendada para el martes a las 10 AM.','2025-06-18 18:28:08','EN_PROGRESO',NULL),(6,'Escribir pruebas unitarias','Cobertura para TaskService.','2025-06-18 18:28:08','PENDIENTE',2),(7,'Refactorizar controlador','Simplificar lógica del controlador de tareas.','2025-06-18 18:28:08','COMPLETADA',4),(8,'Actualizar dependencias','Actualizar Spring Boot a la versión más reciente.','2025-06-18 18:28:08','PENDIENTE',NULL),(9,'Revisión de código','Revisar PR #42 en GitHub.','2025-06-18 18:28:08','EN_PROGRESO',3),(10,'Optimizar consultas SQL','Evitar N+1 queries en el repositorio.','2025-06-18 18:28:08','COMPLETADA',20),(11,'Diseño de interfaz','Crear prototipo en Figma.','2025-06-18 18:28:08','PENDIENTE',5),(12,'Migrar a JDK 21','Actualizar compilador y probar compatibilidad.','2025-06-18 18:28:08','PENDIENTE',2),(13,'Configurar CI/CD','Integrar con GitHub Actions.','2025-06-18 18:28:08','EN_PROGRESO',NULL),(14,'Implementar seguridad','JWT + OAuth para endpoints protegidos.','2025-06-18 18:28:08','COMPLETADA',NULL),(15,'Test de integración','Cobertura para flujos completos de usuario.','2025-06-18 18:28:08','PENDIENTE',3),(16,'Agregar validaciones','Validar campos en el formulario de tareas.','2025-06-18 18:28:08','EN_PROGRESO',4),(17,'Redactar changelog','Lista de cambios para próxima release.','2025-06-18 18:28:08','PENDIENTE',NULL),(18,'Documentar API','Usar Swagger para documentación REST.','2025-06-18 18:28:08','COMPLETADA',2),(19,'Backup de base de datos','Backup completo semanal.','2025-06-18 18:28:08','COMPLETADA',50),(20,'Auditoría de seguridad','Revisión de accesos y roles.','2025-06-18 18:28:08','PENDIENTE',5),(22,'Tarea de prueba','Implementar paginación','2025-06-19 10:00:00','EN_PROGRESO',2),(23,'Tarea de prueba','Implementar paginación','2025-06-19 10:00:00','EN_PROGRESO',2),(24,'Tarea de prueba','Implementar paginación','2025-06-19 10:00:00','EN_PROGRESO',2),(25,'Tarea de prueba','Implementar paginación','2025-06-19 10:00:00','EN_PROGRESO',2),(26,'Tarea de prueba','Implementar paginación','2025-06-19 10:00:00','EN_PROGRESO',2),(27,'Tarea de prueba','Implementar paginación','2025-06-19 10:00:00','EN_PROGRESO',2);
/*!40000 ALTER TABLE `tareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'juan.perez@example.com','Pérez','Juan','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','admin'),(3,'eduardo1@gmail.com','Lopez','Eduardo','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Eduardo1'),(4,'maria2@gmail.com','Perez','Maria','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Maria2'),(5,'juan3@gmail.com','Rodriguez','Juan','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Juan3'),(6,'ana4@gmail.com','Gomez','Ana','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Ana4'),(7,'carlos5@gmail.com','Torres','Carlos','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Carlos5'),(8,'luis6@gmail.com','Martinez','Luis','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Luis6'),(9,'laura7@gmail.com','Fernandez','Laura','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Laura7'),(12,'andres10@gmail.com','Castro','Andres','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Andres10'),(13,'paula11@gmail.com','Vargas','Paula','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Paula11'),(14,'jorge12@gmail.com','Jimenez','Jorge','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Jorge12'),(15,'camila13@gmail.com','Rios','Camila','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Camila13'),(16,'felipe14@gmail.com','Navarro','Felipe','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Felipe14'),(17,'daniela15@gmail.com','Salazar','Daniela','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Daniela15'),(18,'juan.perez@example.com','Pérez','Juan','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','juan123'),(19,'juliana17@gmail.com','Ruiz','Juliana','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Juliana17'),(20,'ricardo18@gmail.com','Pineda','Ricardo','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Ricardo18'),(21,'melissa19@gmail.com','Ortega','Melissa','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Melissa19'),(22,'sebastian20@gmail.com','Peña','Sebastian','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Sebastian20'),(23,'diana21@gmail.com','Moreno','Diana','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Diana21'),(24,'nicolas22@gmail.com','Suarez','Nicolas','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Nicolas22'),(25,'valentina23@gmail.com','Guerrero','Valentina','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Valentina23'),(26,'alejandro24@gmail.com','Silva','Alejandro','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Alejandro24'),(27,'manuela25@gmail.com','Cardenas','Manuela','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Manuela25'),(28,'mateo26@gmail.com','Cruz','Mateo','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Mateo26'),(29,'isabella27@gmail.com','Soto','Isabella','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Isabella27'),(30,'santiago28@gmail.com','Herrera','Santiago','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Santiago28'),(31,'mariana29@gmail.com','Rivera','Mariana','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Mariana29'),(32,'martin30@gmail.com','Vega','Martin','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Martin30'),(33,'susana31@gmail.com','Flores','Susana','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Susana31'),(34,'tomás32@gmail.com','Mendoza','Tomás','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Tomas32'),(35,'angela33@gmail.com','Ibarra','Angela','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Angela33'),(36,'roberto34@gmail.com','Campos','Roberto','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Roberto34'),(37,'yesica35@gmail.com','Acosta','Yesica','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Yesica35'),(38,'francisco36@gmail.com','Nieves','Francisco','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Francisco36'),(39,'carolina37@gmail.com','Reyes','Carolina','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Carolina37'),(40,'edwin38@gmail.com','Serrano','Edwin','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Edwin38'),(41,'soledad39@gmail.com','Montoya','Soledad','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Soledad39'),(42,'german40@gmail.com','Delgado','German','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','German40'),(43,'marcela41@gmail.com','Camargo','Marcela','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Marcela41'),(44,'gustavo42@gmail.com','Villegas','Gustavo','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Gustavo42'),(45,'lucia43@gmail.com','Zapata','Lucia','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Lucia43'),(46,'pedro44@gmail.com','Cortes','Pedro','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Pedro44'),(47,'adriana45@gmail.com','Rosales','Adriana','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Adriana45'),(48,'raul46@gmail.com','Barrios','Raul','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Raul46'),(49,'monica47@gmail.com','Espinosa','Monica','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Monica47'),(50,'julio48@gmail.com','Quintero','Julio','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Julio48'),(51,'viviana49@gmail.com','Cabrera','Viviana','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Viviana49'),(52,'samuel50@gmail.com','Palacios','Samuel','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS','Samuel50'),(53,'luz@example.com','Ramirez','Oscar','$2a$10$1qmF0w446R0KCAYrrlBPleVZBjSGcvsT2Rrr5HWzc/9gpMwsGREPC','80801893'),(54,'juan.perez@example.com','Pérez','Juan','$2a$10$RPe6PmYI6AorWkiccTY.JexUCn66qRhhTmiZWCNcb7UvwM9ao9GQi','juanByCript'),(55,'juan.perez@example.com','Pérez','Juan','$2a$10$l9PW4D7aXNAMWb/BYZ64e.PhlMwwwmxTOalWpOfmqDiFsopEjYIwi','juanByCript'),(56,'juan.perez@example.com','Pérez','Juan','$2a$10$IYNMkJb3wsr6dHLCCFhmcudAezVMgNb639j0/LG70NYJKkMycj/sy','juanByCript'),(57,'luz@example.com','Ramirez','Oscar','rtrt','80801893'),(58,'juan.perez@example.com','Pérez','Juan','secreto123','juan123'),(59,'juan.perez@example.com','Pérez','Juan','$2a$10$0UsQx/MZMYEi.ODsiu/3r.q1Zu/TFyo2Kmbrgx4BYEV.sPepmw49i','juan123'),(60,'juan.perez@example.com','Pérez','Juan','$2a$10$.16Yle8GFU6B1dV0duK0muy3h7PXgizjGzN4zVc2F0EQUlRWufVo6','juan123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  UNIQUE KEY `UKq3r1u8cne2rw2hkr899xuh7vj` (`user_id`,`role_id`),
  KEY `fk_roles_idx` (`role_id`),
  CONSTRAINT `fk_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `fk_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (58,1),(2,2),(3,2),(18,2),(58,2),(59,2),(60,2);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-19 12:05:32
