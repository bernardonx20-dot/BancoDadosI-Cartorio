USE CartorioDB;
GO

-- Alterar endereço do imóvel
UPDATE Indicador_Real
SET Endereco = 'Rua das Acácias, 150'
WHERE Id_Indicador_Real = 1;
GO

-- Alterar natureza do imóvel
UPDATE Indicador_Real
SET Natureza = 'Rural'
WHERE Id_Indicador_Real = 1;
GO

-- Alterar qualidade de um participante
UPDATE Indicador_Pessoal
SET Qualidade = 'Cedente'
WHERE Id_Indicador_Pessoal = 1;
GO

-- Alterar percentual de participação
UPDATE Indicador_Pessoal
SET Percentual_Participacao = 50.00
WHERE Id_Indicador_Pessoal = 2;
GO

-- Alterar documento de um participante
UPDATE Indicador_Pessoal
SET Documento = '999.888.777-66'
WHERE Id_Indicador_Pessoal = 2;
GO

-- Alterar natureza do ato
UPDATE Indicador_Pessoal
SET Natureza = 'Averbação'
WHERE Numero_do_Ato = '1';
GO

-- Encerrar uma matrícula
UPDATE Matricula
SET Data_Encerramento = GETDATE()
WHERE Id_Matricula = 1;
GO