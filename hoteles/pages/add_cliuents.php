<?php
session_start();
if (!isset($_SESSION['client_id'])) {
    header("Location: login.php");
    exit();
}

include('db_config.php');

// Procesar el formulario de agregar cliente
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $address = $_POST['address'];

    // Conectar a la base de datos
    $conn = getDBConnection();
    $sql = "INSERT INTO CLIENTS (FIRST_NAME, LAST_NAME, EMAIL, PHONE, ADDRESS) VALUES (:first_name, :last_name, :email, :phone, :address)";
    $stid = oci_parse($conn, $sql);

    oci_bind_by_name($stid, ":first_name", $first_name);
    oci_bind_by_name($stid, ":last_name", $last_name);
    oci_bind_by_name($stid, ":email", $email);
    oci_bind_by_name($stid, ":phone", $phone);
    oci_bind_by_name($stid, ":address", $address);

    $result = oci_execute($stid);

    if ($result) {
        echo "Cliente agregado correctamente.";
    } else {
        echo "Error al agregar el cliente.";
    }

    oci_free_statement($stid);
    oci_close($conn);
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Cliente</title>
</head>
<body>
    <h1>Agregar Nuevo Cliente</h1>

    <form action="add_client.php" method="POST">
        <label for="first_name">Nombre:</label><br>
        <input type="text" id="first_name" name="first_name" required><br><br>

        <label for="last_name">Apellido:</label><br>
        <input type="text" id="last_name" name="last_name" required><br><br>

        <label for="email">Correo:</label><br>
        <input type="email" id="email" name="email" required><br><br>

        <label for="phone">Teléfono:</label><br>
        <input type="text" id="phone" name="phone" required><br><br>

        <label for="address">Dirección:</label><br>
        <input type="text" id="address" name="address" required><br><br>

        <button type="submit">Agregar Cliente</button>
    </form>

</body>
</html>
