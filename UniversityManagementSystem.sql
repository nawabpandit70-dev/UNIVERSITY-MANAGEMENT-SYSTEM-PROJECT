-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 25, 2026 at 12:20 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `UniversityManagementSystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `credits` int(11) NOT NULL CHECK (`credits` > 0),
  `department_id` int(11) DEFAULT NULL,
  `instructor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `credits`, `department_id`, `instructor_id`) VALUES
(1, 'Database Management', 4, 1, 1),
(2, 'Corporate Finance', 3, 2, 2),
(3, 'Early Childhood Pedagogy', 4, 3, 3),
(4, 'SQL Fundamentals', 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `office_location` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`, `office_location`) VALUES
(1, 'Computer Science', 'Block A'),
(2, 'Business', 'Block B'),
(3, 'Education', 'Block C');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `enrollment_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `semester` varchar(20) NOT NULL,
  `enrollment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`enrollment_id`, `student_id`, `course_id`, `semester`, `enrollment_date`) VALUES
(1, 1, 1, 'Winter 2025', '2025-01-10'),
(2, 1, 4, 'Winter 2025', '2025-01-10'),
(3, 2, 2, 'Winter 2025', '2025-01-12'),
(4, 3, 1, 'Winter 2025', '2025-01-15'),
(5, 4, 3, 'Winter 2025', '2025-01-18'),
(6, 5, 1, 'Winter 2025', '2025-01-20'),
(7, 5, 4, 'Winter 2025', '2025-01-20'),
(8, 6, 2, 'Winter 2025', '2025-01-21'),
(9, 7, 3, 'Winter 2025', '2025-01-22'),
(10, 8, 1, 'Winter 2025', '2025-01-23'),
(11, 8, 4, 'Winter 2025', '2025-01-23'),
(12, 9, 2, 'Winter 2025', '2025-01-24'),
(13, 10, 3, 'Winter 2025', '2025-01-25');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL,
  `enrollment_id` int(11) DEFAULT NULL,
  `grade` varchar(2) DEFAULT NULL,
  `marks` decimal(5,2) DEFAULT NULL CHECK (`marks` >= 0 and `marks` <= 100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`grade_id`, `enrollment_id`, `grade`, `marks`) VALUES
(1, 1, 'A', 91.50),
(2, 2, 'B', 78.00),
(3, 3, 'A', 88.00),
(4, 4, 'C', 67.50),
(5, 5, 'B', 74.00),
(6, 6, 'A', 89.00),
(7, 7, 'B', 76.50),
(8, 8, 'A', 92.00),
(9, 9, 'C', 68.00),
(10, 10, 'B', 81.00),
(11, 11, 'A', 90.50),
(12, 12, 'B', 73.00),
(13, 13, 'B', 75.00);

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `instructor_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`instructor_id`, `first_name`, `last_name`, `email`, `department_id`) VALUES
(1, 'Nikhil', 'Pandit', 'Nikhil.Pandit@gmail.com', 1),
(2, 'Kanchan', 'Hariya', 'kanchan.hariya@gmail.com', 2),
(3, 'Taranbir', 'Sandhu', 'taranbir.sandhu@gmail.com', 3);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `enrollment_year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `first_name`, `last_name`, `email`, `date_of_birth`, `department_id`, `enrollment_year`) VALUES
(1, 'Aman', 'Punia', 'aman.punia@gmail.com', '2001-05-14', 1, 2023),
(2, 'Priya', 'Verma', 'priya.verma@gmail.com', '2002-08-20', 2, 2024),
(3, 'Rahul', 'Singh', 'rahul.singh@gmail.com', '2000-11-11', 1, 2022),
(4, 'Neha', 'Kaur', 'neha.kaur@gmail.com', '2001-02-28', 3, 2023),
(5, 'Karan', 'Verma', 'karan.Verma@gmail.com', '2002-01-17', 1, 2024),
(6, 'Anjali', 'Thakur', 'anjali.Thakur@gmail.com', '2001-09-22', 2, 2023),
(7, 'Rohit', 'Agale', 'rohit.agale@gmail.com', '2000-12-05', 3, 2022),
(8, 'Sneha', 'Rayapati', 'sneha.Rayapati@gmail.com', '2003-04-18', 1, 2024),
(9, 'Vikas', 'Gupta', 'vikas.Gupta@gmail.com', '2001-07-30', 2, 2023),
(10, 'Pooja', 'Moriya', 'pooja.moriya@gmail.com', '2002-11-11', 3, 2024);

-- --------------------------------------------------------

--
-- Stand-in structure for view `student_course_grades`
-- (See below for the actual view)
--
CREATE TABLE `student_course_grades` (
`student_id` int(11)
,`first_name` varchar(50)
,`last_name` varchar(50)
,`course_name` varchar(100)
,`semester` varchar(20)
,`grade` varchar(2)
,`marks` decimal(5,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `student_department_view`
-- (See below for the actual view)
--
CREATE TABLE `student_department_view` (
`student_id` int(11)
,`first_name` varchar(50)
,`last_name` varchar(50)
,`email` varchar(100)
,`department_name` varchar(100)
,`enrollment_year` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `student_course_grades`
--
DROP TABLE IF EXISTS `student_course_grades`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `universitymanagementsystem`.`student_course_grades`  AS SELECT `s`.`student_id` AS `student_id`, `s`.`first_name` AS `first_name`, `s`.`last_name` AS `last_name`, `c`.`course_name` AS `course_name`, `e`.`semester` AS `semester`, `g`.`grade` AS `grade`, `g`.`marks` AS `marks` FROM (((`universitymanagementsystem`.`students` `s` join `universitymanagementsystem`.`enrollments` `e` on(`s`.`student_id` = `e`.`student_id`)) join `universitymanagementsystem`.`courses` `c` on(`e`.`course_id` = `c`.`course_id`)) join `universitymanagementsystem`.`grades` `g` on(`e`.`enrollment_id` = `g`.`enrollment_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `student_department_view`
--
DROP TABLE IF EXISTS `student_department_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `universitymanagementsystem`.`student_department_view`  AS SELECT `s`.`student_id` AS `student_id`, `s`.`first_name` AS `first_name`, `s`.`last_name` AS `last_name`, `s`.`email` AS `email`, `d`.`department_name` AS `department_name`, `s`.`enrollment_year` AS `enrollment_year` FROM (`universitymanagementsystem`.`students` `s` join `universitymanagementsystem`.`departments` `d` on(`s`.`department_id` = `d`.`department_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `instructor_id` (`instructor_id`),
  ADD KEY `idx_course_department` (`department_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`),
  ADD UNIQUE KEY `department_name` (`department_name`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD UNIQUE KEY `student_id` (`student_id`,`course_id`,`semester`),
  ADD KEY `idx_enrollment_student` (`student_id`),
  ADD KEY `idx_enrollment_course` (`course_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`),
  ADD UNIQUE KEY `enrollment_id` (`enrollment_id`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`instructor_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_student_department` (`department_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `instructor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  ADD CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`instructor_id`) REFERENCES `instructors` (`instructor_id`);

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollments` (`enrollment_id`);

--
-- Constraints for table `instructors`
--
ALTER TABLE `instructors`
  ADD CONSTRAINT `instructors_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
