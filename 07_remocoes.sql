USE CartorioDB;
GO

-- Remover um participante
DELETE FROM Indicador_Pessoal
WHERE Id_Indicador_Pessoal = 2;
GO

-- Remover todos os participantes de um ato
DELETE FROM Indicador_Pessoal
WHERE Numero_do_Ato = '1';
GO

-- Remover um acesso de funcionário a um livro
DELETE FROM Acesso_Funcionario
WHERE Id_Funcionario = 1
AND Id_Livro = 1;
GO

-- Remover uma matrícula
-- (somente após remover os participantes vinculados)
DELETE FROM Matricula
WHERE Id_Matricula = 1;
GO

-- Remover um indicador real
-- (somente se nenhuma matrícula o estiver utilizando)
DELETE FROM Indicador_Real
WHERE Id_Indicador_Real = 1;
GO

-- Remover um livro
DELETE FROM Livro
WHERE Id_Livro = 1;
GO

-- Remover um funcionário
DELETE FROM Funcionario
WHERE Id_Funcionario = 1;
GO