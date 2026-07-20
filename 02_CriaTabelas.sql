USE CartorioDB;
GO

CREATE TABLE Funcionario(
    Id_Funcionario INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(150) NOT NULL,
    
);
GO

CREATE TABLE Livro(
    Id_Livro INT IDENTITY(1,1) PRIMARY KEY,
    Tipo_Livro VARCHAR(100) NOT NULL,
    Data_Abertura DATETIME DEFAULT GETDATE() NOT NULL,
    Faixa_matricula VARCHAR(50) NOT NULL,
);
GO

CREATE TABLE Acesso_Funcionario(
    Id_Funcionario INT NOT NULL,
    Id_Livro INT NOT NULL,

    PRIMARY KEY (Id_Funcionario, Id_Livro),
    FOREIGN KEY (Id_Funcionario) REFERENCES Funcionario(Id_Funcionario),
    FOREIGN KEY (Id_Livro) REFERENCES Livro(Id_Livro)
);
GO

CREATE TABLE Indicador_Real(
    Id_Indicador_Real INT IDENTITY(1,1) PRIMARY KEY,
    Endereco VARCHAR(200) NOT NULL,
    Area VARCHAR (50) NOT NULL,
    TIPO_Imovel VARCHAR (20) NOT NULL,
    Qualidade VARCHAR(50)
);
GO

CREATE TABLE Matricula(
    Id_Matricula INT IDENTITY(1,1) PRIMARY KEY,
    Data_abertura DATETIME DEFAULT GETDATE() NOT NULL,
    Data_Encerramento DATETIME DEFAULT NULL,
    Numero_Matricula VARCHAR(50) NOT NULL UNIQUE,
    Imagem VARBINARY(MAX) NULL,

    Id_Livro INT NOT NULL,
    Id_Indicador_Real INT NOT NULL,
    
    FOREIGN KEY (Id_Livro) REFERENCES Livro(Id_Livro),
    FOREIGN KEY (Id_Indicador_Real) REFERENCES Indicador_Real(Id_Indicador_Real)
);
GO

CREATE TABLE Indicador_Pessoal(
    Id_Indicador_Pessoal INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Participante VARCHAR(150) NOT NULL,
    Percentual_Participacao DECIMAL(5,2),
    Tipo_de_Ato VARCHAR(100),
    Qualidade VARCHAR(50),
    Documento VARCHAR(50),
    Numero_do_Ato VARCHAR(50),
    
    Id_Matricula INT NOT NULL,
    FOREIGN KEY (Id_Matricula) REFERENCES Matricula(Id_Matricula)
);
GO
