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
-- ###				 CLIENTE					#####
-- ##################################################


-- ##################################################
-- ###  				COLONIA					#####
-- ##################################################

-- ##################################################
-- ###  				ALCALDIA				#####
-- ##################################################

-- ##################################################
-- ###  				ESTADO					#####
-- ##################################################

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
    CONSTRAINT CK4_ESTATUS_NOMBRE CHECK (NOMBRE_ESTATUS IN ('SOLICITADO','PROGRAMADO','CONFIRMADO','EN CURSO',
                'TERMINADO', 'POR COBRAR', 'PAGADO', 'CON ADEUDO', 'CANCELADO'))

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
