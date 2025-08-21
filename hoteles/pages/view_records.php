<?php
// Iniciar sesión
session_start();

// Verificar si el cliente está logueado
if (!isset($_SESSION['client_id'])) {
    header("Location: login.php");
    exit();
}

include('db_config.php');

// Conectar a la base de datos
$conn = getDBConnection();
$sql = "SELECT CLIENT_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE, ADDRESS FROM CLIENTS";
$stid = oci_parse($conn, $sql);
oci_execute($stid);

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ver Registros</title>
</head>
<body>
    <h1>Lista de Clientes</h1>

    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Correo</th>
            <th>Teléfono</th>
            <th>Dirección</th>
            <th>Acciones</th>
        </tr>

        <?php while ($row = oci_fetch_assoc($stid)): ?>
            <tr>
                <td><?php echo $row['CLIENT_ID']; ?></td>
                <td><?php echo $row['FIRST_NAME']; ?></td>
                <td><?php echo $row['LAST_NAME']; ?></td>
                <td><?php echo $row['EMAIL']; ?></td>
                <td><?php echo $row['PHONE']; ?></td>
                <td><?php echo $row['ADDRESS']; ?></td>
                <td>
                    <a href="edit_record.php?id=<?php echo $row['CLIENT_ID']; ?>">Editar</a> | 
                    <a href="delete_record.php?id=<?php echo $row['CLIENT_ID']; ?>">Eliminar</a>
                </td>
            </tr>
        <?php endwhile; ?>

    </table>

    <?php
    oci_free_statement($stid);
    oci_close($conn);
    ?>

</body>
</html>
