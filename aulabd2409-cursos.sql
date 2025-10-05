-- Criar banco de dados - ok
create database bdEscolar;
-- Habilita o banco de dados - ok
use bdescolar;

-- criação de tabela -ok
create table tbAluno(
raAluno int primary key auto_increment, -- numero inteiro , chave primaria, cadastra automaticamente
nomeAluno varchar(50),
email varchar(100)
);

-- tabela professor - ok

create table tbProfessor(
codProfessor int primary key auto_increment,
nomeProfessor varchar(50)
);

-- tabela notas - ok 
create table tbNotas(
idNota int primary key auto_increment,
raAluno int, -- chave estrangeira
codProfessor int, -- chave estrangeira
nota float, -- numero com casas decimais em bd se usa ponto (.)
faltas int
);

-- Alter table para adicionar as FKs (esse método é melhor) 
ALTER TABLE tbNotas
ADD CONSTRAINT fk_notas_aluno -- constranit relaciona a chave estrangeira usa-se fk e o nome das tabelas relacionadas
FOREIGN KEY (raAluno) REFERENCES tbAluno(raAluno); -- só se relaciona chave estrangeira com a chave primaria correspondente e com tipos iguais

ALTER TABLE tbNotas
ADD CONSTRAINT fk_notas_professor
FOREIGN KEY (codProfessor) REFERENCES tbProfessor(codProfessor);

-- não podemos comecar a adicionar dados na tabela notas antes de prof e aluno
-- não usamos default pq não declaramos ele no parenteses 

-- Alunos
INSERT INTO tbAluno (nomeAluno, email) VALUES
('Ana Silva', 'ana.silva@email.com'),
('Carlos Pereira', 'carlos.pereira@email.com'),
('Mariana Souza', 'mariana.souza@email.com'),
('João Oliveira', 'joao.oliveira@email.com');

-- vereficar se deu certo
-- só é possivel cadastrar notas para os alunos cadastrados (1,2,3,4)
select * from tbAluno;


-- Professores
INSERT INTO tbProfessor (nomeProfessor) VALUES
('Prof. Ricardo'),
('Prof. Fernanda'),
('Prof. Marcos');

-- identificar as tabelas com tb pode ser útil durante a programação
select * from tbProfessor;

-- Notas (relacionando alunos e professores)
INSERT INTO tbNotas (raAluno, codProfessor, nota, faltas) VALUES
(1, 1, 8.5, 2),   -- Ana Silva com Prof. Ricardo
(1, 2, 7.0, 1),   -- Ana Silva com Prof. Fernanda
(2, 1, 6.5, 3),   -- Carlos com Prof. Ricardo
(2, 3, 9.0, 0),   -- Carlos com Prof. Marcos
(3, 2, 8.0, 1),   -- Mariana com Prof. Fernanda
(4, 3, 5.5, 4);   -- João com Prof. Marcos

select * from tbNotas;

-- inner / join

-- 1) Listar todos os alunos ordenados por nome (A→Z)
SELECT raAluno, nomeAluno, email
FROM tbAluno
ORDER BY nomeAluno ASC; -- ASC referece a ordem crescente (se omitir o ASC ele usa a ordem crescente por padrão)

SELECT raAluno, nomeAluno, email
FROM tbAluno
ORDER BY nomeAluno DESC; -- DESC referece a ordem crescente <<<<<<

-- 2) Pesquisar por nome (qualquer parte)
-- LIKE busca por partes do texto
SELECT raAluno, nomeAluno
FROM tbAluno
WHERE nomeAluno LIKE '%ana%';

-- % determina se a palavra vai ser exata ou se esta no começo ou final da palavra
SELECT raAluno, nomeAluno
FROM tbAluno
WHERE nomeAluno LIKE '%j%';

-- 3) Quantidade total de alunos
SELECT COUNT(*) AS qtdeAlunos
FROM tbAluno;

SELECT COUNT(*) AS qtdeProfs
FROM tbProfessor;

SELECT AVG(nota) FROM tbNotas;

SELECT AVG(nota) As mediaNotas FROM tbNotas; -- As Adiciona um nome para o resultado

-- 
SELECT a.nomeAluno, n.nota, n.faltas
FROM tbAluno a -- aqui fizemos uma referencia a tabela aluno (como uma variavel "a")
INNER JOIN tbNotas n ON a.raAluno = n.raAluno; -- pegou a nota onde a chave primaria é igual a chave estrangeira

SELECT a.nomeAluno, n.nota, n.faltas
FROM tbAluno a -- aqui fizemos uma referencia a tabela aluno (como uma variavel "a")
INNER JOIN tbNotas n ON a.raAluno = n.raAluno; -- pegou a nota onde a chave primaria é igual a chave estrangeira

SELECT a.nomeAluno, p.nomeProfessor, n.nota, n.faltas
FROM tbAluno a
INNER JOIN tbNotas n ON a.raAluno = n.raAluno
Inner Join tbProfessor p on p.codProfessor = n.codProfessor;

SELECT a.nomeAluno, p.nomeProfessor, n.nota, n.faltas
FROM tbAluno a
INNER JOIN tbNotas n ON a.raAluno = n.raAluno
Inner Join tbProfessor p on p.codProfessor = n.codProfessor
where a.raAluno = 1;


