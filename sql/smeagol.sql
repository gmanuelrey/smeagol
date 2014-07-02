-- MySQL Script generated by MySQL Workbench
-- 07/01/14 20:53:01
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema smeagol
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `smeagol` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `smeagol` ;

-- -----------------------------------------------------
-- Table `smeagol`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smeagol`.`role` (
  `type` VARCHAR(30) NOT NULL,
  `description` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`type`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `smeagol`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smeagol`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `name` VARCHAR(100) NULL,
  `surname` VARCHAR(100) NULL,
  `email` VARCHAR(150) NOT NULL,
  `active` INT(1) NULL,
  `last_login` DATETIME NULL,
  `modified` DATETIME NULL,
  `role_type` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_role1_idx` (`role_type` ASC),
  CONSTRAINT `fk_user_role1`
    FOREIGN KEY (`role_type`)
    REFERENCES `smeagol`.`role` (`type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `smeagol`.`node_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smeagol`.`node_type` (
  `idnode_type` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idnode_type`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `smeagol`.`node`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smeagol`.`node` (
  `idnode` INT NOT NULL AUTO_INCREMENT,
  `node_type_idnode_type` INT NOT NULL,
  `title` VARCHAR(250) NOT NULL,
  `content` TEXT NOT NULL,
  `url` VARCHAR(250) NOT NULL,
  `user_id` INT NOT NULL,
  `created` DATETIME NULL,
  `modified` DATETIME NULL,
  PRIMARY KEY (`idnode`),
  INDEX `fk_node_node_type_idx` (`node_type_idnode_type` ASC),
  INDEX `fk_node_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_node_node_type`
    FOREIGN KEY (`node_type_idnode_type`)
    REFERENCES `smeagol`.`node_type` (`idnode_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_node_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `smeagol`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;