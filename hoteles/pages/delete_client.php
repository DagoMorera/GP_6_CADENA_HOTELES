<?php
session_start();
if (!isset($_SESSION['client_id'])) {
    header("Location: login.php");
    exit();
}

include('db_config.php');

// Obtener el ID del cliente a eliminar
if (isset($_GET['id'])) {
    $client_id = $_GET['id'];

    // Conectar a la base de datos
    $conn = getDBConnection();
    $sql = "DELETE FROM CLIENTS WHERE CLIENT_ID = :client_id";
    $stid = oci_parse($conn, $sql);
    oci_bind_by_name($stid, ":client_id", $client_id);
    $result = oci_execute($stid);

    if ($result) {
        echo "Cliente eliminado correctamente.";
    } else {
        echo "Error al eliminar el cliente.";
    }

    oci_free_statement($stid);
    oci_close($conn);
} else {
    echo "No se encontró el cliente.";
}
?>
