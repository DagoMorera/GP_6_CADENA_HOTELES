<?php
session_start();
if (!isset($_SESSION['client_id'])) {
    header("Location: login.php");
    exit();
}

include('db_config.php');

// Conectar a la base de datos
$conn = getDBConnection();
$sql = "SELECT PAYMENT_ID, INVOICE_ID, PAYMENT_DATE, AMOUNT_PAID, PAYMENT_METHOD FROM PAYMENTS";
$stid = oci_parse($conn, $sql);
oci_execute($stid);

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ver Pagos</title>
</head>
<body>
    <h1>Lista de Pagos</h1>

    <table border="1">
        <tr>
            <th>ID Pago</th>
            <th>ID Factura</th>
            <th>Fecha de Pago</th>
            <th>Monto Pagado</th>
            <th>Método de Pago</th>
        </tr>

        <?php while ($row = oci_fetch_assoc($stid)): ?>
            <tr>
                <td><?php echo $row['PAYMENT_ID']; ?></td>
                <td><?php echo $row['INVOICE_ID']; ?></td>
                <td><?php echo $row['PAYMENT_DATE']; ?></td>
                <td><?php echo $row['AMOUNT_PAID']; ?></td>
                <td><?php echo $row['PAYMENT_METHOD']; ?></td>
            </tr>
        <?php endwhile; ?>

    </table>

    <?php
    oci_free_statement($stid);
    oci_close($conn);
    ?>

</body>
</html>
