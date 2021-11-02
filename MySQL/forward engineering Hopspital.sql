-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`physician`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`physician` (
  `employeeid` INT NOT NULL,
  `name` TEXT(20) NULL,
  `position` TEXT(20) NULL,
  `ssn` INT NULL,
  PRIMARY KEY (`employeeid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pateients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pateients` (
  `ssn integer` INT NOT NULL COMMENT 'Patient id column',
  `name` TEXT(25) NULL,
  `Addres` TEXT(45) NULL,
  `phone` TEXT(10) NULL,
  `insurance id` INT NULL,
  `pcp` INT NULL,
  PRIMARY KEY (`ssn integer`),
  INDEX `fk_patieint_physician_idx` (`pcp` ASC) VISIBLE,
  CONSTRAINT `fk_patieint_physician`
    FOREIGN KEY (`pcp`)
    REFERENCES `mydb`.`physician` (`employeeid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`nurse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`nurse` (
  `employeeid` INT NOT NULL,
  `name` TEXT(20) NULL,
  `position` TEXT(20) NULL,
  `registerd` TINYINT NULL,
  `ssn` INT NULL,
  PRIMARY KEY (`employeeid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Appointment` (
  `Appointmentid` INT NOT NULL,
  `Patient` INT NULL,
  `prepnurse` INT NULL,
  `physician` INT NULL,
  `start_dt_time` TIMESTAMP(6) NULL,
  `end_dt_time` TIMESTAMP(6) NULL,
  `examinationroom` TEXT(10) NULL,
  PRIMARY KEY (`Appointmentid`),
  INDEX `fk_apt_to_patient_idx` (`Patient` ASC) VISIBLE,
  INDEX `fk_apt_nurse_idx` (`prepnurse` ASC) VISIBLE,
  INDEX `fk_apt_physician_idx` (`physician` ASC) VISIBLE,
  CONSTRAINT `fk_apt_to_patient`
    FOREIGN KEY (`Patient`)
    REFERENCES `mydb`.`Pateients` (`ssn integer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_apt_nurse`
    FOREIGN KEY (`prepnurse`)
    REFERENCES `mydb`.`nurse` (`employeeid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_apt_physician`
    FOREIGN KEY (`physician`)
    REFERENCES `mydb`.`physician` (`employeeid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
check(end_dt_time > start_dt_time))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`medication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medication` (
  `code` INT NOT NULL,
  `name` TEXT(20) NULL,
  `brand` TEXT(20) NULL,
  `description` TEXT(45) NULL,
  PRIMARY KEY (`code`),
check(brand != "cipla"),
check(brand != "gsk"))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Prescribes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Prescribes` (
  `Physician` INT NOT NULL,
  `pateint` INT NOT NULL,
  `medication` INT NOT NULL,
  `date` TIMESTAMP(6) NOT NULL check(date <=sysdate()),
  `Appointment` INT NULL,
  `dose` TEXT(45) NULL,
  PRIMARY KEY (`Physician`, `pateint`, `medication`, `date`),
  INDEX `fk_prescribe_pateint_idx` (`pateint` ASC) VISIBLE,
  INDEX `fk_prescribe_apt_idx` (`Appointment` ASC) VISIBLE,
  INDEX `fk_prescribe_medication_idx` (`medication` ASC) VISIBLE,
  CONSTRAINT `fk_prescribe_pateint`
    FOREIGN KEY (`pateint`)
    REFERENCES `mydb`.`Pateients` (`ssn integer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prescribe_physician`
    FOREIGN KEY (`Physician`)
    REFERENCES `mydb`.`physician` (`employeeid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prescribe_apt`
    FOREIGN KEY (`Appointment`)
    REFERENCES `mydb`.`Appointment` (`Appointmentid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prescribe_medication`
    FOREIGN KEY (`medication`)
    REFERENCES `mydb`.`medication` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`department` (
  `departmentid` INT NOT NULL,
  `name` TEXT(20) NULL,
  `head` INT NULL,
  PRIMARY KEY (`departmentid`),
  INDEX `fk_department_physician_idx` (`head` ASC) VISIBLE,
  CONSTRAINT `fk_department_physician`
    FOREIGN KEY (`head`)
    REFERENCES `mydb`.`physician` (`employeeid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Affliated with`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Affliated with` (
  `Physician` INT NOT NULL,
  `Department id` INT NOT NULL,
  `Primary Affliation` TINYINT NULL,
  PRIMARY KEY (`Physician`, `Department id`),
  INDEX `fk_affiliated_department_idx` (`Department id` ASC) VISIBLE,
  CONSTRAINT `fk_affiliated_physician`
    FOREIGN KEY (`Physician`)
    REFERENCES `mydb`.`physician` (`employeeid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_affiliated_department`
    FOREIGN KEY (`Department id`)
    REFERENCES `mydb`.`department` (`departmentid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`block`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`block` (
  `blockfloor` INT NOT NULL,
  `blockcode` INT NOT NULL,
  `on_call_nurse` INT NOT NULL,
  `on_call_blockfloor` INT NOT NULL,
  `on_call_blockcode` INT NOT NULL,
  `on_call_on_call_start` TIMESTAMP(6) NOT NULL,
  `on_call_on_call_end` TIMESTAMP(6) NOT NULL,
  `on_call_nurse1` INT NOT NULL,
  `on_call_blockfloor1` INT NOT NULL,
  `on_call_blockcode1` INT NOT NULL,
  `on_call_on_call_start1` TIMESTAMP(6) NOT NULL,
  `on_call_on_call_end1` TIMESTAMP(6) NOT NULL,
  PRIMARY KEY (`blockfloor`, `blockcode`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`procedure`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`procedure` (
  `code` INT NOT NULL,
  `name` TEXT(20) NULL,
  `cost` REAL NULL,
  PRIMARY KEY (`code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`trainedin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`trainedin` (
  `physician` INT NOT NULL,
  `treatment` INT NOT NULL,
  `certificationdate` DATE NULL,
  `certificationexpire` DATE NULL,
  PRIMARY KEY (`physician`, `treatment`),
  INDEX `fk_trainedin_procedure_idx` (`treatment` ASC) VISIBLE,
  CONSTRAINT `fk_tainedin_physician`
    FOREIGN KEY (`physician`)
    REFERENCES `mydb`.`physician` (`employeeid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trainedin_procedure`
    FOREIGN KEY (`treatment`)
    REFERENCES `mydb`.`procedure` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`room` (
  `roomnumber` INT NOT NULL,
  `roomtype` TEXT(20) NULL,
  `blockfloor` INT NULL,
  `blockcode` INT NULL,
  `unavailable` TINYINT NULL,
  `block_blockfloor` INT NOT NULL,
  `block_blockcode` INT NOT NULL,
  PRIMARY KEY (`roomnumber`),
  INDEX `fk_room_bloack_idx` (`blockfloor` ASC, `blockcode` ASC) VISIBLE,
  CONSTRAINT `fk_room_bloack`
    FOREIGN KEY (`blockfloor` , `blockcode`)
    REFERENCES `mydb`.`block` (`blockfloor` , `blockcode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`stay`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`stay` (
  `stayid` INT NOT NULL,
  `patient` INT NULL,
  `room` INT NULL,
  `start_time` TIMESTAMP(6) NULL,
  `end_time` TIMESTAMP(6) NULL,
  PRIMARY KEY (`stayid`),
  INDEX `fk_stay_patients_idx` (`patient` ASC) VISIBLE,
  INDEX `fk_stay_room_idx` (`room` ASC) VISIBLE,
  CONSTRAINT `fk_stay_patients`
    FOREIGN KEY (`patient`)
    REFERENCES `mydb`.`Pateients` (`ssn integer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stay_room`
    FOREIGN KEY (`room`)
    REFERENCES `mydb`.`room` (`roomnumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
check(end_time>start_time))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`undergoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`undergoes` (
  `patient` INT NOT NULL,
  `procedure` INT NOT NULL,
  `stay` INT NOT NULL,
  `date` TIMESTAMP(6) NOT NULL,
  `physician` INT NULL,
  `assistingNurse` INT NULL,
  PRIMARY KEY (`patient`, `procedure`, `stay`, `date`),
  INDEX `fk_undergoes_nurse_idx` (`assistingNurse` ASC) VISIBLE,
  INDEX `fk_undergoes_stay_idx` (`stay` ASC) VISIBLE,
  INDEX `fk_undergoes_physician_idx` (`physician` ASC) VISIBLE,
  INDEX `fk_undergoes_procedure_idx` (`procedure` ASC) VISIBLE,
  CONSTRAINT `fk_undergoes_patient`
    FOREIGN KEY (`patient`)
    REFERENCES `mydb`.`Pateients` (`ssn integer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_undergoes_nurse`
    FOREIGN KEY (`assistingNurse`)
    REFERENCES `mydb`.`nurse` (`employeeid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_undergoes_stay`
    FOREIGN KEY (`stay`)
    REFERENCES `mydb`.`stay` (`stayid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_undergoes_physician`
    FOREIGN KEY (`physician`)
    REFERENCES `mydb`.`physician` (`employeeid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_undergoes_procedure`
    FOREIGN KEY (`procedure`)
    REFERENCES `mydb`.`procedure` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`on_call`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`on_call` (
  `nurse` INT NOT NULL,
  `blockfloor` INT NOT NULL,
  `blockcode` INT NOT NULL,
  `on_call_start` TIMESTAMP(6) NOT NULL,
  `on_call_end` TIMESTAMP(6) NOT NULL,
  PRIMARY KEY (`nurse`, `blockfloor`, `blockcode`, `on_call_start`, `on_call_end`),
  INDEX `fk_on_call_block_idx` (`blockfloor` ASC, `blockcode` ASC) VISIBLE,
  CONSTRAINT `fk_on_call_block`
    FOREIGN KEY (`blockfloor` , `blockcode`)
    REFERENCES `mydb`.`block` (`blockfloor` , `blockcode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_on_call_nurse`
    FOREIGN KEY (`nurse`)
    REFERENCES `mydb`.`nurse` (`employeeid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
check((time_to_sec(timediff(on_call_start, on_call_end))/3600) <= 8))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
