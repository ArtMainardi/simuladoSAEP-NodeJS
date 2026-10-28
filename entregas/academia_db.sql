-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema db_academia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_academia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_academia` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `db_academia` ;

-- -----------------------------------------------------
-- Table `db_academia`.`AGENDAMENTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_academia`.`AGENDAMENTOS` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_academia`.`ALUNO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_academia`.`ALUNO` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `cpf_criptografado` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_academia`.`PLANOS_DE_TREINO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_academia`.`PLANOS_DE_TREINO` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` TEXT NULL DEFAULT NULL,
  `fk_usuario` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_planos_usuarios` (`fk_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_planos_usuarios`
    FOREIGN KEY (`fk_usuario`)
    REFERENCES `db_academia`.`ALUNO` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_academia`.`USUARIOS_AGENDAMENTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_academia`.`USUARIOS_AGENDAMENTOS` (
  `USUARIOS_id` INT NOT NULL,
  `AGENDAMENTOS_id` INT NOT NULL,
  PRIMARY KEY (`USUARIOS_id`, `AGENDAMENTOS_id`),
  INDEX `fk_ua_agendamentos` (`AGENDAMENTOS_id` ASC) VISIBLE,
  CONSTRAINT `fk_ua_agendamentos`
    FOREIGN KEY (`AGENDAMENTOS_id`)
    REFERENCES `db_academia`.`AGENDAMENTOS` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ua_usuarios`
    FOREIGN KEY (`USUARIOS_id`)
    REFERENCES `db_academia`.`ALUNO` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_academia`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_academia`.`USUARIO` (
  `id` INT NOT NULL,
  `username` VARCHAR(45) NULL,
  `senha_criptografada` VARCHAR(460) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
