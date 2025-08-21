<?php
session_start();
if (!isset($_SESSION['client_id'])) {
    header("Location: login.php");
    exit();
}

include('db_config.php');

// Verificar si el ID de la factura está presente
if (isset($_GET['id'])) {
    $invoice_id = $_GET['id'];

    // Conectar a la base de datos
    $conn = getDBConnection();
    $sql = "SELECT INVOICE_ID, RESERVATION_ID, TOTAL_AMOUNT, PAYMENT_METHOD, INVOICE_DATE, DISCOUNT FROM INVOICES WHERE INVOICE_ID = :invoice_id";
    $stid = oci_parse($conn, $sql);
    oci_bind_by_name($stid, ":invoice_id", $invoice_id);
    oci_execute($stid);
    $row = oci_fetch_assoc($stid);
    oci_free_statement($stid);

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $amount_paid = $_POST['amount_paid'];
        $payment_method = $_POST['payment_method'];
        $payment_date = date('Y-m-d'); // Fecha de pago actual

        // Procesar el pago
        $update_sql = "UPDATE INVOICES SET PAYMENT_METHOD = :payment_method, DISCOUNT = :discount WHERE INVOICE_ID = :invoice_id";
        $update_stid = oci_parse($conn, $update_sql);

        oci_bind_by_name($update_stid, ":payment_method", $payment_method);
        oci_bind_by_name($update_stid, ":discount", $row['DISCOUNT']);
        oci_bind_by_name($update_stid, ":invoice_id", $invoice_id);

        $result = oci_execute($update_stid);

        // Insertar en la tabla de pagos
        $payment_sql = "INSERT INTO PAYMENTS (INVOICE_ID, PAYMENT_DATE, AMOUNT_PAID, PAYMENT_METHOD) VALUES (:invoice_id, :payment_date, :amount_paid, :payment_method)";
        $payment_stid = oci_parse($conn, $payment_sql);

        oci_bind_by_name($payment_stid, ":invoice_id", $invoice_id);
        oci_bind_by_name($payment_stid, ":payment_date", $payment_date);
        oci_bind_by_name($payment_stid, ":amount_paid", $amount_paid);
        oci_bind_by_name($payment_stid, ":payment_method", $payment_method);

        $payment_result = oci_execute($payment_stid);

        if ($result && $payment_result) {
            echo "Pago procesado correctamente.";
        } else {
            echo "Error al procesar el pago.";
        }

        oci_free_statement($update_stid);
        oci_free_statement($payment_stid);
        oci_close($conn);
    }
} else {
    echo "No se encontró la factura.";
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Procesar Factura</title>
</head>
<body>
    <h1>Procesar Factura</h1>

    <form action="process_invoice.php?id=<?php echo $invoice_id; ?>" method="POST">
        <label for="invoice_id">ID Factura:</label>
        <input type="text" id="invoice_id" name="invoice_id" value="<?php echo $row['INVOICE_ID']; ?>" readonly><br><br>

        <label for="reservation_id">ID Reservación:</label>
        <input type="text" id="reservation_id" name="reservation_id" value="<?php echo $row['RESERVATION_ID']; ?>" readonly><br><br>

        <label for="total_amount">Total Facturado:</label>
        <input type="text" id="total_amount" name="total_amount" value="<?php echo $row['TOTAL_AMOUNT']; ?>" readonly><br><br>

        <label for="amount_paid">Monto Pagado:</label>
        <input type="number" id="amount_paid" name="amount_paid" required><br><br>

        <label for="payment_method">Método de Pago:</label>
        <select id="payment_method" name="payment_method" required>
            <option value="Tarjeta">Tarjeta</option>
            <option value="Efectivo">Efectivo</option>
            <option value="Transferencia">Transferencia</option>
        </select><br><br>

        <button type="submit">Procesar Pago</button>
    </form>

</body>
</html>
