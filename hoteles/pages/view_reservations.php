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

$sql = "SELECT RESERVATION_ID, HOTEL_ID, ROOM_TYPE, START_DATE, END_DATE, NUMBER_OF_ROOMS FROM RESERVATIONS WHERE CLIENT_ID = :client_id";
$stid = oci_parse($conn, $sql);
oci_bind_by_name($stid, ":client_id", $client_id);
oci_execute($stid);

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mis Reservas</title>
</head>
<body>
    <h1>Mis Reservas</h1>

    <table border="1">
        <tr>
            <th>ID Reserva</th>
            <th>ID Hotel</th>
            <th>Tipo de Habitación</th>
            <th>Fecha de Check-in</th>
            <th>Fecha de Check-out</th>
            <th>Número de Habitaciones</th>
        </tr>

        <?php while ($row = oci_fetch_assoc($stid)): ?>
            <tr>
                <td><?php echo $row['RESERVATION_ID']; ?></td>
                <td><?php echo $row['HOTEL_ID']; ?></td>
                <td><?php echo $row['ROOM_TYPE']; ?></td>
                <td><?php echo $row['START_DATE']; ?></td>
                <td><?php echo $row['END_DATE']; ?></td>
                <td><?php echo $row['NUMBER_OF_ROOMS']; ?></td>
            </tr>
        <?php endwhile; ?>

    </table>

    <?php
    oci_free_statement($stid);
    oci_close($conn);
    ?>

</body>
</html>
