<?php
session_start();
if (!isset($_SESSION['client_id'])) {
    header("Location: login.php");
    exit();
}

include('db_config.php');

// Conectar a la base de datos
$conn = getDBConnection();
$sql = "SELECT INVOICE_ID, RESERVATION_ID, TOTAL_AMOUNT, PAYMENT_METHOD, INVOICE_DATE, DISCOUNT FROM INVOICES";
$stid = oci_parse($conn, $sql);
oci_execute($stid);

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ver Facturas</title>
</head>
<body>
    <h1>Lista de Facturas</h1>

    <table border="1">
        <tr>
            <th>ID Factura</th>
            <th>ID Reservación</th>
            <th>Total</th>
            <th>Método de Pago</th>
            <th>Fecha de Emisión</th>
            <th>Descuento</th>
            <th>Acciones</th>
        </tr>

        <?php while ($row = oci_fetch_assoc($stid)): ?>
            <tr>
                <td><?php echo $row['INVOICE_ID']; ?></td>
                <td><?php echo $row['RESERVATION_ID']; ?></td>
                <td><?php echo $row['TOTAL_AMOUNT']; ?></td>
                <td><?php echo $row['PAYMENT_METHOD']; ?></td>
                <td><?php echo $row['INVOICE_DATE']; ?></td>
                <td><?php echo $row['DISCOUNT']; ?>%</td>
                <td>
                    <a href="process_invoice.php?id=<?php echo $row['INVOICE_ID']; ?>">Procesar Pago</a> 
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
