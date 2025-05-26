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

 USE [APPSAFE]
 GO
-- ##################################################
-- ## TRIGGERS VIAJE_ESTATUS
-- ##################################################


-- ##################################################
-- ## TRIGGERS ACCIDENTE
-- ##################################################

--TODO FOR DELETE: VIAJE-ACCIDENTE

-- ##################################################
-- ## TRIGGERS ADMINISTRADOR
-- ##################################################

--TODO FOR DELETE: QUEJA

-- ##################################################
-- ## TRIGGERS AUTOMOVIL
-- ##################################################

CREATE OR ALTER TRIGGER USUARIOS.TR_AUTO_FOR1
ON USUARIOS.AUTOMOVIL
FOR INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS(
		SELECT I.ID_USUARIO
		FROM inserted AS I
		JOIN USUARIOS.AUTOMOVIL AS A
		ON I.ID_USUARIO=A.ID_USUARIO
		GROUP BY I.ID_USUARIO
		HAVING COUNT(A.ID_USUARIO)>2
	)
	BEGIN
		RAISERROR('El maximo de automoviles por conductor es 2',16,1);
		ROLLBACK TRANSACTION;
	END

	IF EXISTS(
		SELECT 1
		FROM inserted
		WHERE AÑO < YEAR(DATEADD(YEAR,-5,GETDATE()))
	)
	BEGIN
		RAISERROR('El automóvil tiene más de 5 años de antigüedad',16,1);
		ROLLBACK TRANSACTION;
	END

IF UPDATE(DISPONIBLE)
    BEGIN

        IF EXISTS (
            SELECT I.ID_USUARIO
            FROM inserted I
            WHERE I.DISPONIBLE = 1
            GROUP BY I.ID_USUARIO
            HAVING COUNT(*) >= 1 AND EXISTS (
                SELECT 1
                FROM USUARIOS.AUTOMOVIL A
                WHERE A.ID_USUARIO = I.ID_USUARIO
                  AND A.DISPONIBLE = 1
                  AND A.ID_AUTOMOVIL NOT IN (SELECT ID_AUTOMOVIL FROM inserted)
            )
        )
        BEGIN
            RAISERROR('Un usuario ya tiene un automóvil disponible.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END


        IF EXISTS (
            SELECT ID_USUARIO
            FROM inserted
            WHERE DISPONIBLE = 1
            GROUP BY ID_USUARIO
            HAVING COUNT(*) > 1
        )
        BEGIN
            RAISERROR('No se pueden establecer múltiples autos disponibles para el mismo usuario en la misma operación.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END
    END
END;
GO

CREATE OR ALTER TRIGGER USUARIOS.TR_AUTO_DISPONIBLE
ON USUARIOS.AUTOMOVIL
AFTER INSERT
AS
BEGIN
    UPDATE A
    SET A.DISPONIBLE = 0
    FROM USUARIOS.AUTOMOVIL A
    JOIN inserted I ON A.ID_AUTOMOVIL = I.ID_AUTOMOVIL;
END;
GO

-- TODO FOR DELETE: VIAJE
-- TODO FOR UPDATE: VIAJE

-- TODO FOR DELETE: FACTURA, TARJETA, VIAJE
-- TODO FOR UPDATE: VIAJE
CREATE OR ALTER TRIGGER OPERACIONES.UPDATE_VIAJE
ON OPERACIONES.VIAJE
FOR UPDATE
AS
	BEGIN
	IF UPDATE(ID_AUTOMOVIL)
		BEGIN
		IF EXISTS(SELECT ID_AUTOMOVIL 
					FROM USUARIOS.AUTOMOVIL 
					WHERE ID_AUTOMOVIL 
					IN (SELECT ID_AUTOMOVIL FROM inserted) AND DISPONIBLE= 0 )
		BEGIN
		RAISERROR('El automóvil asignado no está disponible.', 16, 1);
		ROLLBACK TRAN
		END
		END
	ELSE IF UPDATE(ID_ESTATUS)
		BEGIN
        UPDATE a
        SET a.DISPONIBLE = 1
        FROM inserted i
        JOIN USUARIOS.AUTOMOVIL a ON i.ID_AUTOMOVIL = a.ID_AUTOMOVIL
        WHERE i.ID_ESTATUS = 5;
    END

	END;
GO
-- ##################################################
-- ## TRIGGERS CONDUCTOR
-- ##################################################

-- TODO FOR DELETE: AUTOMOVIL

-- ##################################################
-- ## TRIGGERS VIAJE_ESTATUS
-- ##################################################


-- ##################################################
-- ## TRIGGERS FACTURA
-- ##################################################

-- TODO FOR UPDATE: VIAJE

-- ##################################################
-- ## TRIGGERS PAGO
-- ##################################################

CREATE OR ALTER TRIGGER OPERACIONES.TR_PAGO_INOF1
ON OPERACIONES.PAGO
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validación 1: verificar si ya existe un pago en la misma semana para el mismo usuario
    IF EXISTS (
        SELECT 1
        FROM inserted I
        JOIN OPERACIONES.PAGO P
            ON I.ID_USUARIO = P.ID_USUARIO
            AND DATEPART(YEAR, I.FECHA) = DATEPART(YEAR, P.FECHA)
            AND DATEPART(ISOWK, I.FECHA) = DATEPART(ISOWK, P.FECHA)
    )
    BEGIN
        RAISERROR('Ya existe un pago para este usuario en la semana especificada (tabla existente)', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Validación 2: evitar que en el mismo lote de insert se hagan múltiples pagos en la misma semana
    IF EXISTS (
        SELECT I1.ID_USUARIO, DATEPART(YEAR, I1.FECHA) AS Y, DATEPART(ISOWK, I1.FECHA) AS W
        FROM inserted I1
        GROUP BY I1.ID_USUARIO, DATEPART(YEAR, I1.FECHA), DATEPART(ISOWK, I1.FECHA)
        HAVING COUNT(*) > 1
    )
    BEGIN
        RAISERROR('No se permiten múltiples pagos para el mismo usuario en la misma semana (lote)', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Inserción FOLIO autogenerado
    INSERT INTO OPERACIONES.PAGO(ID_USUARIO, FOLIO, MONTO, FECHA)
    SELECT 
        I.ID_USUARIO,
        RIGHT('00000000' + CAST(ISNULL(MAX(CAST(P.FOLIO AS INT)), 0) + ROW_NUMBER() OVER (PARTITION BY I.ID_USUARIO ORDER BY I.FECHA) AS VARCHAR(8)), 8),
        I.MONTO,
        I.FECHA
    FROM inserted I
    LEFT JOIN OPERACIONES.PAGO P ON I.ID_USUARIO = P.ID_USUARIO
    GROUP BY I.ID_USUARIO, I.MONTO, I.FECHA;
END;
GO

-- ##################################################
-- ## TRIGGERS QUEJA
-- ##################################################


-- ##################################################
-- ## TRIGGERS REGISTRO_UBICACION
-- ##################################################

CREATE OR ALTER TRIGGER REGISTROS.TR_REGISTRO_UBICACION
ON REGISTROS.REGISTRO_UBICACION
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN OPERACIONES.VIAJE v ON v.ID_VIAJE = i.ID_VIAJE
        WHERE v.ID_ESTATUS <> 4
        OR EXISTS (
            SELECT 1
            FROM REGISTROS.REGISTRO_UBICACION r
            WHERE r.ID_VIAJE = i.ID_VIAJE
              AND r.ID_REGISTRO_UBICACION <> i.ID_REGISTRO_UBICACION
              AND ABS(DATEDIFF(SECOND, r.Hora, i.Hora)) < 60
        )
    )
    BEGIN
        RAISERROR(
            'No se puede insertar un nuevo registro de ubicación con menos de 1 minuto de diferencia respecto al anterior (estatus del viaje distinto de 4).',
            16, 1
        );
        ROLLBACK TRANSACTION;
    END
END;
GO

-- ##################################################
-- ## TRIGGERS TARJETA
-- ##################################################

CREATE OR ALTER TRIGGER USUARIOS.TR_TARJETA_FOR1
ON USUARIOS.TARJETA
FOR INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS(
		SELECT I.ID_USUARIO
		FROM inserted AS I
		JOIN USUARIOS.TARJETA AS T
		ON I.ID_USUARIO=T.ID_USUARIO
		GROUP BY I.ID_USUARIO
		HAVING COUNT(T.ID_TARJETA)>3
	)
	BEGIN 
		RAISERROR('Se excedio el número maximo de tarjetas permitidas', 16,1);
		ROLLBACK TRANSACTION;
	END

END;
GO

-- TODO FOR UPDATE: VIAJE

-- ##################################################
-- ## TRIGGERS TELEFONO
-- ##################################################


-- ##################################################
-- ## TRIGGERS USUARIO
-- ##################################################

-- TODO FOR DELETE: DESCUENTO_USUARIO_VIAJE, USUARIO_RECOMENDANTE
-- TODO FOR UPDATE: USUARIO_RECOMENDANTE

-- ##################################################
-- ## TRIGGERS VIAJE
-- ##################################################

CREATE OR ALTER TRIGGER OPERACIONES.FechaInicioViaje
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
END;
GO

CREATE OR ALTER TRIGGER OPERACIONES.TR_VIAJE_HORA
ON OPERACIONES.VIAJE
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT ID_VIAJE 
        FROM inserted
        WHERE FECHA_INICIOVIAJE > DATEADD(HOUR, 2, GETDATE())
    )
    BEGIN
        RAISERROR('Operación no permitida: el inicio del viaje tiene más de dos horas.',16,1);
        ROLLBACK TRANSACTION;
    END
END;
GO

--1'SOLICITADO',2'PROGRAMADO',3'CONFIRMADO',4'EN CURSO', 5'TERMINADO', 6'POR COBRAR',7 'PAGADO',8 'CON ADEUDO',9 'CANCELADO'
CREATE OR ALTER TRIGGER OPERACIONES.TR_VIAJE_CAMBIO_ESTATUS
   ON OPERACIONES.VIAJE
   AFTER UPDATE
AS
BEGIN
    IF UPDATE(ID_ESTATUS)
    BEGIN
        IF EXISTS (
			SELECT 1
			FROM deleted D
			JOIN inserted I
			ON I.ID_VIAJE = D.ID_VIAJE
			WHERE I.ID_ESTATUS <> D.ID_ESTATUS
				AND (
                    (D.ID_ESTATUS = 1 AND I.ID_ESTATUS NOT IN (3, 9)) OR
                    (D.ID_ESTATUS = 2 AND I.ID_ESTATUS NOT IN (3, 9)) OR
                    (D.ID_ESTATUS = 3 AND I.ID_ESTATUS NOT IN (4, 9)) OR
                    (D.ID_ESTATUS = 4 AND I.ID_ESTATUS NOT IN (6, 9)) OR
                    (D.ID_ESTATUS = 5 AND I.ID_ESTATUS <> 5)      OR
                    (D.ID_ESTATUS = 6 AND I.ID_ESTATUS NOT IN (7, 8)) OR
                    (D.ID_ESTATUS IN (7,8,9) AND I.ID_ESTATUS NOT IN (5))
                )
		)
        BEGIN
            RAISERROR('Transición de estatus de viaje incorrecta', 16, 1);
            ROLLBACK TRANSACTION;
        END

        INSERT INTO REGISTROS.VIAJE_ESTATUS (ID_VIAJE, ID_ESTATUS, FECHA_HORA)
        SELECT I.ID_VIAJE, I.ID_ESTATUS, GETDATE()
        FROM inserted I

    END
END
GO

CREATE OR ALTER TRIGGER OPERACIONES.TR_VIAJE_ESTATUS_INICIAL
ON OPERACIONES.VIAJE
FOR INSERT
AS
BEGIN

	IF EXISTS(
		SELECT 1
		FROM inserted I
		WHERE I.ID_ESTATUS NOT IN (1,2)
	)
	BEGIN
		RAISERROR('Solo se permiten los estatus PROGRAMADO (1) o SOLICITADO (2) como estado inicial del viaje',16,1)
		ROLLBACK TRANSACTION
	END

	INSERT INTO REGISTROS.VIAJE_ESTATUS (ID_VIAJE, ID_ESTATUS, FECHA_HORA)
    SELECT I.ID_VIAJE, I.ID_ESTATUS, GETDATE()
    FROM inserted I

	UPDATE V
    SET ID_AUTOMOVIL = NULL
    FROM OPERACIONES.VIAJE V
    JOIN inserted I ON V.ID_VIAJE = I.ID_VIAJE;

END
GO
-- TODO FOR DELETE: ACCIDENTE, QUEJA

-- ##################################################
-- ## TRIGGERS VIAJE_ESTATUS
-- ##################################################



-- ##################################################
-- ## TRIGGERS CATALOGO_ACCIDENTES
-- ##################################################

--TODO FOR DELETE: ACCIDENTE


-- ##################################################
-- ## TRIGGERS MODELO
-- ##################################################

-- TODO FOR DELETE: AUTOMOVIL

-- ##################################################
-- ## TRIGGERS DESCUENTO
-- ##################################################

-- TODO FOR DELETE: DESCUENTO_USUARIO_VIAJE


-- ##################################################
-- ## TRIGGERS CATALOGO_QUEJAS
-- ##################################################

-- TODO FOR DELETE: QUEJA

-- ##################################################
-- ## TRIGGERS BANCO
-- ##################################################

-- TODO FOR DELETE: TARJETA

-- ##################################################
-- ## TRIGGERS ESTATUS
-- ##################################################

-- TODO FOR DELETE: VIAJE_ESTATUS, VIAJE

-- ##################################################
-- ## TRIGGERS DESCUENTO_USUARIO_VIAJE
-- ##################################################

-- TODO FOR DELETE: VIAJE
-- TODO FOR UPDATE: VIAJE
