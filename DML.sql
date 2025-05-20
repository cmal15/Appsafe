/*
 * ER/Studio 8.0 SQL Code Generation
 * Company :      FIUNAM
 * Project :      1Equipo-Appsafe.DM1
 * Authors :      Alvarez Lopez Carlos Manuel
				  Membrilla Isaias I�aki Ramos
				  Miram�n P�rez Jocelyn
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
BEFORE INSERT, UPDATE
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

	IF EXISTS(
		SELECT 1
		FROM inserted
		WHERE AÑO < YEAR(GETDATE()-5)
	)
	BEGIN
		RAISERROR('El tiene más de 5 años de antiguedad',16,1);
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
ALTER SCHEMA OPERACIONES TRANSFER dbo.VIAJE;
go
CREATE TRIGGER FechaInicioViaje
ON operaciones.viaje
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @vID BIGINT,
			@iIDStatus varchar(100),
			@dIDStatus varchar(100)
	SELECT @vID= ID_viaje FROM deleted 
	select @iIDStatus=ID_ESTATUS FROM inserted
	select @dIDStatus=ID_ESTATUS FROM deleted
    -- Actualiza solo los viajes que cambiaron a estado 3 (En Curso) falta confirmarlo
	if @iIDStatus='3' and @iIDStatus <> @dIDStatus
		begin
	UPDATE OPERACIONES.VIAJE
    SET FECHA_INICIOVIAJE = GETDATE()
    FROM OPERACIONES.VIAJE
	WHERE ID_VIAJE=@vID
	end
END
GO

-- ##################################################
-- ## TRIGGERS VIAJE_ESTATUS
-- ##################################################

