<?php
// Iniciar sesión
session_start();

// Conectar a la base de datos Oracle
$conn = oci_connect('andres', '123', 'localhost:1521/PDB1', 'AL32UTF8');

// Verificar si la conexión es exitosa
if (!$conn) {
    $e = oci_error();
    die("Error de conexión: " . htmlentities($e['message'], ENT_QUOTES));
}

// Verificar si el formulario fue enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recoger los datos del formulario
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Consulta para verificar las credenciales del cliente o agente
    $sql = "SELECT CLIENT_ID, PASSWORD FROM CLIENTS WHERE EMAIL = :email";
    $stid = oci_parse($conn, $sql);
    
    // Vincular las variables a la consulta
    oci_bind_by_name($stid, ":email", $email);
    
    // Ejecutar la consulta
    oci_execute($stid);
    
    // Verificar si el correo existe
    if ($row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS)) {
        // Verificar si la contraseña coincide
        if (password_verify($password, $row['PASSWORD'])) {
            // Guardar la sesión del cliente
            $_SESSION['client_id'] = $row['CLIENT_ID'];
            header("Location: dashboard.php"); // Redirigir al dashboard
        } else {
            header("Location: login.php?error=true"); // Mostrar error
        }
    } else {
        header("Location: login.php?error=true"); // Mostrar error
    }

    // Liberar la memoria y cerrar la conexión
    oci_free_statement($stid);
    oci_close($conn);
}
?>
