<?php
// Iniciar sesión
session_start();

// Verificar si el cliente está logueado
if (!isset($_SESSION['client_id'])) {
    header("Location: login.php"); // Redirigir al login si no está logueado
    exit();
}

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Cliente</title>
</head>
<body>
    <h1>Bienvenido al Dashboard</h1>

    <div>
        <h3>Acciones Disponibles</h3>
        <ul>
            <li><a href="add_record.php">Agregar Nuevo Registro</a></li>
            <li><a href="view_records.php">Ver Registros</a></li>
        </ul>
    </div>
</body>
</html>
