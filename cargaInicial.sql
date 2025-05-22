/*
 * Company :      FI UNAM
 * Project :      AppSafe Carga Inicial 
 * Authors :      Alvarez Lopez Carlos Manuel
				  Membrilla Isaias Iñaki Ramos
				  Miramón Pérez Jocelyn
 */

 -------************* INSERCIONES ******************-------

 --##################################################
-- ###				VIAJE_ESTATUS				#####
-- ##################################################

 --##################################################
-- ###				ACCIDENTE					#####
-- ##################################################


-- ##################################################
-- ##			 ADMINISTRADOR					#####
-- ##################################################

-- ##################################################
-- ###  				AUTO					#####
-- ##################################################



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
-- ###				CONDUCTOR					#####
-- ##################################################

-- ##################################################
-- ###				FACTURA						#####
-- ##################################################


-- ##################################################
-- ##				MODELO						#####
-- ##################################################


-- ##################################################
-- ###					PAGO					#####
-- ##################################################


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


-- ##################################################
-- ##					 VIAJE					#####
-- ##################################################


