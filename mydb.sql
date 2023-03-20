-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 18 2023 г., 09:33
-- Версия сервера: 8.0.29
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mydb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `group`
--

CREATE TABLE `group` (
  `group_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `group`
--

INSERT INTO `group` (`group_id`, `name`) VALUES
(1, 'ИЗ-301'),
(2, 'ИЗ-201');

-- --------------------------------------------------------

--
-- Структура таблицы `student`
--

CREATE TABLE `student` (
  `student_id` int NOT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `age` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `student`
--

INSERT INTO `student` (`student_id`, `fname`, `lname`, `group_id`, `age`) VALUES
(1, 'Иванов', 'Иван', 1, 24),
(2, 'Катаев', 'Василий ', 1, 23),
(3, 'Груздев', 'Груздь', 1, 51),
(4, 'Лапшин', 'Геннадий', 2, 44);

-- --------------------------------------------------------

--
-- Структура таблицы `student_has_subjects`
--

CREATE TABLE `student_has_subjects` (
  `id` int NOT NULL,
  `student_student_id` int DEFAULT NULL,
  `subjects_subjects_id` int DEFAULT NULL,
  `mark` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `subjects`
--

CREATE TABLE `subjects` (
  `subjects_id` int NOT NULL,
  `title` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`group_id`);

--
-- Индексы таблицы `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Индексы таблицы `student_has_subjects`
--
ALTER TABLE `student_has_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_student_has_subjects_subjects1_idx` (`subjects_subjects_id`),
  ADD KEY `fk_student_has_subjects_student1_idx` (`student_student_id`);

--
-- Индексы таблицы `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subjects_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `student_has_subjects`
--
ALTER TABLE `student_has_subjects`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `student_has_subjects`
--
ALTER TABLE `student_has_subjects`
  ADD CONSTRAINT `fk_student_has_subjects_student1` FOREIGN KEY (`student_student_id`) REFERENCES `student` (`student_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_student_has_subjects_subjects1` FOREIGN KEY (`subjects_subjects_id`) REFERENCES `subjects` (`subjects_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
