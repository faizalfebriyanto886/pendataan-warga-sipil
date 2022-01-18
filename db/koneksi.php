<?php

$host = 'localhost';
$user = 'root';
$password = '';
$database = 'db_sipil';

$koneksi = mysqli_connect($host, $user, $password, $database);

if(!$koneksi){
    $error = mysqli_connect_error();
    echo $error;
}