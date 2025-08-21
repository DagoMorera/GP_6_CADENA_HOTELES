<?php
session_start();
if (!isset($_SESSION['client_id'])) {
    header("Location: login.php");
    exit();
}

include('db_config.php');

// Conectar a la base de datos
$conn = getDBConnection();

// Obtener los restaurantes disponibles para el select
$sql_restaurants = "SELECT RESTAURANT_ID, NAME FROM RESTAURANTS";
$stid_restaurants = oci_parse($conn, $sql_restaurants);
oci_execute($stid_restaurants);

// Procesar la reserva de restaurante
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $restaurant_id = $_POST['restaurant_id'];
    $reservation_date = $_POST['reservation_date'];
    $number_of_guests = $_POST['guests'];

    // Insertar la reserva de restaurante en la base de datos
    $client_id = $_SESSION['client_id'];
    $sql_reservation = "INSERT INTO RESTAURANT_RESERVATIONS (HOTEL_ID, CLIENT_ID, RESERVATION_DATE, NUMBER_OF_GUESTS) 
                        VALUES (:restaurant_id, :client_id, TO_DATE(:reservation_date, 'YYYY-MM-DD'), :number_of_guests)";
    $stid_reservation = oci_parse($conn, $sql_reservation);

    oci_bind_by_name($stid_reservation, ":restaurant_id", $restaurant_id);
    oci_bind_by_name($stid_reservation, ":client_id", $client_id);
    oci_bind_by_name($stid_reservation, ":reservation_date", $reservation_date);
    oci_bind_by_name($stid_reservation, ":number_of_guests", $number_of_guests);

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
    <title>Hacer Reserva en Restaurante</title>
</head>
<body>
    <h1>Realizar Reserva en Restaurante</h1>

    <form action="make_restaurant_reservation.php" method="POST">
        <label for="restaurant">Selecciona un Restaurante:</label>
        <select name="restaurant_id" id="restaurant" required>
            <option value="">Selecciona un restaurante</option>
            <?php while ($row = oci_fetch_assoc($stid_restaurants)): ?>
                <option value="<?php echo $row['RESTAURANT_ID']; ?>"><?php echo $row['NAME']; ?></option>
            <?php endwhile; ?>
        </select><br><br>

        <label for="reservation_date">Fecha de Reserva:</label>
        <input type="date" name="reservation_date" id="reservation_date" required><br><br>

        <label for="guests">Número de Comensales:</label>
        <input type="number" name="guests" id="guests" required><br><br>

        <button type="submit">Realizar Reserva</button>
    </form>

</body>
</html>
