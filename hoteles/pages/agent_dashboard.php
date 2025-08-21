<?php
session_start();
if (!isset($_SESSION['agent_id'])) {
    header("Location: login.php"); // Redirige a la página de login si no está logueado
    exit();
}

include('db_config.php');

// Conectar a la base de datos
$conn = getDBConnection();

// Obtener los agentes registrados (si es necesario)
$agent_id = $_SESSION['agent_id'];

// Obtener información de clientes (ejemplo)
$sql_clients = "SELECT CLIENT_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE FROM CLIENTS";
$stid_clients = oci_parse($conn, $sql_clients);
oci_execute($stid_clients);

// Obtener reservas pendientes (ejemplo)
$sql_reservations = "SELECT RESERVATION_ID, CLIENT_ID, HOTEL_ID, ROOM_TYPE, START_DATE, END_DATE FROM RESERVATIONS WHERE STATUS = 'Pendiente'";
$stid_reservations = oci_parse($conn, $sql_reservations);
oci_execute($stid_reservations);

// Obtener pagos pendientes (ejemplo)
$sql_payments = "SELECT PAYMENT_ID, INVOICE_ID, PAYMENT_DATE, AMOUNT_PAID FROM PAYMENTS WHERE STATUS = 'Pendiente'";
$stid_payments = oci_parse($conn, $sql_payments);
oci_execute($stid_payments);

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Agente</title>
</head>
<body>
    <h1>Bienvenido al Dashboard de Agente</h1>

    <!-- Sección de Clientes -->
    <h2>Clientes Registrados</h2>
    <table border="1">
        <tr>
            <th>ID Cliente</th>
            <th>Nombre</th>
            <th>Correo</th>
            <th>Teléfono</th>
            <th>Acciones</th>
        </tr>
        <?php while ($row = oci_fetch_assoc($stid_clients)): ?>
            <tr>
                <td><?php echo $row['CLIENT_ID']; ?></td>
                <td><?php echo $row['FIRST_NAME'] . " " . $row['LAST_NAME']; ?></td>
                <td><?php echo $row['EMAIL']; ?></td>
                <td><?php echo $row['PHONE']; ?></td>
                <td><a href="edit_client.php?id=<?php echo $row['CLIENT_ID']; ?>">Editar</a> | <a href="delete_client.php?id=<?php echo $row['CLIENT_ID']; ?>">Eliminar</a></td>
            </tr>
        <?php endwhile; ?>
    </table>

    <!-- Sección de Reservas Pendientes -->
    <h2>Reservas Pendientes</h2>
    <table border="1">
        <tr>
            <th>ID Reserva</th>
            <th>ID Cliente</th>
            <th>ID Hotel</th>
            <th>Tipo de Habitación</th>
            <th>Fecha Inicio</th>
            <th>Fecha Fin</th>
            <th>Acciones</th>
        </tr>
        <?php while ($row = oci_fetch_assoc($stid_reservations)): ?>
            <tr>
                <td><?php echo $row['RESERVATION_ID']; ?></td>
                <td><?php echo $row['CLIENT_ID']; ?></td>
                <td><?php echo $row['HOTEL_ID']; ?></td>
                <td><?php echo $row['ROOM_TYPE']; ?></td>
                <td><?php echo $row['START_DATE']; ?></td>
                <td><?php echo $row['END_DATE']; ?></td>
                <td><a href="approve_reservation.php?id=<?php echo $row['RESERVATION_ID']; ?>">Aprobar</a> | <a href="cancel_reservation.php?id=<?php echo $row['RESERVATION_ID']; ?>">Cancelar</a></td>
            </tr>
        <?php endwhile; ?>
    </table>

    <!-- Sección de Pagos Pendientes -->
    <h2>Pagos Pendientes</h2>
    <table border="1">
        <tr>
            <th>ID Pago</th>
            <th>ID Factura</th>
            <th>Fecha Pago</th>
            <th>Monto Pagado</th>
            <th>Acciones</th>
        </tr>
        <?php while ($row = oci_fetch_assoc($stid_payments)): ?>
            <tr>
                <td><?php echo $row['PAYMENT_ID']; ?></td>
                <td><?php echo $row['INVOICE_ID']; ?></td>
                <td><?php echo $row['PAYMENT_DATE']; ?></td>
                <td><?php echo $row['AMOUNT_PAID']; ?></td>
                <td><a href="process_payment.php?id=<?php echo $row['PAYMENT_ID']; ?>">Procesar Pago</a> | <a href="cancel_payment.php?id=<?php echo $row['PAYMENT_ID']; ?>">Cancelar</a></td>
            </tr>
        <?php endwhile; ?>
    </table>

    <?php
    oci_free_statement($stid_clients);
    oci_free_statement($stid_reservations);
    oci_free_statement($stid_payments);
    oci_close($conn);
    ?>

</body>
</html>
