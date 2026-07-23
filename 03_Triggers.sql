USE CartorioDB;
GO

CREATE TRIGGER trg_ImpedeExclusao_Matricula
ON Matricula
INSTEAD OF DELETE
AS
BEGIN
    RAISERROR ('ERRO DE SEGURANÇA: Registros de Matrícula são históricos e NÃO podem ser excluídos do sistema!', 16, 1);
    ROLLBACK TRANSACTION;
END;
GO

CREATE TRIGGER trg_ImpedeExclusao_Livro
ON Livro
INSTEAD OF DELETE
AS
BEGIN
    RAISERROR ('ERRO DE SEGURANÇA: Livros do cartório NÃO podem ser excluídos do sistema!', 16, 1);
    ROLLBACK TRANSACTION;
END;
GO
