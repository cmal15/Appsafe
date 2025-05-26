/*
 * Project :      1Equipo-Appsafe-informes y estadisticas
 * Authors :      Alvarez Lopez Carlos Manuel
				  Membrilla Isaias I�aki Ramos
				  Miramón Pérez Jocelyn
 *
 */
use APPSAFE
go

-- se crea el login usuarioconsulta
create login [usuarioConsulta] with password = N'1234zaq*',
	default_database = [APPSAFE],
	check_expiration = OFF,
	check_policy = OFF
go

create login [usuarioAdmin] with password = N'1234zaq*',
	default_database = [APPSAFE],
	check_expiration = OFF,
	check_policy = OFF
go

CREATE USER [usuarioConsulta] FOR LOGIN [usuarioConsulta];
GO

CREATE USER [usuarioAdmin] FOR LOGIN [usuarioAdmin];
GO

-- se agrega ese usuario al rol para que pueda crear otros usuarios
EXEC master..sp_addsrvrolemember 
    @loginame = N'usuarioAdmin',
    @rolename = N'securityadmin';
GO

ALTER ROLE db_datareader ADD MEMBER [usuarioConsulta];
GO

ALTER ROLE db_datareader ADD MEMBER usuarioConsulta;


GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::[OPERACIONES] TO [usuarioAdmin];
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::[REGISTROS] TO [usuarioAdmin];
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::[CATALOGOS] TO [usuarioAdmin];
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::[USUARIOS] TO [usuarioAdmin];
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::[INCIDENCIAS] TO [usuarioAdmin];
GO

USE APPSAFE;
GO
-- ========================
-- Permisos efectivos sobre esquemas
-- ========================
PRINT '>>> Permisos efectivos sobre esquema OPERACIONES';
EXECUTE AS USER = 'usuarioConsulta';
SELECT 'usuarioConsulta' AS Usuario, * FROM fn_my_permissions('USUARIOS', 'SCHEMA');
REVERT;
GO

EXECUTE AS USER = 'usuarioAdmin';
SELECT 'usuarioAdmin' AS Usuario, * FROM fn_my_permissions('USUARIOS', 'SCHEMA');
REVERT;
GO

EXECUTE AS USER = 'usuarioConsulta';
SELECT 'usuarioConsulta' AS Usuario, * FROM fn_my_permissions('CATALOGOS', 'SCHEMA');
REVERT;
GO

EXECUTE AS USER = 'usuarioAdmin';
SELECT 'usuarioAdmin' AS Usuario, * FROM fn_my_permissions('CATALOGOS', 'SCHEMA');
REVERT;
GO

EXECUTE AS USER = 'usuarioConsulta';
SELECT 'usuarioConsulta' AS Usuario, * FROM fn_my_permissions('OPERACIONES', 'SCHEMA');
REVERT;
GO

EXECUTE AS USER = 'usuarioAdmin';
SELECT 'usuarioAdmin' AS Usuario, * FROM fn_my_permissions('OPERACIONES', 'SCHEMA');
REVERT;
GO

EXECUTE AS USER = 'usuarioConsulta';
SELECT 'usuarioConsulta' AS Usuario, * FROM fn_my_permissions('INCIDENCIAS', 'SCHEMA');
REVERT;
GO

EXECUTE AS USER = 'usuarioAdmin';
SELECT 'usuarioAdmin' AS Usuario, * FROM fn_my_permissions('INCIDENCIAS', 'SCHEMA');
REVERT;
GO

EXECUTE AS USER = 'usuarioConsulta';
SELECT 'usuarioConsulta' AS Usuario, * FROM fn_my_permissions('REGISTROS', 'SCHEMA');
REVERT;
GO

EXECUTE AS USER = 'usuarioAdmin';
SELECT 'usuarioAdmin' AS Usuario, * FROM fn_my_permissions('REGISTROS', 'SCHEMA');
REVERT;
GO

-- ========================
-- 4. Roles de servidor (solo desde master)
-- ========================
PRINT '>>> Roles de servidor';
USE master;
SELECT 
    sp.name AS LoginName,
    spr.name AS RolServidor
FROM sys.server_role_members srm
JOIN sys.server_principals sp ON srm.member_principal_id = sp.principal_id
JOIN sys.server_principals spr ON srm.role_principal_id = spr.principal_id
WHERE sp.name IN ('usuarioConsulta', 'usuarioAdmin');
GO