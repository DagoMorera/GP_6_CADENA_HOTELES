<?php
$username = "andres";
$password = "123";
// Cadena Easy Connect (ajusta puerto y servicio si es necesario)
$connection_string = "//localhost:1521/PDB1";

$conn = oci_connect($username, $password, $connection_string);

if (!$conn) {
    $e = oci_error();
    die("Conexión fallida: " . $e['message']);
}
?>
