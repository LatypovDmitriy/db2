<?php
$name = stripcslashes(htmlspecialchars(trim($_POST['name'])));


require("config.php");
$connect = new mysqli(HOST, USER, PASS, DB);
$connect->set_charset("UTF8");

$sql = "INSERT INTO `group`(`name`) VALUES ('$name')";
$result = $connect->query($sql);
if($result) {
  echo "данные записаны";
} else {
  echo "ошибка записи";
}