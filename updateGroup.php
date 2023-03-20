<?php
$id = $_GET['id'];
echo $id;
$sql =  "SELECT * FROM `group` WHERE `group_id`=$id";
$connect->query($sql);