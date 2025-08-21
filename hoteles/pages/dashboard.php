<?php
// Iniciar sesión
session_start();

// Verificar si el cliente está logueado
if (!isset($_SESSION['client_id'])) {
    header("Location: login.php"); // Redirigir al login si no está logueado
    exit();
}

// Conectar a la base de datos Oracle
$conn = oci_connect('andres', '123', 'localhost:1521/PDB1', 'AL32UTF8');

// Verificar si la conexión es exitosa
if (!$conn) {
    $e = oci_error();
    die("Error de conexión: " . htmlentities($e['message'], ENT_QUOTES));
}

// Obtener los hoteles para el primer select
$sql_hotels = "SELECT hotel_id, name FROM HOTELS";
$stid_hotels = oci_parse($conn, $sql_hotels);
oci_execute($stid_hotels);

if (!$stid_hotels) {
    $e = oci_error($stid_hotels);
    echo "Error en la consulta: " . $e['message'];
}

// Ahora imprime directamente los hoteles antes del select para ver qué devuelve
while ($row = oci_fetch_assoc($stid_hotels)) {
    echo "Hotel ID: " . $row['HOTEL_ID'] . " - Hotel Name: " . $row['NAME'] . "<br>";
}

// Verificar si la consulta se ejecutó correctamente
if (!$stid_hotels) {
    $e = oci_error($stid_hotels);
    echo "Error en la consulta de hoteles: " . $e['message'];
} else {
    echo "Consulta ejecutada correctamente.<br>";  // Verificación de que la consulta fue exitosa
}

// Obtener la información del cliente logueado
$client_id = $_SESSION['client_id'];
$sql = "SELECT FIRST_NAME, LAST_NAME, EMAIL FROM CLIENTS WHERE CLIENT_ID = :client_id";
$stid = oci_parse($conn, $sql);
oci_bind_by_name($stid, ":client_id", $client_id);
oci_execute($stid);
$row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS);

// Datos del cliente
$first_name = $row['FIRST_NAME'];
$last_name = $row['LAST_NAME'];
$email = $row['EMAIL'];

oci_free_statement($stid);
oci_close($conn);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Cliente</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <script src="assets/js/jquery.min.js"></script> <!-- Para manejar AJAX -->
</head>
<body>
    <div class="dashboard-container">
        <h1>Bienvenido, <?php echo $first_name . ' ' . $last_name; ?>!</h1>

        <div class="profile-info">
            <h2>Tu Perfil</h2>
            <p><strong>Correo Electrónico:</strong> <?php echo $email; ?></p>
        </div>

        <div class="actions">
            <h3>Acciones Rápidas</h3>
            <ul>
                <li><a href="reservations.php">Ver mis Reservas</a></li>
                <li><a href="payments.php">Ver mis Pagos</a></li>
                <li><a href="services.php">Ver Servicios Disponibles</a></li>
                <li><a href="update_profile.php">Actualizar Perfil</a></li>
                <li><a href="logout.php">Cerrar Sesión</a></li>
            </ul>
        </div>

        <!-- Formulario de búsqueda de hoteles -->
        <div class="container">
            <h2>Bienvenido a Hotel Booking</h2>
            <p>Busque y reserve hoteles con facilidad</p>

            <form action="search_hotels.php" method="POST">

                <!-- Select de Hoteles -->
                <label for="hotel">Selecciona un Hotel:</label>
                <select id="hotel" name="hotel" onchange="getRoomTypesAndServices(this.value)">
                    <option value="">Selecciona un hotel</option>
                    <?php while ($row = oci_fetch_assoc($stid_hotels)) { ?>
                        <!-- Imprimir los resultados para depurar -->
                        <?php echo "Hotel ID: " . $row['HOTEL_ID'] . " - " . $row['NAME'] . "<br>"; ?>

                        <option value="<?php echo $row['HOTEL_ID']; ?>"><?php echo $row['NAME']; ?></option>
                    <?php } ?>
                </select>

                <!-- Select de Tipos de habitación (se llenará con AJAX) -->
                <label for="room_type">Tipo de habitación:</label>
                <select id="room_type" name="room_type">
                    <option value="">Selecciona un tipo de habitación</option>
                </select>

                <!-- Checkboxes para los Servicios (se llenarán con AJAX) -->
                <div id="services"></div>

                <br><br>

                <label for="checkin">Fecha de Check-in:</label>
                <input type="date" id="checkin" name="checkin">

                <label for="checkout">Fecha de Check-out:</label>
                <input type="date" id="checkout" name="checkout">

                <label for="rooms">Número de habitaciones:</label>
                <select id="rooms" name="rooms">
                    <option value="1">1 habitación</option>
                    <option value="2">2 habitaciones</option>
                    <option value="3">3 habitaciones</option>
                    <option value="4">4 habitaciones</option>
                </select>

                <button type="submit">Buscar Hoteles</button>
            </form>
        </div>

        <div class="notifications">
            <h3>Ofertas Especiales</h3>
            <p>¡No te pierdas nuestras ofertas! Haz tu próxima reserva con un 10% de descuento.</p>
        </div>
    </div>

    <script>
        // Función para obtener los tipos de habitación y servicios según el hotel seleccionado
        function getRoomTypesAndServices(hotel_id) {
            if (hotel_id == "") {
                document.getElementById("room_type").innerHTML = "<option value=''>Selecciona un tipo de habitación</option>";
                document.getElementById("services").innerHTML = "";
                return;
            }

            // Realizar una llamada AJAX para obtener los tipos de habitación y los servicios
            $.ajax({
                url: "get_room_and_services.php", // Archivo PHP que devuelve los tipos de habitaciones y servicios
                method: "GET",
                data: { hotel_id: hotel_id },
                success: function(data) {
                    // Separar los tipos de habitación y servicios de la respuesta
                    let [roomTypes, services] = data.split("||");
                    document.getElementById("room_type").innerHTML = roomTypes;
                    document.getElementById("services").innerHTML = services;
                }
            });
        }
    </script>

</body>
</html>
