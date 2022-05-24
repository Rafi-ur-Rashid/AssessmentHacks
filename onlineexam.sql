-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2022 at 07:27 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineexam`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `name`, `email`, `comment`, `datetime`) VALUES
(5, '14', 'dd', '22@f.com', 'qq', '2022-05-20 03:36:12');

-- --------------------------------------------------------

--
-- Table structure for table `exam_remark`
--

CREATE TABLE `exam_remark` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `student_answer` text NOT NULL,
  `got_mark` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exam_tbl`
--

CREATE TABLE `exam_tbl` (
  `exam_id` int(10) NOT NULL,
  `faculty_id` int(10) NOT NULL,
  `exam_title` varchar(100) NOT NULL,
  `exam_datetime` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `exam_duration` float DEFAULT NULL,
  `qsn1` text DEFAULT NULL,
  `exam_status` binary(1) DEFAULT NULL,
  `total_marks` float DEFAULT 0,
  `exam_declaration_datetime` datetime DEFAULT NULL,
  `sol1` text DEFAULT NULL,
  `qsn2` text DEFAULT NULL,
  `qsn3` text DEFAULT NULL,
  `sol2` text DEFAULT NULL,
  `sol3` text DEFAULT NULL,
  `qsn4` text DEFAULT NULL,
  `qsn5` text DEFAULT NULL,
  `sol4` text DEFAULT NULL,
  `sol5` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exam_tbl_qsn_tbl`
--

CREATE TABLE `exam_tbl_qsn_tbl` (
  `exam_id` int(10) NOT NULL,
  `qsn_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exam_tbl_std_exam_enrolled`
--

CREATE TABLE `exam_tbl_std_exam_enrolled` (
  `exam_id` int(10) NOT NULL,
  `std_exam_enrolled_id` int(10) NOT NULL,
  `enrollment_datetime` datetime NOT NULL,
  `std_tbl_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `faculty_tbl`
--

CREATE TABLE `faculty_tbl` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `uni_name` varchar(255) NOT NULL,
  `img` varchar(500) DEFAULT NULL,
  `exam_counter` int(10) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `faculty_tbl`
--

INSERT INTO `faculty_tbl` (`id`, `name`, `email`, `password`, `uni_name`, `img`, `exam_counter`, `status`) VALUES
(17, 'Mak Raiaan', 'makraiaan31@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'UIU', '', 0, 0),
(18, 'Mak Raiaan', 'm@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'UIU', 'faculty_image/Albert_Einstein.jpg', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `msg_tbl`
--

CREATE TABLE `msg_tbl` (
  `id` int(11) NOT NULL,
  `rec_id` int(11) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `msg_tbl`
--

INSERT INTO `msg_tbl` (`id`, `rec_id`, `message`) VALUES
(1, 17, 'Hello');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `section` varchar(20) NOT NULL,
  `post` varchar(10000) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `qsn_tbl`
--

CREATE TABLE `qsn_tbl` (
  `qsn_id` int(10) NOT NULL,
  `qsn_title` varchar(100) NOT NULL,
  `qsn_description` varchar(255) NOT NULL,
  `new_database` varchar(255) NOT NULL,
  `solution_code` varchar(1000) NOT NULL,
  `marks` float NOT NULL,
  `qsn_upload_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `std_exam_enrolled`
--

CREATE TABLE `std_exam_enrolled` (
  `id` int(10) NOT NULL,
  `exam_id` int(10) NOT NULL,
  `faculty_id` int(10) NOT NULL,
  `enrolled_exam_status` int(1) NOT NULL,
  `std_tbl_std_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `std_solution`
--

CREATE TABLE `std_solution` (
  `std_solution` int(10) NOT NULL,
  `std_ans` varchar(1000) NOT NULL,
  `std_id` int(10) NOT NULL,
  `qsn_id` int(10) NOT NULL,
  `got_marks` float NOT NULL,
  `solution_up_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `timeover` int(11) DEFAULT NULL,
  `submitted` int(11) DEFAULT NULL,
  `std_ans2` varchar(1000) NOT NULL,
  `std_ans3` varchar(1000) NOT NULL,
  `std_ans4` varchar(1000) NOT NULL,
  `std_ans5` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `std_tbl`
--

CREATE TABLE `std_tbl` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(80) NOT NULL,
  `uni_roll_no` int(10) NOT NULL,
  `img` varchar(500) DEFAULT NULL,
  `uni_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `std_tbl`
--

INSERT INTO `std_tbl` (`id`, `name`, `password`, `email`, `uni_roll_no`, `img`, `uni_name`) VALUES
(17, 'Mak Raiaan', '827ccb0eea8a706c4c34a16891f84e7b', 'makraiaan31@gmail.com', 11191228, NULL, 'UIU'),
(18, 'Sadman', '827ccb0eea8a706c4c34a16891f84e7b', 'sadman@g.com', 11191282, NULL, 'UIU');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_remark`
--
ALTER TABLE `exam_remark`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_exam_remark_exam_tbl` (`exam_id`),
  ADD KEY `FK_exam_remark_faculty_tbl` (`faculty_id`),
  ADD KEY `FK_exam_remark_std_tbl` (`student_id`);

--
-- Indexes for table `exam_tbl`
--
ALTER TABLE `exam_tbl`
  ADD PRIMARY KEY (`exam_id`),
  ADD KEY `FKexam_tbl343397` (`faculty_id`);

--
-- Indexes for table `exam_tbl_qsn_tbl`
--
ALTER TABLE `exam_tbl_qsn_tbl`
  ADD PRIMARY KEY (`exam_id`,`qsn_id`),
  ADD KEY `FKexam_tbl_q415233` (`exam_id`),
  ADD KEY `FKexam_tbl_q300810` (`qsn_id`);

--
-- Indexes for table `exam_tbl_std_exam_enrolled`
--
ALTER TABLE `exam_tbl_std_exam_enrolled`
  ADD PRIMARY KEY (`exam_id`,`std_exam_enrolled_id`),
  ADD KEY `FKexam_tbl_s624522` (`std_tbl_id`),
  ADD KEY `FKexam_tbl_s796076` (`std_exam_enrolled_id`);

--
-- Indexes for table `faculty_tbl`
--
ALTER TABLE `faculty_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `msg_tbl`
--
ALTER TABLE `msg_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rec_id` (`rec_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qsn_tbl`
--
ALTER TABLE `qsn_tbl`
  ADD PRIMARY KEY (`qsn_id`);

--
-- Indexes for table `std_exam_enrolled`
--
ALTER TABLE `std_exam_enrolled`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKstd_exam_e484286` (`std_tbl_std_id`);

--
-- Indexes for table `std_solution`
--
ALTER TABLE `std_solution`
  ADD PRIMARY KEY (`std_solution`),
  ADD KEY `FKstd_soluti244267` (`std_id`);

--
-- Indexes for table `std_tbl`
--
ALTER TABLE `std_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `uni_roll_no` (`uni_roll_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `exam_remark`
--
ALTER TABLE `exam_remark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `exam_tbl`
--
ALTER TABLE `exam_tbl`
  MODIFY `exam_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `faculty_tbl`
--
ALTER TABLE `faculty_tbl`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `msg_tbl`
--
ALTER TABLE `msg_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `qsn_tbl`
--
ALTER TABLE `qsn_tbl`
  MODIFY `qsn_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `std_exam_enrolled`
--
ALTER TABLE `std_exam_enrolled`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `std_solution`
--
ALTER TABLE `std_solution`
  MODIFY `std_solution` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `std_tbl`
--
ALTER TABLE `std_tbl`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exam_remark`
--
ALTER TABLE `exam_remark`
  ADD CONSTRAINT `FK_exam_remark_exam_tbl` FOREIGN KEY (`exam_id`) REFERENCES `exam_tbl` (`exam_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_exam_remark_faculty_tbl` FOREIGN KEY (`faculty_id`) REFERENCES `faculty_tbl` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_exam_remark_std_tbl` FOREIGN KEY (`student_id`) REFERENCES `std_tbl` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `exam_tbl`
--
ALTER TABLE `exam_tbl`
  ADD CONSTRAINT `FKexam_tbl343397` FOREIGN KEY (`faculty_id`) REFERENCES `faculty_tbl` (`id`);

--
-- Constraints for table `exam_tbl_qsn_tbl`
--
ALTER TABLE `exam_tbl_qsn_tbl`
  ADD CONSTRAINT `FKexam_tbl_q300810` FOREIGN KEY (`qsn_id`) REFERENCES `qsn_tbl` (`qsn_id`),
  ADD CONSTRAINT `FKexam_tbl_q415233` FOREIGN KEY (`exam_id`) REFERENCES `exam_tbl` (`exam_id`);

--
-- Constraints for table `exam_tbl_std_exam_enrolled`
--
ALTER TABLE `exam_tbl_std_exam_enrolled`
  ADD CONSTRAINT `FKexam_tbl_s402395` FOREIGN KEY (`exam_id`) REFERENCES `exam_tbl` (`exam_id`),
  ADD CONSTRAINT `FKexam_tbl_s624522` FOREIGN KEY (`std_tbl_id`) REFERENCES `std_tbl` (`id`),
  ADD CONSTRAINT `FKexam_tbl_s796076` FOREIGN KEY (`std_exam_enrolled_id`) REFERENCES `std_exam_enrolled` (`id`);

--
-- Constraints for table `msg_tbl`
--
ALTER TABLE `msg_tbl`
  ADD CONSTRAINT `msg_tbl_ibfk_1` FOREIGN KEY (`rec_id`) REFERENCES `std_tbl` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `std_exam_enrolled`
--
ALTER TABLE `std_exam_enrolled`
  ADD CONSTRAINT `FKstd_exam_e484286` FOREIGN KEY (`std_tbl_std_id`) REFERENCES `std_tbl` (`id`);

--
-- Constraints for table `std_solution`
--
ALTER TABLE `std_solution`
  ADD CONSTRAINT `FKstd_soluti244267` FOREIGN KEY (`std_id`) REFERENCES `std_tbl` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
