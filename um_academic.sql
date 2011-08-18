-- phpMyAdmin SQL Dump
-- version 3.3.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 07, 2011 at 03:52 PM
-- Server version: 5.0.82
-- PHP Version: 5.2.12

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
(135, 'AEPD', 'AEPD-PHD', 'AEP', 'Anthropology and Environmental Policy', 'Anthropology and Environmental Policy', 'PHD', 'PhD', 'Anthropology/Envtl Policy-PhD', 'Anthropology/Envtl Policy-PhD', '', '', '', '', ''),
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
(129, 'SPIA', 'GLP-MA', 'GLP', 'Global Policy', 'Global Policy', 'MA', 'MA', 'Global Policy-MA', 'Global Policy-MA', '', '', '', '', ''),
(130, 'CAID', 'CAI-PHD', 'CAI', 'Curriculum and Instruction', 'Curriculum and Instruction', 'PHD', 'PhD', 'Curriculum and Instruction-PhD', 'Curriculum and Instruction-PhD', '', '', '', '', ''),
(131, 'ISCGS', 'ISY-CGS', 'ISY', 'Information Systems', 'Information Systems', 'CGS', 'CGS', 'Information Systems-CGS', 'Information Systems-CGS', '', '', '', '', '');
