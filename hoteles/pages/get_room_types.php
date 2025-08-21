<?php
// Conectar a la base de datos Oracle
$conn = oci_connect('andres', '123', 'localhost:1521/PDB1', 'AL32UTF8');

// Verificar si se pasó el `hotel_id` a través de GET
if (isset($_GET['hotel_id'])) {
    $hotel_id = $_GET['hotel_id'];

    // Obtener los tipos de habitación
    $sql_rooms = "SELECT room_type FROM ROOMS WHERE hotel_id = :hotel_id";
    $stid_rooms = oci_parse($conn, $sql_rooms);
    oci_bind_by_name($stid_rooms, ":hotel_id", $hotel_id);
    oci_execute($stid_rooms);

    // Crear las opciones para el select de tipos de habitación
    $roomOptions = "<option value=''>Selecciona un tipo de habitación</option>";
    while ($row = oci_fetch_assoc($stid_rooms)) {
        $roomOptions .= "<option value='" . $row['ROOM_TYPE'] . "'>" . $row['ROOM_TYPE'] . "</option>";
    }

    // Obtener los servicios
    $sql_services = "SELECT service_name FROM SERVICES WHERE hotel_id = :hotel_id";
    $stid_services = oci_parse($conn, $sql_services);
    oci_bind_by_name($stid_services, ":hotel_id", $hotel_id);
    oci_execute($stid_services);

    // Crear los checkboxes para los servicios
    $serviceCheckboxes = "";
    while ($row = oci_fetch_assoc($stid_services)) {
        $serviceCheckboxes .= "<label><input type='checkbox' name='services[]' value='" . $row['SERVICE_NAME'] . "'> " . $row['SERVICE_NAME'] . "</label><br>";
    }

    // Devolver los tipos de habitación y los servicios
    echo $roomOptions . "||" . $serviceCheckboxes;
}

oci_free_statement($stid_rooms);
oci_free_statement($stid_services);
oci_close($conn);
?>
