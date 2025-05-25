/*
 * Project :      1Equipo-Appsafe-informes y estadisticas
 * Authors :      Alvarez Lopez Carlos Manuel
				  Membrilla Isaias I�aki Ramos
				  Miramón Pérez Jocelyn
 *
 */

 USE [APPSAFE]
 GO

/*
 * 1. Viajes diarios por conductor; datos del conductor, numero de viajes, monto total, este informe debe poder
 * obtener por un periodo de tiempo
*/

CREATE PROCEDURE OBTENER_DATOS_CONDUCTOR
	@FECHA_INICIO DATE,
	@FECHA_FIN DATE
AS
BEGIN

    WITH VIAJES_POR_CONDUCTOR AS (
        SELECT 
            C.ID_USUARIO,
            COUNT(V.ID_VIAJE) AS NUMERO_DE_VIAJES,
            SUM(V.IMPORTE) AS MONTO
        FROM USUARIOS.CONDUCTOR AS C
        JOIN USUARIOS.AUTOMOVIL AS A ON A.ID_USUARIO = C.ID_USUARIO
        JOIN OPERACIONES.VIAJE AS V ON V.ID_AUTOMOVIL = A.ID_AUTOMOVIL
        WHERE V.FECHA_INICIOVIAJE BETWEEN @FECHA_INICIO AND @FECHA_FIN
        GROUP BY C.ID_USUARIO
    )


    SELECT 
        C.ID_USUARIO, 
        C.DESCRIPCION,
        C.LICENCIA,
        C.VIGENCIA AS VIGENCIA_LICENCIA,
        U.NOMBRE_USUARIO,
        U.NOMBRE,
        U.APELLIDO1 AS PATERNO,
        U.APELLIDO2 AS MATERNO,
        U.CORREO,
        VPC.NUMERO_DE_VIAJES,
        VPC.MONTO
    FROM VIAJES_POR_CONDUCTOR AS VPC
    JOIN USUARIOS.CONDUCTOR AS C ON C.ID_USUARIO = VPC.ID_USUARIO
    JOIN USUARIOS.USUARIO AS U ON U.ID_USUARIO = C.ID_USUARIO;
END;
GO
/*
 * 2. Consolidado mensual; día, monto total, monto mensual
*/



/*
 * 3. Top 5 de conductores por un periodo de tiempo
*/ 

CREATE PROCEDURE OBTENER_TOP_CONDUCTORES
	@FECHA_INICIO DATE,
	@FECHA_FIN DATE
AS
BEGIN
	
	SELECT TOP 5
		C.ID_USUARIO, 
		COUNT(*) AS 'CANTIDAD DE VIAJES'
	FROM USUARIOS.CONDUCTOR AS C
	JOIN USUARIOS.AUTOMOVIL AS A
	ON C.ID_USUARIO=A.ID_USUARIO
	JOIN OPERACIONES.VIAJE AS V
	ON V.ID_AUTOMOVIL=A.ID_AUTOMOVIL
	WHERE V.FECHA_INICIOVIAJE BETWEEN @FECHA_INICIO AND @FECHA_FIN
	GROUP BY C.ID_USUARIO
	ORDER BY COUNT(*) DESC
END;
GO
/*
 * 4. Top 5 de clientes, es decir, los clientes con mayor número de viajes (nombre completo y correo)
*/

CREATE PROCEDURE OBTENER_TOP_CLIENTES
	@FECHA_INICIO DATE,
	@FECHA_FIN DATE
AS
BEGIN
	
	WITH DATOS_CLIENTES AS (
		SELECT
			C.ID_USUARIO,
			COUNT(V.ID_VIAJE) AS NUMERO_DE_VIAJES
		FROM USUARIOS.CLIENTE AS C
		JOIN OPERACIONES.VIAJE AS V
		ON V.ID_USUARIO=C.ID_USUARIO
		WHERE V.FECHA_INICIOVIAJE BETWEEN @FECHA_INICIO AND @FECHA_FIN
		GROUP BY C.ID_USUARIO
	)

	SELECT TOP 5
		DC.ID_USUARIO, 
		DC.NUMERO_DE_VIAJES AS 'NUMERO DE VIAJES',
		U.NOMBRE + ' ' + U.APELLIDO1 + ' ' + U.APELLIDO2 AS 'NOMBRE COMPLETO',
		U.CORREO
	FROM DATOS_CLIENTES AS DC
	JOIN USUARIOS.USUARIO AS U
	ON U.ID_USUARIO=DC.ID_USUARIO
	ORDER BY DC.NUMERO_DE_VIAJES DESC;

END;

/*
 * 5. Listado de conductores con más quejas y motivo (se maneja un catálogo, ejemplo, irrespetuoso, maneja
 * muy rápido, no respeta las reglas de vialidad, etc.)
*/


/*
 * 6. Listado de accidentes; fecha, ubicación, tipo, descripción, heridos si o no, monto gastado, nombre del
 * conductor y auto, si el conductor fue el responsable o no. Con filtros para poder obtener el listado desde un
 * día o un periodo de tiempo.
*/


/*
 * 7. Listado de los clientes con menos estrellas
*/


/*
 * 8. Listado de los conductores con el total que les han dado por cada estrella
*/


/*
 * 9. Listado de autos, placa, número de serie, marca, modelo, año y color y su dueño
*/


/*
 * 10. Listado de quejas incluyendo el conductor y auto, con filtro para obtenerse por un periodo de tiempo o por
 * conductor
*/


