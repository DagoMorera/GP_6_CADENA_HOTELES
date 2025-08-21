--------------------------------------------------------
--  File created - Thursday-August-21-2025   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence CLIENTS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ANDRES"."CLIENTS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 15 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence EMPLOYEES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ANDRES"."EMPLOYEES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 11 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HOTELS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ANDRES"."HOTELS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence INVOICES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ANDRES"."INVOICES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence PAYMENTS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ANDRES"."PAYMENTS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence PROMOTIONS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ANDRES"."PROMOTIONS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence RESERVATIONS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ANDRES"."RESERVATIONS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 15 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence RESTAURANTS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ANDRES"."RESTAURANTS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 11 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence RESTAURANT_RESERVATIONS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ANDRES"."RESTAURANT_RESERVATIONS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ROOMS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ANDRES"."ROOMS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CHECKIN
--------------------------------------------------------

   CREATE SEQUENCE  "ANDRES"."SEQ_CHECKIN"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CHECKOUT
--------------------------------------------------------

   CREATE SEQUENCE  "ANDRES"."SEQ_CHECKOUT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_FACTURA
--------------------------------------------------------

   CREATE SEQUENCE  "ANDRES"."SEQ_FACTURA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_HISTORIAL
--------------------------------------------------------

   CREATE SEQUENCE  "ANDRES"."SEQ_HISTORIAL"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PAGO
--------------------------------------------------------

   CREATE SEQUENCE  "ANDRES"."SEQ_PAGO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SERVICIOS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ANDRES"."SERVICIOS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 111 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table CHECKINS_CHECKOUTS
--------------------------------------------------------

  CREATE TABLE "ANDRES"."CHECKINS_CHECKOUTS" 
   (	"CHECKIN_CHECKOUT_ID" NUMBER(*,0), 
	"RESERVATION_ID" NUMBER(*,0), 
	"CHECKIN_DATE" DATE, 
	"CHECKOUT_DATE" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CLIENTS
--------------------------------------------------------

  CREATE TABLE "ANDRES"."CLIENTS" 
   (	"CLIENT_ID" NUMBER(*,0), 
	"FIRST_NAME" VARCHAR2(100 BYTE), 
	"LAST_NAME" VARCHAR2(100 BYTE), 
	"EMAIL" VARCHAR2(100 BYTE), 
	"PHONE" VARCHAR2(50 BYTE), 
	"ADDRESS" VARCHAR2(255 BYTE), 
	"PASSWORD" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CLIENT_STAY_HISTORY
--------------------------------------------------------

  CREATE TABLE "ANDRES"."CLIENT_STAY_HISTORY" 
   (	"HISTORY_ID" NUMBER(*,0), 
	"CLIENT_ID" NUMBER(*,0), 
	"HOTEL_ID" NUMBER(*,0), 
	"ROOM_ID" NUMBER(*,0), 
	"STAY_START_DATE" DATE, 
	"STAY_END_DATE" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table EMPLOYEES
--------------------------------------------------------

  CREATE TABLE "ANDRES"."EMPLOYEES" 
   (	"EMPLOYEE_ID" NUMBER(*,0), 
	"HOTEL_ID" NUMBER(*,0), 
	"ROLE" VARCHAR2(100 BYTE), 
	"FIRST_NAME" VARCHAR2(100 BYTE), 
	"LAST_NAME" VARCHAR2(100 BYTE), 
	"EMAIL" VARCHAR2(100 BYTE), 
	"PHONE" VARCHAR2(50 BYTE), 
	"SALARY" NUMBER(10,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table HOTELS
--------------------------------------------------------

  CREATE TABLE "ANDRES"."HOTELS" 
   (	"HOTEL_ID" NUMBER(*,0), 
	"NAME" VARCHAR2(255 BYTE), 
	"LOCATION" VARCHAR2(255 BYTE), 
	"CLASSIFICATION" VARCHAR2(50 BYTE), 
	"CONTACT_INFO" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table INVOICES
--------------------------------------------------------

  CREATE TABLE "ANDRES"."INVOICES" 
   (	"INVOICE_ID" NUMBER(*,0), 
	"RESERVATION_ID" NUMBER(*,0), 
	"TOTAL_AMOUNT" NUMBER(10,2), 
	"PAYMENT_METHOD" VARCHAR2(50 BYTE), 
	"INVOICE_DATE" DATE, 
	"DISCOUNT" NUMBER(5,2)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PAYMENTS
--------------------------------------------------------

  CREATE TABLE "ANDRES"."PAYMENTS" 
   (	"PAYMENT_ID" NUMBER(*,0), 
	"INVOICE_ID" NUMBER(*,0), 
	"PAYMENT_DATE" DATE, 
	"AMOUNT_PAID" NUMBER(10,2), 
	"PAYMENT_METHOD" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PROMOTIONS
--------------------------------------------------------

  CREATE TABLE "ANDRES"."PROMOTIONS" 
   (	"PROMOTION_ID" NUMBER(*,0), 
	"PROMOTION_NAME" VARCHAR2(255 BYTE), 
	"DISCOUNT_PERCENTAGE" NUMBER(5,2), 
	"START_DATE" DATE, 
	"END_DATE" DATE, 
	"IS_ACTIVE" NUMBER(1,0) DEFAULT 1 -- Marca si la promoción está activa (1 para TRUE, 0 para FALSE)

   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table RESERVATIONS
--------------------------------------------------------

  CREATE TABLE "ANDRES"."RESERVATIONS" 
   (	"RESERVATION_ID" NUMBER(*,0), 
	"CLIENT_ID" NUMBER(*,0), 
	"HOTEL_ID" NUMBER(*,0), 
	"START_DATE" DATE, 
	"END_DATE" DATE, 
	"STATUS" VARCHAR2(50 BYTE), 
	"ROOM_ID" NUMBER(*,0), 
	"NUMBER_OF_NIGHTS" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table RESTAURANTS
--------------------------------------------------------

  CREATE TABLE "ANDRES"."RESTAURANTS" 
   (	"RESTAURANT_ID" NUMBER(*,0), 
	"HOTEL_ID" NUMBER(*,0), 
	"NAME" VARCHAR2(255 BYTE), 
	"LOCATION" VARCHAR2(255 BYTE), 
	"CAPACITY" NUMBER(*,0), 
	"CONTACT_INFO" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table RESTAURANT_RESERVATIONS
--------------------------------------------------------

  CREATE TABLE "ANDRES"."RESTAURANT_RESERVATIONS" 
   (	"RESTAURANT_RESERVATION_ID" NUMBER(*,0), 
	"HOTEL_ID" NUMBER(*,0), 
	"CLIENT_ID" NUMBER(*,0), 
	"RESERVATION_DATE" DATE, 
	"NUMBER_OF_GUESTS" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ROOMS
--------------------------------------------------------

  CREATE TABLE "ANDRES"."ROOMS" 
   (	"ROOM_ID" NUMBER(*,0), 
	"HOTEL_ID" NUMBER(*,0), 
	"ROOM_TYPE" VARCHAR2(50 BYTE), 
	"STATUS" VARCHAR2(50 BYTE), 
	"CAPACITY" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SERVICES
--------------------------------------------------------

  CREATE TABLE "ANDRES"."SERVICES" 
   (	"SERVICE_ID" NUMBER(*,0), 
	"HOTEL_ID" NUMBER(*,0), 
	"SERVICE_NAME" VARCHAR2(100 BYTE), 
	"DESCRIPTION" CLOB, 
	"SERVICE_COST" NUMBER(10,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("DESCRIPTION") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for View VISTA_CHECKIN_CHECKOUT
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ANDRES"."VISTA_CHECKIN_CHECKOUT" ("ID_RESERVACION", "NOMBRE_COMPLETO", "NOMBRE_HOTEL", "FECHA_CHECKIN", "FECHA_CHECKOUT") AS 
  SELECT r.id_reservacion, c.nombre_completo, h.nombre_hotel,
       ci.fecha_checkin, co.fecha_checkout
FROM Reservaciones r
JOIN Clientes c ON r.id_cliente = c.id_cliente
JOIN Hoteles h ON r.id_hotel = h.id_hotel
LEFT JOIN Check_In ci ON r.id_reservacion = ci.id_reservacion
LEFT JOIN CheckOut co ON r.id_reservacion = co.id_reservacion
;
--------------------------------------------------------
--  DDL for View VISTA_DETALLE_RESERVACIONES
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ANDRES"."VISTA_DETALLE_RESERVACIONES" ("ID_RESERVACION", "CLIENTE", "TIPO_HABITACION", "NUMERO_NOCHES", "COSTO_TOTAL") AS 
  SELECT r.id_reservacion, c.nombre_completo AS cliente, h.tipo_habitacion, d.numero_noches, d.costo_total
FROM Detalle_Reservacion_Habitacion d
JOIN Reservaciones r ON d.id_reservacion = r.id_reservacion
JOIN Clientes c ON r.id_cliente = c.id_cliente
JOIN Habitaciones h ON d.id_habitacion = h.id_habitacion
;
--------------------------------------------------------
--  DDL for View VISTA_EMPLEADOS_POR_HOTEL
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ANDRES"."VISTA_EMPLEADOS_POR_HOTEL" ("NOMBRE_COMPLETO", "PUESTO", "EMAIL_EMPLEADO", "TELEFONO_EMPLEADO", "NOMBRE_HOTEL") AS 
  SELECT e.nombre_completo, e.puesto, e.email_empleado, e.telefono_empleado, h.nombre_hotel
FROM Empleados e
JOIN Hoteles h ON e.id_hotel = h.id_hotel
;
--------------------------------------------------------
--  DDL for View VISTA_FACTURAS_DETALLADAS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ANDRES"."VISTA_FACTURAS_DETALLADAS" ("ID_FACTURA", "CLIENTE", "TOTAL_FACTURADO", "FECHA_EMISION", "DESCRIPCION_DETALLADA") AS 
  SELECT f.id_factura, c.nombre_completo AS cliente, f.total_facturado, f.fecha_emision, f.descripcion_detallada
FROM Facturas f
JOIN Reservaciones r ON f.id_reservacion = r.id_reservacion
JOIN Clientes c ON r.id_cliente = c.id_cliente
;
--------------------------------------------------------
--  DDL for View VISTA_HABITACIONES_DISPONIBLES
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ANDRES"."VISTA_HABITACIONES_DISPONIBLES" ("ID_HOTEL", "NOMBRE_HOTEL", "ID_HABITACION", "TIPO_HABITACION", "PRECIO_POR_NOCHE") AS 
  SELECT h.id_hotel, h.nombre_hotel, hab.id_habitacion, hab.tipo_habitacion, hab.precio_por_noche
FROM Habitaciones hab
JOIN Hoteles h ON hab.id_hotel = h.id_hotel
WHERE hab.estado_habitacion = 'Disponible'
;
--------------------------------------------------------
--  DDL for View VISTA_HISTORIAL_CLIENTES
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ANDRES"."VISTA_HISTORIAL_CLIENTES" ("NOMBRE_COMPLETO", "NOMBRE_HOTEL", "TIPO_HABITACION", "INGRESO_ANTERIOR", "SALIDA_ANTERIOR") AS 
  SELECT c.nombre_completo, h.nombre_hotel, hab.tipo_habitacion, he.ingreso_anterior, he.salida_anterior
FROM Historial_Estadias he
JOIN Clientes c ON he.id_cliente = c.id_cliente
JOIN Hoteles h ON he.id_hotel = h.id_hotel
JOIN Habitaciones hab ON he.id_habitacion = hab.id_habitacion
;
--------------------------------------------------------
--  DDL for View VISTA_PAGOS_POR_RESERVA
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ANDRES"."VISTA_PAGOS_POR_RESERVA" ("ID_PAGO", "ID_RESERVACION", "CLIENTE", "MONTO_PAGADO", "FECHA_PAGO", "FORMA_PAGO") AS 
  SELECT p.id_pago, p.id_reservacion, c.nombre_completo AS cliente, p.monto_pagado, p.fecha_pago, p.forma_pago
FROM Pagos p
JOIN Reservaciones r ON p.id_reservacion = r.id_reservacion
JOIN Clientes c ON r.id_cliente = c.id_cliente
;
--------------------------------------------------------
--  DDL for View VISTA_RESERVAS_ACTIVAS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ANDRES"."VISTA_RESERVAS_ACTIVAS" ("ID_RESERVACION", "CLIENTE", "NOMBRE_HOTEL", "FECHA_INICIO", "FECHA_FINAL") AS 
  SELECT r.id_reservacion, c.nombre_completo AS cliente, h.nombre_hotel, r.fecha_inicio, r.fecha_final
FROM Reservaciones r
JOIN Clientes c ON r.id_cliente = c.id_cliente
JOIN Hoteles h ON r.id_hotel = h.id_hotel
WHERE r.estado_reservacion = 'Activa'
;
--------------------------------------------------------
--  DDL for View VISTA_RESERVAS_RESTAURANTE
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ANDRES"."VISTA_RESERVAS_RESTAURANTE" ("ID_RESERVA_RESTAURANTE", "NOMBRE_COMPLETO", "NOMBRE_HOTEL", "FECHA_RESERVA", "HORA_RESERVA", "CANTIDAD_COMENSALES") AS 
  SELECT rr.id_reserva_restaurante, c.nombre_completo, h.nombre_hotel,
       rr.fecha_reserva, rr.hora_reserva, rr.cantidad_comensales
FROM Reservaciones_Restaurante rr
JOIN Clientes c ON rr.id_cliente = c.id_cliente
JOIN Hoteles h ON rr.id_hotel = h.id_hotel
;
--------------------------------------------------------
--  DDL for View VISTA_SERVICIOS_POR_HOTEL
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ANDRES"."VISTA_SERVICIOS_POR_HOTEL" ("NOMBRE_HOTEL", "NOMBRE_DEL_SERVICIO", "COSTO_POR_SERVICIO") AS 
  SELECT h.nombre_hotel, s.nombre_del_servicio, s.costo_por_servicio
FROM Servicios s
JOIN Hoteles h ON s.id_hotel = h.id_hotel
;
REM INSERTING into ANDRES.CHECKINS_CHECKOUTS
SET DEFINE OFF;
REM INSERTING into ANDRES.CLIENTS
SET DEFINE OFF;
Insert into ANDRES.CLIENTS (CLIENT_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE,ADDRESS,PASSWORD) values (5,'Juan','Pérez','juan.perez@email.com','987654321','Calle Falsa 123','password123');
Insert into ANDRES.CLIENTS (CLIENT_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE,ADDRESS,PASSWORD) values (6,'Ana','Gómez','ana.gomez@email.com','912345678','Avenida Libertad 456','password456');
Insert into ANDRES.CLIENTS (CLIENT_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE,ADDRESS,PASSWORD) values (7,'Carlos','Martínez','carlos.martinez@email.com','934567890','Calle 5 de Mayo 789','password789');
Insert into ANDRES.CLIENTS (CLIENT_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE,ADDRESS,PASSWORD) values (8,'Laura','Rodríguez','laura.rodriguez@email.com','976543210','Bulevar de la Paz 321','password321');
Insert into ANDRES.CLIENTS (CLIENT_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE,ADDRESS,PASSWORD) values (9,'Pedro','López','pedro.lopez@email.com','965432109','Calle Gran Vía 654','password654');
Insert into ANDRES.CLIENTS (CLIENT_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE,ADDRESS,PASSWORD) values (10,'Sofía','Martínez','sofia.martinez@email.com','987632109','Avenida San Juan 123','password1234');
Insert into ANDRES.CLIENTS (CLIENT_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE,ADDRESS,PASSWORD) values (11,'Javier','Hernández','javier.hernandez@email.com','923476890','Calle del Sol 876','password4321');
Insert into ANDRES.CLIENTS (CLIENT_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE,ADDRESS,PASSWORD) values (12,'Lucía','Díaz','lucia.diaz@email.com','912345678','Avenida del Río 543','password5678');
Insert into ANDRES.CLIENTS (CLIENT_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE,ADDRESS,PASSWORD) values (13,'Martín','Sánchez','martin.sanchez@email.com','978654321','Calle Sierra 234','password8765');
Insert into ANDRES.CLIENTS (CLIENT_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE,ADDRESS,PASSWORD) values (14,'Marta','García','marta.garcia@email.com','923476543','Calle de la Luna 432','password1357');
Insert into ANDRES.CLIENTS (CLIENT_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE,ADDRESS,PASSWORD) values (1,'dago','Morera','cliente@gmail.com','987654321','Alajuela','123');
Insert into ANDRES.CLIENTS (CLIENT_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE,ADDRESS,PASSWORD) values (3,'Pedro','Mora','cliente2@gmail.com','9876543210','San Jose','123');
Insert into ANDRES.CLIENTS (CLIENT_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE,ADDRESS,PASSWORD) values (4,'pablo','santamaria','cliente3@gmail.com','90909090','Naranjo','123');
REM INSERTING into ANDRES.CLIENT_STAY_HISTORY
SET DEFINE OFF;
REM INSERTING into ANDRES.EMPLOYEES
SET DEFINE OFF;
Insert into ANDRES.EMPLOYEES (EMPLOYEE_ID,HOTEL_ID,ROLE,FIRST_NAME,LAST_NAME,EMAIL,PHONE,SALARY) values (1,1,'Gerente','Carlos','Pérez','carlos.perez@hotel1.com','987654321',5000);
Insert into ANDRES.EMPLOYEES (EMPLOYEE_ID,HOTEL_ID,ROLE,FIRST_NAME,LAST_NAME,EMAIL,PHONE,SALARY) values (2,1,'Recepcionista','Laura','González','laura.gonzalez@hotel1.com','912345678',1800);
Insert into ANDRES.EMPLOYEES (EMPLOYEE_ID,HOTEL_ID,ROLE,FIRST_NAME,LAST_NAME,EMAIL,PHONE,SALARY) values (3,1,'Cocinero','Luis','Martínez','luis.martinez@hotel1.com','934567890',2000);
Insert into ANDRES.EMPLOYEES (EMPLOYEE_ID,HOTEL_ID,ROLE,FIRST_NAME,LAST_NAME,EMAIL,PHONE,SALARY) values (4,2,'Gerente','Ana','Rodríguez','ana.rodriguez@hotel2.com','928374659',5500);
Insert into ANDRES.EMPLOYEES (EMPLOYEE_ID,HOTEL_ID,ROLE,FIRST_NAME,LAST_NAME,EMAIL,PHONE,SALARY) values (5,2,'Recepcionista','Sofía','López','sofia.lopez@hotel2.com','986543210',1800);
Insert into ANDRES.EMPLOYEES (EMPLOYEE_ID,HOTEL_ID,ROLE,FIRST_NAME,LAST_NAME,EMAIL,PHONE,SALARY) values (6,2,'Cocinero','Jorge','Vázquez','jorge.vazquez@hotel2.com','932654879',2100);
Insert into ANDRES.EMPLOYEES (EMPLOYEE_ID,HOTEL_ID,ROLE,FIRST_NAME,LAST_NAME,EMAIL,PHONE,SALARY) values (7,3,'Gerente','Marta','Hernández','marta.hernandez@hotel3.com','987234654',5200);
Insert into ANDRES.EMPLOYEES (EMPLOYEE_ID,HOTEL_ID,ROLE,FIRST_NAME,LAST_NAME,EMAIL,PHONE,SALARY) values (8,3,'Recepcionista','Pedro','Jiménez','pedro.jimenez@hotel3.com','975623459',1900);
Insert into ANDRES.EMPLOYEES (EMPLOYEE_ID,HOTEL_ID,ROLE,FIRST_NAME,LAST_NAME,EMAIL,PHONE,SALARY) values (9,4,'Gerente','Claudia','Paredes','claudia.paredes@hotel4.com','939283746',5300);
Insert into ANDRES.EMPLOYEES (EMPLOYEE_ID,HOTEL_ID,ROLE,FIRST_NAME,LAST_NAME,EMAIL,PHONE,SALARY) values (10,4,'Recepcionista','Isabel','Torres','isabel.torres@hotel4.com','924865730',1800);
REM INSERTING into ANDRES.HOTELS
SET DEFINE OFF;
Insert into ANDRES.HOTELS (HOTEL_ID,NAME,LOCATION,CLASSIFICATION,CONTACT_INFO) values (1,'The Ritz-Carlton','New York, USA','5','+1 212-308-9100');
Insert into ANDRES.HOTELS (HOTEL_ID,NAME,LOCATION,CLASSIFICATION,CONTACT_INFO) values (2,'Burj Al Arab','Dubai, UAE','7','+971 4 301 7777');
Insert into ANDRES.HOTELS (HOTEL_ID,NAME,LOCATION,CLASSIFICATION,CONTACT_INFO) values (3,'Four Seasons','Paris, France','5','+33 1 44 39 88 88');
Insert into ANDRES.HOTELS (HOTEL_ID,NAME,LOCATION,CLASSIFICATION,CONTACT_INFO) values (4,'Hotel de Crillon','Paris, France','5','+33 1 44 71 15 15');
Insert into ANDRES.HOTELS (HOTEL_ID,NAME,LOCATION,CLASSIFICATION,CONTACT_INFO) values (5,'The Peninsula','Hong Kong, China','5','+852 2920 2888');
Insert into ANDRES.HOTELS (HOTEL_ID,NAME,LOCATION,CLASSIFICATION,CONTACT_INFO) values (6,'Mandarin Oriental','Tokyo, Japan','5','+81 3 3270 8800');
Insert into ANDRES.HOTELS (HOTEL_ID,NAME,LOCATION,CLASSIFICATION,CONTACT_INFO) values (7,'The Langham','London, UK','5','+44 20 7636 1000');
Insert into ANDRES.HOTELS (HOTEL_ID,NAME,LOCATION,CLASSIFICATION,CONTACT_INFO) values (8,'The St. Regis','San Francisco, USA','5','+1 415-284-4000');
Insert into ANDRES.HOTELS (HOTEL_ID,NAME,LOCATION,CLASSIFICATION,CONTACT_INFO) values (9,'Aman Tokyo','Tokyo, Japan','5','+81 3 5226 3333');
Insert into ANDRES.HOTELS (HOTEL_ID,NAME,LOCATION,CLASSIFICATION,CONTACT_INFO) values (10,'The Plaza','New York, USA','5','+1 212-759-3000');
Insert into ANDRES.HOTELS (HOTEL_ID,NAME,LOCATION,CLASSIFICATION,CONTACT_INFO) values (11,'Shangri-La Hotel','Singapore, Singapore','5','+65 6213 4388');
Insert into ANDRES.HOTELS (HOTEL_ID,NAME,LOCATION,CLASSIFICATION,CONTACT_INFO) values (12,'InterContinental','Sydney, Australia','5','+61 2 9240 1888');
Insert into ANDRES.HOTELS (HOTEL_ID,NAME,LOCATION,CLASSIFICATION,CONTACT_INFO) values (13,'Palace Hotel','Milan, Italy','5','+39 02 6230 8111');
Insert into ANDRES.HOTELS (HOTEL_ID,NAME,LOCATION,CLASSIFICATION,CONTACT_INFO) values (14,'Sofitel Legend','Amsterdam, Netherlands','5','+31 20 555 3111');
Insert into ANDRES.HOTELS (HOTEL_ID,NAME,LOCATION,CLASSIFICATION,CONTACT_INFO) values (15,'Ritz-Carlton','Tokyo, Japan','5','+81 3 3423 8000');
Insert into ANDRES.HOTELS (HOTEL_ID,NAME,LOCATION,CLASSIFICATION,CONTACT_INFO) values (16,'The Savoy','London, UK','5','+44 20 7836 4343');
Insert into ANDRES.HOTELS (HOTEL_ID,NAME,LOCATION,CLASSIFICATION,CONTACT_INFO) values (17,'Marina Bay Sands','Singapore, Singapore','5','+65 6688 8888');
Insert into ANDRES.HOTELS (HOTEL_ID,NAME,LOCATION,CLASSIFICATION,CONTACT_INFO) values (18,'Park Hyatt','Paris, France','5','+33 1 49 52 72 00');
Insert into ANDRES.HOTELS (HOTEL_ID,NAME,LOCATION,CLASSIFICATION,CONTACT_INFO) values (19,'Banyan Tree','Phuket, Thailand','5','+66 76 324 101');
Insert into ANDRES.HOTELS (HOTEL_ID,NAME,LOCATION,CLASSIFICATION,CONTACT_INFO) values (20,'The Dorchester','London, UK','5','+44 20 7629 8888');
REM INSERTING into ANDRES.INVOICES
SET DEFINE OFF;
REM INSERTING into ANDRES.PAYMENTS
SET DEFINE OFF;
REM INSERTING into ANDRES.PROMOTIONS
SET DEFINE OFF;
REM INSERTING into ANDRES.RESERVATIONS
SET DEFINE OFF;
Insert into ANDRES.RESERVATIONS (RESERVATION_ID,CLIENT_ID,HOTEL_ID,START_DATE,END_DATE,STATUS,ROOM_ID,NUMBER_OF_NIGHTS) values (1,1,1,to_date('01-SEP-25','DD-MON-RR'),to_date('05-SEP-25','DD-MON-RR'),'Confirmada',1,4);
Insert into ANDRES.RESERVATIONS (RESERVATION_ID,CLIENT_ID,HOTEL_ID,START_DATE,END_DATE,STATUS,ROOM_ID,NUMBER_OF_NIGHTS) values (3,3,3,to_date('05-SEP-25','DD-MON-RR'),to_date('10-SEP-25','DD-MON-RR'),'Confirmada',3,5);
Insert into ANDRES.RESERVATIONS (RESERVATION_ID,CLIENT_ID,HOTEL_ID,START_DATE,END_DATE,STATUS,ROOM_ID,NUMBER_OF_NIGHTS) values (4,4,4,to_date('08-SEP-25','DD-MON-RR'),to_date('12-SEP-25','DD-MON-RR'),'Confirmada',4,4);
Insert into ANDRES.RESERVATIONS (RESERVATION_ID,CLIENT_ID,HOTEL_ID,START_DATE,END_DATE,STATUS,ROOM_ID,NUMBER_OF_NIGHTS) values (5,5,5,to_date('10-SEP-25','DD-MON-RR'),to_date('15-SEP-25','DD-MON-RR'),'Confirmada',5,5);
Insert into ANDRES.RESERVATIONS (RESERVATION_ID,CLIENT_ID,HOTEL_ID,START_DATE,END_DATE,STATUS,ROOM_ID,NUMBER_OF_NIGHTS) values (6,6,6,to_date('11-SEP-25','DD-MON-RR'),to_date('14-SEP-25','DD-MON-RR'),'Confirmada',6,3);
Insert into ANDRES.RESERVATIONS (RESERVATION_ID,CLIENT_ID,HOTEL_ID,START_DATE,END_DATE,STATUS,ROOM_ID,NUMBER_OF_NIGHTS) values (7,7,7,to_date('13-SEP-25','DD-MON-RR'),to_date('17-SEP-25','DD-MON-RR'),'Confirmada',7,4);
Insert into ANDRES.RESERVATIONS (RESERVATION_ID,CLIENT_ID,HOTEL_ID,START_DATE,END_DATE,STATUS,ROOM_ID,NUMBER_OF_NIGHTS) values (8,8,8,to_date('15-SEP-25','DD-MON-RR'),to_date('20-SEP-25','DD-MON-RR'),'Confirmada',8,5);
Insert into ANDRES.RESERVATIONS (RESERVATION_ID,CLIENT_ID,HOTEL_ID,START_DATE,END_DATE,STATUS,ROOM_ID,NUMBER_OF_NIGHTS) values (9,9,9,to_date('18-SEP-25','DD-MON-RR'),to_date('22-SEP-25','DD-MON-RR'),'Confirmada',9,4);
Insert into ANDRES.RESERVATIONS (RESERVATION_ID,CLIENT_ID,HOTEL_ID,START_DATE,END_DATE,STATUS,ROOM_ID,NUMBER_OF_NIGHTS) values (10,10,10,to_date('20-SEP-25','DD-MON-RR'),to_date('25-SEP-25','DD-MON-RR'),'Confirmada',10,5);
Insert into ANDRES.RESERVATIONS (RESERVATION_ID,CLIENT_ID,HOTEL_ID,START_DATE,END_DATE,STATUS,ROOM_ID,NUMBER_OF_NIGHTS) values (11,11,11,to_date('22-SEP-25','DD-MON-RR'),to_date('26-SEP-25','DD-MON-RR'),'Confirmada',11,4);
Insert into ANDRES.RESERVATIONS (RESERVATION_ID,CLIENT_ID,HOTEL_ID,START_DATE,END_DATE,STATUS,ROOM_ID,NUMBER_OF_NIGHTS) values (12,12,12,to_date('25-SEP-25','DD-MON-RR'),to_date('28-SEP-25','DD-MON-RR'),'Confirmada',12,3);
Insert into ANDRES.RESERVATIONS (RESERVATION_ID,CLIENT_ID,HOTEL_ID,START_DATE,END_DATE,STATUS,ROOM_ID,NUMBER_OF_NIGHTS) values (13,13,13,to_date('28-SEP-25','DD-MON-RR'),to_date('02-OCT-25','DD-MON-RR'),'Confirmada',13,4);
Insert into ANDRES.RESERVATIONS (RESERVATION_ID,CLIENT_ID,HOTEL_ID,START_DATE,END_DATE,STATUS,ROOM_ID,NUMBER_OF_NIGHTS) values (14,14,14,to_date('30-SEP-25','DD-MON-RR'),to_date('05-OCT-25','DD-MON-RR'),'Confirmada',14,5);
REM INSERTING into ANDRES.RESTAURANTS
SET DEFINE OFF;
Insert into ANDRES.RESTAURANTS (RESTAURANT_ID,HOTEL_ID,NAME,LOCATION,CAPACITY,CONTACT_INFO) values (1,1,'La Terraza','Calle 123, Ciudad',50,'+1 212-123-4567');
Insert into ANDRES.RESTAURANTS (RESTAURANT_ID,HOTEL_ID,NAME,LOCATION,CAPACITY,CONTACT_INFO) values (2,2,'Gourmet Dine','Avenida Central 456, Ciudad',80,'+971 4-301-7777');
Insert into ANDRES.RESTAURANTS (RESTAURANT_ID,HOTEL_ID,NAME,LOCATION,CAPACITY,CONTACT_INFO) values (3,3,'Le Bistro','Rue de Paris 789, Francia',60,'+33 1 44 39 88 88');
Insert into ANDRES.RESTAURANTS (RESTAURANT_ID,HOTEL_ID,NAME,LOCATION,CAPACITY,CONTACT_INFO) values (4,4,'The Dining Room','Calle Madrid 321, España',100,'+34 91 234 5678');
Insert into ANDRES.RESTAURANTS (RESTAURANT_ID,HOTEL_ID,NAME,LOCATION,CAPACITY,CONTACT_INFO) values (5,5,'Sea Breeze','Av. Oceanica 654, México',70,'+52 55 1234 5678');
Insert into ANDRES.RESTAURANTS (RESTAURANT_ID,HOTEL_ID,NAME,LOCATION,CAPACITY,CONTACT_INFO) values (6,6,'Sakura','Shibuya 1122, Japón',40,'+81 3 3270 8800');
Insert into ANDRES.RESTAURANTS (RESTAURANT_ID,HOTEL_ID,NAME,LOCATION,CAPACITY,CONTACT_INFO) values (7,7,'The Royal Feast','Strand Street 234, UK',120,'+44 20 7636 1000');
Insert into ANDRES.RESTAURANTS (RESTAURANT_ID,HOTEL_ID,NAME,LOCATION,CAPACITY,CONTACT_INFO) values (8,8,'Le Jardin','Plaza Mayor 567, Francia',80,'+33 1 44 71 15 15');
Insert into ANDRES.RESTAURANTS (RESTAURANT_ID,HOTEL_ID,NAME,LOCATION,CAPACITY,CONTACT_INFO) values (9,9,'Tropical Paradise','Plaza las Palmas 890, Brasil',90,'+55 11 2345-6789');
Insert into ANDRES.RESTAURANTS (RESTAURANT_ID,HOTEL_ID,NAME,LOCATION,CAPACITY,CONTACT_INFO) values (10,10,'Ristorante Bella','Piazza Navona 345, Italia',60,'+39 06 6889 5555');
REM INSERTING into ANDRES.RESTAURANT_RESERVATIONS
SET DEFINE OFF;
REM INSERTING into ANDRES.ROOMS
SET DEFINE OFF;
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (1,1,'Suite','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (2,1,'Individual','Disponible',1);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (3,1,'Doble','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (4,1,'Familiar','Disponible',4);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (5,2,'Suite','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (6,2,'Individual','Disponible',1);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (7,2,'Doble','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (8,2,'Familiar','Disponible',4);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (9,3,'Suite','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (10,3,'Individual','Disponible',1);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (11,3,'Doble','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (12,3,'Familiar','Disponible',4);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (13,4,'Suite','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (14,4,'Individual','Disponible',1);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (15,4,'Doble','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (16,4,'Familiar','Disponible',4);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (17,5,'Suite','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (18,5,'Individual','Disponible',1);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (19,5,'Doble','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (20,5,'Familiar','Disponible',4);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (21,6,'Suite','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (22,6,'Individual','Disponible',1);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (23,6,'Doble','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (24,6,'Familiar','Disponible',4);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (25,7,'Suite','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (26,7,'Individual','Disponible',1);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (27,7,'Doble','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (28,7,'Familiar','Disponible',4);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (29,8,'Suite','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (30,8,'Individual','Disponible',1);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (31,8,'Doble','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (32,8,'Familiar','Disponible',4);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (33,9,'Suite','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (34,9,'Individual','Disponible',1);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (35,9,'Doble','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (36,9,'Familiar','Disponible',4);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (37,10,'Suite','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (38,10,'Individual','Disponible',1);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (39,10,'Doble','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (40,10,'Familiar','Disponible',4);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (41,11,'Suite','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (42,11,'Individual','Disponible',1);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (43,11,'Doble','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (44,11,'Familiar','Disponible',4);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (45,12,'Suite','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (46,12,'Individual','Disponible',1);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (47,12,'Doble','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (48,12,'Familiar','Disponible',4);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (49,13,'Suite','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (50,13,'Individual','Disponible',1);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (51,13,'Doble','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (52,13,'Familiar','Disponible',4);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (53,14,'Suite','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (54,14,'Individual','Disponible',1);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (55,14,'Doble','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (56,14,'Familiar','Disponible',4);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (57,15,'Suite','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (58,15,'Individual','Disponible',1);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (59,15,'Doble','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (60,15,'Familiar','Disponible',4);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (61,16,'Suite','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (62,16,'Individual','Disponible',1);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (63,16,'Doble','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (64,16,'Familiar','Disponible',4);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (65,17,'Suite','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (66,17,'Individual','Disponible',1);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (67,17,'Doble','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (68,17,'Familiar','Disponible',4);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (69,18,'Suite','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (70,18,'Individual','Disponible',1);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (71,18,'Doble','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (72,18,'Familiar','Disponible',4);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (73,19,'Suite','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (74,19,'Individual','Disponible',1);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (75,19,'Doble','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (76,19,'Familiar','Disponible',4);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (77,20,'Suite','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (78,20,'Individual','Disponible',1);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (79,20,'Doble','Disponible',2);
Insert into ANDRES.ROOMS (ROOM_ID,HOTEL_ID,ROOM_TYPE,STATUS,CAPACITY) values (80,20,'Familiar','Disponible',4);
REM INSERTING into ANDRES.SERVICES
SET DEFINE OFF;
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (1,1,'Spa',150);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (2,1,'Fitness Center',30);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (3,1,'Private Beach',200);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (4,1,'Luxury Car Rental',500);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (5,1,'Dinner Cruise',180);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (6,2,'Helicopter Tour',300);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (7,2,'Private Beach',250);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (8,2,'Butler Service',150);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (9,2,'Skiing',100);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (10,2,'Luxury Suite',800);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (11,3,'Cooking Class',120);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (12,3,'Luxury Car Rental',500);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (13,3,'Private Tour',200);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (14,3,'Afternoon Tea',50);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (15,3,'Personal Shopper',100);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (16,4,'Personal Shopper',150);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (17,4,'Private Tour',180);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (18,4,'Wine Tasting',90);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (19,4,'Beauty Salon',60);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (20,4,'Cultural Dinner',100);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (21,5,'Water Sports',80);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (22,5,'Airport Transfer',40);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (23,5,'Private Jet',2000);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (24,5,'Luxury Spa',180);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (25,5,'Golf',250);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (26,6,'Traditional Tea Ceremony',70);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (27,6,'Sushi Making Class',100);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (28,6,'Zen Garden',60);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (29,6,'Private Suite',700);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (30,6,'Cooking Class',90);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (31,7,'Afternoon Tea',45);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (32,7,'Sightseeing Tour',120);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (33,7,'Luxury Car Rental',300);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (34,7,'Private Yoga',100);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (35,7,'Concierge Service',50);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (36,8,'Wine Tasting',90);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (37,8,'Concierge Service',50);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (38,8,'Luxury Spa',150);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (39,8,'Personal Chef',200);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (40,8,'Private Tour',180);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (41,9,'Zen Meditation',70);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (42,9,'Luxury Spa',180);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (43,9,'Personalized Shopping',120);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (44,9,'Private Helicopter',300);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (45,9,'Gourmet Dining',200);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (46,10,'Dinner Cruise',200);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (47,10,'Private Yoga',100);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (48,10,'Luxury Car Rental',500);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (49,10,'Personal Shopper',150);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (50,10,'Spa Package',250);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (51,11,'Dinner Cruise',180);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (61,12,'Helicopter Tour',300);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (71,12,'Private Beach',250);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (81,12,'Butler Service',150);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (91,12,'Skiing',100);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (101,12,'Luxury Suite',800);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (111,13,'Cooking Class',120);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (121,13,'Luxury Car Rental',500);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (131,13,'Private Tour',200);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (141,13,'Afternoon Tea',50);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (115,13,'Personal Shopper',100);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (161,14,'Personal Shopper',150);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (171,14,'Private Tour',180);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (181,14,'Wine Tasting',90);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (191,14,'Beauty Salon',60);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (210,14,'Cultural Dinner',100);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (211,15,'Water Sports',80);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (221,15,'Airport Transfer',40);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (231,15,'Private Jet',2000);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (241,15,'Luxury Spa',180);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (215,15,'Golf',250);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (216,16,'Traditional Tea Ceremony',70);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (217,16,'Sushi Making Class',100);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (281,16,'Zen Garden',60);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (219,16,'Private Suite',700);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (130,16,'Cooking Class',90);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (311,17,'Afternoon Tea',45);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (312,17,'Sightseeing Tour',120);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (313,17,'Luxury Car Rental',300);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (314,17,'Private Yoga',100);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (351,17,'Concierge Service',50);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (316,18,'Wine Tasting',90);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (371,18,'Concierge Service',50);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (381,18,'Luxury Spa',150);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (319,18,'Personal Chef',200);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (420,18,'Private Tour',180);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (421,19,'Zen Meditation',70);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (242,19,'Luxury Spa',180);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (432,19,'Personalized Shopping',120);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (424,19,'Private Helicopter',300);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (425,19,'Gourmet Dining',200);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (246,20,'Dinner Cruise',200);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (427,20,'Private Yoga',100);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (248,20,'Luxury Car Rental',500);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (429,20,'Personal Shopper',150);
Insert into ANDRES.SERVICES (SERVICE_ID,HOTEL_ID,SERVICE_NAME,SERVICE_COST) values (502,20,'Spa Package',250);
--------------------------------------------------------
--  DDL for Trigger TRG_ADJUST_PAYMENT_BALANCE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ANDRES"."TRG_ADJUST_PAYMENT_BALANCE" 
AFTER INSERT ON PAYMENTS
FOR EACH ROW
DECLARE
  v_total_amount NUMBER(10,2);
BEGIN
  -- Recuperamos el total de la reserva utilizando el RESERVATION_ID de :NEW
  SELECT total_amount 
  INTO v_total_amount
  FROM RESERVATIONS
  WHERE RESERVATION_ID = :NEW.RESERVATION_ID;

  -- Ajustamos el saldo pendiente de la reservación
  UPDATE RESERVATIONS
  SET TOTAL_AMOUNT = v_total_amount - :NEW.AMOUNT_PAID
  WHERE RESERVATION_ID = :NEW.RESERVATION_ID;

  -- Opcionalmente, puedes verificar si el total se ha pagado
  IF (v_total_amount - :NEW.AMOUNT_PAID) <= 0 THEN
    -- Si el saldo es 0 o negativo, actualizar el estado de la reservación a "Pagada"
    UPDATE RESERVATIONS
    SET STATUS = 'Paid'
    WHERE RESERVATION_ID = :NEW.RESERVATION_ID;
  END IF;
END;

/
ALTER TRIGGER "ANDRES"."TRG_ADJUST_PAYMENT_BALANCE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_CHECKIN_CHECKOUT_DATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ANDRES"."TRG_CHECKIN_CHECKOUT_DATE" 
AFTER INSERT ON RESERVATIONS
FOR EACH ROW
BEGIN
  -- Se actualiza la fecha de salida con la fecha de fin de la reservación
  UPDATE CHECKINS_CHECKOUTS
  SET CHECKOUT_DATE = :NEW.END_DATE
  WHERE RESERVATION_ID = :NEW.RESERVATION_ID;
END;

/
ALTER TRIGGER "ANDRES"."TRG_CHECKIN_CHECKOUT_DATE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_GENERATE_INVOICE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ANDRES"."TRG_GENERATE_INVOICE" 
AFTER UPDATE ON RESERVATIONS
FOR EACH ROW
BEGIN
  IF :NEW.STATUS = 'Completed' AND :OLD.STATUS != 'Completed' THEN
    -- Inserta una nueva factura relacionada a la reservación
    INSERT INTO INVOICES (INVOICE_ID, RESERVATION_ID, TOTAL_AMOUNT, INVOICE_DATE)
    VALUES (SEQ_FACTURA.NEXTVAL, :NEW.RESERVATION_ID, :NEW.NUMBER_OF_NIGHTS * 100, SYSDATE);
  END IF;
END;

/
ALTER TRIGGER "ANDRES"."TRG_GENERATE_INVOICE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_ROOM_STATUS_CHANGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ANDRES"."TRG_ROOM_STATUS_CHANGE" 
BEFORE UPDATE ON ROOMS
FOR EACH ROW
BEGIN
  IF :NEW.STATUS != :OLD.STATUS THEN
    -- Se puede registrar en un log si el estado de la habitación cambia
    INSERT INTO ROOM_STATUS_LOG (ROOM_ID, OLD_STATUS, NEW_STATUS, CHANGE_DATE)
    VALUES (:NEW.ROOM_ID, :OLD.STATUS, :NEW.STATUS, SYSDATE);
  END IF;
END;

/
ALTER TRIGGER "ANDRES"."TRG_ROOM_STATUS_CHANGE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_UPDATE_ROOM_STATUS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ANDRES"."TRG_UPDATE_ROOM_STATUS" 
AFTER UPDATE ON RESERVATIONS
FOR EACH ROW
BEGIN
  IF :NEW.STATUS = 'Confirmed' AND :OLD.STATUS != 'Confirmed' THEN
    -- Se actualiza el estado de la habitación asociada a la reservación
    UPDATE ROOMS
    SET STATUS = 'Not Available'
    WHERE ROOM_ID = :NEW.ROOM_ID;
  END IF;
END;

/
ALTER TRIGGER "ANDRES"."TRG_UPDATE_ROOM_STATUS" ENABLE;
--------------------------------------------------------
--  DDL for Package CLIENT_MANAGEMENT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ANDRES"."CLIENT_MANAGEMENT" AS
    -- Procedimiento para registrar un nuevo cliente
    PROCEDURE register_client(p_first_name IN VARCHAR2, p_last_name IN VARCHAR2, p_email IN VARCHAR2, p_phone IN VARCHAR2, p_address IN VARCHAR2);

    -- Función para obtener los detalles de un cliente
    FUNCTION get_client_details(p_client_id IN INT) RETURN SYS_REFCURSOR;

    -- Procedimiento para obtener el historial de estadías de un cliente
    PROCEDURE get_client_stay_history(p_client_id IN INT, p_history OUT SYS_REFCURSOR);

    -- Procedimiento para actualizar la información de un cliente
    PROCEDURE update_client_info(p_client_id IN INT, p_first_name IN VARCHAR2, p_last_name IN VARCHAR2, p_email IN VARCHAR2, p_phone IN VARCHAR2, p_address IN VARCHAR2);

    -- Procedimiento para eliminar un cliente
    PROCEDURE delete_client(p_client_id IN INT);
END CLIENT_MANAGEMENT;

/
--------------------------------------------------------
--  DDL for Package EMPLOYEE_MANAGEMENT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ANDRES"."EMPLOYEE_MANAGEMENT" AS
    -- Procedimiento para agregar un nuevo empleado a un hotel
    PROCEDURE add_employee(p_hotel_id IN INT, p_role IN VARCHAR2, p_first_name IN VARCHAR2, p_last_name IN VARCHAR2, p_email IN VARCHAR2, p_phone IN VARCHAR2, p_salary IN NUMBER);

    -- Procedimiento para actualizar la información de un empleado
    PROCEDURE update_employee(p_employee_id IN INT, p_role IN VARCHAR2, p_first_name IN VARCHAR2, p_last_name IN VARCHAR2, p_email IN VARCHAR2, p_phone IN VARCHAR2, p_salary IN NUMBER);

    -- Función para obtener los detalles de un empleado
    FUNCTION get_employee_details(p_employee_id IN INT) RETURN SYS_REFCURSOR;

    -- Función para obtener los empleados de un hotel específico
    FUNCTION get_employees_by_hotel(p_hotel_id IN INT) RETURN SYS_REFCURSOR;

    -- Procedimiento para eliminar un empleado
    PROCEDURE delete_employee(p_employee_id IN INT);
END EMPLOYEE_MANAGEMENT;

/
--------------------------------------------------------
--  DDL for Package HOTEL_MANAGEMENT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ANDRES"."HOTEL_MANAGEMENT" AS
    -- Procedimiento para obtener las habitaciones disponibles en un hotel en un rango de fechas
    PROCEDURE get_available_rooms(p_hotel_id IN INT, p_start_date IN DATE, p_end_date IN DATE, p_rooms OUT SYS_REFCURSOR);

    -- Función para obtener la información de un hotel (nombre, ubicación, etc.)
    FUNCTION get_hotel_info(p_hotel_id IN INT) RETURN SYS_REFCURSOR;

    -- Procedimiento para obtener las habitaciones de un tipo específico en un hotel
    PROCEDURE get_rooms_by_type(p_hotel_id IN INT, p_room_type IN VARCHAR2, p_rooms OUT SYS_REFCURSOR);

    -- Procedimiento para actualizar el estado de una habitación
    PROCEDURE update_room_status(p_room_id IN INT, p_new_status IN VARCHAR2);

    -- Procedimiento para obtener los servicios de un hotel
    PROCEDURE get_hotel_services(p_hotel_id IN INT, p_services OUT SYS_REFCURSOR);
END HOTEL_MANAGEMENT;

/
--------------------------------------------------------
--  DDL for Package HOTEL_SERVICES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ANDRES"."HOTEL_SERVICES" AS
    -- Procedimiento para agregar un nuevo servicio a un hotel
    PROCEDURE add_service(p_hotel_id IN INT, p_service_name IN VARCHAR2, p_service_cost IN DECIMAL);

    -- Función para obtener los servicios ofrecidos por un hotel específico
    FUNCTION get_services_by_hotel(p_hotel_id IN INT) RETURN SYS_REFCURSOR;

    -- Procedimiento para actualizar la información de un servicio de un hotel
    PROCEDURE update_service(p_service_id IN INT, p_service_name IN VARCHAR2, p_service_cost IN DECIMAL);

    -- Procedimiento para eliminar un servicio de un hotel
    PROCEDURE delete_service(p_service_id IN INT);

    -- Función para obtener los detalles de un servicio específico
    FUNCTION get_service_details(p_service_id IN INT) RETURN SYS_REFCURSOR;
END HOTEL_SERVICES;

/
--------------------------------------------------------
--  DDL for Package PAYMENT_MANAGEMENT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ANDRES"."PAYMENT_MANAGEMENT" AS
    -- Procedimiento para registrar un nuevo pago para una reservación
    PROCEDURE register_payment(p_invoice_id IN INT, p_payment_date IN DATE, p_amount_paid IN NUMBER, p_payment_method IN VARCHAR2);

    -- Procedimiento para actualizar los detalles de un pago
    PROCEDURE update_payment(p_payment_id IN INT, p_amount_paid IN NUMBER, p_payment_method IN VARCHAR2);

    -- Función para obtener los detalles de un pago
    FUNCTION get_payment_details(p_payment_id IN INT) RETURN SYS_REFCURSOR;

    -- Función para obtener los pagos asociados a una factura
    FUNCTION get_payments_by_invoice(p_invoice_id IN INT) RETURN SYS_REFCURSOR;

    -- Función para obtener el historial de pagos de un cliente
    FUNCTION get_payment_history(p_client_id IN INT) RETURN SYS_REFCURSOR;
END PAYMENT_MANAGEMENT;

/
--------------------------------------------------------
--  DDL for Package PROMOTION_MANAGEMENT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ANDRES"."PROMOTION_MANAGEMENT" AS
    -- Procedimiento para agregar una nueva promoción
    PROCEDURE add_promotion(p_promotion_name IN VARCHAR2, p_discount_percentage IN DECIMAL, p_start_date IN DATE, p_end_date IN DATE);

    -- Procedimiento para actualizar una promoción existente
    PROCEDURE update_promotion(p_promotion_id IN INT, p_promotion_name IN VARCHAR2, p_discount_percentage IN DECIMAL, p_start_date IN DATE, p_end_date IN DATE);

    -- Procedimiento para eliminar una promoción
    PROCEDURE delete_promotion(p_promotion_id IN INT);

    -- Función para obtener los detalles de una promoción específica
    FUNCTION get_promotion_details(p_promotion_id IN INT) RETURN SYS_REFCURSOR;

    -- Función para obtener todas las promociones activas
    FUNCTION get_active_promotions RETURN SYS_REFCURSOR;
END PROMOTION_MANAGEMENT;

/
--------------------------------------------------------
--  DDL for Package RESERVATION_MANAGEMENT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ANDRES"."RESERVATION_MANAGEMENT" AS
    -- Procedimiento para obtener el historial de estadías de un cliente
    PROCEDURE get_client_stay_history(p_client_id IN INT, p_history OUT SYS_REFCURSOR);

    -- Procedimiento para obtener las reservaciones activas
    PROCEDURE get_active_reservations(p_client_id IN INT, p_reservations OUT SYS_REFCURSOR);

    -- Procedimiento para obtener los detalles de una reservación
    PROCEDURE get_reservation_details(p_reservation_id IN INT, p_details OUT SYS_REFCURSOR);

    -- Procedimiento para verificar si una habitación está disponible
    PROCEDURE check_room_availability(p_room_id IN INT, p_start_date IN DATE, p_end_date IN DATE, p_availability OUT SYS_REFCURSOR);

    -- Procedimiento para cancelar una reservación
    PROCEDURE cancel_reservation(p_reservation_id IN INT);
END RESERVATION_MANAGEMENT;

/
--------------------------------------------------------
--  DDL for Package ROOM_MANAGEMENT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ANDRES"."ROOM_MANAGEMENT" AS
    -- Procedimiento para registrar una habitación en el sistema
    PROCEDURE register_room(p_hotel_id IN INT, p_room_type IN VARCHAR2, p_status IN VARCHAR2, p_capacity IN INT);

    -- Procedimiento para cambiar el estado de una habitación
    PROCEDURE update_room_status(p_room_id IN INT, p_new_status IN VARCHAR2);

    -- Procedimiento para consultar el estado de una habitación
    PROCEDURE get_room_status(p_room_id IN INT, p_status OUT VARCHAR2);

    -- Procedimiento para actualizar la capacidad de una habitación
    PROCEDURE update_room_capacity(p_room_id IN INT, p_new_capacity IN INT);

    -- Procedimiento para eliminar una habitación
    PROCEDURE delete_room(p_room_id IN INT);
END ROOM_MANAGEMENT;

/
--------------------------------------------------------
--  DDL for Package Body CLIENT_MANAGEMENT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ANDRES"."CLIENT_MANAGEMENT" AS

    -- Procedimiento para registrar un nuevo cliente
    PROCEDURE register_client(p_first_name IN VARCHAR2, p_last_name IN VARCHAR2, p_email IN VARCHAR2, p_phone IN VARCHAR2, p_address IN VARCHAR2) IS
    BEGIN
        INSERT INTO CLIENTS (client_id, first_name, last_name, email, phone, address)
        VALUES (CLIENTS_SEQ.NEXTVAL, p_first_name, p_last_name, p_email, p_phone, p_address);
    END register_client;

    -- Función para obtener los detalles de un cliente
    FUNCTION get_client_details(p_client_id IN INT) RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT c.first_name, c.last_name, c.email, c.phone, c.address
            FROM CLIENTS c
            WHERE c.client_id = p_client_id;
        RETURN v_cursor;
    END get_client_details;

    -- Procedimiento para obtener el historial de estadías de un cliente
    PROCEDURE get_client_stay_history(p_client_id IN INT, p_history OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN p_history FOR
            SELECT h.hotel_id, h.room_id, h.stay_start_date, h.stay_end_date
            FROM CLIENT_STAY_HISTORY h
            WHERE h.client_id = p_client_id;
    END get_client_stay_history;

    -- Procedimiento para actualizar la información de un cliente
    PROCEDURE update_client_info(p_client_id IN INT, p_first_name IN VARCHAR2, p_last_name IN VARCHAR2, p_email IN VARCHAR2, p_phone IN VARCHAR2, p_address IN VARCHAR2) IS
    BEGIN
        UPDATE CLIENTS
        SET first_name = p_first_name,
            last_name = p_last_name,
            email = p_email,
            phone = p_phone,
            address = p_address
        WHERE client_id = p_client_id;
    END update_client_info;

    -- Procedimiento para eliminar un cliente
    PROCEDURE delete_client(p_client_id IN INT) IS
    BEGIN
        DELETE FROM CLIENTS WHERE client_id = p_client_id;
    END delete_client;

END CLIENT_MANAGEMENT;

/
--------------------------------------------------------
--  DDL for Package Body EMPLOYEE_MANAGEMENT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ANDRES"."EMPLOYEE_MANAGEMENT" AS

    -- Procedimiento para agregar un nuevo empleado a un hotel
    PROCEDURE add_employee(p_hotel_id IN INT, p_role IN VARCHAR2, p_first_name IN VARCHAR2, p_last_name IN VARCHAR2, p_email IN VARCHAR2, p_phone IN VARCHAR2, p_salary IN NUMBER) IS
    BEGIN
        INSERT INTO EMPLOYEES (employee_id, hotel_id, role, first_name, last_name, email, phone, salary)
        VALUES (EMPLOYEES_SEQ.NEXTVAL, p_hotel_id, p_role, p_first_name, p_last_name, p_email, p_phone, p_salary);
    END add_employee;

    -- Procedimiento para actualizar la información de un empleado
    PROCEDURE update_employee(p_employee_id IN INT, p_role IN VARCHAR2, p_first_name IN VARCHAR2, p_last_name IN VARCHAR2, p_email IN VARCHAR2, p_phone IN VARCHAR2, p_salary IN NUMBER) IS
    BEGIN
        UPDATE EMPLOYEES
        SET role = p_role,
            first_name = p_first_name,
            last_name = p_last_name,
            email = p_email,
            phone = p_phone,
            salary = p_salary
        WHERE employee_id = p_employee_id;
    END update_employee;

    -- Función para obtener los detalles de un empleado
    FUNCTION get_employee_details(p_employee_id IN INT) RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT e.first_name, e.last_name, e.email, e.phone, e.salary, e.role, h.name AS hotel_name
            FROM EMPLOYEES e
            JOIN HOTELS h ON e.hotel_id = h.hotel_id
            WHERE e.employee_id = p_employee_id;

        RETURN v_cursor;
    END get_employee_details;

    -- Función para obtener los empleados de un hotel específico
    FUNCTION get_employees_by_hotel(p_hotel_id IN INT) RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT e.first_name || ' ' || e.last_name AS employee_name, e.role, e.email, e.phone, e.salary
            FROM EMPLOYEES e
            WHERE e.hotel_id = p_hotel_id;

        RETURN v_cursor;
    END get_employees_by_hotel;

    -- Procedimiento para eliminar un empleado
    PROCEDURE delete_employee(p_employee_id IN INT) IS
    BEGIN
        DELETE FROM EMPLOYEES WHERE employee_id = p_employee_id;
    END delete_employee;

END EMPLOYEE_MANAGEMENT;

/
--------------------------------------------------------
--  DDL for Package Body HOTEL_MANAGEMENT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ANDRES"."HOTEL_MANAGEMENT" AS

    -- Procedimiento para obtener las habitaciones disponibles en un hotel en un rango de fechas
    PROCEDURE get_available_rooms(p_hotel_id IN INT, p_start_date IN DATE, p_end_date IN DATE, p_rooms OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN p_rooms FOR
            SELECT r.room_id, r.room_type, r.status
            FROM Rooms r
            WHERE r.hotel_id = p_hotel_id
            AND r.status = 'Available'
            AND r.room_id NOT IN (
                SELECT room_id 
                FROM Reservations 
                WHERE hotel_id = p_hotel_id
                AND (start_date BETWEEN p_start_date AND p_end_date OR end_date BETWEEN p_start_date AND p_end_date)
            );
    END get_available_rooms;

    -- Función para obtener la información de un hotel (nombre, ubicación, etc.)
    FUNCTION get_hotel_info(p_hotel_id IN INT) RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT h.name, h.location, h.classification, h.contact_info
            FROM Hotels h
            WHERE h.hotel_id = p_hotel_id;

        RETURN v_cursor;
    END get_hotel_info;

    -- Procedimiento para obtener las habitaciones de un tipo específico en un hotel
    PROCEDURE get_rooms_by_type(p_hotel_id IN INT, p_room_type IN VARCHAR2, p_rooms OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN p_rooms FOR
            SELECT r.room_id, r.room_type, r.status, r.capacity
            FROM Rooms r
            WHERE r.hotel_id = p_hotel_id
            AND r.room_type = p_room_type;
    END get_rooms_by_type;

    -- Procedimiento para actualizar el estado de una habitación
    PROCEDURE update_room_status(p_room_id IN INT, p_new_status IN VARCHAR2) IS
    BEGIN
        UPDATE Rooms
        SET status = p_new_status
        WHERE room_id = p_room_id;
    END update_room_status;

    -- Procedimiento para obtener los servicios de un hotel
    PROCEDURE get_hotel_services(p_hotel_id IN INT, p_services OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN p_services FOR
            SELECT s.service_name, s.service_cost
            FROM Services s
            WHERE s.hotel_id = p_hotel_id;
    END get_hotel_services;

END HOTEL_MANAGEMENT;

/
--------------------------------------------------------
--  DDL for Package Body HOTEL_SERVICES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ANDRES"."HOTEL_SERVICES" AS

    -- Procedimiento para agregar un nuevo servicio a un hotel
    PROCEDURE add_service(p_hotel_id IN INT, p_service_name IN VARCHAR2, p_service_cost IN DECIMAL) IS
    BEGIN
        INSERT INTO SERVICES (service_id, hotel_id, service_name, service_cost)
        VALUES (SERVICIOS_SEQ.NEXTVAL, p_hotel_id, p_service_name, p_service_cost);
    END add_service;

    -- Función para obtener los servicios ofrecidos por un hotel específico
    FUNCTION get_services_by_hotel(p_hotel_id IN INT) RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT s.service_name, s.service_cost
            FROM SERVICES s
            WHERE s.hotel_id = p_hotel_id
            ORDER BY s.service_name;

        RETURN v_cursor;
    END get_services_by_hotel;

    -- Procedimiento para actualizar la información de un servicio de un hotel
    PROCEDURE update_service(p_service_id IN INT, p_service_name IN VARCHAR2, p_service_cost IN DECIMAL) IS
    BEGIN
        UPDATE SERVICES
        SET service_name = p_service_name, service_cost = p_service_cost
        WHERE service_id = p_service_id;
    END update_service;

    -- Procedimiento para eliminar un servicio de un hotel
    PROCEDURE delete_service(p_service_id IN INT) IS
    BEGIN
        DELETE FROM SERVICES WHERE service_id = p_service_id;
    END delete_service;

    -- Función para obtener los detalles de un servicio específico
    FUNCTION get_service_details(p_service_id IN INT) RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT s.service_name, s.service_cost
            FROM SERVICES s
            WHERE s.service_id = p_service_id;

        RETURN v_cursor;
    END get_service_details;

END HOTEL_SERVICES;

/
--------------------------------------------------------
--  DDL for Package Body PAYMENT_MANAGEMENT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ANDRES"."PAYMENT_MANAGEMENT" AS

    -- Procedimiento para registrar un nuevo pago para una reservación
    PROCEDURE register_payment(p_invoice_id IN INT, p_payment_date IN DATE, p_amount_paid IN NUMBER, p_payment_method IN VARCHAR2) IS
    BEGIN
        INSERT INTO PAYMENTS (payment_id, invoice_id, payment_date, amount_paid, payment_method)
        VALUES (PAYMENTS_SEQ.NEXTVAL, p_invoice_id, p_payment_date, p_amount_paid, p_payment_method);
    END register_payment;

    -- Procedimiento para actualizar los detalles de un pago
    PROCEDURE update_payment(p_payment_id IN INT, p_amount_paid IN NUMBER, p_payment_method IN VARCHAR2) IS
    BEGIN
        UPDATE PAYMENTS
        SET amount_paid = p_amount_paid,
            payment_method = p_payment_method
        WHERE payment_id = p_payment_id;
    END update_payment;

    -- Función para obtener los detalles de un pago
    FUNCTION get_payment_details(p_payment_id IN INT) RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT p.payment_id, p.payment_date, p.amount_paid, p.payment_method, i.total_amount
            FROM PAYMENTS p
            JOIN INVOICES i ON p.invoice_id = i.invoice_id
            WHERE p.payment_id = p_payment_id;

        RETURN v_cursor;
    END get_payment_details;

    -- Función para obtener los pagos asociados a una factura
    FUNCTION get_payments_by_invoice(p_invoice_id IN INT) RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT p.payment_id, p.payment_date, p.amount_paid, p.payment_method
            FROM PAYMENTS p
            WHERE p.invoice_id = p_invoice_id;

        RETURN v_cursor;
    END get_payments_by_invoice;

    -- Función para obtener el historial de pagos de un cliente
    FUNCTION get_payment_history(p_client_id IN INT) RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT p.payment_id, p.payment_date, p.amount_paid, p.payment_method, i.total_amount
            FROM PAYMENTS p
            JOIN INVOICES i ON p.invoice_id = i.invoice_id
            JOIN RESERVATIONS r ON i.reservation_id = r.reservation_id
            WHERE r.client_id = p_client_id;

        RETURN v_cursor;
    END get_payment_history;

END PAYMENT_MANAGEMENT;

/
--------------------------------------------------------
--  DDL for Package Body PROMOTION_MANAGEMENT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ANDRES"."PROMOTION_MANAGEMENT" AS

    -- Procedimiento para agregar una nueva promoción
    PROCEDURE add_promotion(p_promotion_name IN VARCHAR2, p_discount_percentage IN DECIMAL, p_start_date IN DATE, p_end_date IN DATE) IS
    BEGIN
        INSERT INTO PROMOTIONS (promotion_id, promotion_name, discount_percentage, start_date, end_date, is_active)
        VALUES (PROMOTIONS_SEQ.NEXTVAL, p_promotion_name, p_discount_percentage, p_start_date, p_end_date, 1);
    END add_promotion;

    -- Procedimiento para actualizar una promoción existente
    PROCEDURE update_promotion(p_promotion_id IN INT, p_promotion_name IN VARCHAR2, p_discount_percentage IN DECIMAL, p_start_date IN DATE, p_end_date IN DATE) IS
    BEGIN
        UPDATE PROMOTIONS
        SET promotion_name = p_promotion_name,
            discount_percentage = p_discount_percentage,
            start_date = p_start_date,
            end_date = p_end_date
        WHERE promotion_id = p_promotion_id;
    END update_promotion;

    -- Procedimiento para eliminar una promoción
    PROCEDURE delete_promotion(p_promotion_id IN INT) IS
    BEGIN
        DELETE FROM PROMOTIONS WHERE promotion_id = p_promotion_id;
    END delete_promotion;

    -- Función para obtener los detalles de una promoción específica
    FUNCTION get_promotion_details(p_promotion_id IN INT) RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT promotion_name, discount_percentage, start_date, end_date, is_active
            FROM PROMOTIONS
            WHERE promotion_id = p_promotion_id;

        RETURN v_cursor;
    END get_promotion_details;

    -- Función para obtener todas las promociones activas
    FUNCTION get_active_promotions RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT promotion_name, discount_percentage, start_date, end_date
            FROM PROMOTIONS
            WHERE is_active = 1;

        RETURN v_cursor;
    END get_active_promotions;

END PROMOTION_MANAGEMENT;

/
--------------------------------------------------------
--  DDL for Package Body RESERVATION_MANAGEMENT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ANDRES"."RESERVATION_MANAGEMENT" AS

    -- Procedimiento para obtener el historial de estadías de un cliente
    PROCEDURE get_client_stay_history(p_client_id IN INT, p_history OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN p_history FOR
            SELECT h.hotel_id, h.room_id, h.stay_start_date, h.stay_end_date
            FROM CLIENT_STAY_HISTORY h
            WHERE h.client_id = p_client_id;
    END get_client_stay_history;

    -- Procedimiento para obtener las reservaciones activas de un cliente
    PROCEDURE get_active_reservations(p_client_id IN INT, p_reservations OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN p_reservations FOR
            SELECT r.reservation_id, r.hotel_id, r.room_id, r.start_date, r.end_date, r.status
            FROM RESERVATIONS r
            WHERE r.client_id = p_client_id AND r.status = 'Active';
    END get_active_reservations;

    -- Procedimiento para obtener los detalles de una reservación
    PROCEDURE get_reservation_details(p_reservation_id IN INT, p_details OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN p_details FOR
            SELECT r.reservation_id, c.first_name || ' ' || c.last_name AS client_name, h.name AS hotel_name,
                   r.start_date, r.end_date, r.status, rm.room_type
            FROM RESERVATIONS r
            JOIN CLIENTS c ON r.client_id = c.client_id
            JOIN HOTELS h ON r.hotel_id = h.hotel_id
            JOIN ROOMS rm ON r.room_id = rm.room_id
            WHERE r.reservation_id = p_reservation_id;
    END get_reservation_details;

    -- Procedimiento para verificar la disponibilidad de una habitación
    PROCEDURE check_room_availability(p_room_id IN INT, p_start_date IN DATE, p_end_date IN DATE, p_availability OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN p_availability FOR
            SELECT r.room_id, r.room_type, r.status
            FROM ROOMS r
            WHERE r.room_id = p_room_id
            AND r.status = 'Available'
            AND r.room_id NOT IN (
                SELECT room_id 
                FROM RESERVATIONS 
                WHERE room_id = p_room_id 
                AND (start_date BETWEEN p_start_date AND p_end_date 
                     OR end_date BETWEEN p_start_date AND p_end_date)
            );
    END check_room_availability;

    -- Procedimiento para cancelar una reservación
    PROCEDURE cancel_reservation(p_reservation_id IN INT) IS
    BEGIN
        UPDATE RESERVATIONS
        SET status = 'Cancelled'
        WHERE reservation_id = p_reservation_id;
    END cancel_reservation;

END RESERVATION_MANAGEMENT;

/
--------------------------------------------------------
--  DDL for Package Body ROOM_MANAGEMENT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ANDRES"."ROOM_MANAGEMENT" AS

    -- Procedimiento para registrar una habitación en el sistema
    PROCEDURE register_room(p_hotel_id IN INT, p_room_type IN VARCHAR2, p_status IN VARCHAR2, p_capacity IN INT) IS
    BEGIN
        INSERT INTO ROOMS (room_id, hotel_id, room_type, status, capacity)
        VALUES (ROOMS_SEQ.NEXTVAL, p_hotel_id, p_room_type, p_status, p_capacity);
    END register_room;

    -- Procedimiento para cambiar el estado de una habitación
    PROCEDURE update_room_status(p_room_id IN INT, p_new_status IN VARCHAR2) IS
    BEGIN
        UPDATE ROOMS
        SET status = p_new_status
        WHERE room_id = p_room_id;
    END update_room_status;

    -- Procedimiento para consultar el estado de una habitación
    PROCEDURE get_room_status(p_room_id IN INT, p_status OUT VARCHAR2) IS
        v_status VARCHAR2(50);
    BEGIN
        SELECT status INTO v_status
        FROM ROOMS
        WHERE room_id = p_room_id;

        p_status := v_status; -- Asignamos el valor al parámetro de salida
    END get_room_status;

    -- Procedimiento para actualizar la capacidad de una habitación
    PROCEDURE update_room_capacity(p_room_id IN INT, p_new_capacity IN INT) IS
    BEGIN
        UPDATE ROOMS
        SET capacity = p_new_capacity
        WHERE room_id = p_room_id;
    END update_room_capacity;

    -- Procedimiento para eliminar una habitación
    PROCEDURE delete_room(p_room_id IN INT) IS
    BEGIN
        DELETE FROM ROOMS
        WHERE room_id = p_room_id;
    END delete_room;

END ROOM_MANAGEMENT;

/
--------------------------------------------------------
--  Constraints for Table CHECKINS_CHECKOUTS
--------------------------------------------------------

  ALTER TABLE "ANDRES"."CHECKINS_CHECKOUTS" ADD PRIMARY KEY ("CHECKIN_CHECKOUT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table HOTELS
--------------------------------------------------------

  ALTER TABLE "ANDRES"."HOTELS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."HOTELS" MODIFY ("LOCATION" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."HOTELS" ADD PRIMARY KEY ("HOTEL_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table RESERVATIONS
--------------------------------------------------------

  ALTER TABLE "ANDRES"."RESERVATIONS" ADD PRIMARY KEY ("RESERVATION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table RESTAURANT_RESERVATIONS
--------------------------------------------------------

  ALTER TABLE "ANDRES"."RESTAURANT_RESERVATIONS" ADD PRIMARY KEY ("RESTAURANT_RESERVATION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "ANDRES"."EMPLOYEES" MODIFY ("FIRST_NAME" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."EMPLOYEES" MODIFY ("LAST_NAME" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."EMPLOYEES" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."EMPLOYEES" ADD PRIMARY KEY ("EMPLOYEE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "ANDRES"."EMPLOYEES" ADD UNIQUE ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table INVOICES
--------------------------------------------------------

  ALTER TABLE "ANDRES"."INVOICES" ADD PRIMARY KEY ("INVOICE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table RESTAURANTS
--------------------------------------------------------

  ALTER TABLE "ANDRES"."RESTAURANTS" ADD PRIMARY KEY ("RESTAURANT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CLIENT_STAY_HISTORY
--------------------------------------------------------

  ALTER TABLE "ANDRES"."CLIENT_STAY_HISTORY" ADD PRIMARY KEY ("HISTORY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SERVICES
--------------------------------------------------------

  ALTER TABLE "ANDRES"."SERVICES" ADD PRIMARY KEY ("SERVICE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ROOMS
--------------------------------------------------------

  ALTER TABLE "ANDRES"."ROOMS" MODIFY ("ROOM_TYPE" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."ROOMS" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."ROOMS" ADD PRIMARY KEY ("ROOM_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PROMOTIONS
--------------------------------------------------------

  ALTER TABLE "ANDRES"."PROMOTIONS" ADD PRIMARY KEY ("PROMOTION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CLIENTS
--------------------------------------------------------

  ALTER TABLE "ANDRES"."CLIENTS" MODIFY ("FIRST_NAME" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."CLIENTS" MODIFY ("LAST_NAME" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."CLIENTS" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "ANDRES"."CLIENTS" ADD PRIMARY KEY ("CLIENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "ANDRES"."CLIENTS" ADD UNIQUE ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PAYMENTS
--------------------------------------------------------

  ALTER TABLE "ANDRES"."PAYMENTS" ADD PRIMARY KEY ("PAYMENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CHECKINS_CHECKOUTS
--------------------------------------------------------

  ALTER TABLE "ANDRES"."CHECKINS_CHECKOUTS" ADD FOREIGN KEY ("RESERVATION_ID")
	  REFERENCES "ANDRES"."RESERVATIONS" ("RESERVATION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CLIENT_STAY_HISTORY
--------------------------------------------------------

  ALTER TABLE "ANDRES"."CLIENT_STAY_HISTORY" ADD FOREIGN KEY ("CLIENT_ID")
	  REFERENCES "ANDRES"."CLIENTS" ("CLIENT_ID") ENABLE;
  ALTER TABLE "ANDRES"."CLIENT_STAY_HISTORY" ADD FOREIGN KEY ("HOTEL_ID")
	  REFERENCES "ANDRES"."HOTELS" ("HOTEL_ID") ENABLE;
  ALTER TABLE "ANDRES"."CLIENT_STAY_HISTORY" ADD FOREIGN KEY ("ROOM_ID")
	  REFERENCES "ANDRES"."ROOMS" ("ROOM_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "ANDRES"."EMPLOYEES" ADD FOREIGN KEY ("HOTEL_ID")
	  REFERENCES "ANDRES"."HOTELS" ("HOTEL_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table INVOICES
--------------------------------------------------------

  ALTER TABLE "ANDRES"."INVOICES" ADD FOREIGN KEY ("RESERVATION_ID")
	  REFERENCES "ANDRES"."RESERVATIONS" ("RESERVATION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PAYMENTS
--------------------------------------------------------

  ALTER TABLE "ANDRES"."PAYMENTS" ADD FOREIGN KEY ("INVOICE_ID")
	  REFERENCES "ANDRES"."INVOICES" ("INVOICE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RESERVATIONS
--------------------------------------------------------

  ALTER TABLE "ANDRES"."RESERVATIONS" ADD FOREIGN KEY ("CLIENT_ID")
	  REFERENCES "ANDRES"."CLIENTS" ("CLIENT_ID") ENABLE;
  ALTER TABLE "ANDRES"."RESERVATIONS" ADD FOREIGN KEY ("HOTEL_ID")
	  REFERENCES "ANDRES"."HOTELS" ("HOTEL_ID") ENABLE;
  ALTER TABLE "ANDRES"."RESERVATIONS" ADD FOREIGN KEY ("ROOM_ID")
	  REFERENCES "ANDRES"."ROOMS" ("ROOM_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RESTAURANTS
--------------------------------------------------------

  ALTER TABLE "ANDRES"."RESTAURANTS" ADD FOREIGN KEY ("HOTEL_ID")
	  REFERENCES "ANDRES"."HOTELS" ("HOTEL_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RESTAURANT_RESERVATIONS
--------------------------------------------------------

  ALTER TABLE "ANDRES"."RESTAURANT_RESERVATIONS" ADD FOREIGN KEY ("HOTEL_ID")
	  REFERENCES "ANDRES"."HOTELS" ("HOTEL_ID") ENABLE;
  ALTER TABLE "ANDRES"."RESTAURANT_RESERVATIONS" ADD FOREIGN KEY ("CLIENT_ID")
	  REFERENCES "ANDRES"."CLIENTS" ("CLIENT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ROOMS
--------------------------------------------------------

  ALTER TABLE "ANDRES"."ROOMS" ADD FOREIGN KEY ("HOTEL_ID")
	  REFERENCES "ANDRES"."HOTELS" ("HOTEL_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SERVICES
--------------------------------------------------------

  ALTER TABLE "ANDRES"."SERVICES" ADD FOREIGN KEY ("HOTEL_ID")
	  REFERENCES "ANDRES"."HOTELS" ("HOTEL_ID") ENABLE;
