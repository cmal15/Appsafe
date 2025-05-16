/*
 * ER/Studio 8.0 SQL Code Generation
 * Company :      FIUNAM
 * Project :      1Equipo-Appsafe.DM1
 * Authors :      Alvarez Lopez Carlos Manuel
				  Membrilla Isaias Iñaki Ramos
				  Miramón Pérez Jocelyn
 *
 * Date Created : Wednesday, April 16, 2025 17:39:49
 * Target DBMS : Microsoft SQL Server 2008
 */

-- ##################################################
-- ## TRIGGERS VIAJE_ESTATUS
-- ##################################################


-- ##################################################
-- ## TRIGGERS ACCIDENTE
-- ##################################################


-- ##################################################
-- ## TRIGGERS ADMINISTRADOR
-- ##################################################


-- ##################################################
-- ## TRIGGERS AUTO
-- ##################################################

CREATE TRIGGER TR_AUTO_AF1
ON USUARIOS.AUTOMOVIL
FOR INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS(
		SELECT ID_AUTOMOVIL 
		FROM USUARIOS.AUTOMOVIL
		WHERE ID_USUARIO IN (SELECT ID_USUARIO FROM inserted)
		GROUP BY ID_USUARIO
		HAVING COUNT(*)>2
	)
	BEGIN
		RAISERROR('El maximo de automoviles por conductor es 2',16,1);
		ROLLBACK TRANSACTION;
	END

	IF EXISTS(
		SELECT I.ID_AUTOMOVIL
		FROM inserted AS I
		JOIN USUARIOS.AUTOMOVIL AS A
			ON I.ID_AUTOMOVIL=A.ID_AUTOMOVIL
		WHERE I.ID_USUARIO!=A.ID_USUARIO
	)
	BEGIN
		RAISERROR('El vehiculo ya esta registrado para otro conductor',16,1);
		ROLLBACK TRANSACTION;
	END
END;

-- ##################################################
-- ## TRIGGERS CLIENTE
-- ##################################################


-- ##################################################
-- ## TRIGGERS CONDUCTOR
-- ##################################################


-- ##################################################
-- ## TRIGGERS VIAJE_ESTATUS
-- ##################################################


-- ##################################################
-- ## TRIGGERS FACTURA
-- ##################################################


-- ##################################################
-- ## TRIGGERS MODELO
-- ##################################################


-- ##################################################
-- ## TRIGGERS PAGO
-- ##################################################


-- ##################################################
-- ## TRIGGERS QUEJA
-- ##################################################


-- ##################################################
-- ## TRIGGERS REGISTRO_UBICACION
-- ##################################################


-- ##################################################
-- ## TRIGGERS TARJETA
-- ##################################################


-- ##################################################
-- ## TRIGGERS TELEFONO
-- ##################################################


-- ##################################################
-- ## TRIGGERS USUARIO
-- ##################################################


-- ##################################################
-- ## TRIGGERS VIAJE
-- ##################################################


-- ##################################################
-- ## TRIGGERS VIAJE_ESTATUS
-- ##################################################

