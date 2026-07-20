USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'CartorioDB')
BEGIN
    CREATE DATABASE CartorioDB;
    PRINT 'Banco de dados CartorioDB criado com sucesso.';
END
ELSE
BEGIN
    PRINT 'O banco de dados CartorioDB já existe.';
END
GO

USE CartorioDB;
GO
