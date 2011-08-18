-- phpMyAdmin SQL Dump
-- version 3.3.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 14, 2011 at 12:46 PM
-- Server version: 5.0.91
-- PHP Version: 5.2.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `grad5app`
--

-- --------------------------------------------------------

--
-- Table structure for table `applicants`
--

CREATE TABLE IF NOT EXISTS `applicants` (
  `applicant_id` int(10) unsigned NOT NULL auto_increment COMMENT 'PS: required',
  `given_name` varchar(30) NOT NULL COMMENT 'PS: required',
  `middle_name` varchar(30) NOT NULL,
  `family_name` varchar(30) NOT NULL COMMENT 'PS: required',
  `suffix` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `login_email` varchar(100) NOT NULL,
  `login_email_confirmed` tinyint(1) NOT NULL default '0',
  `login_email_code` varchar(40) NOT NULL,
  `forgot_password_code` varchar(40) NOT NULL,
  `password` varchar(155) NOT NULL,
  `alternate_name` varchar(55) NOT NULL,
  `mailing_addr1` varchar(55) NOT NULL,
  `mailing_addr2` varchar(55) NOT NULL,
  `mailing_city` varchar(55) NOT NULL,
  `mailing_state` varchar(55) NOT NULL,
  `mailing_postal` varchar(15) default NULL,
  `primary_phone` varchar(30) NOT NULL COMMENT 'PS: 10 char xxxxxxxxxx',
  `secondary_phone` varchar(30) NOT NULL COMMENT 'PS: 10 char xxxxxxxxxx',
  `permanent_addr1` varchar(55) NOT NULL COMMENT 'PS: required',
  `permanent_addr2` varchar(55) NOT NULL,
  `permanent_city` varchar(30) NOT NULL COMMENT 'PS: required',
  `permanent_state` varchar(30) NOT NULL,
  `permanent_postal` varchar(15) default NULL,
  `date_of_birth` varchar(10) NOT NULL COMMENT 'PS: mm/dd/yyyy',
  `birth_city` varchar(30) NOT NULL,
  `birth_state` varchar(30) NOT NULL,
  `birth_country` char(3) NOT NULL,
  `gender` char(1) NOT NULL COMMENT 'PS: M/F',
  `us_citizen` tinyint(1) NOT NULL COMMENT 'PS: 1/2 (1=US)',
  `us_state` char(2) NOT NULL,
  `residency_status` varchar(30) NOT NULL,
  `green_card_link` varchar(128) NOT NULL,
  `country_of_citizenship` char(3) NOT NULL,
  `social_security_number` text NOT NULL COMMENT 'PS: pad with 0s',
  `ethnicity_amind` varchar(10) NOT NULL,
  `ethnicity_asian` varchar(10) NOT NULL,
  `ethnicity_black` varchar(10) NOT NULL,
  `ethnicity_hispa` varchar(10) NOT NULL,
  `ethnicity_pacif` varchar(10) NOT NULL,
  `ethnicity_white` varchar(10) NOT NULL,
  `ethnicity_unspec` varchar(10) NOT NULL,
  `languages_repeatable` int(3) NOT NULL default '1',
  `previousschools_repeatable` int(3) NOT NULL default '1',
  `english_years_school` varchar(10) NOT NULL,
  `english_years_univ` varchar(10) NOT NULL,
  `english_years_private` varchar(10) NOT NULL,
  `international_repeatable` int(3) NOT NULL default '1',
  `present_occupation` varchar(55) NOT NULL,
  `appliedprograms_repeatable` int(3) NOT NULL default '1',
  `start_semester` varchar(10) NOT NULL COMMENT 'PS: required SPRING/FALL/SUMMER',
  `start_year` int(4) NOT NULL COMMENT 'PS: required yyyy',
  `academic_program` varchar(10) NOT NULL COMMENT 'PS: required',
  `academic_plan` varchar(10) NOT NULL COMMENT 'PS: required',
  `academic_major` varchar(30) NOT NULL,
  `academic_minor` varchar(30) NOT NULL,
  `student_type` varchar(5) NOT NULL COMMENT 'PS: IS/OS/INTNL/NEBHE',
  `academic_load` char(1) NOT NULL COMMENT 'PS: F/P (fulltime/parttime)',
  `desired_housing` varchar(10) NOT NULL COMMENT 'PS: On Campus/Off Campus',
  `undergrad_gpa` decimal(3,2) NOT NULL,
  `postbacc_gpa` decimal(3,2) NOT NULL,
  `preenroll_courses` text NOT NULL,
  `extracurricular_activities` text NOT NULL,
  `academic_honors` text NOT NULL,
  `employment_history` text NOT NULL,
  `dviolations_repeatable` int(3) NOT NULL default '1',
  `cviolations_repeatable` int(3) NOT NULL default '1',
  `resume_link` varchar(128) NOT NULL,
  `essay_link` varchar(128) NOT NULL,
  `gre_repeatable` int(3) NOT NULL default '1',
  `gmat_date` varchar(7) NOT NULL,
  `gmat_score` int(3) NOT NULL,
  `mat_date` varchar(7) NOT NULL,
  `mat_score` int(3) NOT NULL,
  `prev_um_grad_app_date` varchar(7) NOT NULL,
  `prev_um_grad_app_dept` varchar(30) NOT NULL,
  `prev_um_grad_degree` varchar(30) NOT NULL,
  `prev_um_grad_degree_date` varchar(7) NOT NULL,
  `prev_um_grad_withdraw_date` varchar(7) NOT NULL,
  `desire_assistantship_dept` varchar(30) NOT NULL,
  `desire_financial_aid` char(1) NOT NULL COMMENT 'PS: Y/Blank',
  `um_correspond_details` text NOT NULL,
  `extrareferences_repeatable` int(3) NOT NULL default '0',
  `reference1_first` varchar(30) NOT NULL,
  `reference1_last` varchar(30) NOT NULL,
  `reference1_email` varchar(30) NOT NULL,
  `reference1_relationship` varchar(10) NOT NULL,
  `reference1_phone` varchar(18) NOT NULL,
  `reference1_addr1` varchar(55) NOT NULL,
  `reference1_addr2` varchar(55) NOT NULL,
  `reference1_city` varchar(30) NOT NULL,
  `reference1_state` varchar(30) NOT NULL,
  `reference1_postal` varchar(15) default NULL,
  `reference1_country` varchar(3) NOT NULL,
  `reference2_first` varchar(32) NOT NULL,
  `reference2_last` varchar(32) NOT NULL,
  `reference2_email` varchar(64) NOT NULL,
  `reference2_relationship` varchar(10) NOT NULL,
  `reference2_phone` varchar(18) NOT NULL,
  `reference2_addr1` varchar(55) NOT NULL,
  `reference2_addr2` varchar(55) NOT NULL,
  `reference2_city` varchar(32) NOT NULL,
  `reference2_state` varchar(32) NOT NULL,
  `reference2_postal` varchar(15) default NULL,
  `reference2_country` varchar(3) NOT NULL,
  `reference3_first` varchar(32) NOT NULL,
  `reference3_last` varchar(32) NOT NULL,
  `reference3_email` varchar(64) NOT NULL,
  `reference3_relationship` varchar(10) NOT NULL,
  `reference3_phone` varchar(18) NOT NULL,
  `reference3_addr1` varchar(55) NOT NULL,
  `reference3_addr2` varchar(55) NOT NULL,
  `reference3_city` varchar(32) NOT NULL,
  `reference3_state` varchar(32) NOT NULL,
  `reference3_postal` varchar(15) default NULL,
  `reference3_country` varchar(3) NOT NULL,
  `application_start_date` date NOT NULL,
  `application_edit_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `application_submit_date` date NOT NULL COMMENT 'PS: mm/dd/yyyy',
  `application_signed_date` date NOT NULL,
  `application_fee_payment_status` char(1) NOT NULL default 'N' COMMENT 'PS: Y/N',
  `application_fee_transaction_type` varchar(6) NOT NULL COMMENT 'PS: Online/blank',
  `application_fee_transaction_date` date NOT NULL COMMENT 'PS: mm/dd/yyyy',
  `application_fee_transaction_amount` decimal(5,2) NOT NULL COMMENT 'PS: xxx.xx',
  `application_fee_transaction_number` varchar(30) default NULL,
  `has_been_pushed` tinyint(1) NOT NULL,
  `has_been_submitted` tinyint(1) NOT NULL,
  `gmat_verbal` int(2) NOT NULL,
  `gmat_quantitative` int(2) NOT NULL,
  `mailing_perm` tinyint(1) default NULL,
  `english_primary` tinyint(1) default NULL,
  `international` tinyint(1) default NULL,
  `disciplinary_violation` tinyint(1) default NULL,
  `gre_taken` tinyint(1) default NULL,
  `gmat_taken` tinyint(1) default NULL,
  `gmat_reported` tinyint(1) default NULL,
  `mat_taken` tinyint(1) default NULL,
  `mat_reported` tinyint(1) default NULL,
  `prev_um_app` tinyint(1) default NULL,
  `prev_um_grad_app` tinyint(1) default NULL,
  `prev_um_grad_withdraw` tinyint(1) default NULL,
  `desire_assistantship` tinyint(1) default NULL,
  `apply_nebhe` tinyint(1) default NULL,
  `um_correspond` tinyint(1) default NULL,
  `waive_view_rights` tinyint(1) default NULL,
  `reference1_online` tinyint(1) default NULL,
  `reference2_online` tinyint(1) default NULL,
  `reference3_online` tinyint(1) default NULL,
  `application_signed` tinyint(1) default NULL,
  `accept_terms` tinyint(1) default NULL,
  `criminal_violation` tinyint(1) default NULL,
  `transaction_id` varchar(128) default NULL,
  `gmat_analytical` decimal(2,1) NOT NULL,
  `mailing_country` char(3) default NULL,
  `permanent_country` char(3) default NULL,
  `essay_file_name` varchar(70) default NULL,
  `resume_file_name` varchar(70) default NULL,
  PRIMARY KEY  (`applicant_id`),
  UNIQUE KEY `transaction_id` (`transaction_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=48 ;

--
-- Dumping data for table `applicants`
--

INSERT INTO `applicants` (`applicant_id`, `given_name`, `middle_name`, `family_name`, `suffix`, `email`, `login_email`, `login_email_confirmed`, `login_email_code`, `forgot_password_code`, `password`, `alternate_name`, `mailing_addr1`, `mailing_addr2`, `mailing_city`, `mailing_state`, `mailing_postal`, `primary_phone`, `secondary_phone`, `permanent_addr1`, `permanent_addr2`, `permanent_city`, `permanent_state`, `permanent_postal`, `date_of_birth`, `birth_city`, `birth_state`, `birth_country`, `gender`, `us_citizen`, `us_state`, `residency_status`, `green_card_link`, `country_of_citizenship`, `social_security_number`, `ethnicity_amind`, `ethnicity_asian`, `ethnicity_black`, `ethnicity_hispa`, `ethnicity_pacif`, `ethnicity_white`, `ethnicity_unspec`, `languages_repeatable`, `previousschools_repeatable`, `english_years_school`, `english_years_univ`, `english_years_private`, `international_repeatable`, `present_occupation`, `appliedprograms_repeatable`, `start_semester`, `start_year`, `academic_program`, `academic_plan`, `academic_major`, `academic_minor`, `student_type`, `academic_load`, `desired_housing`, `undergrad_gpa`, `postbacc_gpa`, `preenroll_courses`, `extracurricular_activities`, `academic_honors`, `employment_history`, `dviolations_repeatable`, `cviolations_repeatable`, `resume_link`, `essay_link`, `gre_repeatable`, `gmat_date`, `gmat_score`, `mat_date`, `mat_score`, `prev_um_grad_app_date`, `prev_um_grad_app_dept`, `prev_um_grad_degree`, `prev_um_grad_degree_date`, `prev_um_grad_withdraw_date`, `desire_assistantship_dept`, `desire_financial_aid`, `um_correspond_details`, `extrareferences_repeatable`, `reference1_first`, `reference1_last`, `reference1_email`, `reference1_relationship`, `reference1_phone`, `reference1_addr1`, `reference1_addr2`, `reference1_city`, `reference1_state`, `reference1_postal`, `reference1_country`, `reference2_first`, `reference2_last`, `reference2_email`, `reference2_relationship`, `reference2_phone`, `reference2_addr1`, `reference2_addr2`, `reference2_city`, `reference2_state`, `reference2_postal`, `reference2_country`, `reference3_first`, `reference3_last`, `reference3_email`, `reference3_relationship`, `reference3_phone`, `reference3_addr1`, `reference3_addr2`, `reference3_city`, `reference3_state`, `reference3_postal`, `reference3_country`, `application_start_date`, `application_edit_date`, `application_submit_date`, `application_signed_date`, `application_fee_payment_status`, `application_fee_transaction_type`, `application_fee_transaction_date`, `application_fee_transaction_amount`, `application_fee_transaction_number`, `has_been_pushed`, `has_been_submitted`, `gmat_verbal`, `gmat_quantitative`, `mailing_perm`, `english_primary`, `international`, `disciplinary_violation`, `gre_taken`, `gmat_taken`, `gmat_reported`, `mat_taken`, `mat_reported`, `prev_um_app`, `prev_um_grad_app`, `prev_um_grad_withdraw`, `desire_assistantship`, `apply_nebhe`, `um_correspond`, `waive_view_rights`, `reference1_online`, `reference2_online`, `reference3_online`, `application_signed`, `accept_terms`, `criminal_violation`, `transaction_id`, `gmat_analytical`, `mailing_country`, `permanent_country`, `essay_file_name`, `resume_file_name`) VALUES
(1, 'Joshua', '', 'Belanger', '', 'joshua.calvin.belanger@gmail.com', 'joshua.calvin.belanger@gmail.com', 1, '433766', '', '924e153b79dcc28d9186e3295d8aa14c30ee4d23', '', '', '', '', '', '', '', '', '189', '', 'asd', 'INT', '04401', '01/20/1990', '', '', '', 'M', 0, 'IN', 'resident', '', 'USA', '6³ŠÚ¾¡Àõìq¥Z¦êø', '', '', '', '', '', '', '', 1, 2, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, 'a', '', '', '', '', '', '', '', '', ';', '', 'b', 'b', '', '', '', '', '', '', '', ';', '', 'c', 'c', '', '', '', '', '', '', '', ';', '', '0000-00-00', '2010-12-19 01:27:23', '2010-12-24', '0000-00-00', 'N', '', '0000-00-00', 65.00, '0', 0, 0, 0, 0, NULL, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, 0, 0, NULL, 0.0, NULL, 'USA', NULL, NULL),
(2, 'Tim', '', 'Baker', '', 'timbone945@gmail.com', 'timbone945@gmail.com', 1, '487888', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', 'IT', '', '', '', '13', '', 'bow', 'IT', '345678912345', '02/28/2003', '', 'IT', '', '', 0, 'IT', 'US resident', '', 'USA', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 2, '', 0, '', 0, '', '', '', '', '', '', '', '', 2, 'Tim', 'Baker', 'timbone945@gmail.com', 'Family', '', '', '', '', 'IT', '', '', 'Tim', 'BakerB', 'timbone945@gmail.com', '', '', '', '', '', 'IT', '', 'BHS', 'Tim', 'BakerC', 'timbone945@gmail.com', '', '', '', '', '', 'IT', '', '', '0000-00-00', '2010-12-21 21:24:37', '2011-02-23', '0000-00-00', 'N', 'Online', '2011-01-27', 65.00, '*2*1295982476', 0, 0, 0, 0, 1, NULL, 0, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 1, NULL, 1, 0, NULL, 0.0, NULL, 'CAN', 'test.txt', 'test.txt'),
(3, 'Orville', '', 'Reddenbocker', '', 'joshua.e.mcgrath@gmail.com', 'joshua.e.mcgrath@gmail.com', 1, '723852', '', '261e4be27e3c714008c2ea33cd6a7cd65e312c66', '', '', '', '', '', '', '', '', '1', '', 'Penny ln.', 'ME', '04287', '01/24/1945', '', '', '', '', 0, 'ME', 'resident', '', 'USA', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, 'George', 'McFly', 'joshua.e.mcgrath@gmail.com', '', '', '', '', '', '', '', '', 'Marty', 'McFly', 'joshua.e.mcgrath@gmail.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '2010-12-23 13:38:59', '2011-01-04', '0000-00-00', 'N', '', '0000-00-00', 65.00, '0', 0, 0, 0, 0, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, 1, 0, NULL, 0.0, NULL, 'USA', NULL, NULL),
(4, 'Mike', 'D', 'Scott', '', 'mscott@umit.maine.edu', 'mscott@umit.maine.edu', 1, '199871', '', '27baf0d35165c998cf03579f5189a0cdd374c26b', '', '', '', '', '', '', '', '', '12 riverview st', '', 'veazie', 'ME', '04401', '08/20/1990', '', '', '', '', 0, 'ME', 'resident', '', 'USA', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, 'pete', 'davis', '', '', '', '', '', '', '', '', '', 'sally ', 'field', '', '', '', '', '', '', '', '', '', 'tim', 'carrier', '', '', '', '', '', '', '', '', '', '0000-00-00', '2010-12-28 16:22:05', '2010-12-28', '0000-00-00', 'N', '', '0000-00-00', 65.00, '0', 0, 0, 0, 0, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, 1, 0, NULL, 0.0, NULL, 'USA', NULL, NULL),
(5, 'tim', '', 'baker', '', 'timbone945@gmail.com', 'timbone945+grad9@gmail.com', 1, '502874', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', '', '', '', '13', '', 'bow', 'ME', '04287', '09/20/1988', '', '', '', '', 0, 'ME', 'resident', '', 'USA', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, 'ASend', 'A', 'timbone945@gmail.com', '', '', '', '', '', '', '', '', 'BNo', 'B', 'timbone945@gmail.com', '', '', '', '', '', '', '', '', 'CYes', 'C', 'timbone945@gmail.com', '', '', '', '', '', '', '', '', '0000-00-00', '2010-12-30 15:34:29', '2010-12-30', '0000-00-00', 'N', '', '0000-00-00', 65.00, '0', 0, 0, 0, 0, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 1, NULL, 1, 0, NULL, 0.0, NULL, 'USA', NULL, NULL),
(6, '', '', '', '', '', 'janet@maine.edu', 1, '487518', '', '67b6e2776d9c5a8c677fb9d523d536d102e77c34', '', '', '', '', '', '', '', '', '35 Wedgeport Rd', '', 'St John', 'NL', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '2011-01-04 13:50:47', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, '0', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, 'CAN', NULL, NULL),
(7, '', '', '', '', '', 'timbone945+grad11@gmail.com', 0, '935077', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '2011-01-11 13:42:04', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, '0', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(8, '', '', '', '', '', 'timbone945+grad12@gmail.com', 0, '763191', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '2011-01-11 16:11:14', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, '0', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(42, '', '', '', '', '', 'timothy.d.baker@umit.maine.edu', 0, '521626', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '0000-00-00', '2011-01-31 12:22:39', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(36, '', '', '', '', '', 'timothy.d.baker@umit.maine.du', 0, '99097', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '0000-00-00', '2011-01-24 13:54:58', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, '0', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(34, '', '', '', '', '', 'nathan.rocker@umit.maine.edu', 1, '868220', '', 'b2b8e5061a31e6ce0070e2af299234382b7803e6', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '0000-00-00', '2011-01-18 12:57:34', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, '0', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(35, '', '', '', '', '', 'narocker27@yahoo.com', 1, '924322', '', 'b2b8e5061a31e6ce0070e2af299234382b7803e6', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '0000-00-00', '2011-01-18 13:02:50', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, '0', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(18, '', '', '', '', '', 'timbone945+grad17@gmail.com', 1, '292237', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '2011-01-13 15:08:26', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, '0', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(19, '', '', '', '', '', 'timbone945+grad18@gmail.com', 1, '916584', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '2011-01-13 15:15:49', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, '0', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(20, '', '', '', '', '', 'timbone945+grad19@gmail.com', 0, '464969', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '2011-01-13 15:17:51', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, '0', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(21, '', '', '', '', '', 'timbone945+grad20@gmail.com', 0, '785081', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '2011-01-13 15:22:31', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, '0', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(22, '', '', '', '', '', 'timbone945+grad21@gmail.com', 0, '768338', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '2011-01-13 15:23:49', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, '0', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(23, '', '', '', '', '', 'timbone945+grad22@gmail.com', 0, '608803', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '2011-01-13 15:26:34', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, '0', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(24, '', '', '', '', '', 'timbone945+grad23@gmail.com', 0, '264854', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '2011-01-13 15:27:15', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, '0', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(25, '', '', '', '', '', 'timbone945+grad24@gmail.com', 1, '188186', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '2011-01-13 15:29:50', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, '0', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(26, '', '', '', '', '', 'timbone945+grad30@gmail.com', 0, '171019', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '2011-01-13 16:24:58', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, '0', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(27, '', '', '', '', '', 'timbone945+grad31@gmail.com', 0, '265165', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '2011-01-13 16:26:07', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, '0', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(28, '', '', '', '', '', 'timbone945+grad32@gmail.com', 0, '79916', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '2011-01-13 16:28:45', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, '0', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(29, '', '', '', '', '', 'timbone945+grad35@gmail.com', 0, '943967', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '2011-01-13 16:34:01', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, '0', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(30, '', '', '', '', '', 'timbone945+grad38@gmail.com', 0, '591037', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '2011-01-13 16:40:13', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, '0', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(31, '', '', '', '', '', 'timbone945+grad39@gmail.com', 0, '494769', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '2011-01-14 03:31:48', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, '0', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(32, '', '', '', '', '', 'timbone945+grad40@gmail.com', 0, '15731', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '2011-01-14 03:33:53', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, '0', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(33, '', '', '', '', '', 'timbone945+grad50@gmail.com', 0, '773316', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '0000-00-00', '2011-01-18 11:44:07', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, '0', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(39, '', '', '', '', '', 'timbone945+grad60@gmail.com', 1, '257438', 'a410a76c13517a746deb5ad592955bd33f0908c2', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '0000-00-00', '2011-01-25 17:43:06', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(38, 'Zev', '', 'Eisenberg', '', 'igeek1@gmail.com', 'igeek1@gmail.com', 1, '952859', '', '601f1889667efaebb33b8c12572835da3f027f78', '', '', '', '', '', NULL, '', '', '29 place', '', 'City', 'SC', '12345', '10/01/1988', '', '', '', '', 0, 'ME', 'US resident', '', 'USA', 'VÅ“š8C|?E(uË_ëÆW', '', '', '', '', '', '', '', 2, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 2, 'ZevOne', 'Eisenberg', 'igeek1@gmail.com', '', '', '', '', '', '', '', '', 'ZevTwo', 'Eisenberg', 'igeek1@gmail.com', '', '', '', '', '', '', NULL, '', 'ZevThree', 'Eisenberg', 'igeek1@gmail.com', '', '', '', '', '', '', NULL, '', '0000-00-00', '2011-01-25 14:57:01', '2011-01-25', '0000-00-00', 'N', '', '0000-00-00', 65.00, NULL, 0, 0, 0, 0, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, 1, 1, 1, 1, NULL, 1, 0, NULL, 0.0, NULL, 'USA', 'Recipes for Linda.rtf', 'Lorem Ipsum.rtf'),
(40, '', '', '', '', '', 'timbone945+grad61@gmail.com', 0, '453394', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '0000-00-00', '2011-01-25 17:44:10', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(43, '', '', '', '', '', 'timbone945+grad135@gmail.com', 1, '587785', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, 'a', 'a', '', '', '', '', '', '', '', NULL, '', 'a', 'a', '', '', '', '', '', '', '', NULL, '', 'a', 'a', '', '', '', '', '', '', '', NULL, '', '0000-00-00', '2011-02-02 11:27:06', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 65.00, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(44, '', '', '', '', '', 'timbone945+grad111@gmail.com', 1, '551315', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '0000-00-00', '2011-02-03 00:55:58', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(45, '', '', '', '', '', 'timbone945+grad112@gmail.com', 1, '432173', 'ca63aadc7dbbec8a12a05dbaedcf66ab816d4e42', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '0000-00-00', '2011-02-03 01:15:54', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(46, '', '', '', '', '', 'timbone945+grad2211@gmail.com', 1, '672239', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '0000-00-00', '2011-02-07 13:43:04', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL),
(47, '', '', '', '', '', 'timbone945+grad11231@gmail.com', 1, '63761', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '', '', '', NULL, '', '', '', '', '', '', NULL, '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '', '', '', 1, '', 1, '', 0, '', '', '', '', '', '', '', 0.00, 0.00, '', '', '', '', 1, 1, '', '', 1, '', 0, '', 0, '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '0000-00-00', '2011-02-07 15:50:56', '0000-00-00', '0000-00-00', 'N', '', '0000-00-00', 0.00, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `application_cost`
--

CREATE TABLE IF NOT EXISTS `application_cost` (
  `first_program` int(2) NOT NULL,
  `additional_programs` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `application_cost`
--

INSERT INTO `application_cost` (`first_program`, `additional_programs`) VALUES
(65, 10);

-- --------------------------------------------------------

--
-- Table structure for table `appliedprograms`
--

CREATE TABLE IF NOT EXISTS `appliedprograms` (
  `applicant_id` int(32) NOT NULL,
  `appliedprograms_id` int(32) NOT NULL,
  `academic_program` varchar(10) NOT NULL,
  `academic_plan` varchar(10) NOT NULL,
  `academic_dept_code` varchar(3) NOT NULL,
  `academic_major` varchar(30) NOT NULL,
  `academic_minor` varchar(30) NOT NULL,
  `student_type` varchar(5) NOT NULL,
  `start_semester` varchar(6) NOT NULL,
  `start_year` varchar(4) NOT NULL,
  `attendance_load` char(1) NOT NULL,
  PRIMARY KEY  (`applicant_id`,`appliedprograms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appliedprograms`
--

INSERT INTO `appliedprograms` (`applicant_id`, `appliedprograms_id`, `academic_program`, `academic_plan`, `academic_dept_code`, `academic_major`, `academic_minor`, `student_type`, `start_semester`, `start_year`, `attendance_load`) VALUES
(1, 1, 'HUDS', '', 'HUD', '', '', 'INTNL', 'FALL', '2010', 'F'),
(2, 1, 'AEPD', '', 'AEP', '', '', 'CAN', 'SUMMER', '2011', 'P'),
(3, 1, 'BLES', '', 'BLE', '', '', 'IS', 'FALL', '2012', 'F'),
(4, 1, 'SISS', '', 'SIS', '', '', 'IS', 'FALL', '2011', 'F'),
(5, 1, 'BMOD', '', 'BMO', '', '', 'NEBHE', 'SPRING', '2011', 'F'),
(6, 1, 'SPIA', '', 'GLP', '', '', '', '', '', ''),
(12, 1, 'CHES', '', 'CHE', '', '', 'IS', 'FALL', '2011', 'F'),
(14, 1, 'MAPS', '', 'MAP', '', '', 'IS', 'SPRING', '2011', 'F'),
(15, 1, '', '', '', '', '', '', '', '', ''),
(34, 1, '', '', '', '', '', '', '', '', ''),
(35, 1, '', '', '', '', '', '', '', '', ''),
(38, 1, 'BMOD', '', 'BMO', '', '', 'IS', 'FALL', '2012', 'F'),
(43, 1, 'BCHS', '', 'BCH', '', '', 'INTNL', 'FALL', '', 'F'),
(44, 1, '', '', 'CIE', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `cviolations`
--

CREATE TABLE IF NOT EXISTS `cviolations` (
  `applicant_id` int(10) unsigned NOT NULL,
  `cviolations_id` int(10) unsigned NOT NULL auto_increment,
  `cviolation_type` varchar(12) NOT NULL,
  `cviolation_date` varchar(7) NOT NULL,
  `cviolation_details` text NOT NULL,
  PRIMARY KEY  (`applicant_id`,`cviolations_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cviolations`
--

INSERT INTO `cviolations` (`applicant_id`, `cviolations_id`, `cviolation_type`, `cviolation_date`, `cviolation_details`) VALUES
(1, 1, '', '', ''),
(2, 1, '', '', ''),
(3, 1, '', '', ''),
(4, 1, '', '', ''),
(5, 1, '', '', ''),
(6, 1, '', '', ''),
(12, 1, '', '', ''),
(14, 1, '', '', ''),
(15, 1, '', '', ''),
(34, 1, '', '', ''),
(35, 1, '', '', ''),
(38, 1, '', '', ''),
(43, 1, '', '', ''),
(44, 1, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `dviolations`
--

CREATE TABLE IF NOT EXISTS `dviolations` (
  `applicant_id` int(10) unsigned NOT NULL,
  `dviolations_id` int(10) unsigned NOT NULL auto_increment,
  `dviolation_type` varchar(12) NOT NULL,
  `dviolation_date` varchar(7) NOT NULL,
  `dviolation_details` text NOT NULL,
  PRIMARY KEY  (`applicant_id`,`dviolations_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dviolations`
--

INSERT INTO `dviolations` (`applicant_id`, `dviolations_id`, `dviolation_type`, `dviolation_date`, `dviolation_details`) VALUES
(1, 1, '', '', ''),
(2, 1, '', '', ''),
(3, 1, '', '', ''),
(4, 1, '', '', ''),
(5, 1, '', '', ''),
(6, 1, '', '', ''),
(12, 1, '', '', ''),
(14, 1, '', '', ''),
(15, 1, '', '', ''),
(34, 1, '', '', ''),
(35, 1, '', '', ''),
(38, 1, '', '', ''),
(43, 1, '', '', ''),
(44, 1, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `extrareferences`
--

CREATE TABLE IF NOT EXISTS `extrareferences` (
  `applicant_id` int(32) NOT NULL,
  `extrareferences_id` int(32) NOT NULL,
  `reference_first` varchar(32) NOT NULL,
  `reference_last` varchar(32) NOT NULL,
  `reference_email` varchar(128) NOT NULL,
  `reference_relationship` varchar(10) NOT NULL,
  `reference_phone` varchar(18) NOT NULL,
  `reference_addr1` varchar(55) NOT NULL,
  `reference_addr2` varchar(55) NOT NULL,
  `reference_city` varchar(30) NOT NULL,
  `reference_state` varchar(30) NOT NULL,
  `reference_postal` varchar(15) default NULL,
  `reference_country` varchar(3) NOT NULL,
  `reference_online` tinyint(1) default NULL,
  PRIMARY KEY  (`applicant_id`,`extrareferences_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `extrareferences`
--

INSERT INTO `extrareferences` (`applicant_id`, `extrareferences_id`, `reference_first`, `reference_last`, `reference_email`, `reference_relationship`, `reference_phone`, `reference_addr1`, `reference_addr2`, `reference_city`, `reference_state`, `reference_postal`, `reference_country`, `reference_online`) VALUES
(2, 1, 'Extra Reference', 'Baker', 'timbone945@gmail.com', '', '', '', '', '', 'HI', '', '', 1),
(38, 1, 'ZevFour', 'Eisenberg', 'igeek1@gmail.com', '', '', '', '', '', '', NULL, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gre`
--

CREATE TABLE IF NOT EXISTS `gre` (
  `applicant_id` int(32) NOT NULL,
  `gre_id` int(32) NOT NULL,
  `gre_date` varchar(7) NOT NULL,
  `gre_verbal` int(3) NOT NULL,
  `gre_quantitative` int(3) NOT NULL,
  `gre_analytical` decimal(2,1) NOT NULL,
  `gre_subject` varchar(32) NOT NULL,
  `gre_reported` tinyint(1) default NULL,
  `gre_score` int(3) NOT NULL,
  PRIMARY KEY  (`applicant_id`,`gre_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gre`
--

INSERT INTO `gre` (`applicant_id`, `gre_id`, `gre_date`, `gre_verbal`, `gre_quantitative`, `gre_analytical`, `gre_subject`, `gre_reported`, `gre_score`) VALUES
(1, 1, '', 0, 0, 0.0, '', NULL, 0),
(2, 1, '', 0, 800, 5.0, 'BIO', 0, 900),
(2, 2, '', 0, 800, 9.9, '', NULL, 900),
(3, 1, '', 0, 0, 0.0, '', NULL, 0),
(4, 1, '', 0, 0, 0.0, '', NULL, 0),
(5, 1, '', 0, 0, 0.0, '', NULL, 0),
(6, 1, '', 0, 0, 0.0, '', NULL, 0),
(12, 1, '', 0, 0, 0.0, '', NULL, 0),
(14, 1, '', 0, 0, 0.0, '', NULL, 0),
(15, 1, '', 0, 0, 0.0, '', NULL, 0),
(34, 1, '', 0, 0, 0.0, '', NULL, 0),
(35, 1, '', 0, 0, 0.0, '', NULL, 0),
(38, 1, '', 0, 0, 0.0, '', NULL, 0),
(43, 1, '', 0, 0, 0.0, '', NULL, 0),
(44, 1, '', 0, 0, 0.0, '', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `international`
--

CREATE TABLE IF NOT EXISTS `international` (
  `applicant_id` int(10) unsigned NOT NULL,
  `international_id` int(10) unsigned NOT NULL auto_increment,
  `toefl_date` varchar(7) NOT NULL,
  `toefl_score` int(3) NOT NULL,
  `us_career` tinyint(1) NOT NULL,
  `us_career_details` text NOT NULL,
  `further_studies_details` text NOT NULL,
  `home_career_details` text NOT NULL,
  `finance_details` text NOT NULL,
  `us_contacts` text NOT NULL,
  `us_emergency_contact_name` varchar(55) NOT NULL,
  `us_emergency_contact_addr1` varchar(55) NOT NULL,
  `us_emergency_contact_addr2` varchar(55) NOT NULL,
  `us_emergency_contact_city` varchar(30) NOT NULL,
  `us_emergency_contact_state` char(2) NOT NULL,
  `us_emergency_contact_zip` varchar(15) default NULL,
  `us_emergency_contact_phone` varchar(30) NOT NULL,
  `us_emergency_contact_relationship` varchar(30) NOT NULL,
  `home_emergency_contact_name` varchar(55) NOT NULL,
  `home_emergency_contact_addr1` varchar(55) NOT NULL,
  `home_emergency_contact_addr2` varchar(55) NOT NULL,
  `home_emergency_contact_city` varchar(30) NOT NULL,
  `home_emergency_contact_state` varchar(30) NOT NULL,
  `home_emergency_contact_postal` varchar(15) default NULL,
  `home_emergency_contact_country` varchar(3) NOT NULL,
  `home_emergency_contact_phone` varchar(30) NOT NULL,
  `home_emergency_contact_relationship` varchar(30) NOT NULL,
  `toefl_taken` tinyint(1) default NULL,
  `toefl_reported` tinyint(1) default NULL,
  `further_studies` tinyint(1) default NULL,
  `home_career` tinyint(1) default NULL,
  PRIMARY KEY  (`applicant_id`,`international_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `international`
--

INSERT INTO `international` (`applicant_id`, `international_id`, `toefl_date`, `toefl_score`, `us_career`, `us_career_details`, `further_studies_details`, `home_career_details`, `finance_details`, `us_contacts`, `us_emergency_contact_name`, `us_emergency_contact_addr1`, `us_emergency_contact_addr2`, `us_emergency_contact_city`, `us_emergency_contact_state`, `us_emergency_contact_zip`, `us_emergency_contact_phone`, `us_emergency_contact_relationship`, `home_emergency_contact_name`, `home_emergency_contact_addr1`, `home_emergency_contact_addr2`, `home_emergency_contact_city`, `home_emergency_contact_state`, `home_emergency_contact_postal`, `home_emergency_contact_country`, `home_emergency_contact_phone`, `home_emergency_contact_relationship`, `toefl_taken`, `toefl_reported`, `further_studies`, `home_career`) VALUES
(1, 1, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(2, 1, '', 0, 0, '', '', '', '', '', '', '', '', '', 'IT', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(3, 1, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(4, 1, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(5, 1, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(6, 1, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(12, 1, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(14, 1, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(15, 1, '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(34, 1, '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', NULL, '', '', '', NULL, NULL, NULL, NULL),
(35, 1, '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', NULL, '', '', '', NULL, NULL, NULL, NULL),
(38, 1, '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', NULL, '', '', '', NULL, NULL, NULL, NULL),
(43, 1, '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', NULL, '', '', '', NULL, NULL, NULL, NULL),
(44, 1, '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', NULL, '', '', '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `applicant_id` int(32) unsigned NOT NULL,
  `languages_id` int(32) unsigned NOT NULL,
  `language` varchar(30) NOT NULL,
  `writing_proficiency` varchar(4) NOT NULL,
  `reading_proficiency` varchar(4) NOT NULL,
  `speaking_proficiency` varchar(4) NOT NULL,
  PRIMARY KEY  (`applicant_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`applicant_id`, `languages_id`, `language`, `writing_proficiency`, `reading_proficiency`, `speaking_proficiency`) VALUES
(1, 1, '', '', '', ''),
(2, 1, '', '', '', ''),
(3, 1, '', '', '', ''),
(4, 1, '', '', '', ''),
(5, 1, '', '', '', ''),
(6, 1, '', '', '', ''),
(12, 1, '', '', '', ''),
(14, 1, '', '', '', ''),
(15, 1, '', '', '', ''),
(34, 1, '', '', '', ''),
(35, 1, '', '', '', ''),
(38, 1, '', '', '', ''),
(43, 1, '', '', '', ''),
(44, 1, '', '', '', ''),
(38, 3, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `previousschools`
--

CREATE TABLE IF NOT EXISTS `previousschools` (
  `applicant_id` int(10) unsigned NOT NULL,
  `previousschools_id` int(10) unsigned NOT NULL auto_increment,
  `previous_schools_name` varchar(55) NOT NULL,
  `previous_schools_city` varchar(30) NOT NULL,
  `previous_schools_state` varchar(30) NOT NULL,
  `previous_schools_country` varchar(3) NOT NULL,
  `previous_schools_code` varchar(4) NOT NULL,
  `previous_schools_from_date` varchar(7) NOT NULL,
  `previous_schools_to_date` varchar(7) NOT NULL,
  `previous_schools_major` varchar(30) NOT NULL,
  `previous_schools_degree_earned` varchar(30) NOT NULL,
  `previous_schools_degree_date` varchar(7) NOT NULL,
  PRIMARY KEY  (`applicant_id`,`previousschools_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Previous Schools Attended' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `previousschools`
--

INSERT INTO `previousschools` (`applicant_id`, `previousschools_id`, `previous_schools_name`, `previous_schools_city`, `previous_schools_state`, `previous_schools_country`, `previous_schools_code`, `previous_schools_from_date`, `previous_schools_to_date`, `previous_schools_major`, `previous_schools_degree_earned`, `previous_schools_degree_date`) VALUES
(5, 1, '', '', '', '', '', '', '', '', '', ''),
(2, 1, '', '', 'IT', '', '', '', '', '', '', ''),
(3, 1, '', '', '', '', '', '', '', '', '', ''),
(4, 1, '', '', '', '', '', '', '', '', '', ''),
(1, 1, '', '', '', '', '', '', '', '', '', ''),
(6, 1, '', '', '', '', '', '', '', '', '', ''),
(12, 1, '', '', '', '', '', '', '', '', '', ''),
(14, 1, '', '', '', '', '', '', '', '', '', ''),
(15, 1, '', '', '', '', '', '', '', '', '', ''),
(34, 1, '', '', '', '', '', '', '', '', '', ''),
(35, 1, '', '', '', '', '', '', '', '', '', ''),
(38, 1, '', '', '', '', '', '', '', '', '', ''),
(43, 1, '', '', '', '', '', '', '', '', '', ''),
(44, 1, '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `progress`
--

CREATE TABLE IF NOT EXISTS `progress` (
  `applicant_id` int(10) NOT NULL,
  `structure_id` int(3) NOT NULL,
  `status` enum('INCOMPLETE','IN PROGRESS','PENDING','COMPLETE') NOT NULL default 'INCOMPLETE',
  `notes` varchar(512) NOT NULL,
  PRIMARY KEY  (`applicant_id`,`structure_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `progress`
--

INSERT INTO `progress` (`applicant_id`, `structure_id`, `status`, `notes`) VALUES
(1, 1, 'INCOMPLETE', ''),
(1, 2, 'INCOMPLETE', ''),
(1, 3, 'INCOMPLETE', ''),
(1, 4, 'INCOMPLETE', ''),
(1, 5, 'INCOMPLETE', ''),
(1, 6, 'INCOMPLETE', ''),
(2, 1, 'INCOMPLETE', ''),
(2, 2, 'INCOMPLETE', ''),
(2, 3, 'INCOMPLETE', ''),
(2, 4, 'INCOMPLETE', ''),
(2, 5, 'INCOMPLETE', ''),
(2, 6, 'INCOMPLETE', ''),
(3, 1, 'INCOMPLETE', ''),
(3, 2, 'INCOMPLETE', ''),
(3, 3, 'INCOMPLETE', ''),
(3, 4, 'INCOMPLETE', ''),
(3, 5, 'INCOMPLETE', ''),
(3, 6, 'INCOMPLETE', ''),
(4, 1, 'INCOMPLETE', ''),
(4, 2, 'INCOMPLETE', ''),
(4, 3, 'INCOMPLETE', ''),
(4, 4, 'INCOMPLETE', ''),
(4, 5, 'INCOMPLETE', ''),
(4, 6, 'INCOMPLETE', ''),
(5, 1, 'INCOMPLETE', ''),
(5, 2, 'INCOMPLETE', ''),
(5, 3, 'INCOMPLETE', ''),
(5, 4, 'INCOMPLETE', ''),
(5, 5, 'INCOMPLETE', ''),
(5, 6, 'INCOMPLETE', ''),
(6, 1, 'INCOMPLETE', ''),
(6, 2, 'INCOMPLETE', ''),
(6, 3, 'INCOMPLETE', ''),
(6, 4, 'INCOMPLETE', ''),
(6, 5, 'INCOMPLETE', ''),
(6, 6, 'INCOMPLETE', ''),
(12, 1, 'INCOMPLETE', ''),
(12, 2, 'INCOMPLETE', ''),
(12, 3, 'INCOMPLETE', ''),
(12, 4, 'INCOMPLETE', ''),
(12, 5, 'INCOMPLETE', ''),
(12, 6, 'INCOMPLETE', ''),
(14, 1, 'INCOMPLETE', ''),
(14, 2, 'INCOMPLETE', ''),
(14, 3, 'INCOMPLETE', ''),
(14, 4, 'INCOMPLETE', ''),
(14, 5, 'INCOMPLETE', ''),
(14, 6, 'INCOMPLETE', ''),
(15, 1, 'INCOMPLETE', ''),
(15, 2, 'INCOMPLETE', ''),
(15, 3, 'INCOMPLETE', ''),
(15, 4, 'INCOMPLETE', ''),
(15, 5, 'INCOMPLETE', ''),
(15, 6, 'INCOMPLETE', ''),
(34, 1, 'INCOMPLETE', ''),
(34, 2, 'INCOMPLETE', ''),
(34, 3, 'INCOMPLETE', ''),
(34, 4, 'INCOMPLETE', ''),
(34, 5, 'INCOMPLETE', ''),
(34, 6, 'INCOMPLETE', ''),
(35, 1, 'INCOMPLETE', ''),
(35, 2, 'INCOMPLETE', ''),
(35, 3, 'INCOMPLETE', ''),
(35, 4, 'INCOMPLETE', ''),
(35, 5, 'INCOMPLETE', ''),
(35, 6, 'INCOMPLETE', ''),
(38, 1, 'INCOMPLETE', ''),
(38, 2, 'INCOMPLETE', ''),
(38, 3, 'INCOMPLETE', ''),
(38, 4, 'INCOMPLETE', ''),
(38, 5, 'INCOMPLETE', ''),
(38, 6, 'INCOMPLETE', ''),
(43, 1, 'INCOMPLETE', ''),
(43, 2, 'INCOMPLETE', ''),
(43, 3, 'INCOMPLETE', ''),
(43, 4, 'INCOMPLETE', ''),
(43, 5, 'INCOMPLETE', ''),
(43, 6, 'INCOMPLETE', ''),
(44, 1, 'INCOMPLETE', ''),
(44, 2, 'INCOMPLETE', ''),
(44, 3, 'INCOMPLETE', ''),
(44, 4, 'INCOMPLETE', ''),
(44, 5, 'INCOMPLETE', ''),
(44, 6, 'INCOMPLETE', '');

-- --------------------------------------------------------

--
-- Table structure for table `structure`
--

CREATE TABLE IF NOT EXISTS `structure` (
  `id` int(3) NOT NULL auto_increment,
  `name` varchar(128) NOT NULL,
  `path` varchar(128) NOT NULL,
  `include` tinyint(1) NOT NULL,
  `order` int(3) unsigned default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `order` (`order`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `structure`
--

INSERT INTO `structure` (`id`, `name`, `path`, `include`, `order`) VALUES
(1, 'Application', '/', 1, 0),
(2, 'Personal Information', 'templates/personal.php', 1, 1),
(3, 'International', 'templates/international.php', 1, 2),
(4, 'Educational History', 'templates/history.php', 1, 3),
(5, 'Educational Objectives', 'templates/objectives.php', 1, 4),
(6, 'Letters of Recommendation', 'templates/recommendations.php', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `um_academic`
--

CREATE TABLE IF NOT EXISTS `um_academic` (
  `academic_index` int(8) NOT NULL auto_increment,
  `academic_program` varchar(10) NOT NULL,
  `academic_plan` varchar(10) NOT NULL,
  `academic_dept_code` varchar(3) NOT NULL,
  `academic_dept` varchar(64) NOT NULL,
  `academic_dept_heading` varchar(64) NOT NULL,
  `academic_degree` varchar(10) NOT NULL,
  `academic_degree_heading` varchar(4) NOT NULL,
  `description_app` varchar(30) NOT NULL,
  `description_list` varchar(30) NOT NULL,
  `nebhe_ct` varchar(1) NOT NULL,
  `nebhe_ma` varchar(1) NOT NULL,
  `nebhe_nh` varchar(1) NOT NULL,
  `nebhe_ri` varchar(1) NOT NULL,
  `nebhe_vt` varchar(1) NOT NULL,
  PRIMARY KEY  (`academic_index`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=136 ;

--
-- Dumping data for table `um_academic`
--

INSERT INTO `um_academic` (`academic_index`, `academic_program`, `academic_plan`, `academic_dept_code`, `academic_dept`, `academic_dept_heading`, `academic_degree`, `academic_degree_heading`, `description_app`, `description_list`, `nebhe_ct`, `nebhe_ma`, `nebhe_nh`, `nebhe_ri`, `nebhe_vt`) VALUES
(1, 'KPEME', 'KPE-MED', 'KPE', 'Kinesiology & Phys Edu', 'Kinesiology & Physical Education', 'MED', 'MEd', 'Kinesiology & Phys Edu-MED', 'Kinesiology & Phys Edu-MED', '', '', '', '', 'X'),
(2, 'ISYS', 'ISY-MS', 'ISY', 'Information Systems', 'Information Systems', 'MS', 'MS', 'Information Systems-MS', 'Information Systems-MS', 'X', 'X', 'X', 'X', 'X'),
(3, 'INTD', 'INT-PHD', 'INT', 'Interdisciplinary', 'Interdisciplinary', 'PHD', 'PhD', 'Interdisciplinary-PHD', 'Interdisciplinary-PHD', '', '', '', '', ''),
(4, 'IMMFA', 'IMD-MFA', 'IMD', 'Intermedia', 'Intermedia', 'MFA', 'MFA', 'Intermedia-MFA', 'Intermedia-MFA', 'X', 'X', 'X', 'X', 'X'),
(5, 'HUDS', 'HUD-MS', 'HUD', 'Human Development', 'Human Development', 'MS', 'MS', 'Human Development-MS', 'Human Development-MS', '', 'X', '', '', 'X'),
(6, 'HTYD', 'HTY-PHD', 'HTY', 'History', 'History', 'PHD', 'PhD', 'History-PHD', 'History-PHD', '', '', 'X', 'X', 'X'),
(7, 'HTYA', 'HTY-MA', 'HTY', 'History', 'History', 'MA', 'MA', 'History-MA', 'History-MA', '', '', '', '', ''),
(8, 'HELED', 'HEL-EDD', 'HEL', 'Higher Ed Leadership', 'Higher Education Leadership', 'EDD', 'EdD', 'Higher Ed Leadership-EDD', 'Higher Ed Leadership-EDD', 'X', 'X', 'X', 'X', ''),
(9, 'HEDME', 'HED-MED', 'HED', 'Higher Education', 'Higher Education', 'MED', 'MEd', 'Higher Education-MED', 'Higher Education-MED', '', '', '', '', ''),
(11, 'HEDCS', 'HED-CAS', 'HED', 'Higher Education', 'Higher Education', 'CAS', 'CAS', 'Higher Education-CAS', 'Higher Education-CAS', '', '', '', '', ''),
(12, 'HCLS', 'HCL-MS', 'HCL', 'Horticulture', 'Horticulture', 'MS', 'MS', 'Horticulture-MS', 'Horticulture-MS', '', '', '', '', ''),
(135, 'AEPD', 'AED-PHD', 'AEP', 'Anthropology and Environmental Policy', 'Anthropology and Environmental Policy', 'PHD', 'PhD', 'Anthropology/Envtl Policy-PhD', 'Anthropology/Envtl Policy-PhD', '', '', '', '', ''),
(16, 'FTYMF', 'FTY-MFOR', 'FTY', 'Forestry', 'Forestry', 'MFOR', 'MFOR', 'Forestry-MFOR', 'Forestry-MFOR', '', '', '', '', ''),
(17, 'FSNS', 'FSN-MS', 'FSN', 'Food Sci & Human Nutr', 'Food and Nutrition Science', 'MS', 'MS', 'Food Sci & Human Nutr-MS', 'Food Sci & Human Nutr-MS', '', '', 'X', '', ''),
(19, 'FREAT', 'FRE-MAT', 'FRE', 'French', 'French', 'MAT', 'MAT', 'French-MAT', 'French-MAT', '', '', 'X', 'X', ''),
(20, 'FREA', 'FRE-MA', 'FRE', 'French', 'French', 'MA', 'MA', 'French-MA', 'French-MA', '', '', 'X', 'X', ''),
(21, 'FORS', 'FOR-MS', 'FOR', 'Forest Resources', 'Forest Resources', 'MS', 'MS', 'Forest Resources-MS', 'Forest Resources-MS', 'X', '', '', 'X', ''),
(22, 'FORD', 'FOR-PHD', 'FOR', 'Forest Resources', 'Forest Resources', 'PHD', 'PhD', 'Forest Resources-PHD', 'Forest Resources-PHD', 'X', '', 'X', 'X', 'X'),
(23, 'FNSD', 'FNS-PHD', 'FNS', 'Food & Nutrition Sci', 'Food and Nutrition Science', 'PHD', 'PhD', 'Food & Nutrition Sci-PHD', 'Food & Nutrition Sci-PHD', '', 'X', 'X', '', ''),
(24, 'FIEA', 'FIE-MA', 'FIE', 'Financial Economics', 'Financial Economics', 'MA', 'MA', 'Financial Economics-MA', 'Financial Economics-MA', 'X', 'X', 'X', 'X', 'X'),
(25, 'ESSME', 'ESS-MED', 'ESS', 'Social Studies Education', 'Social Studies Education', 'MED', 'MEd', 'Social Studies Education-MED', 'Social Studies Education-MED', '', '', '', '', ''),
(26, 'ESSCS', 'ESS-CAS', 'ESS', 'Social Studies Education', 'Social Studies Education', 'CAS', 'CAS', 'Social Studies Education-CAS', 'Social Studies Education-CAS', '', '', '', '', ''),
(27, 'ESCME', 'ESC-MED', 'ESC', 'Science Education', 'Science Education', 'MED', 'MEd', 'Science Education-MED', 'Science Education-MED', '', '', '', '', ''),
(28, 'ESCCS', 'ESC-CAS', 'ESC', 'Science Education', 'Science Education', 'CAS', 'CAS', 'Science Education-CAS', 'Science Education-CAS', '', '', 'X', 'X', 'X'),
(29, 'ERSS', 'ERS-MS', 'ERS', 'Earth Sciences', 'Earth Sciences', 'MS', 'MS', 'Earth Sciences-MS', 'Earth Sciences-MS', '', '', '', '', ''),
(30, 'ERSD', 'ERS-PHD', 'ERS', 'Earth Sciences', 'Earth Sciences', 'PHD', 'PhD', 'Earth Sciences-PHD', 'Earth Sciences-PHD', '', '', '', 'X', 'X'),
(31, 'EPSME', 'EPS-ME', 'EPS', 'Engineering Physics', 'Engineering Physics', 'ME', 'ME', 'Engineering Physics-ME', 'Engineering Physics-ME', '', '', '', '', ''),
(32, 'ENTS', 'ENT-MS', 'ENT', 'Entomology', 'Entomology', 'MS', 'MS', 'Entomology-MS', 'Entomology-MS', '', '', 'X', '', ''),
(33, 'ENGA', 'ENG-MA', 'ENG', 'English', 'English', 'MA', 'MA', 'English-MA', 'English-MA', '', '', '', '', ''),
(34, 'ELES', 'ELE-MS', 'ELE', 'Electrical Engineering', 'Electrical and Computer Engineering', 'MS', 'MS', 'Electrical Engineering-MS', 'Electrical Engineering-MS', '', '', '', '', ''),
(35, 'ELED', 'ELE-PHD', 'ELE', 'Elect & Comp Egr', 'Electrical and Computer Engineering', 'PHD', 'PhD', 'Elect & Comp Egr-PHD', 'Elect & Comp Egr PHD', '', '', '', '', ''),
(36, 'EESS', 'EES-MS', 'EES', 'Ecology/Environmental Sci', 'Ecology and Environmental Science', 'MS', 'MS', 'Ecology/Environmental Sci-MS', 'Ecology/Environmental Sci-MS', '', '', '', '', 'X'),
(37, 'EESD', 'EES-PHD', 'EES', 'Ecology/Environmental Sci', 'Ecology and Environmental Science', 'PHD', 'PhD', 'Ecology/Environmental Sci-PHD', 'Ecology/Environmental Sci-PHD', 'X', '', '', '', 'X'),
(38, 'EDXME', 'EDX-MED', 'EDX', 'Individualized in Educ', 'Individualized in Education', 'MED', 'MEd', 'Individualized in Educ-MED', 'Individualized in Educ-MED', '', '', '', '', ''),
(40, 'EDXCS', 'EDX-CAS', 'EDX', 'Individualized in Educ', 'Individualized in Education', 'CAS', '', 'Individualized in Educ-CAS', 'Individualized in Educ-CAS', '', '', '', '', ''),
(41, 'EDTME', 'EDT-MED', 'EDT', 'Instructional Technology', 'Instructional Technology', 'MED', 'MEd', 'Instructional Technology-MED', 'Instructional Technology-MED', '', '', 'X', 'X', 'X'),
(42, 'EDSAT', 'EDS-MAT', 'EDS', 'Secondary Education', 'Secondary Education (MAT)', 'MAT', 'MAT', 'Secondary Education-MAT', 'Secondary Education-MAT', '', '', '', '', ''),
(43, 'EDLME', 'EDL-MED', 'EDL', 'Educational Leadership', 'Educational Leadership', 'MED', 'MEd', 'Educational Leadership-MED', 'Educational Leadership-MED', '', '', '', '', ''),
(44, 'EDLED', 'EDL-EDD', 'EDL', 'Educational Leadership', 'Educational Leadership', 'EDD', 'EdD', 'Educational Leadership-EDD', 'Educational Leadership-EDD', '', '', '', 'X', ''),
(45, 'EDLCS', 'EDL-CAS', 'EDL', 'Educational Leadership', 'Educational Leadership', 'CAS', 'CAS', 'Educational Leadership-CAS', 'Educational Leadership-CAS', '', '', 'X', 'X', ''),
(46, 'EDEAT', 'EDE-MAT', 'EDE', 'Elementary Education', 'Elementary Education (MAT)', 'EDEMAT', 'MAT', 'Elementary Education-EDEMAT', 'Elementary Education-MAT', '', '', '', '', ''),
(47, 'EDCME', 'EDC-MED', 'EDC', 'Elementary Education', 'Elementary Education', 'MED', 'MEd', 'Elementary Education-MED', 'Elementary Education-MED', '', '', '', '', ''),
(48, 'EDCCS', 'EDC-CAS', 'EDC', 'Elementary Education', 'Elementary Education', 'CAS', 'CAS', 'Elementary Education-CAS', 'Elementary Education-CAS', '', '', 'X', 'X', ''),
(49, 'EDAME', 'EDA-MED', 'EDA', 'Secondary Education', 'Secondary Education', 'MED', 'MEd', 'Secondary Education-MED', 'Secondary Education-MED', '', '', '', '', ''),
(50, 'EDACS', 'EDA-CAS', 'EDA', 'Secondary Education', 'Secondary Education', 'CAS', 'CAS', 'Secondary Education-CAS', 'Secondary Education-CAS', '', '', 'X', 'X', ''),
(51, 'ECOA', 'ECO-MA', 'ECO', 'Economics', 'Economics', 'MA', 'MA', 'Economics-MA', 'Economics-MA', '', '', '', 'X', 'X'),
(52, 'CSDA', 'CSD-MA', 'CSD', 'Comm Sciences & Disorders', 'Communication Sciences and Disorders', 'MA', 'MA', 'Comm Sciences & Disorders-MA', 'Comm Sciences & Disorders-MA', '', '', '', '', ''),
(53, 'COSS', 'COS-MS', 'COS', 'Computer Science', 'Computer Science', 'MS', 'MS', 'Computer Science-MS', 'Computer Science-MS', '', '', '', '', ''),
(54, 'COSD', 'COS-PHD', 'COS', 'Computer Science', 'Computer Science', 'PHD', 'PhD', 'Computer Science-PHD', 'Computer Science-PHD', '', '', '', '', ''),
(55, 'COMA', 'COM-MA', 'COM', 'Communication', 'Communication', 'MA', 'MA', 'Communication-MA', 'Communication-MA', '', '', 'X', '', 'X'),
(56, 'CIES', 'CIE-MS', 'CIE', 'Civil Engineering', 'Civil Engineering', 'MS', 'MS', 'Civil Engineering-MS', 'Civil Engineering-MS', '', '', '', '', ''),
(57, 'CIED', 'CIE-PHD', 'CIE', 'Civil Engineering', 'Civil Engineering', 'PHD', 'PhD', 'Civil Engineering-PHD', 'Civil Engineering-PHD', '', '', '', '', ''),
(58, 'CHYS', 'CHY-MS', 'CHY', 'Chemistry', 'Chemistry', 'MS', 'MS', 'Chemistry-MS', 'Chemistry-MS', '', '', '', '', ''),
(59, 'CHYD', 'CHY-PHD', 'CHY', 'Chemistry', 'Chemistry', 'PHD', 'PhD', 'Chemistry-PHD', 'Chemistry-PHD', '', '', '', '', ''),
(60, 'CHES', 'CHE-MS', 'CHE', 'Chemical Engineering', 'Chemical Engineering', 'MS', 'MS', 'Chemical Engineering-MS', 'Chemical Engineering-MS', '', '', '', '', 'X'),
(61, 'CHED', 'CHE-PHD', 'CHE', 'Chemical Engineering', 'Chemical Engineering', 'PHD', 'PhD', 'Chemical Engineering-PHD', 'Chemical Engineering-PHD', '', '', '', '', 'X'),
(62, 'CENS', 'CEN-MS', 'CEN', 'Computer Engineering', 'Computer Engineering', 'MS', 'MS', 'Computer Engineering-MS', 'Computer Engineering-MS', '', '', '', '', ''),
(63, 'CECME', 'CEC-MED', 'CEC', 'Counselor Education', 'Counselor Education', 'MED', 'MEd', 'Counselor Education-MED', 'Counselor Education-MED', '', '', '', '', ''),
(65, 'CECCS', 'CEC-CAS', 'CEC', 'Counselor Education', 'Counselor Education', 'CAS', 'CAS', 'Counselor Education-CAS', 'Counselor Education-CAS', '', '', '', '', ''),
(66, 'BUAMB', 'BUA-MBA', 'BUA', 'Business Admin', 'Business Administration', 'MBA', 'MBA', 'Business Admin-MBA', 'Business Admin-MBA', '', '', '', '', ''),
(67, 'BTPS', 'BTP-MS', 'BTP', 'Botany and Plant Pathology', 'Botany and Plant Pathology', 'MS', 'MS', 'Botany & Plant Pathology-MS', 'Botany & Plant Pathology-MS', 'X', '', '', '', ''),
(68, 'BSCD', 'BSC-PHD', 'BSC', 'Biological Science', 'Biological Science', 'PHD', 'PhD', 'Biological Science-PHD', 'Biological Science-PHD', '', '', '', '', ''),
(69, 'BMSD', 'BMS-PHD', 'BMS', 'Biomedical Sciences', 'Biomedical Sciences', 'PHD', 'PhD', 'Biomedical Sciences-PHD', 'Biomedical Sciences-PHD', '', '', '', '', ''),
(70, 'BMOD', 'BMO-PHD', 'BMO', 'Biochem/Molecular Biology', 'Biochemistry and Molecular Biology', 'PHD', 'PhD', 'Biochem/Molecular Biology-PHD', 'Biochem/Molecular Biology-PHD', '', '', '', '', ''),
(71, 'BLES', 'BLE-MS', 'BLE', 'Biological Engineering', 'Biological Engineering', 'MS', 'MS', 'Biological Engineering-MS', 'Biological Engineering-MS', 'X', 'X', 'X', 'X', 'X'),
(72, 'BLEME', 'BLE-ME', 'BLE', 'Biological Engineering', 'Biological Engineering', 'ME', 'ME', 'Biological Engineering-ME', 'Biological Engineering-ME', 'X', 'X', 'X', 'X', 'X'),
(73, 'BCHS', 'BCH-MS', 'BCH', 'Biochemistry', 'Biochemistry', 'MS', 'MS', 'Biochemistry-MS', 'Biochemistry-MS', '', '', '', '', ''),
(74, 'BCHPS', 'BCH-MPS', 'BCH', 'Biochemistry', 'Biochemistry', 'MPS', 'MPS', 'Biochemistry-MPS', 'Biochemistry-MPS', '', '', '', '', ''),
(75, 'ANSS', 'ANS-MS', 'ANS', 'Animal Sciences', 'Animal Sciences', 'MS', 'MS', 'Animal Sciences-MS', 'Animal Sciences-MS', '', '', '', '', ''),
(76, 'ANSPS', 'ANS-MPS', 'ANS', 'Animal Sciences', 'Animal Sciences', 'MPS', 'MPS', 'Animal Sciences-MPS', 'Animal Sciences-MPS', '', '', '', '', ''),
(79, 'KPES', 'KPE-MS', 'KPE', 'Kinesiology & Phys Edu', 'Kinesiology & Physical Education', 'MS', 'MS', 'Kinesiology & Phys Edu-MS', 'Kinesiology & Phys Edu-MS', '', '', '', '', 'X'),
(80, 'LEDCS', 'LED-CAS', 'LED', 'Literacy Education', 'Literacy Education', 'CAS', 'CAS', 'Literacy Education-CAS', 'Literacy Education-CAS', '', '', 'X', 'X', ''),
(81, 'LEDED', 'LED-EDD', 'LED', 'Literacy Education', 'Literacy Education', 'EDD', 'EdD', 'Literacy Education-EDD', 'Literacy Education-EDD', 'X', '', '', 'X', 'X'),
(82, 'LEDME', 'LED-MED', 'LED', 'Literacy Education', 'Literacy Education', 'MED', 'MEd', 'Literacy Education-MED', 'Literacy Education-MED', '', '', '', '', ''),
(83, 'MABD', 'MAB-PHD', 'MAB', 'Marine Biology', 'Marine Biology', 'PHD', 'PhD', 'Marine Biology-PHD', 'Marine Biology-PHD', '', '', '', '', 'X'),
(84, 'MABS', 'MAB-MS', 'MAB', 'Marine Biology', 'Marine Biology', 'MS', 'MS', 'Marine Biology-MS', 'Marine Biology-MS', '', '', '', '', 'X'),
(85, 'MAPS', 'MAP-MS', 'MAP', 'Marine Policy', 'Marine Policy', 'MS', 'MS', 'Marine Policy-MS', 'Marine Policy-MS', 'X', 'X', 'X', '', 'X'),
(86, 'MATA', 'MAT-MA', 'MAT', 'Mathematics', 'Mathematics', 'MA', 'MA', 'Mathematics-MA', 'Mathematics-MA', '', '', '', '', ''),
(87, 'MBRD', 'MBR-PHD', 'MBR', 'Marine Bio', 'Marine Bio-Resources', 'PHD', 'PhD', 'Marine Bio-PHD', 'Marine Bio-Resources-PHD', '', '', '', '', 'X'),
(88, 'MBRS', 'MBR-MS', 'MBR', 'Marine Bio', 'Marine Bio-Resources', 'MS', 'MS', 'Marine Bio-MS', 'Marine Bio-Resources-MS', '', '', '', '', 'X'),
(89, 'MCBD', 'MCB-PHD', 'MCB', 'Microbiology', 'Microbiology', 'PHD', 'PhD', 'Microbiology-PHD', 'Microbiology-PHD', '', '', '', '', ''),
(90, 'MCBPS', 'MCB-MPS', 'MCB', 'Microbiology', 'Microbiology', 'MPS', 'MPS', 'Microbiology-MPS', 'Microbiology-MPS', '', '', '', '', ''),
(91, 'MCBS', 'MCB-MS', 'MCB', 'Microbiology', 'Microbiology', 'MS', 'MS', 'Microbiology-MS', 'Microbiology-MS', '', '', '', '', ''),
(92, 'MEED', 'MEE-PHD', 'MEE', 'Mechanical Engineering', 'Mechanical Engineering', 'PHD', 'PhD', 'Mechanical Engineering-PHD', 'Mechanical Engineering-PHD', '', '', '', '', ''),
(93, 'MEES', 'MEE-MS', 'MEE', 'Mechanical Engineering', 'Mechanical Engineering', 'MS', 'MS', 'Mechanical Engineering-MS', 'Mechanical Engineering-MS', '', '', '', '', ''),
(94, 'MLSA', 'MLS-MA', 'MLS', 'Liberal Studies', 'Liberal Studies', 'MA', 'MA', 'Liberal Studies-MA', 'Liberal Studies-MA', 'X', 'X', '', '', 'X'),
(96, 'MUIMM', 'MUI-MM', 'MUI', 'Music Education', 'Music Education', 'MM', 'MM', 'Music Education-MM', 'Music Education-MMUS', '', '', '', '', 'X'),
(97, 'MUPMM', 'MUP-MM', 'MUP', 'Music Performance', 'Music Performance', 'MM', 'MM', 'Music Performance-MM', 'Music Performance-MMUS', '', '', '', '', 'X'),
(100, 'NURCS', 'NUR-CAS', 'NUR', 'Nursing', 'Nursing', 'CAS', 'CAS', 'Nursing-CAS', 'Nursing-CAS', 'X', '', 'X', 'X', 'X'),
(101, 'NURS', 'NUR-MS', 'NUR', 'Nursing', 'Nursing', 'MS', 'MS', 'Nursing-MS', 'Nursing-MS', '', '', '', '', ''),
(102, 'OCED', 'OCE-PHD', 'OCE', 'Oceanography', 'Oceanography', 'PHD', 'PhD', 'Oceanography-PHD', 'Oceanography-PHD', '', '', '', '', 'X'),
(103, 'OCES', 'OCE-MS', 'OCE', 'Oceanography', 'Oceanography', 'MS', 'MS', 'Oceanography-MS', 'Oceanography-MS', '', '', '', '', 'X'),
(105, 'PHYD', 'PHY-PHD', 'PHY', 'Physics', 'Physics', 'PHD', 'PhD', 'Physics-PHD', 'Physics-PHD', '', '', '', '', 'X'),
(106, 'PHYS', 'PHY-MS', 'PHY', 'Physics', 'Physics', 'MS', 'MS', 'Physics-MS', 'Physics-MS', '', '', '', '', ''),
(107, 'PLSD', 'PLS-PHD', 'PLS', 'Plant Science', 'Plant Science', 'PHD', 'PhD', 'Plant Science-PHD', 'Plant Science-PHD', '', '', '', '', ''),
(108, 'PSES', 'PSE-MS', 'PSE', 'Plant Soil Envir Sci', 'Plant Soil & Environmental Science', 'MS', 'MS', 'Plant Soil Envir Sci-MS', 'Plant Soil Envir Sci-MS', 'X', '', '', '', ''),
(109, 'PSYA', 'PSY-MA', 'PSY', 'Psychology', 'Psychology', 'MA', 'MA', 'Psychology-MA', 'Psychology-MA', '', '', 'X', '', ''),
(110, 'PSYD', 'PSY-PHD', 'PSY', 'Psychology', 'Psychology', 'PHD', 'PhD', 'Psychology-PHD', 'Psychology-PHD', '', '', '', '', ''),
(112, 'QCSS', 'QCS-MS', 'QCS', 'Quaternary & Climate Std', 'Quaternary & Climate Studies', 'MS', 'MS', 'Quaternary & Climate Std-MS', 'Quaternary & Climate Std-MS', 'X', 'X', 'X', 'X', 'X'),
(113, 'REPS', 'REP-MS', 'REP', 'Resource Economics & Policy', 'Resource Economics & Policy', 'MS', 'MS', 'Resource Economics & Policy-MS', 'Resource Economics & Policy-MS', '', '', '', '', ''),
(114, 'SEDCS', 'SED-CAS', 'SED', 'Special Education', 'Special Education', 'CAS', 'CAS', 'Special Education-CAS', 'Special Education-CAS', '', '', '', '', ''),
(115, 'SEDME', 'SED-MED', 'SED', 'Special Education', 'Special Education', 'MED', 'MEd', 'Special Education-MED', 'Special Education-MED', '', '', '', '', ''),
(116, 'SISD', 'SIS-PHD', 'SIS', 'Spatial Inf Sci Engineer', 'Spatial Information Science & Engineering', 'PHD', 'PhD', 'Spatial Inf Sci Engineer-PHD', 'Spatial Inf Sci Engineer-PHD', 'X', 'X', 'X', 'X', 'X'),
(117, 'SISS', 'SIS-MS', 'SIS', 'Spatial Inf Sci Engineer', 'Spatial Information Science & Engineering', 'MS', 'MS', 'Spatial Inf Sci Engineer-MS', 'Spatial Inf Sci Engineer-MS', 'X', 'X', 'X', 'X', 'X'),
(118, 'SMTST', 'SMT-MST', 'SMT', 'Teaching', 'MS in Teaching Science & Mathematics', 'MST', 'MST', 'Teaching-MST', 'Teaching-MST', '', '', '', '', 'X'),
(119, 'SWKSW', 'SWK-MSW', 'SWK', 'Social Work', 'Social Work', 'MSW', 'MSW', 'Social Work-MSW', 'Social Work-MSW', '', '', '', '', ''),
(120, 'WLCWC', 'WLC-MWC', 'WLC', 'Wildlife Conservation', 'Wildlife Conservation', 'MWC', 'MWC', 'Wildlife Conservation-MWC', 'Wildlife Conservation-MWC', '', '', '', '', ''),
(121, 'WLED', 'WLE-PHD', 'WLE', 'Wildlife Ecology', 'Wildlife Ecology', 'PHD', 'PhD', 'Wildlife Ecology-PHD', 'Wildlife Ecology-PHD', 'X', '', 'X', 'X', 'X'),
(122, 'WLES', 'WLE-MS', 'WLE', 'Wildlife Ecology', 'Wildlife Ecology', 'MS', 'MS', 'Wildlife Ecology-MS', 'Wildlife Ecology-MS', '', '', '', '', ''),
(123, 'ZOLD', 'ZOL-PHD', 'ZOL', 'Zoology', 'Zoology', 'PHD', 'PhD', 'Zoology-PHD', 'Zoology-PHD', '', '', '', '', ''),
(124, 'ZOLS', 'ZOL-MS', 'ZOL', 'Zoology', 'Zoology', 'MS', 'MS', 'Zoology-MS', 'Zoology-MS', '', '', '', '', ''),
(125, 'HELD', 'HEL-PHD', 'HEL', 'Higher Ed Leadership', 'Higher Education Leadership', 'PHD', 'PhD', 'Higher Ed Leadership-PHD', 'Higher Ed Leadership-PHD', '', '', '', '', ''),
(126, 'EDLD', 'EDL-PHD', 'EDL', 'Educational Leadership', 'Educational Leadership', 'PHD', 'PhD', 'Educational Leadership-PHD', 'Educational Leadership-PHD', '', '', '', '', ''),
(127, 'LEDD', 'LED-PHD', 'LED', 'Literacy Education', 'Literacy Education', 'PHD', 'PhD', 'Literacy Education-PHD', 'Literacy Education-PHD', '', '', '', '', ''),
(129, 'SPIA', 'GPL-MA', 'GPL', 'Global Policy', 'Global Policy', 'MA', 'MA', 'Global Policy-MA', 'Global Policy-MA', '', '', '', '', ''),
(130, 'CAID', 'CAI-PHD', 'CAI', 'Curriculum and Instruction', 'Curriculum and Instruction', 'PHD', 'PhD', 'Curriculum and Instruction-PhD', 'Curriculum and Instruction-PhD', '', '', '', '', ''),
(131, 'ISCGS', 'ISY-CGS', 'ISY', 'Information Systems', 'Information Systems', 'CGS', 'CGS', 'Information Systems-CGS', 'Information Systems-CGS', '', '', '', '', '');
