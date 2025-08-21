<?php
session_start();
if (!isset($_SESSION['client_id'])) {
    header("Location: login.php");
    exit();
}

include('db_config.php');

// Conectar a la base de datos
$conn = getDBConnection();
$client_id = $_SESSION['client_id'];

$sql = "SELECT RR.RESTAURANT_RESERVATION_ID, R.NAME, RR.RESERVATION_DATE, RR.NUMBER_OF_GUESTS 
        FROM RESTAURANT_RESERVATIONS RR
        JOIN RESTAURANTS R ON RR.RESTAURANT_ID = R.RESTAURANT_ID
        WHERE RR.CLIENT_ID = :client_id";
$stid = oci_parse($conn, $sql);
oci_bind_by_name($stid, ":client_id", $client_id);
oci_execute($stid);

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mis Reservas en Restaurantes</title>
</head>
<body>
    <h1>Mis Reservas en Restaurantes</h1>

    <table border="1">
        <tr>
            <th>ID Reserva</th>
            <th>Restaurante</th>
            <th>Fecha de Reserva</th>
            <th>Número de Comensales</th>
        </tr>

        <?php while ($row = oci_fetch_assoc($stid)): ?>
            <tr>
                <td><?php echo $row['RESTAURANT_RESERVATION_ID']; ?></td>
                <td><?php echo $row['NAME']; ?></td>
                <td><?php echo $row['RESERVATION_DATE']; ?></td>
                <td><?php echo $row['NUMBER_OF_GUESTS']; ?></td>
            </tr>
        <?php endwhile; ?>

    </table>

    <?php
    oci_free_statement($stid);
    oci_close($conn);
    ?>

</body>
</html>
