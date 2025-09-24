-- criar banco de dados
CREATE DATABASE dbCursos;
Use dbCursos;

-- tabela alunos

CREATE TABLE Alunos (
idAluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- tabela professores

CREATE TABLE Professores(
idProfessor INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100) NOT NULL
);

-- tabela cursos

CREATE TABLE Cursos(
	idCurso INT NOT NULL  AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargaHoraria INT NOT NULL,
    idProfessor INT references Professores(idProfessor)
);

-- tabela Matriculas

CREATE TABLE Matriculas(
idMatricula INT AUTO_INCREMENT PRIMARY KEY,
 idAluno INT NOT NULL,
 idCurso INT NOT NULL,
 dataMatticula DATE DEFAULT (CURRENT_DATE)
);

-- agora adicionando as  FKs com ALTER TABLES

ALTER TABLE Matriculas
	ADD CONSTRAINT fk_matruculas_alunos FOREIGN KEY (idAluno) REFERENCES Alunos(idAluno);
    

-- inserindo alunos

INSERT INTO Alunos (nome, email) VALUES
('Ana Silva', 'ana.silva@gmail.com'),
('Carlos Souza', 'carlos.souzaa@gmail.com'),
('MAriana Lima', 'mariana.lima@gmail.com');


-- inserindo professores

INSERT INTO Professores (nome, especialidade) VALUES
('João Mendes', 'Banco de dados'),
('Fernanda Costa', 'Programação');

-- inserindo cursos

INSERT INTO Cursos (nome, cargaHoraria, idProfessor) VALUES
('SQL Completo', 40, 1),
('HTML e CSS', 30, 2),
('JavaScript Avançado', 50, 2);

-- inserindo matriculas

INSERT INTO Matriculas (idAluno, idCurso) VALUES
(1,1), -- Ana Silva (SQL completo)
(1,2), -- Ana Silva (HTML e CSS)
(2,1), -- Carlos Souza (SQL completo)
(3,3); -- Maria Lima (JavaScript Avançado)

-- select todos alunos
SELECT * FROM Alunos;

-- Lista de alunos e seus cursos
SELECT	
    Alunos.nome AS NomeAluno,
    Cursos.nome AS NomeCursos
FROM Matriculas
INNER JOIN Alunos  ON Matriculas.idAluno = Alunos.idAluno
INNER JOIN Cursos  ON Matriculas.idCurso = Cursos.idCurso; 

-- Lista de alunos, cursos e professores
SELECT	
    Alunos.nome AS NomeAluno,
    Cursos.nome AS NomeCursos,
    Professores.nome AS NomeProfessor
FROM Matriculas
INNER JOIN Alunos  ON Matriculas.idAluno = Alunos.idAluno
INNER JOIN Cursos  ON Matriculas.idCurso = Cursos.idCurso
INNER JOIN Professores  ON Cursos.idProfessor = Professores.idProfessor; 