<?php
// Incluir la conexión a la base de datos
include('db_connect.php');

// Verificar si el formulario fue enviado
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Obtener los datos del formulario
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $address = $_POST['address'];
    $password = $_POST['password'];

    // Insertar los datos en la tabla CLIENTS
$sql = "INSERT INTO CLIENTS (CLIENT_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE, ADDRESS, PASSWORD)
        VALUES (CLIENTS_SEQ.NEXTVAL, :first_name, :last_name, :email, :phone, :address, :password)";


    $stid = oci_parse($conn, $sql);
    oci_bind_by_name($stid, ":first_name", $first_name);
    oci_bind_by_name($stid, ":last_name", $last_name);
    oci_bind_by_name($stid, ":email", $email);
    oci_bind_by_name($stid, ":phone", $phone);
    oci_bind_by_name($stid, ":address", $address);
    oci_bind_by_name($stid, ":password", $password);  // Asegúrate de encriptar la contraseña antes de almacenarla.

    if (oci_execute($stid)) {
        echo "Registro exitoso. Puedes iniciar sesión.";
        // Redirigir a la página de inicio de sesión
        header("Location: login.php?user=client");
        exit;
    } else {
        echo "Error en el registro.";
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro - Cliente</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<!-- Menú de navegación -->
<header>
    <nav>
        <ul>
            <li><a href="index.php">Inicio</a></li>
            <li><a href="login.php?user=client">Iniciar sesión como Cliente</a></li>
            <li><a href="login.php?user=agent">Iniciar sesión como Agente</a></li>
        </ul>
    </nav>
</header>

<!-- Formulario de registro -->
<div class="container">
    <h2>Registro de Cliente</h2>

    <form method="POST" action="register.php">
        <label for="first_name">Nombre:</label>
        <input type="text" id="first_name" name="first_name" required>

        <label for="last_name">Apellido:</label>
        <input type="text" id="last_name" name="last_name" required>

        <label for="email">Correo electrónico:</label>
        <input type="email" id="email" name="email" required>

        <label for="phone">Teléfono:</label>
        <input type="text" id="phone" name="phone" required>

        <label for="address">Dirección:</label>
        <input type="text" id="address" name="address" required>

        <label for="password">Contraseña:</label>
        <input type="password" id="password" name="password" required>

        <button type="submit">Registrar</button>
    </form>
</div>

<footer>
    <p>&copy; 2025 Hotel Booking. Todos los derechos reservados.</p>
</footer>

<script src="assets/js/validation.js"></script>
</body>
</html>
