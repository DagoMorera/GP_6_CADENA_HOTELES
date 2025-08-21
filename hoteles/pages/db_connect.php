<?php
// Conectar a la base de datos Oracle
function getDBConnection() {
    $conn = oci_connect('andres', '123', 'localhost:1521/PDB1', 'AL32UTF8');
    if (!$conn) {
        $e = oci_error();
        die("Error de conexión: " . htmlentities($e['message'], ENT_QUOTES));  // Ver error específico de la conexión
    }
    return $conn;
}
?>
