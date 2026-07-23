USE CartorioDB;
GO



INSERT INTO Funcionario (Nome)
VALUES
('João Silva'),
('Maria Oliveira'),
('Carlos Souza');
GO


INSERT INTO Livro (Tipo_Livro, Faixa_Matricula)
VALUES
('Livro 2 - Registro Geral', '1 a 500'),
('Livro 3 - Registro Auxiliar', '501 a 1000');
GO


INSERT INTO Acesso_Funcionario (Id_Funcionario, Id_Livro)
VALUES
(1,1),
(2,1),
(2,2),
(3,2);
GO



INSERT INTO Indicador_Real
(Endereco, Area, Tipo_Imovel, Qualidade, Natureza)
VALUES
('Rua das Flores, 100', '250 m²', 'Casa', 'Urbano', 'Registro'),
('Av. Brasil, 500', '600 m²', 'Terreno', 'Urbano', 'Averbação');
GO



INSERT INTO Matricula
(Numero_Matricula, Id_Livro, Id_Indicador_Real)
VALUES
('MAT0001', 1, 1),
('MAT0002', 2, 2);
GO




INSERT INTO Indicador_Pessoal
(Nome_Participante, Percentual_Participacao, Qualidade,
Documento, Numero_do_Ato, Natureza, Id_Matricula)
VALUES
('Igor Augusto',100.00,'Transmitente',
'123.456.789-00','1','Registro',1),

('Anderson Andrade',100.00,'Adquirente',
'111.222.333-44','1','Registro',1);


INSERT INTO Indicador_Pessoal
(Nome_Participante, Percentual_Participacao, Qualidade,
Documento, Numero_do_Ato, Natureza, Id_Matricula)
VALUES
('José Pereira',50.00,'Transmitente',
'222.333.444-55','2','Averbação',2),

('Ana Pereira',50.00,'Transmitente',
'333.444.555-66','2','Averbação',2),

('Pedro Santos',100.00,'Adquirente',
'444.555.666-77','2','Averbação',2);
GO
