CREATE TABLE Hoteles (
    id_hotel INT PRIMARY KEY,
    nombre_hotel VARCHAR(100) NOT NULL,
    ubicacion_hotel VARCHAR(100) NOT NULL,
    clasificacion INT,
    total_habitaciones INT,
    servicios_ofrecidos VARCHAR(500)
);

CREATE TABLE Servicios (
    id_servicio INT PRIMARY KEY,
    id_hotel INT,
    nombre_del_servicio VARCHAR(100) NOT NULL,
    costo_por_servicio NUMBER(10,2) NOT NULL,
    CONSTRAINT fk_servicios_hoteles FOREIGN KEY (id_hotel) REFERENCES Hoteles(id_hotel)
);
CREATE TABLE Habitaciones (
    id_habitacion INT PRIMARY KEY,
    id_hotel INT,
    tipo_habitacion VARCHAR(50) NOT NULL,
    precio_por_noche NUMBER(10,2) NOT NULL,
    estado_habitacion VARCHAR(50) NOT NULL,
    capacidad_personas INT NOT NULL,
    CONSTRAINT fk_habitaciones_hoteles FOREIGN KEY (id_hotel) REFERENCES Hoteles(id_hotel)
);
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nombre_completo VARCHAR(150) NOT NULL,
    email_cliente VARCHAR(100) NOT NULL,
    telefono_cliente VARCHAR(20),
    documento_id VARCHAR(50) NOT NULL
);
CREATE TABLE Reservaciones_Restaurante (
    id_reserva_restaurante INT PRIMARY KEY,
    id_cliente INT,
    id_hotel INT,
    fecha_reserva DATE NOT NULL,
    hora_reserva VARCHAR(10) NOT NULL,
    cantidad_comensales INT NOT NULL,
    CONSTRAINT fk_reserva_cliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    CONSTRAINT fk_reserva_hotel FOREIGN KEY (id_hotel) REFERENCES Hoteles(id_hotel)
);
CREATE TABLE Historial_Estadias (
    id_historial INT PRIMARY KEY,
    id_cliente INT,
    id_hotel INT,
    id_habitacion INT,
    ingreso_anterior DATE NOT NULL,
    salida_anterior DATE NOT NULL,
    CONSTRAINT fk_historial_cliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    CONSTRAINT fk_historial_hotel FOREIGN KEY (id_hotel) REFERENCES Hoteles(id_hotel),
    CONSTRAINT fk_historial_habitacion FOREIGN KEY (id_habitacion) REFERENCES Habitaciones(id_habitacion)
);

CREATE TABLE Reservaciones (
    id_reservacion INT PRIMARY KEY,
    id_cliente INT,
    id_hotel INT,
    fecha_inicio DATE NOT NULL,
    fecha_final DATE NOT NULL,
    estado_reservacion VARCHAR(50) NOT NULL,
    CONSTRAINT fk_reservacion_cliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    CONSTRAINT fk_reservacion_hotel FOREIGN KEY (id_hotel) REFERENCES Hoteles(id_hotel)
);

CREATE TABLE Pagos (
    id_pago INT PRIMARY KEY,
    id_reservacion INT,
    monto_pagado NUMBER(10,2) NOT NULL,
    fecha_pago DATE NOT NULL,
    forma_pago VARCHAR(50) NOT NULL,
    CONSTRAINT fk_pagos_reservacion FOREIGN KEY (id_reservacion) REFERENCES Reservaciones(id_reservacion)
);
CREATE TABLE Facturas (
    id_factura INT PRIMARY KEY,
    id_reservacion INT,
    total_facturado NUMBER(12,2) NOT NULL,
    fecha_emision DATE NOT NULL,
    descripcion_detallada VARCHAR2(500),
    CONSTRAINT fk_factura_reservacion FOREIGN KEY (id_reservacion) REFERENCES Reservaciones(id_reservacion)
);

CREATE TABLE Check_In (
    id_checkin INT PRIMARY KEY,
    id_reservacion INT,
    fecha_checkin DATE NOT NULL,
    hora_checkin VARCHAR(10) NOT NULL,
    CONSTRAINT fk_checkin_reservacion FOREIGN KEY (id_reservacion) REFERENCES Reservaciones(id_reservacion)
);

CREATE TABLE CheckOut (
    id_checkout INT PRIMARY KEY,
    id_reservacion INT,
    fecha_checkout DATE NOT NULL,
    hora_checkout VARCHAR(10) NOT NULL,
    CONSTRAINT fk_checkout_reservacion FOREIGN KEY (id_reservacion) REFERENCES Reservaciones(id_reservacion)
);

CREATE TABLE Detalle_Reservacion_Habitacion (
    id_detalle INT PRIMARY KEY,
    id_reservacion INT,
    id_habitacion INT,
    numero_noches INT NOT NULL,
    costo_total NUMBER(12,2) NOT NULL,
    CONSTRAINT fk_detalle_reservacion FOREIGN KEY (id_reservacion) REFERENCES Reservaciones(id_reservacion),
    CONSTRAINT fk_detalle_habitacion FOREIGN KEY (id_habitacion) REFERENCES Habitaciones(id_habitacion)
);

CREATE TABLE Empleados (
    id_empleado INT PRIMARY KEY,
    id_hotel INT,
    nombre_completo VARCHAR2(100) NOT NULL,
    puesto VARCHAR2(50),
    email_empleado VARCHAR2(100),
    telefono_empleado VARCHAR2(20),
    fecha_contratacion DATE,
    CONSTRAINT fk_empleado_hotel FOREIGN KEY (id_hotel) REFERENCES Hoteles(id_hotel)
);

-- Secuencia para Check-In
CREATE SEQUENCE seq_checkin START WITH 1 INCREMENT BY 1 NOCACHE;

-- Secuencia para CheckOut
CREATE SEQUENCE seq_checkout START WITH 1 INCREMENT BY 1 NOCACHE;

-- Secuencia para Pagos
CREATE SEQUENCE seq_pago START WITH 1 INCREMENT BY 1 NOCACHE;

-- Secuencia para Facturas
CREATE SEQUENCE seq_factura START WITH 1 INCREMENT BY 1 NOCACHE;

-- Secuencia para Historial_Estadias
CREATE SEQUENCE seq_historial START WITH 1 INCREMENT BY 1 NOCACHE;
-- ========================================
-- CABECERA DEL PAQUETE
-- ========================================
CREATE OR REPLACE PACKAGE pkg_gestion_hotelera AS
    -- Procedimientos
    PROCEDURE agregar_hotel(p_id INT, p_nombre VARCHAR2, p_ubicacion VARCHAR2, p_clasificacion INT, p_total_habitaciones INT, p_servicios VARCHAR2);
    PROCEDURE eliminar_cliente(p_id_cliente INT);
    PROCEDURE actualizar_estado_habitacion(p_id INT, p_estado VARCHAR2);
    PROCEDURE registrar_checkin(p_id_reservacion INT, p_fecha DATE, p_hora VARCHAR2);
    PROCEDURE registrar_checkout(p_id_reservacion INT, p_fecha DATE, p_hora VARCHAR2);
    PROCEDURE registrar_pago(p_id_reservacion INT, p_monto NUMBER, p_fecha DATE, p_forma_pago VARCHAR2);
    PROCEDURE generar_factura(p_id_reservacion INT);
    PROCEDURE insertar_servicio(p_id INT, p_id_hotel INT, p_nombre VARCHAR2, p_costo NUMBER);
    PROCEDURE reservar_restaurante(p_id INT, p_id_cliente INT, p_id_hotel INT, p_fecha DATE, p_hora VARCHAR2, p_comensales INT);
    PROCEDURE mover_cliente_historial(p_id_cliente INT);

    -- Funciones
    FUNCTION obtener_total_hoteles RETURN INT;
    FUNCTION habitaciones_disponibles(p_id_hotel INT) RETURN INT;
    FUNCTION calcular_total_reservacion(p_id_reservacion INT) RETURN NUMBER;
    FUNCTION cliente_tiene_reserva(p_id_cliente INT) RETURN BOOLEAN;
    FUNCTION obtener_nombre_hotel(p_id INT) RETURN VARCHAR2;
    FUNCTION total_servicios_hotel(p_id_hotel INT) RETURN INT;
    FUNCTION total_reservaciones_cliente(p_id_cliente INT) RETURN INT;
    FUNCTION monto_total_pagado(p_id_reservacion INT) RETURN NUMBER;
    FUNCTION estado_reservacion(p_id_reservacion INT) RETURN VARCHAR2;
    FUNCTION obtener_checkin(p_id_reservacion INT) RETURN DATE;
END pkg_gestion_hotelera;
/

-- ========================================
-- CUERPO DEL PAQUETE
-- ========================================
CREATE OR REPLACE PACKAGE BODY pkg_gestion_hotelera AS

    PROCEDURE agregar_hotel(p_id INT, p_nombre VARCHAR2, p_ubicacion VARCHAR2, p_clasificacion INT, p_total_habitaciones INT, p_servicios VARCHAR2) IS
    BEGIN
        INSERT INTO Hoteles VALUES(p_id, p_nombre, p_ubicacion, p_clasificacion, p_total_habitaciones, p_servicios);
    END;

    PROCEDURE eliminar_cliente(p_id_cliente INT) IS
    BEGIN
        DELETE FROM Clientes WHERE id_cliente = p_id_cliente;
    END;

    PROCEDURE actualizar_estado_habitacion(p_id INT, p_estado VARCHAR2) IS
    BEGIN
        UPDATE Habitaciones SET estado_habitacion = p_estado WHERE id_habitacion = p_id;
    END;

    PROCEDURE registrar_checkin(p_id_reservacion INT, p_fecha DATE, p_hora VARCHAR2) IS
    BEGIN
        INSERT INTO Check_In VALUES(seq_checkin.NEXTVAL, p_id_reservacion, p_fecha, p_hora);
    END;

    PROCEDURE registrar_checkout(p_id_reservacion INT, p_fecha DATE, p_hora VARCHAR2) IS
    BEGIN
        INSERT INTO CheckOut VALUES(seq_checkout.NEXTVAL, p_id_reservacion, p_fecha, p_hora);
    END;

    PROCEDURE registrar_pago(p_id_reservacion INT, p_monto NUMBER, p_fecha DATE, p_forma_pago VARCHAR2) IS
    BEGIN
        INSERT INTO Pagos VALUES(seq_pago.NEXTVAL, p_id_reservacion, p_monto, p_fecha, p_forma_pago);
    END;

    PROCEDURE generar_factura(p_id_reservacion INT) IS
        v_total NUMBER;
    BEGIN
        SELECT SUM(costo_total) INTO v_total
        FROM Detalle_Reservacion_Habitacion
        WHERE id_reservacion = p_id_reservacion;

        INSERT INTO Facturas(id_factura, id_reservacion, total_facturado, fecha_emision, descripcion_detallada)
        VALUES(seq_factura.NEXTVAL, p_id_reservacion, v_total, SYSDATE, 'Factura generada automáticamente');
    END;

    PROCEDURE insertar_servicio(p_id INT, p_id_hotel INT, p_nombre VARCHAR2, p_costo NUMBER) IS
    BEGIN
        INSERT INTO Servicios VALUES(p_id, p_id_hotel, p_nombre, p_costo);
    END;

    PROCEDURE reservar_restaurante(p_id INT, p_id_cliente INT, p_id_hotel INT, p_fecha DATE, p_hora VARCHAR2, p_comensales INT) IS
    BEGIN
        INSERT INTO Reservaciones_Restaurante VALUES(p_id, p_id_cliente, p_id_hotel, p_fecha, p_hora, p_comensales);
    END;

    PROCEDURE mover_cliente_historial(p_id_cliente INT) IS
        CURSOR c_reservas IS
            SELECT id_reservacion, id_hotel
            FROM Reservaciones
            WHERE id_cliente = p_id_cliente AND estado_reservacion = 'Completada';

        v_habitacion INT;
        v_inicio DATE;
        v_final DATE;

    BEGIN
        FOR r IN c_reservas LOOP
            SELECT id_habitacion, fecha_inicio, fecha_final
            INTO v_habitacion, v_inicio, v_final
            FROM Detalle_Reservacion_Habitacion dr
            JOIN Reservaciones res ON res.id_reservacion = dr.id_reservacion
            WHERE dr.id_reservacion = r.id_reservacion
            AND ROWNUM = 1;

            INSERT INTO Historial_Estadias VALUES(seq_historial.NEXTVAL, p_id_cliente, r.id_hotel, v_habitacion, v_inicio, v_final);
        END LOOP;
    END;

    FUNCTION obtener_total_hoteles RETURN INT IS
        v_total INT;
    BEGIN
        SELECT COUNT(*) INTO v_total FROM Hoteles;
        RETURN v_total;
    END;

    FUNCTION habitaciones_disponibles(p_id_hotel INT) RETURN INT IS
        v_disp INT;
    BEGIN
        SELECT COUNT(*) INTO v_disp
        FROM Habitaciones
        WHERE id_hotel = p_id_hotel AND estado_habitacion = 'Disponible';
        RETURN v_disp;
    END;

    FUNCTION calcular_total_reservacion(p_id_reservacion INT) RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT SUM(costo_total) INTO v_total
        FROM Detalle_Reservacion_Habitacion
        WHERE id_reservacion = p_id_reservacion;
        RETURN NVL(v_total, 0);
    END;

    FUNCTION cliente_tiene_reserva(p_id_cliente INT) RETURN BOOLEAN IS
        v_count INT;
    BEGIN
        SELECT COUNT(*) INTO v_count
        FROM Reservaciones
        WHERE id_cliente = p_id_cliente AND estado_reservacion = 'Activa';
        RETURN v_count > 0;
    END;

    FUNCTION obtener_nombre_hotel(p_id INT) RETURN VARCHAR2 IS
        v_nombre VARCHAR2(100);
    BEGIN
        SELECT nombre_hotel INTO v_nombre
        FROM Hoteles
        WHERE id_hotel = p_id;
        RETURN v_nombre;
    END;

    FUNCTION total_servicios_hotel(p_id_hotel INT) RETURN INT IS
        v_total INT;
    BEGIN
        SELECT COUNT(*) INTO v_total
        FROM Servicios
        WHERE id_hotel = p_id_hotel;
        RETURN v_total;
    END;

    FUNCTION total_reservaciones_cliente(p_id_cliente INT) RETURN INT IS
        v_total INT;
    BEGIN
        SELECT COUNT(*) INTO v_total
        FROM Reservaciones
        WHERE id_cliente = p_id_cliente;
        RETURN v_total;
    END;

    FUNCTION monto_total_pagado(p_id_reservacion INT) RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT SUM(monto_pagado) INTO v_total
        FROM Pagos
        WHERE id_reservacion = p_id_reservacion;
        RETURN NVL(v_total, 0);
    END;

    FUNCTION estado_reservacion(p_id_reservacion INT) RETURN VARCHAR2 IS
        v_estado VARCHAR2(50);
    BEGIN
        SELECT estado_reservacion INTO v_estado
        FROM Reservaciones
        WHERE id_reservacion = p_id_reservacion;
        RETURN v_estado;
    END;

    FUNCTION obtener_checkin(p_id_reservacion INT) RETURN DATE IS
        v_fecha DATE;
    BEGIN
        SELECT fecha_checkin INTO v_fecha
        FROM Check_In
        WHERE id_reservacion = p_id_reservacion;
        RETURN v_fecha;
    END;

END pkg_gestion_hotelera;
/

CREATE OR REPLACE VIEW vista_reservas_activas AS
SELECT r.id_reservacion, c.nombre_completo AS cliente, h.nombre_hotel, r.fecha_inicio, r.fecha_final
FROM Reservaciones r
JOIN Clientes c ON r.id_cliente = c.id_cliente
JOIN Hoteles h ON r.id_hotel = h.id_hotel
WHERE r.estado_reservacion = 'Activa';


CREATE OR REPLACE VIEW vista_habitaciones_disponibles AS
SELECT h.id_hotel, h.nombre_hotel, hab.id_habitacion, hab.tipo_habitacion, hab.precio_por_noche
FROM Habitaciones hab
JOIN Hoteles h ON hab.id_hotel = h.id_hotel
WHERE hab.estado_habitacion = 'Disponible';


CREATE OR REPLACE VIEW vista_servicios_por_hotel AS
SELECT h.nombre_hotel, s.nombre_del_servicio, s.costo_por_servicio
FROM Servicios s
JOIN Hoteles h ON s.id_hotel = h.id_hotel;


CREATE OR REPLACE VIEW vista_historial_clientes AS
SELECT c.nombre_completo, h.nombre_hotel, hab.tipo_habitacion, he.ingreso_anterior, he.salida_anterior
FROM Historial_Estadias he
JOIN Clientes c ON he.id_cliente = c.id_cliente
JOIN Hoteles h ON he.id_hotel = h.id_hotel
JOIN Habitaciones hab ON he.id_habitacion = hab.id_habitacion;

CREATE OR REPLACE VIEW vista_empleados_por_hotel AS
SELECT e.nombre_completo, e.puesto, e.email_empleado, e.telefono_empleado, h.nombre_hotel
FROM Empleados e
JOIN Hoteles h ON e.id_hotel = h.id_hotel;


CREATE OR REPLACE VIEW vista_facturas_detalladas AS
SELECT f.id_factura, c.nombre_completo AS cliente, f.total_facturado, f.fecha_emision, f.descripcion_detallada
FROM Facturas f
JOIN Reservaciones r ON f.id_reservacion = r.id_reservacion
JOIN Clientes c ON r.id_cliente = c.id_cliente;


CREATE OR REPLACE VIEW vista_pagos_por_reserva AS
SELECT p.id_pago, p.id_reservacion, c.nombre_completo AS cliente, p.monto_pagado, p.fecha_pago, p.forma_pago
FROM Pagos p
JOIN Reservaciones r ON p.id_reservacion = r.id_reservacion
JOIN Clientes c ON r.id_cliente = c.id_cliente;



CREATE OR REPLACE VIEW vista_detalle_reservaciones AS
SELECT r.id_reservacion, c.nombre_completo AS cliente, h.tipo_habitacion, d.numero_noches, d.costo_total
FROM Detalle_Reservacion_Habitacion d
JOIN Reservaciones r ON d.id_reservacion = r.id_reservacion
JOIN Clientes c ON r.id_cliente = c.id_cliente
JOIN Habitaciones h ON d.id_habitacion = h.id_habitacion;



CREATE OR REPLACE VIEW vista_checkin_checkout AS
SELECT r.id_reservacion, c.nombre_completo, h.nombre_hotel,
       ci.fecha_checkin, co.fecha_checkout
FROM Reservaciones r
JOIN Clientes c ON r.id_cliente = c.id_cliente
JOIN Hoteles h ON r.id_hotel = h.id_hotel
LEFT JOIN Check_In ci ON r.id_reservacion = ci.id_reservacion
LEFT JOIN CheckOut co ON r.id_reservacion = co.id_reservacion;



CREATE OR REPLACE VIEW vista_reservas_restaurante AS
SELECT rr.id_reserva_restaurante, c.nombre_completo, h.nombre_hotel,
       rr.fecha_reserva, rr.hora_reserva, rr.cantidad_comensales
FROM Reservaciones_Restaurante rr
JOIN Clientes c ON rr.id_cliente = c.id_cliente
JOIN Hoteles h ON rr.id_hotel = h.id_hotel;
