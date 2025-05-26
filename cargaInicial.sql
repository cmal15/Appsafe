/*
 * Company :      FI UNAM
 * Project :      AppSafe Carga Inicial 
 * Authors :      Alvarez Lopez Carlos Manuel
				  Membrilla Isaias Iñaki Ramos
				  Miramón Pérez Jocelyn

 */

 -------************* INSERCIONES ******************-------

 USE [APPSAFE]
GO
-- ##################################################
-- ##					 DESCUENTO				#####
-- ##################################################

BEGIN TRANSACTION
INSERT INTO OPERACIONES.DESCUENTO(ID_DESCUENTO, FECHA_INICIO, FECHA_FIN, MONTO, ORIGEN)
VALUES (1, '2025-05-20', '2025-06-20', 50, 'ANIVERSARIO'),
	(2, '2025-05-25', '2025-06-20', 50, 'OFERTA FLASH'),
	(3, '2025-05-20', '2025-05-25', 50, 'RECOMENDACION')
COMMIT TRANSACTION

-- ##################################################
-- ##					 ESTATUS				#####
-- ##################################################

BEGIN TRANSACTION
INSERT INTO CATALOGOS.ESTATUS(ID_ESTATUS, NOMBRE_ESTATUS)
VALUES (1, 'SOLICITADO'),
	(2,'PROGRAMADO'),
	(3,'CONFIRMADO'),
	(4,'EN CURSO'),
	(5,'TERMINADO'),
	(6,'POR COBRAR'),
	(7,'PAGADO'),
	(8,'CON ADEUDO'),
	(9,'CANCELADO')
COMMIT TRANSACTION

--###################################################
-- ###				CATALOGO_QUEJAS 			#####
-- ##################################################

BEGIN TRANSACTION
INSERT INTO CATALOGOS.CATALOGO_QUEJAS(ID_CATALOGO_QUEJAS, MOTIVO)
VALUES (1, 'GROSERO'),
	(2, 'LENTO'),
	(3, 'SUCIO'),
	(4, 'FUMADOR')
COMMIT TRANSACTION

-- ##################################################
-- ##					USUARIO					#####
-- ##################################################

begin tran
insert into usuarios.usuario (ID_USUARIO, ID_RECOMENDANTE,ES_ADMINISTRADOR,ES_CONDUCTOR, ES_CLIENTE,CONTRASEÑA,NOMBRE_USUARIO,CORREO,NOMBRE,APELLIDO1,APELLIDO2)
	values  (1, NULL, 1, 0, 0, 'Lorem4*', 'CCGREEN', 'green@example.com', 'Alan', 'Turing', NULL),
			(2, NULL, 1, 0, 0, 'Ipsum10*', 'GGMur', 'germ@example.com', 'Jonh', 'Doe', 'Second'),
			(3, NULL, 1, 0, 0, '3Ste*rno', 'ERB', 'justice@example.com', 'Ada', 'Lovelance', NULL),
			(4, NULL, 0, 0, 0, '123Admin1*', 'admin_user', 'admin@example.com', 'Carlos', 'Pérez', NULL),
			(5, 4, 0, 0, 0, 'Driver456#', 'driver_luis', 'luis@transporte.com', 'Luis', 'Martínez', 'Gómez'),
			(6, NULL, 0, 0, 0, 'Client789&', 'cliente_ana', 'ana@email.com', 'Ana', 'López', NULL),
			(7, 5, 0, 0, 0, 'Mix123&', 'usuario_mixto', 'mix@ejemplo.com', 'Jorge', 'Ramírez', 'Díaz'),
			(8, NULL, 0, 1, 0, 'Cont23*', 'client_maria', 'maria@clientes.com', 'María', 'Santos', 'Delgado'),
			(9, 6, 0, 1, 0, 'Secu#91', 'cliente_jorge', 'jorge@clientes.com', 'Jorge', 'Mendoza', 'Ruiz'),
			(10, NULL, 0, 1, 0, 'Driv*88', 'chofer_pedro', 'pedro@transporte.com', 'Pedro', 'González', NULL),
			(11, 2, 0, 1, 0, 'Admi*33', 'super_admin', 'admin2@empresa.com', 'Lucía', 'Navarro', 'Sierra'),
			(12, 1, 0, 1, 0, 'Clie*202', 'client_roberto', 'roberto@clientes.com', 'Roberto', 'Fernández', NULL);
commit tran
-- ##################################################
-- ###				CONDUCTOR					#####
-- ##################################################
begin tran
INSERT INTO USUARIOS.conductor (ID_USUARIO, LICENCIA, VIGENCIA, DESCRIPCION, FOTO)
SELECT '9', '1234ABCD', '2025-05-25', 'Conductor con historial limpio y excelente sentido de responsabilidad al volante.', 
* FROM OpenRowset(Bulk 'C:\Users\isaia\OneDrive\Desktop\fotos licencia\conductor4.png', Single_Blob) AS ProductosFoto;
GO

INSERT INTO USUARIOS.conductor (ID_USUARIO, LICENCIA, VIGENCIA, DESCRIPCION, FOTO)
SELECT '10', '6852AZCY', '2025-05-25', 'Profesional comprometido con la seguridad y satisfacción del cliente en cada viaje.', 
* FROM OpenRowset(Bulk 'C:\Users\isaia\OneDrive\Desktop\fotos licencia\conductor5.png', Single_Blob) AS ProductosFoto;
GO

INSERT INTO USUARIOS.conductor (ID_USUARIO, LICENCIA, VIGENCIA, DESCRIPCION, FOTO)
SELECT '11', '4678JHSJ', '2025-05-25', 'Experto en conducción urbana, con actitud proactiva y vocación de servicio.', 
* FROM OpenRowset(Bulk 'C:\Users\isaia\OneDrive\Desktop\fotos licencia\conductor6.png', Single_Blob) AS ProductosFoto;
GO

INSERT INTO USUARIOS.conductor (ID_USUARIO, LICENCIA, VIGENCIA, DESCRIPCION, FOTO)
SELECT '12', '1569KLAS', '2025-05-25', 'Licencia vigente y comprobada experiencia en rutas de alta demanda. Siempre puntual.', 
* FROM OpenRowset(Bulk 'C:\Users\isaia\OneDrive\Desktop\fotos licencia\conductor7.png', Single_Blob) AS ProductosFoto;
GO

INSERT INTO USUARIOS.conductor (ID_USUARIO, LICENCIA, VIGENCIA, DESCRIPCION, FOTO)
SELECT '8', '4568USAD', '2025-05-25', 'Conductor confiable, con amplio conocimiento de la ciudad y enfoque en atención al usuario.', 
* FROM OpenRowset(Bulk 'C:\Users\isaia\OneDrive\Desktop\fotos licencia\conductor8.png', Single_Blob) AS ProductosFoto;
GO
commit tran

-- ##################################################
-- ##			 ADMINISTRADOR					#####
-- ##################################################

BEGIN TRANSACTION
INSERT INTO USUARIOS.ADMINISTRADOR(ID_USUARIO, FECHA_INGRESO)
VALUES (1, '2024-06-21'),
	(2, '2024-06-21'),
	(3, '2024-06-21')
COMMIT TRANSACTION

-- ##################################################
-- ##			 TELEFONO						#####
-- ##################################################

BEGIN TRANSACTION
INSERT INTO USUARIOS.TELEFONO(ID_USUARIO, TELEFONO)
VALUES (1, '5555555555'),
	(2, '5534346767'),
	(3, '1123581321')
COMMIT TRANSACTION

-- ##################################################
-- ###				 BANCO						#####
-- ##################################################

INSERT INTO CATALOGOS.BANCO (ID_BANCO, NOMBRE)
VALUES
  (1,  'BBVA'),
  (2,  'Banorte'),
  (3,  'Citibanamex'),
  (4,  'Santander'),
  (5,  'HSBC'),
  (6,  'Scotiabank'),
  (7,  'Banco Azteca'),
  (8,  'Inbursa'),
  (9,  'NU');



--##################################################
-- ###				CATALOGO_ACCIDENTE			#####
-- ##################################################

BEGIN TRANSACTION
INSERT INTO CATALOGOS.CATALOGO_ACCIDENTES(ID_TIPO_ACCIDENTE, TIPO)
VALUES (1, 'Colisión frontal'),
	(2, 'Colisión lateral'),
	(3, 'Colisión trasera')
COMMIT TRANSACTION

-- ##################################################
-- ##					 MARCA					#####
-- ##################################################

	insert into CATALOGOS.MARCA (ID_MARCA, NOMBRE_MARCA)
	values  (1,'Toyota'),
			(2,'Ford'),
			(3,'BMW');

-- ##################################################
-- ##				MODELO						#####
-- ##################################################

	insert into CATALOGOS.MODELO (ID_MODELO, NOMBRE_MODELO, ID_MARCA)
	values  (1, 'Corolla', 1),
			(2, 'Camry', 1),
			(3, 'RAV4', 1),
			(4, 'Mustang', 2),
			(5, 'F-150', 2),
			(6, 'Explorer', 2),
			(7, 'X5', 3),
			(8, 'Serie 3', 3),
			(9, 'i4', 3);


-- ##################################################
-- ###  				AUTO					#####
-- ##################################################
begin tran
	insert into USUARIOS.automovil (ID_AUTOMOVIL,NUMPLACAS,AÑO,ID_USUARIO,ID_MODELO,DISPONIBLE,COLOR,NUMSERIE)
	values  (1, 'ABC1234', 2021, 9, 1,1,'NEGRO','9XZ1L4M72V83Q7KJP'),
			(2, 'XYZ5678', 2020, 10, 4,1,'BLANCO',	'B3W9A8XTR2M6D1NQ7'),
			(3, 'LMN9012', 2022, 11, 7,1,'VERDE', 'J7K8L5QZ92TAXY3WV'),
			(4, 'QRS3456', 2020, 12, 2,1,'AMARILLO','MZ0X2Y7V9RQP3L8TN'),
			(5, 'TUV7890', 2021, 8, 3,1,'NEGRO', 'Y6WQ91MNB3L7XZV2K'),
			(6, 'WXY1234', 2022, 8, 5, 1, 'AZUL', 'L9P8O7I6U5Y4T3R2E'),
			(7, 'ZAB5678', 2023, 10, 8, 1, 'BLANCO', 'Q1W2E3R4T5Y6U7I8O');
commit tran
-- ##################################################
-- ###					PAGO					#####
-- ##################################################
begin tran
	insert into OPERACIONES.PAGO(ID_USUARIO,FOLIO,MONTO,FECHA)
			--pagos para ID 4
	values  (9, 1, 3200, '2025-04-28'),
			(9, 2, 4800, '2025-05-05'),
			(9, 3, 3500, '2025-05-12'),

			-- Pagos para ID 5
			(10, 1, 3100, '2025-04-28'),
			(10, 2, 4950, '2025-05-05'),
			(10, 3, 3700, '2025-05-12'),

			-- Pagos para ID 6
			(11, 1, 4600, '2025-04-28'),
			(11, 2, 3300, '2025-05-05'),
			(11, 3, 4100, '2025-05-12'),

			-- Pagos para ID 7
			(12, 1, 3000, '2025-04-28'),
			(12, 2, 4500, '2025-05-05'),
			(12, 3, 3850, '2025-05-12'),

			-- Pagos para ID 8
			(8, 1, 5000, '2025-04-28'),
			(8, 2, 3900, '2025-05-05'),
			(8, 3, 3400, '2025-05-12');
commit tran
-- ##################################################
-- ###  				ESTADO					#####
-- ##################################################
begin tran
INSERT INTO CATALOGOS.ESTADO (NOMBRE_ESTADO)
VALUES ('CDMX'), 
		('Aguascalientes'),
		('Baja California'),
		('Baja California Sur'),
		('Campeche'),
		('Chiapas'),
		('Chihuahua'),
		('Coahuila de Zaragoza'),
		('Colima'),
		('Durango'),
		('Estado de México'),
		('Guanajuato'),
		('Guerrero'),
		('Hidalgo'),
		('Jalisco'),
		('Michoacán de Ocampo'),
		('Morelos'),
		('Nayarit'),
		('Nuevo León'),
		('Oaxaca'),
		('Puebla'),
		('Querétaro'),
		('Quintana Roo'),
		('San Luis Potosí'),
		('Sinaloa'),
		('Sonora'),
		('Tabasco'),
		('Tamaulipas'),
		('Tlaxcala'),
		('Veracruz de Ignacio de la Llave'),
		('Yucatán'),
		('Zacatecas');
commit tran
-- ##################################################
-- ###  				ALCALDIA				#####
-- ##################################################

--Por el momento agregaremos de la CDMX
begin tran
INSERT INTO CATALOGOS.ALCALDIA (NOMBRE_ALCALDIA, ID_ESTADO) 
VALUES	('Álvaro Obregón', 1), --1
		('Azcapotzalco', 1), --2
		('Benito Juárez', 1), --3
		('Coyoacán', 1), --4
		('Cuajimalpa de Morelos', 1), --5
		('Cuauhtémoc', 1), --6
		('Gustavo A. Madero', 1), --7
		('Iztacalco', 1), --8 
		('Iztapalapa', 1), --9
		('La Magdalena Contreras', 1), --10
		('Miguel Hidalgo', 1), --11
		('Milpa Alta', 1), --12
		('Tláhuac', 1), --13
		('Tlalpan', 1), --14
		('Venustiano Carranza', 1), --15
		('Xochimilco', 1); --16
commit tran

-- ##################################################
-- ###  				COLONIA					#####
-- ##################################################

--Por el momento agregaremos de la CDMX
begin tran
INSERT INTO CATALOGOS.COLONIA (NOMBRE_COLONIA, ID_ALCALDIA)
VALUES ('Acueducto', 1),
	   ('Ave Real', 1),
	   ('Carola', 1),
	   ('Aguilera', 2), 
	   ('Claveria', 2),
	   ('Plenitud', 2),
	   ('Acacias', 3),
	   ('Mixcoac', 3),
	   ('Napoles', 3),
	   ('Ciudad Jardin', 4),
	   ('Cafetales', 4),
	   ('Huayamilpas', 4),
	   ('Contadero', 5),
	   ('Xalpa', 5),
	   ('Memetla', 5),
	   ('Hipodromo', 6),
	   ('Obrera', 6),
	   ('Roma Sur', 6),
	   ('Arboleadas', 7),
	   ('Bondonjito', 7),
	   ('Forestal', 7),
	   ('Tazintla', 8),
	   ('Agricola Oriental', 8),
	   ('El Rodeo', 8),
	   ('Apatlaco', 9),
	   ('Bellavista', 9),
	   ('Sideral', 9),
	   ('Atacaxco', 10),
	   ('Proterillo', 10),
	   ('El Rosal', 10),
	   ('America', 11),
	   ('Granada', 11),
	   ('Observatorio', 11),
	   ('Barrio San Juan', 12),
	   ('Barrio Santa Cruz', 12),
	   ('La Conchita', 12),
	   ('La Nopalera', 13),
	   ('Santa Cecilia', 13),
	   ('Selene', 13),
	   ('Fuentes Brotantes', 14),
	   ('La Joya', 14),
	   ('Vergel Coapa', 14),
	   ('Caracol', 15),
	   ('Jamaica', 15),
	   ('Progresista', 15),
	   ('La Noria', 16),
	   ('Barrio 18', 16),
	   ('Ampliacion Nativita', 16);
commit tran


-- ##################################################
-- ###				 DIRECCIÓN				#####
-- ##################################################

INSERT INTO USUARIOS.DIRECCION_FACTURACION (ID_DIRECCION, CALLE, NUMERO_INT, NUMERO_EXT, CP, ID_COLONIA)
  VALUES (1, 'Cerrada Magnolia',         23, 145, '01234', 1),
  (2, 'Calzada Cedros',           NULL, 312, '04567', 2),
  (3, 'Eje Zapata',               47,   99,  '33456', 3),
  (4, 'Viaducto Miguel Alemán',   10,  287, '12345', 4),
  (5, 'Anillo Periférico',        NULL, 400, '67890', 5),
  (6, 'Río Bravo',                5,   150, '54321', 6),
  (7, 'Andador del Sol',          NULL, 220, '11111', 7),
  (8, 'Camino Real',              12,  333, '22222', 8);

-- ##################################################
-- ###				 CLIENTE					#####
-- ##################################################
INSERT INTO USUARIOS.CLIENTE (ID_USUARIO, RFC, CELULAR, FECHA_REGISTRO, DIRECCION_FACTURACION)
VALUES (1, 'GARC850101HDF', '5512345678',  '2025-01-10', 1),
  (2, 'LOPE920215ABC', '5523456789',  '2025-02-15', 2),
  (3, 'MORA880503XYZ', '5534567890',  '2025-03-05', 3),
  (4, 'HERN900709QWE', '5545678901',  '2025-04-07', 4),
  (5, 'PERE830123RTY', '5556789012',  '2025-01-23', 5),
  (6, 'TORR950330UOP', '5567890123',  '2025-03-30', 6),
  (7, 'RUIZ871112PAS', '5578901234',  '2025-02-28', 7),
  (8, 'SANC940825LMN', '5589012345',  '2025-05-05', 8);


-- ##################################################
-- ###				TARJETA						#####
-- ##################################################

INSERT INTO USUARIOS.TARJETA(ID_TARJETA, VIGENCIA, NUMERO, ID_BANCO, ID_USUARIO)
VALUES
  (1, '2026-05-31', '4539578763451234', 1, 1),
  (2, '2026-12-31', '5520137890123456', 2, 2),
  (3, '2027-07-15', '6011000990139424', 3, 3),
  (4, '2025-11-30', '3566002020360505', 4, 4),
  (5, '2028-03-31', '5105105105105100', 5, 5),
  (6, '2029-09-30', '4111111111111111', 6, 6),
  (7, '2026-06-30', '6011111111111117', 7, 7),
  (8, '2027-10-31', '3782822463100050', 8, 8);


-- ##################################################
-- ##					 VIAJE					#####
-- ##################################################
DISABLE TRIGGER ALL ON OPERACIONES.VIAJE

BEGIN TRANSACTION VIAJES_CARGA_INICIAL

INSERT INTO OPERACIONES.VIAJE( ID_VIAJE, FECHA_INICIOVIAJE, ORIGEN_LONGITUD, ORIGEN_LATITUD,
							 DESTINO_LONGITUD, DESTINO_LATITUD, IMPORTE, PROPINA, ADEUDO,
                            CALIFICACION_CONDUCTOR, CALIFICACION_CLIENTE, COMENTARIO, 
                            PAGO_CON_TARJETA, ID_ESTATUS, ID_TARJETA, ID_USUARIO, ID_FACTURA,
                            ID_AUTOMOVIL, ID_DESCUENTO)

--15 viajes completos
VALUES 	(1, '2025-05-23', -99.120200, 19.508300, -99.133209, 19.432608, 331, 10, 0.00, 2, 2, 'Viaje caro y tardado.', 1, 5, 1, 1, NULL, 1, null),
		(2, '2025-06-23', -99.200500, 19.489100, -99.120200, 19.508300, 320, 15, 0.00, 1, 2, 'Mala actitud del conductor.', 1, 5, 2, 2, NULL, 2, NULL),
		(3, '2025-07-24', -99.174600, 19.493900, -99.200500, 19.489100, 123, 20, 0.00, 2, 3, 'El auto estaba sucio.', 1, 5, 3, 3, NULL, 3, null),
		(4, '2025-05-23', -99.175300, 19.378600, -99.174600, 19.493900, 112, 10, 0.00, 2, 2, 'No conocía la ruta.', 1, 5, 4, 4, NULL, 4, NULL),
		(5, '2025-06-10', -99.139600, 19.455900, -99.175300, 19.378600, 358, 15, 0.00, 1, 2, 'Tardó demasiado en llegar.', 1, 5, 5, 5, NULL, 5, NULL),
		(6, '2025-05-3', -99.161700, 19.288300, -99.139600, 19.455900, 98.23, 20, 0.00, 2, 1,'Conductor muy distraído.', 1, 5, 6, 6, NULL, 1, null),
		(7, '2025-05-11', -99.071900, 19.436100, -99.161700, 19.288300, 332, 15, 0.00, 3, 2, 'Viaje incómodo y ruidoso.', 1, 5, 7, 7, NULL, 2, NULL),

		(8, '2025-06-7', -99.200800, 19.433400, -99.071900, 19.436100, 237, 20, 0.00, 5, 5, 'Excelente trato y puntualidad.', 1, 5, 8, 8, NULL, 1, NULL),
		(9, '2025-07-8', -99.270000, 19.360000, -99.200800, 19.433400, 420, 20, 0.00, 5, 5, 'Muy buen servicio, gracias.', 1, 5, 1, 1, NULL, 2, null),
		(10, '2025-05-23', -99.152000, 19.416000, -99.270000, 19.360000, 230, 15, 0.00, 4, 5, 'Conductor amable y eficiente.', 1, 5, 2, 2, NULL, 1, NULL),
		(11, '2025-06-23', -99.096300, 19.267300, -99.152000, 19.416000, 106, 15, 0.00, 4, 4, 'Auto limpio y cómodo.', 1, 5, 3, 3, NULL, 4, null),
		(12, '2025-07-23', -99.186000, 19.332200, -99.096300, 19.267300, 89, 15, 0.00, 5, 5, 'Todo salió perfecto.', 1, 5, 4, 4, NULL, 5, NULL),
		(13, '2025-08-23', -99.162703, 19.346679, -99.186000, 19.332200, 56, 10, 0.00, 5, 5, 'Excelente manejo y cortesía.', 1, 5, 5, 5, NULL, 3, null),
		(14, '2025-09-23', -99.181153, 19.420380, -99.162703, 19.346679, 235, 20, 0.00, 4, 4, 'Sin contratiempos, muy bien.', 1, 5, 6, 6, NULL, 4, NULL),
		(15, '2025-10-23', -99.133209, 19.432608, -99.181153, 19.420380, 245, 15, 0.00, 5, 5, 'Recomiendo este conductor.', 1, 5, 7, 7, NULL, 5, null),

--5 viajes programados
		(16, '2025-01-20', -99.1332, 19.4326, -99.1400, 19.4400, 215.50, 15, 0.00, 5, 5, 'Viaje rápido y seguro.', 1, 2, 1, 1, NULL, NULL, NULL),
  		(17, '2025-02-19', -99.1500, 19.4300, -99.1600, 19.4500, 289.75, 20, 0.00, 4, 5, 'Conductor amable y puntual.', 0, 2, NULL, 2, NULL, NULL, NULL),
  		(18, '2025-05-18', -99.1200, 19.4100, -99.1300, 19.4200, 260.00, 10, 0.00, 3, 4, 'Todo bien, sin contratiempos.', 1, 2, 3, 3, NULL, NULL, NULL),
  		(19, '2025-06-17', -99.1000, 19.4000, -99.1100, 19.4100, 299.99, 15, 0.00, 5, 5, 'Excelente servicio nocturno.', 1, 2, 4, 4, NULL, NULL, NULL),
  		(20, '2025-07-16', -99.1350, 19.4350, -99.1450, 19.4450, 200.00, 10, 0.00, 4, 4, 'Buen viaje, sin problemas.', 0, 2, NULL, 5, NULL, NULL, NULL),
--4 viajes cancelados
  		(21, '2025-08-15', -99.1550, 19.4450, -99.1650, 19.4550, 275.30, 20, 0.00, 5, 5, 'Maneja con las patas.', 1, 9, 6, 6, NULL, 1, NULL),
  		(22, '2025-05-14', -99.1100, 19.4200, -99.1200, 19.4300, 248.00, 15, 0.00, 4, 3, 'No me encontro.', 0, 9, NULL, 7, NULL, 2, NULL),
  		(23, '2025-06-13', -99.1050, 19.4050, -99.1150, 19.4150, 220.75, 10, 0.00, 3, 4, 'Encontramos la calle cerrada.', 1, 9, 8, 8, NULL, 3, NULL),
  		(24, '2025-07-12', -99.0900, 19.4000, -99.1000, 19.4100, 295.90, 15, 0.00, 5, 5, 'Olia a cigarro el conductor.', 0, 9, NULL, 1, NULL, 4, NULL),
--3 viajes con adeudos
  		(25, '2025-09-11', -99.1300, 19.4250, -99.1400, 19.4350, 230.00, 10, 230.00, 4, 4, 'Buena música durante viaje.', 1, 8, 2, 2, NULL, 5, NULL),
  		(26, '2025-05-10', -99.1600, 19.4500, -99.1700, 19.4600, 280.60, 20, 100.00, 5, 5, 'Servicio rápido y eficiente.', 0, 8, NULL, 3, NULL, 1, NULL),
  		(27, '2025-07-09', -99.1450, 19.4400, -99.1550, 19.4500, 210.40, 15, 210.40, 3, 3, 'Conductor llegó puntual.', 1, 8, 4, 4, NULL, 2, NULL),
--6 viajes solicitados
			(28, '2025-05-08', -99.1350, 19.4370, -99.1450, 19.4470, 299.00, 15, 0.00, 5, 5, 'Conductor educado y puntual.', 1, 1, 5, 5, NULL, NULL, NULL),
  		(29, '2025-06-07', -99.1000, 19.4000, -99.1100, 19.4100, 250.50, 10, 0.00, 4, 4, 'El viaje fue sin demoras.', 0, 1, NULL, 6, NULL, NULL, NULL),
  		(30, '2025-07-06', -99.1550, 19.4450, -99.1650, 19.4550, 285.25, 20, 0.00, 5, 5, 'Excelente atención al cliente.', 1, 1, 7, 7, NULL, NULL, NULL),
  		(31, '2025-05-05', -99.1250, 19.4200, -99.1350, 19.4300, 270.00, 15, 0.00, 4, 4, 'Viaje cómodo y tranquilo.', 0, 1, NULL, 8, NULL, NULL, NULL),
  		(32, '2025-05-04', -99.0900, 19.3950, -99.1000, 19.4050, 225.00, 10, 0.00, 3, 3, 'Sin inconvenientes en ruta.', 1, 1, 1, 1, NULL, NULL, NULL),
  		(33, '2025-05-03', -99.1150, 19.4100, -99.1250, 19.4200, 240.80, 15, 0.00, 5, 4, 'Buen trato del conductor.', 0, 1, NULL, 1, NULL, NULL, NULL);
GO


COMMIT TRANSACTION;

ENABLE TRIGGER ALL ON OPERACIONES.VIAJE

 --##################################################
-- ###				VIAJE_ESTATUS				#####
-- ##################################################

INSERT INTO REGISTROS.VIAJE_ESTATUS(ID_VIAJE, ID_ESTATUS, FECHA_HORA)
VALUES 
		-- VIAJE COMPLETADO 1 
	(1, 1, '2025-05-23 08:00:00'),
	(1, 3, '2025-05-23 08:05:00'),
	(1, 4, '2025-05-23 08:10:00'),
	(1, 6, '2025-05-23 08:20:00'),
	(1, 7, '2025-05-23 08:25:00'),
	(1, 5, '2025-05-23 08:30:00'),

	-- VIAJE COMPLETADO 2 
	(2, 1, '2025-06-23 09:00:00'),
	(2, 3, '2025-06-23 09:05:00'),
	(2, 4, '2025-06-23 09:10:00'),
	(2, 6, '2025-06-23 09:20:00'),
	(2, 7, '2025-06-23 09:25:00'),
	(2, 5, '2025-06-23 09:30:00'),

	-- VIAJE COMPLETADO 3 
	(3, 1, '2025-07-24 10:00:00'),
	(3, 3, '2025-07-24 10:05:00'),
	(3, 4, '2025-07-24 10:10:00'),
	(3, 6, '2025-07-24 10:20:00'),
	(3, 7, '2025-07-24 10:25:00'),
	(3, 5, '2025-07-24 10:30:00'),

	-- VIAJE COMPLETADO 4 
	(4, 1, '2025-05-23 11:00:00'),
	(4, 3, '2025-05-23 11:05:00'),
	(4, 4, '2025-05-23 11:10:00'),
	(4, 6, '2025-05-23 11:20:00'),
	(4, 7, '2025-05-23 11:25:00'),
	(4, 5, '2025-05-23 11:30:00'),

	-- VIAJE COMPLETADO 5 
	(5, 1, '2025-06-10 12:00:00'),
	(5, 3, '2025-06-10 12:05:00'),
	(5, 4, '2025-06-10 12:10:00'),
	(5, 6, '2025-06-10 12:20:00'),
	(5, 7, '2025-06-10 12:25:00'),
	(5, 5, '2025-06-10 12:30:00'),

	-- VIAJE COMPLETADO 6 
	(6, 1, '2025-05-03 08:00:00'),
	(6, 3, '2025-05-03 08:05:00'),
	(6, 4, '2025-05-03 08:10:00'),
	(6, 6, '2025-05-03 08:20:00'),
	(6, 7, '2025-05-03 08:25:00'),
	(6, 5, '2025-05-03 08:30:00'),

	-- VIAJE COMPLETADO 7 
	(7, 1, '2025-05-11 09:00:00'),
	(7, 3, '2025-05-11 09:05:00'),
	(7, 4, '2025-05-11 09:10:00'),
	(7, 6, '2025-05-11 09:20:00'),
	(7, 7, '2025-05-11 09:25:00'),
	(7, 5, '2025-05-11 09:30:00'),

	-- VIAJE COMPLETADO 8 
	(8, 1, '2025-06-07 10:00:00'),
	(8, 3, '2025-06-07 10:05:00'),
	(8, 4, '2025-06-07 10:10:00'),
	(8, 6, '2025-06-07 10:20:00'),
	(8, 7, '2025-06-07 10:25:00'),
	(8, 5, '2025-06-07 10:30:00'),

	-- VIAJE COMPLETADO 9 
	(9, 1, '2025-07-08 11:00:00'),
	(9, 3, '2025-07-08 11:05:00'),
	(9, 4, '2025-07-08 11:10:00'),
	(9, 6, '2025-07-08 11:20:00'),
	(9, 7, '2025-07-08 11:25:00'),
	(9, 5, '2025-07-08 11:30:00'),

	-- VIAJE COMPLETADO 10 
	(10, 1, '2025-05-23 12:00:00'),
	(10, 3, '2025-05-23 12:05:00'),
	(10, 4, '2025-05-23 12:10:00'),
	(10, 6, '2025-05-23 12:20:00'),
	(10, 7, '2025-05-23 12:25:00'),
	(10, 5, '2025-05-23 12:30:00'),

	-- VIAJE COMPLETADO 11 
	(11, 1, '2025-06-23 08:00:00'),
	(11, 3, '2025-06-23 08:05:00'),
	(11, 4, '2025-06-23 08:10:00'),
	(11, 6, '2025-06-23 08:20:00'),
	(11, 7, '2025-06-23 08:25:00'),
	(11, 5, '2025-06-23 08:30:00'),

	-- VIAJE COMPLETADO 12 
	(12, 1, '2025-07-23 09:00:00'),
	(12, 3, '2025-07-23 09:05:00'),
	(12, 4, '2025-07-23 09:10:00'),
	(12, 6, '2025-07-23 09:20:00'),
	(12, 7, '2025-07-23 09:25:00'),
	(12, 5, '2025-07-23 09:30:00'),

	-- VIAJE COMPLETADO 13 
	(13, 1, '2025-05-23 10:00:00'),
	(13, 3, '2025-05-23 10:05:00'),
	(13, 4, '2025-05-23 10:10:00'),
	(13, 6, '2025-05-23 10:20:00'),
	(13, 7, '2025-05-23 10:25:00'),
	(13, 5, '2025-05-23 10:30:00'),

	-- VIAJE COMPLETADO 14 
	(14, 1, '2025-06-23 11:00:00'),
	(14, 3, '2025-06-23 11:05:00'),
	(14, 4, '2025-06-23 11:10:00'),
	(14, 6, '2025-06-23 11:20:00'),
	(14, 7, '2025-06-23 11:25:00'),
	(14, 5, '2025-06-23 11:30:00'),

	-- VIAJE COMPLETADO 15 
	(15, 1, '2025-07-23 12:00:00'),
	(15, 3, '2025-07-23 12:05:00'),
	(15, 4, '2025-07-23 12:10:00'),
	(15, 6, '2025-07-23 12:20:00'),
	(15, 7, '2025-07-23 12:25:00'),
	(15, 5, '2025-07-23 12:30:00'),

	--5 viajes programados
	(16, 2, '2025-05-01 08:05:00'),
	(17, 2, '2025-05-02 09:15:00'),
	(18, 2, '2025-05-03 11:25:00'),
	(19, 2, '2025-05-04 10:15:00'),
	(20, 2, '2025-05-05 12:20:00'),

	--4 viajes cancelados
	(21, 1, '2025-05-01 08:05:00'),
	(21, 9, '2025-05-01 08:15:00'),
	(22, 1, '2025-05-02 12:55:00'),
	(22, 9, '2025-05-02 12:57:00'),
	(23, 1, '2025-05-03 10:32:00'),
	(23, 9, '2025-05-03 10:37:00'),
	(24, 1, '2025-05-02 07:10:00'),
	(24, 9, '2025-05-02 07:14:00'),

	--3 viajes con adeudos
	-- VIAJE ADEUDO 1 
	(25, 1, '2025-05-03 08:00:00'),
	(25, 3, '2025-05-03 08:05:00'),
	(25, 4, '2025-05-03 08:10:00'),
	(25, 6, '2025-05-03 08:20:00'),
	(25, 8, '2025-05-03 08:30:00'),
	(25, 5, '2025-05-03 08:35:00'),

	-- VIAJE ADEUDO 2
	(26, 1, '2025-05-06 09:00:00'),
	(26, 3, '2025-05-06 09:05:00'),
	(26, 4, '2025-05-06 09:10:00'),
	(26, 6, '2025-05-06 09:20:00'),
	(26, 8, '2025-05-06 09:30:00'),
	(26, 5, '2025-05-06 09:35:00'),

	-- VIAJE ADEUDO 3
	(27, 1, '2025-05-08 10:00:00'),
	(27, 3, '2025-05-08 10:05:00'),
	(27, 4, '2025-05-08 10:10:00'),
	(27, 6, '2025-05-08 10:20:00'),
	(27, 8, '2025-05-08 10:25:00'),
	(27, 5, '2025-05-08 10:30:00'),

	--6 viajes solicitados
	-- VIAJE SOLICITADO 1
	(28, 1, '2025-05-15 12:00:00'),

	-- VIAJE SOLICITADO 2
	(29, 1, '2025-05-15 12:05:00'),

	-- VIAJE SOLICITADO 3
	(30, 1, '2025-05-15 12:10:00'),

	-- VIAJE SOLICITADO 4
	(31, 1, '2025-05-15 12:20:00'),

	-- VIAJE SOLICITADO 5
	(32, 1, '2025-05-15 12:25:00'),

	-- VIAJE SOLICITADO 6
	(33, 1, '2025-05-15 12:30:00');
GO

 --##################################################
-- ###				ACCIDENTE					#####
-- ##################################################

INSERT INTO INCIDENCIAS.ACCIDENTE (
    ID_ACCIDENTE,FECHA,LONGITUD,
    LATITUD,HERIDOS,MONTO,
    ES_RESPONSABLE,ID_TIPO_ACCIDENTE,
    ID_VIAJE,DESCRIPCION
)
VALUES
(1, '2025-05-23', -99.120000, 19.508000, 1, 1500.00, 1, 1, 1, 'Colisión menor al salir de la ubicación de origen.'),
(2, '2025-06-23', -99.200000, 19.489000, 0, 800.00, 0, 2, 2, 'Golpe lateral por otro vehículo al cambiar de carril.'),
(3, '2025-07-24', -99.174000, 19.494000, 1, 2500.00, 1, 3, 3, 'Frenado brusco causó accidente con motociclista.'),
(4, '2025-05-23', -99.175000, 19.378000, 0, 300.00, 0, 1, 4, 'Accidente leve con poste de señalización.'),
(5, '2025-06-10', -99.139000, 19.456000, 1, 1800.00, 1, 1, 5, 'Choque por alcance debido a distracción.'),
(6, '2025-05-03', -99.161000, 19.288000, 0, 700.00, 0, 1, 6, 'Impacto menor en cruce sin semáforo.'),
(7, '2025-05-11', -99.071000, 19.436000, 1, 3200.00, 1, 3, 7, 'Conductor impactó al peatón en paso cebra. Atención médica requerida.');

-- ##################################################
-- ##			REGISTRO_UBICACION				#####
-- ##################################################
-- VIAJE 1 - 2025-05-23
INSERT INTO REGISTROS.REGISTRO_UBICACION VALUES 
(1, -99.120200, 19.508300, '2025-05-23 08:10:00', 1),
(2, -99.122000, 19.505000, '2025-05-23 08:11:00', 1),
(3, -99.125000, 19.495000, '2025-05-23 08:12:00', 1),
(4, -99.128000, 19.470000, '2025-05-23 08:13:00', 1),
(5, -99.133209, 19.432608, '2025-05-23 08:14:00', 1);

-- VIAJE 2 - 2025-06-23
INSERT INTO REGISTROS.REGISTRO_UBICACION VALUES 
(6, -99.200500, 19.489100, '2025-06-23 09:10:00', 2),
(7, -99.192000, 19.492000, '2025-06-23 09:11:00', 2),
(8, -99.180000, 19.496000, '2025-06-23 09:12:00', 2),
(9, -99.160000, 19.500000, '2025-06-23 09:13:00', 2),
(10, -99.120200, 19.508300, '2025-06-23 09:14:00', 2);

-- VIAJE 3 - 2025-07-23
INSERT INTO REGISTROS.REGISTRO_UBICACION VALUES 
(11, -99.174600, 19.493900, '2025-07-24 10:10:00', 3),
(12, -99.180000, 19.492000, '2025-07-24 10:11:00', 3),
(13, -99.185000, 19.490000, '2025-07-24 10:12:00', 3),
(14, -99.192000, 19.489500, '2025-07-24 10:13:00', 3),
(15, -99.200500, 19.489100, '2025-07-24 10:14:00', 3);

-- VIAJE 4 - 2025-05-23
INSERT INTO REGISTROS.REGISTRO_UBICACION VALUES 
(16, -99.175300, 19.378600, '2025-05-23 11:10:00', 4),
(17, -99.170000, 19.400000, '2025-05-23 11:11:00', 4),
(18, -99.168000, 19.420000, '2025-05-23 11:12:00', 4),
(19, -99.170000, 19.440000, '2025-05-23 11:13:00', 4),
(20, -99.174600, 19.493900, '2025-05-23 11:14:00', 4);

-- VIAJE 5 - 2025-06-23
INSERT INTO REGISTROS.REGISTRO_UBICACION VALUES 
(21, -99.139600, 19.455900, '2025-06-10 12:10:00', 5),
(22, -99.145000, 19.440000, '2025-06-10 12:11:00', 5),
(23, -99.150000, 19.420000, '2025-06-10 12:12:00', 5),
(24, -99.160000, 19.400000, '2025-06-10 12:13:00', 5),
(25, -99.175300, 19.378600, '2025-06-10 12:14:00', 5);

-- VIAJE 6 - 2025-07-23
INSERT INTO REGISTROS.REGISTRO_UBICACION VALUES 
(26, -99.161700, 19.288300, '2025-05-03 08:10:00', 6),
(27, -99.150000, 19.320000, '2025-05-03 08:11:00', 6),
(28, -99.145000, 19.350000, '2025-05-03 08:12:00', 6),
(29, -99.142000, 19.400000, '2025-05-03 08:13:00', 6),
(30, -99.139600, 19.455900, '2025-05-03 08:14:00', 6);

-- VIAJE 7 - 2025-05-23
INSERT INTO REGISTROS.REGISTRO_UBICACION VALUES 
(31, -99.071900, 19.436100, '2025-05-11 09:10:00', 7),
(32, -99.100000, 19.400000, '2025-05-11 09:11:00', 7),
(33, -99.120000, 19.370000, '2025-05-11 09:12:00', 7),
(34, -99.140000, 19.330000, '2025-05-11 09:13:00', 7),
(35, -99.161700, 19.288300, '2025-05-11 09:14:00', 7);

-- VIAJE 8 - 2025-06-23
INSERT INTO REGISTROS.REGISTRO_UBICACION VALUES 
(36, -99.200800, 19.433400, '2025-06-07 10:10:00', 8),
(37, -99.175000, 19.434000, '2025-06-07 10:11:00', 8),
(38, -99.150000, 19.435000, '2025-06-07 10:12:00', 8),
(39, -99.110000, 19.435500, '2025-06-07 10:13:00', 8),
(40, -99.071900, 19.436100, '2025-06-07 10:14:00', 8);

-- VIAJE 9 - 2025-07-23
INSERT INTO REGISTROS.REGISTRO_UBICACION VALUES 
(41, -99.270000, 19.360000, '2025-07-08 11:10:00', 9),
(42, -99.250000, 19.380000, '2025-07-08 11:11:00', 9),
(43, -99.230000, 19.400000, '2025-07-08 11:12:00', 9),
(44, -99.210000, 19.420000, '2025-07-08 11:13:00', 9),
(45, -99.200800, 19.433400, '2025-07-08 11:14:00', 9);

-- VIAJE 10 - 2025-05-23
INSERT INTO REGISTROS.REGISTRO_UBICACION VALUES 
(46, -99.152000, 19.416000, '2025-05-23 12:10:00', 10),
(47, -99.180000, 19.410000, '2025-05-23 12:11:00', 10),
(48, -99.210000, 19.400000, '2025-05-23 12:12:00', 10),
(49, -99.240000, 19.380000, '2025-05-23 12:13:00', 10),
(50, -99.270000, 19.360000, '2025-05-23 12:14:00', 10);


-- ##################################################
-- ###					QUEJA					#####
-- ##################################################
INSERT INTO INCIDENCIAS.QUEJA (ID_QUEJA,ID_VIAJE,TITULO,
    FECHA_GENERACION, DESCRIPCION_QUEJA, DESCRIPCION_RESOLUCION,
    FECHA_RESOLUCION, ID_CATALOGO_QUEJAS, ID_USUARIO
)
VALUES
(1, 1, 'Viaje caro', '2025-05-23', 'Viaje caro y tardado.', 'Se reembolsó parcialmente.', '2025-05-26', 2, 1),
(2, 2, 'Actitud del conductor', '2025-06-23', 'Mala actitud del conductor.', 'Conductor advertido.', '2025-06-26', 1, 2),
(3, 3, 'Auto sucio', '2025-07-24', 'El auto estaba sucio.', 'Auto fue limpiado.', '2025-07-27', 4, 3),
(4, 4, 'Ruta desconocida', '2025-05-23', 'No conocía la ruta.', 'Capacitación al conductor.', '2025-05-26', 2, 1),
(5, 5, 'Retraso del conductor', '2025-06-10', 'Tardó demasiado en llegar.', 'Se bonificó al cliente.', '2025-06-13', 2, 2),
(6, 6, 'Conductor distraído', '2025-05-03', 'Conductor muy distraído.', 'Conductor fue evaluado.', '2025-05-06', 3, 3),
(7, 7, 'Viaje incómodo', '2025-05-11', 'Viaje incómodo y ruidoso.', 'Se aplicó encuesta de calidad.', '2025-05-14', 1, 1);

-- ##################################################
-- ###				FACTURA						#####
-- ##################################################
INSERT INTO operaciones.FACTURA (ID_FACTURA, ID_USUARIO, IMPORTE, FECHA)
VALUES (1, 1, 331.0, '2025-05-23'), 
	   (2, 2, 580.0, '2025-06-23'), 
       (3, 3, 143.0, '2025-07-26'), 
       (4, 4, 122.0, '2025-05-30'); 

UPDATE OPERACIONES.VIAJE
SET ID_FACTURA = 1
WHERE ID_VIAJE = 1;

UPDATE OPERACIONES.VIAJE
SET ID_FACTURA = 2
WHERE ID_VIAJE in (2,10);

UPDATE OPERACIONES.VIAJE
SET ID_FACTURA = 3
WHERE ID_VIAJE = 3;

UPDATE OPERACIONES.VIAJE
SET ID_FACTURA = 3
WHERE ID_VIAJE = 4;

-- ##################################################
-- ###				DESCUENTOS						#####
-- ##################################################
insert into OPERACIONES.DESCUENTO_USUARIO_VIAJE (ID_USUARIO,ID_DESCUENTO)
values	(1,1),
		(3,2),
		(5,3),
		(8,1),
		(2,2);
UPDATE OPERACIONES.VIAJE
SET ID_DESCUENTO = 1
WHERE ID_VIAJE = 1;
UPDATE OPERACIONES.VIAJE
SET ID_DESCUENTO = 2
WHERE ID_VIAJE = 3;
UPDATE OPERACIONES.VIAJE
SET ID_DESCUENTO = 3
WHERE ID_VIAJE = 5;
UPDATE OPERACIONES.VIAJE
SET ID_DESCUENTO = 1
WHERE ID_VIAJE = 8;
UPDATE OPERACIONES.VIAJE
SET ID_DESCUENTO = 2
WHERE ID_VIAJE = 10;
