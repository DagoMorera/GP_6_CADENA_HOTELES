<?php
session_start();
if (!isset($_SESSION['client_id'])) {
    header("Location: login.php");
    exit();
}

include('db_config.php');

// Obtener el ID del cliente a editar
if (isset($_GET['id'])) {
    $client_id = $_GET['id'];

    // Conectar a la base de datos
    $conn = getDBConnection();
    $sql = "SELECT FIRST_NAME, LAST_NAME, EMAIL, PHONE, ADDRESS FROM CLIENTS WHERE CLIENT_ID = :client_id";
    $stid = oci_parse($conn, $sql);
    oci_bind_by_name($stid, ":client_id", $client_id);
    oci_execute($stid);
    $row = oci_fetch_assoc($stid);
    oci_free_statement($stid);

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $first_name = $_POST['first_name'];
        $last_name = $_POST['last_name'];
        $email = $_POST['email'];
        $phone = $_POST['phone'];
        $address = $_POST['address'];

        // Actualizar el cliente en la base de datos
        $update_sql = "UPDATE CLIENTS SET FIRST_NAME = :first_name, LAST_NAME = :last_name, EMAIL = :email, PHONE = :phone, ADDRESS = :address WHERE CLIENT_ID = :client_id";
        $update_stid = oci_parse($conn, $update_sql);

        oci_bind_by_name($update_stid, ":first_name", $first_name);
        oci_bind_by_name($update_stid, ":last_name", $last_name);
        oci_bind_by_name($update_stid, ":email", $email);
        oci_bind_by_name($update_stid, ":phone", $phone);
        oci_bind_by_name($update_stid, ":address", $address);
        oci_bind_by_name($update_stid, ":client_id", $client_id);

        $result = oci_execute($update_stid);

        if ($result) {
            echo "Cliente actualizado correctamente.";
        } else {
            echo "Error al actualizar el cliente.";
        }

        oci_free_statement($update_stid);
        oci_close($conn);
    }
} else {
    echo "No se encontró el cliente.";
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Cliente</title>
</head>
<body>
    <h1>Editar Cliente</h1>

    <form action="edit_client.php?id=<?php echo $client_id; ?>" method="POST">
        <label for="first_name">Nombre:</label><br>
        <input type="text" id="first_name" name="first_name" value="<?php echo $row['FIRST_NAME']; ?>" required><br><br>

        <label for="last_name">Apellido:</label><br>
        <input type="text" id="last_name" name="last_name" value="<?php echo $row['LAST_NAME']; ?>" required><br><br>

        <label for="email">Correo:</label><br>
        <input type="email" id="email" name="email" value="<?php echo $row['EMAIL']; ?>" required><br><br>

        <label for="phone">Teléfono:</label><br>
        <input type="text" id="phone" name="phone" value="<?php echo $row['PHONE']; ?>" required><br><br>

        <label for="address">Dirección:</label><br>
        <input type="text" id="address" name="address" value="<?php echo $row['ADDRESS']; ?>" required><br><br>

        <button type="submit">Actualizar Cliente</button>
    </form>

</body>
</html>
