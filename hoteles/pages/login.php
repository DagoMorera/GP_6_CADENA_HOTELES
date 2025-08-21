<?php
// Incluir la conexión a la base de datos
include('db_connect.php');

// Iniciar sesión
session_start();

// Verificar si el cliente está logueado
if (isset($_SESSION['client_id'])) {
    header("Location: dashboard.php"); // Redirigir al dashboard si ya está logueado
    exit();
}

// Determinar si es un cliente o un agente
$user_type = $_GET['user'] ?? null;

// Función para verificar las credenciales
function verify_login($username, $password, $user_type) {
    global $conn;

    if ($user_type == 'client') {
        $sql = "SELECT * FROM CLIENTS WHERE EMAIL = :email AND PASSWORD = :password";
    } else {
        $sql = "SELECT * FROM EMPLOYEES WHERE EMAIL = :email AND PASSWORD = :password";
    }

    $stid = oci_parse($conn, $sql);
    oci_bind_by_name($stid, ":email", $username);
    oci_bind_by_name($stid, ":password", $password);
    oci_execute($stid);

    if ($row = oci_fetch_assoc($stid)) {
        return $row; // Devuelve los datos si las credenciales son correctas
    }

    return false;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Recibir datos del formulario
    $username = $_POST['email'];
    $password = $_POST['password'];

    // Verificar las credenciales
    $user_data = verify_login($username, $password, $user_type);

    if ($user_data) {
        // Guardar la sesión del cliente
        $_SESSION['client_id'] = $user_data['CLIENT_ID']; // O puedes almacenar el nombre o el ID, según lo necesites
        $_SESSION['username'] = $username; // Puedes agregar otros datos relevantes a la sesión
        header("Location: dashboard.php"); // Redirigir a dashboard.php
        exit();
    } else {
        $error_message = "Credenciales incorrectas.";
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar sesión</title>
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

<!-- Formulario de inicio de sesión -->
<div class="container">
    <h2>Iniciar sesión como <?php echo ucfirst($user_type); ?></h2>

    <?php if (isset($error_message)): ?>
        <div class="error"><?php echo $error_message; ?></div>
    <?php endif; ?>

    <form method="POST" action="login.php?user=<?php echo $user_type; ?>">
        <label for="email">Correo electrónico:</label>
        <input type="email" id="email" name="email" placeholder="Correo electrónico" required>

        <label for="password">Contraseña:</label>
        <input type="password" id="password" name="password" placeholder="Contraseña" required>

        <button type="submit">Iniciar sesión</button>
    </form>
</div>

<footer>
    <p>&copy; 2025 Hotel Booking. Todos los derechos reservados.</p>
</footer>

<script src="assets/js/validation.js"></script>
</body>
</html>
