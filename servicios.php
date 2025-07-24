<?php
include 'db_connection.php';

if (isset($_GET['hotel_id'])) {
    $hotel_id = intval($_GET['hotel_id']);

    $sql = "SELECT nombre_del_servicio, costo_por_servicio FROM Servicios WHERE id_hotel = :hotel_id ORDER BY nombre_del_servicio";
    $stid = oci_parse($conn, $sql);
    oci_bind_by_name($stid, ":hotel_id", $hotel_id);

    if (!oci_execute($stid)) {
        $e = oci_error($stid);
        header('Content-Type: application/json');
        echo json_encode(['error' => $e['message']]);
        exit;
    }

    $servicios = [];

    while (($row = oci_fetch_assoc($stid)) != false) {
        // Convertir claves a minúsculas
        $row_lower = array_change_key_case($row, CASE_LOWER);
        $servicios[] = $row_lower;
    }

    header('Content-Type: application/json');
    echo json_encode($servicios);
} else {
    header('Content-Type: application/json');
    echo json_encode([]);
}
?>
