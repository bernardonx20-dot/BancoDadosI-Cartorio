USE CartorioDB;
GO

-- 1. Listar todas as matrículas com o imóvel
SELECT
    M.Id_Matricula,
    M.Numero_Matricula,
    L.Tipo_Livro,
    IR.Endereco,
    IR.Tipo_Imovel,
    IR.Area,
    IR.Qualidade,
    IR.Natureza
FROM Matricula M
INNER JOIN Livro L
    ON M.Id_Livro = L.Id_Livro
INNER JOIN Indicador_Real IR
    ON M.Id_Indicador_Real = IR.Id_Indicador_Real;
GO

-- 2. Listar todos os participantes de cada matrícula
SELECT
    M.Numero_Matricula,
    IP.Numero_do_Ato,
    IP.Natureza,
    IP.Nome_Participante,
    IP.Qualidade,
    IP.Documento,
    IP.Percentual_Participacao
FROM Indicador_Pessoal IP
INNER JOIN Matricula M
    ON IP.Id_Matricula = M.Id_Matricula
ORDER BY M.Numero_Matricula, IP.Numero_do_Ato;
GO

-- 3. Consultar participantes de uma matrícula específica
SELECT
    Nome_Participante,
    Qualidade,
    Documento,
    Percentual_Participacao,
    Numero_do_Ato,
    Natureza
FROM Indicador_Pessoal
WHERE Id_Matricula = 1;
GO

-- 4. Consultar todos os participantes de um ato
SELECT *
FROM Indicador_Pessoal
WHERE Numero_do_Ato = '1';
GO

-- 5. Funcionários com acesso aos livros
SELECT
    F.Nome,
    L.Tipo_Livro
FROM Acesso_Funcionario AF
INNER JOIN Funcionario F
    ON AF.Id_Funcionario = F.Id_Funcionario
INNER JOIN Livro L
    ON AF.Id_Livro = L.Id_Livro;
GO

-- 6. Quantidade de participantes por matrícula
SELECT
    M.Numero_Matricula,
    COUNT(IP.Id_Indicador_Pessoal) AS TotalParticipantes
FROM Matricula M
LEFT JOIN Indicador_Pessoal IP
    ON M.Id_Matricula = IP.Id_Matricula
GROUP BY M.Numero_Matricula;
GO
