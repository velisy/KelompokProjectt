<?php
session_start();

require_once("config.php");
require_once("helpers/auth.php");

$modul = "dashboard";
$proses = "index";

if(isset($_GET["modul"])) {
    $modul = $_GET["modul"]; //anggota
}

if(isset($_GET["proses"])) {
    $proses = $_GET["proses"]; //proses_tambah
}

if(!is_login() and $modul != "auth"){
    include("controller/auth.php");
    call_user_func("login");
}else{
    include("controller/".$modul.".php"); //anggota.php
    call_user_func($proses); //proses_tambah
}
?>