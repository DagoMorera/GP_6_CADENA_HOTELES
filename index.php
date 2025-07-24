<?php include 'db_connection.php'; ?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8" />
<title>Formulario de Reserva - Cadena de Hoteles</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Aquí enlazamos el CSS externo -->
<link rel="stylesheet" href="estilos.css" />
</head>
<body>
<div class="container">
    <h2>Reserva tu Estancia</h2>

    <form method="post" action="procesar_reserva.php">

        <div class="left-column">
            <!-- Datos del cliente -->
            <div class="form-section">
                <h3>Datos del Cliente</h3>
                <label for="nombre">Nombre completo:</label>
                <input type="text" id="nombre" name="nombre" required>

                <label for="cedula">Cédula o pasaporte:</label>
                <input type="text" id="cedula" name="cedula" required>

                <label for="correo">Correo electrónico:</label>
                <input type="email" id="correo" name="correo" required>

                <label for="telefono">Teléfono:</label>
                <input type="tel" id="telefono" name="telefono" required>
            </div>

            <!-- Método de pago -->
            <div class="form-section">
                <h3>Método de Pago</h3>
                <label for="nombre_tarjeta">Nombre en la tarjeta:</label>
                <input type="text" id="nombre_tarjeta" name="nombre_tarjeta" required>

                <label for="numero_tarjeta">Número de tarjeta:</label>
                <input type="text" id="numero_tarjeta" name="numero_tarjeta" maxlength="16" pattern="\d{16}" required>

                <label for="expiracion">Fecha de expiración:</label>
                <input type="month" id="expiracion" name="expiracion" required>

                <label for="cvv">CVV:</label>
                <input type="text" id="cvv" name="cvv" maxlength="4" pattern="\d{3,4}" required>
            </div>
        </div>

        <div class="right-column">
            <!-- Detalles de reserva -->
            <div class="form-section">
                <h3>Detalles de la Reserva</h3>
                <label for="hotel">Hotel:</label>
                <select id="hotel" name="hotel" required>
                    <option value="">Seleccione un hotel</option>
                    <?php
                    $sql = "SELECT id_hotel, nombre_hotel FROM Hoteles ORDER BY nombre_hotel ASC";
                    $result = oci_parse($conn, $sql);
                    oci_execute($result);
                    while (($row = oci_fetch_array($result, OCI_ASSOC)) != false) {
                        echo "<option value='{$row['ID_HOTEL']}'>{$row['NOMBRE_HOTEL']}</option>";
                    }
                    ?>
                </select>

                <label for="fecha_ingreso">Fecha de ingreso:</label>
                <input type="date" id="fecha_ingreso" name="fecha_ingreso" required>

                <label for="fecha_salida">Fecha de salida:</label>
                <input type="date" id="fecha_salida" name="fecha_salida" required>

                <label>Servicios adicionales:</label>
                        <div id="servicios-container" class="checkbox-group">
                        <p>Seleccione un hotel para ver los servicios disponibles.</p>
                        </div>

            </div>
        </div>

        <button type="submit">Reservar Ahora</button>
    </form>
</div>
<script>
document.getElementById('hotel').addEventListener('change', function() {
    const hotelId = this.value;
    const serviciosContainer = document.getElementById('servicios-container'); // corregido aquí
    serviciosContainer.innerHTML = ''; // Limpiar servicios previos

    if (hotelId) {
        fetch(`servicios.php?hotel_id=${hotelId}`)
            .then(response => response.json())
            .then(data => {
                if(data.length === 0){
                    serviciosContainer.innerHTML = '<p>No hay servicios disponibles para este hotel.</p>';
                    return;
                }
                data.forEach(servicio => {
                    const label = document.createElement('label');
                    label.style.display = 'block';
                    label.style.fontWeight = 'normal';
                    label.style.marginTop = '8px';

                    const checkbox = document.createElement('input');
                    checkbox.type = 'checkbox';
                    checkbox.name = 'servicios[]';
                    checkbox.value = servicio.NOMBRE_DEL_SERVICIO;

                    label.appendChild(checkbox);
                   label.append(` ${servicio.nombre_del_servicio} ($${servicio.costo_por_servicio})`);
                    serviciosContainer.appendChild(label);
                });
            })
            .catch(error => {
                serviciosContainer.innerHTML = '<p>Error al cargar los servicios.</p>';
                console.error('Error:', error);
            });
    } else {
        serviciosContainer.innerHTML = '<p>Seleccione un hotel para ver los servicios disponibles.</p>';
    }
});
</script>

<!-- Bootstrap JS (opcional, pero útil) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
