/*
 * Company :      FI UNAM
 * Project :      AppSafe Carga Inicial 
 * Authors :      Alvarez Lopez Carlos Manuel
				  Membrilla Isaias Iñaki Ramos
				  Miramón Pérez Jocelyn

3 descuentos (Carlos)
3 admins {3 teléfonos} (Carlos)
3 catalogo_accidentes (Carlos)
6 estatus (Carlos)
4 catalogo_quejas (Carlos)
 */

 -------************* INSERCIONES ******************-------

 --##################################################
-- ###				VIAJE_ESTATUS				#####
-- ##################################################

 --##################################################
-- ###				ACCIDENTE					#####
-- ##################################################


--##################################################
-- ###				CATALOGO_ACCIDENTE			#####
-- ##################################################

BEGIN TRANSACTION
INSERT INTO CATALOGOS.CATALOGO_ACCIDENTE(ID_TIPO_ACCIDENTE, TIPO)
VALUES (1, 'Colisión frontal'),
	(2, 'Colisión lateral'),
	(3, 'Colisión trasera')
COMMIT TRANSACTION

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
-- ###  				AUTO					#####
-- ##################################################
	insert into USUARIOS.automovil (ID_AUTOMOVIL,NUMPLACAS,AÑO,ID_USUARIO,ID_MODELO)
	values  (1, 'ABC1234', 2018, 4, 1),
			(2, 'XYZ5678', 2020, 5, 4),
			(3, 'LMN9012', 2017, 6, 7),
			(4, 'QRS3456', 2019, 7, 2),
			(5, 'TUV7890', 2021, 8, 8);


-- ##################################################
-- ###  				ESTADO					#####
-- ##################################################
INSERT INTO USUARIOS.ESTADO (NOMBRE_ESTADO)
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
-- ##################################################
-- ###  				ALCALDIA				#####
-- ##################################################

--Por el momento agregaremos de la CDMX
INSERT INTO USUARIOS.ALCALDIA (NOMBRE_ALCALDIA, ID_ESTADO) 
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


-- ##################################################
-- ###  				COLONIA					#####
-- ##################################################

--Por el momento agregaremos de la CDMX
INSERT INTO USUARIOS.COLONIA (NOMBRE_COLONIA, ID_ALCALDIA)
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
-- ###				 BANCO						#####
-- ##################################################

INSERT INTO USUARIOS.BANCO (ID_BANCO, NOMBRE)
VALUES
  (1,  'BBVA'),
  (2,  'Banorte'),
  (3,  'Citibanamex'),
  (4,  'Santander'),
  (5,  'HSBC'),
  (6,  'Scotiabank'),
  (7,  'Banco Azteca'),
  (8,  'Inbursa'),
  (9,  'NU'),

-- ##################################################
-- ###				TARJETA						#####
-- ##################################################

INSERT INTO TARJETA (ID_TARJETA, VIGENCIA, NUMERO, ID_BANCO, ID_USUARIO)
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
-- ###				FACTURA						#####
-- ##################################################


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
-- ###					QUEJA					#####
-- ##################################################


-- ##################################################
-- ##			REGISTRO_UBICACION				#####
-- ##################################################


-- ##################################################
-- ##				TARJETA						#####
-- ##################################################


-- ##################################################
-- ##					TELEFONO				#####
-- ##################################################


-- ##################################################
-- ##					USUARIO					#####
-- ##################################################
insert into usuarios.usuario (ID_USUARIO, ID_RECOMENDANTE,ES_ADMINISTRADOR,ES_CONDUCTOR, ES_CLIENTE,CONTRASEÑA,NOMBRE_USUARIO,CORREO,NOMBRE,APELLIDO1,APELLIDO2)
	values  (1, NULL, 1, 0, 0, 'lorem4', 'CCGREEN', 'green@example.com', 'Alan', 'Turing', NULL),
			(2, NULL, 1, 0, 0, 'ipsum*', 'GGMur', 'germ@example.com', 'Jonh', 'Doe', 'Second'),
			(3, NULL, 1, 0, 0, '3sterno', 'ERB', 'justice@example.com', 'Ada', 'Lovelance', NULL),
			(4, NULL, 0, 1, 0, '123Admin1*', 'admin_user', 'admin@example.com', 'Carlos', 'Pérez', NULL),
			(5, 4, 0, 1, 0, 'Driver456#', 'driver_luis', 'luis@transporte.com', 'Luis', 'Martínez', 'Gómez'),
			(6, NULL, 0, 1, 0, 'Client789&', 'cliente_ana', 'ana@email.com', 'Ana', 'López', NULL),
			(7, 5, 0, 1, 0, 'Mix123&', 'usuario_mixto', 'mix@ejemplo.com', 'Jorge', 'Ramírez', 'Díaz'),
			(8, NULL, 0, 1, 0, 'Cont23*', 'client_maria', 'maria@clientes.com', 'María', 'Santos', 'Delgado');

-- ##################################################
-- ###				CONDUCTOR					#####
-- ##################################################
insert into USUARIOS.conductor (ID_USUARIO, LICENCIA,VIGENCIA,DESCRIPCION,FOTO)
	select '4','1234ABCD','2025-05-25','descripción ingeniosa 4', *from OpenRowset(Bulk 'C:\Users\isaia\OneDrive\Desktop\fotos licencia\conductor4.png', Single_Blob) As ProductosFoto
	go
	insert into USUARIOS.conductor (ID_USUARIO, LICENCIA,VIGENCIA,DESCRIPCION,FOTO)
	select '5','6852AZCY','2025-05-25','descripción mas ingeniosa', *from OpenRowset(Bulk 'C:\Users\isaia\OneDrive\Desktop\fotos licencia\conductor5.png', Single_Blob) As ProductosFoto
	go
insert into USUARIOS.conductor (ID_USUARIO, LICENCIA,VIGENCIA,DESCRIPCION,FOTO)
	select '6','4678JHSJ','2025-05-25','descripción  menos ingeniosa ', *from OpenRowset(Bulk 'C:\Users\isaia\OneDrive\Desktop\fotos licencia\conductor6.png', Single_Blob) As ProductosFoto
go
insert into USUARIOS.conductor (ID_USUARIO, LICENCIA,VIGENCIA,DESCRIPCION,FOTO)
	select '7','1569KLAS','2025-05-25','descripción algo ingeniosa', *from OpenRowset(Bulk 'C:\Users\isaia\OneDrive\Desktop\fotos licencia\conductor7.png', Single_Blob) As ProductosFoto
go
insert into USUARIOS.conductor (ID_USUARIO, LICENCIA,VIGENCIA,DESCRIPCION,FOTO)
	select '8','4568USAD','2025-05-25','descripción', *from OpenRowset(Bulk 'C:\Users\isaia\OneDrive\Desktop\fotos licencia\conductor8.png', Single_Blob) As ProductosFoto
go

-- ##################################################
-- ###					PAGO					#####
-- ##################################################
	insert into OPERACIONES.PAGO(ID_USUARIO,FOLIO,MONTO,FECHA)
			--pagos para ID 4
	values  (4, 1, 3200, '2025-04-28'),
			(4, 2, 4800, '2025-05-05'),
			(4, 3, 3500, '2025-05-12'),

			-- Pagos para ID 5
			(5, 1, 3100, '2025-04-28'),
			(5, 2, 4950, '2025-05-05'),
			(5, 3, 3700, '2025-05-12'),

			-- Pagos para ID 6
			(6, 1, 4600, '2025-04-28'),
			(6, 2, 3300, '2025-05-05'),
			(6, 3, 4100, '2025-05-12'),

			-- Pagos para ID 7
			(7, 1, 3000, '2025-04-28'),
			(7, 2, 4500, '2025-05-05'),
			(7, 3, 3850, '2025-05-12'),

			-- Pagos para ID 8
			(8, 1, 5000, '2025-04-28'),
			(8, 2, 3900, '2025-05-05'),
			(8, 3, 3400, '2025-05-12');

-- ##################################################
-- ##					 VIAJE					#####
-- ##################################################

INSERT INTO OPERACIONES.VIAJE(ID_VIAJE, FECHA_INICIOVIAJE,)
VALUES (1,),
	(2,),
	(3,),
	(4,),
	(5,),
	(6,),
	(7,),
	(8,),
	(9,),
	(10,),
	(11,),
	(12,),
	(13,),
	(14,),
	(15,);
GO

-- ##################################################
-- ##					 DESCUENTO				#####
-- ##################################################

BEGIN TRANSACTION
INSERT INTO OPERACIONES.DESCUENTO(ID_DESCUENTO, FECHA_INICIO, FECHA_FIN, MONTO, ORIGEN)
VALUES (1, '2025-05-20', '2025-06-20', 50, 'ANIVERSARIO'),
	(2, '2025-05-25', '2025-06-20', 50, 'OFERTA FLASH'),
	(3, '2025-05-20', '2025-05-25', 50, 'RECOMENDACION'),
COMMIT TRANSACTION

-- ##################################################
-- ##					 ESTATUS				#####
-- ##################################################

BEGIN TRANSACTION
INSERT INTO CATALOGO.ESTATUS(ID_ESTATUS, NOMBRE_ESTATUS)
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
INSERT INTO CATALOGO.CATALOGO_QUEJAS(ID_CATALOGO_QUEJAS, MOTIVO)
VALUES (1, 'GROSERO'),
	(2, 'LENTO'),
	(3, 'SUCIO'),
	(4, 'FUMADOR')
COMMIT TRANSACTION
