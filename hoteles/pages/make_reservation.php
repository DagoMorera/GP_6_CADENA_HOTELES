<?php
session_start();
if (!isset($_SESSION['client_id'])) {
    header("Location: login.php");
    exit();
}

include('db_config.php');

// Conectar a la base de datos
$conn = getDBConnection();

// Obtener los hoteles disponibles para el select
$sql_hotels = "SELECT HOTEL_ID, NAME FROM HOTELS";
$stid_hotels = oci_parse($conn, $sql_hotels);
oci_execute($stid_hotels);

// Procesar la reserva
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $hotel_id = $_POST['hotel_id'];
    $room_type = $_POST['room_type'];
    $checkin_date = $_POST['checkin'];
    $checkout_date = $_POST['checkout'];
    $number_of_rooms = $_POST['rooms'];

    // Insertar la reserva en la base de datos
    $client_id = $_SESSION['client_id'];
    $sql_reservation = "INSERT INTO RESERVATIONS (CLIENT_ID, HOTEL_ID, ROOM_TYPE, START_DATE, END_DATE, NUMBER_OF_ROOMS) 
                        VALUES (:client_id, :hotel_id, :room_type, TO_DATE(:checkin_date, 'YYYY-MM-DD'), TO_DATE(:checkout_date, 'YYYY-MM-DD'), :number_of_rooms)";
    $stid_reservation = oci_parse($conn, $sql_reservation);

    oci_bind_by_name($stid_reservation, ":client_id", $client_id);
    oci_bind_by_name($stid_reservation, ":hotel_id", $hotel_id);
    oci_bind_by_name($stid_reservation, ":room_type", $room_type);
    oci_bind_by_name($stid_reservation, ":checkin_date", $checkin_date);
    oci_bind_by_name($stid_reservation, ":checkout_date", $checkout_date);
    oci_bind_by_name($stid_reservation, ":number_of_rooms", $number_of_rooms);

    $result = oci_execute($stid_reservation);

    if ($result) {
        echo "Reserva realizada correctamente.";
    } else {
        echo "Error al realizar la reserva.";
    }

    oci_free_statement($stid_reservation);
    oci_close($conn);
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hacer Reserva</title>
</head>
<body>
    <h1>Realizar Reserva</h1>

    <form action="make_reservation.php" method="POST">
        <label for="hotel">Selecciona un Hotel:</label>
        <select name="hotel_id" id="hotel" required>
            <option value="">Selecciona un hotel</option>
            <?php while ($row = oci_fetch_assoc($stid_hotels)): ?>
                <option value="<?php echo $row['HOTEL_ID']; ?>"><?php echo $row['NAME']; ?></option>
            <?php endwhile; ?>
        </select><br><br>

        <label for="room_type">Tipo de Habitación:</label>
        <select name="room_type" id="room_type" required>
            <option value="Suite">Suite</option>
            <option value="Individual">Individual</option>
            <option value="Doble">Doble</option>
            <option value="Familiar">Familiar</option>
        </select><br><br>

        <label for="checkin">Fecha de Check-in:</label>
        <input type="date" name="checkin" id="checkin" required><br><br>

        <label for="checkout">Fecha de Check-out:</label>
        <input type="date" name="checkout" id="checkout" required><br><br>

        <label for="rooms">Número de habitaciones:</label>
        <select name="rooms" id="rooms" required>
            <option value="1">1 habitación</option>
            <option value="2">2 habitaciones</option>
            <option value="3">3 habitaciones</option>
            <option value="4">4 habitaciones</option>
        </select><br><br>

        <button type="submit">Realizar Reserva</button>
    </form>

</body>
</html>
