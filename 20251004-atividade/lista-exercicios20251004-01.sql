-- ATIVIDADE 1 >>>>>>>>
-- Biblioteca - Criar estrutura

-- Caso eu erre algum passo 
drop database dbBiblioteca;

-- 1 Criar banco
create database dbBiblioteca;
use dbBiblioteca;

-- 2 Criar tabelas
create table tbAutor (
    idAutor int auto_increment primary key,
    nomeAutor varchar(100) not null
);

create table tbLivro (
    idLivro int auto_increment primary key,
    tituloLivro varchar(100) not null,
    idAutor int,
    foreign key (idAutor) references tbAutor(idAutor)
);

create table tbEmprestimo (
    idEmprestimo int auto_increment primary key,
    dataEmprestimo date not null,
    nomeLeitor varchar(100) not null,
    idLivro int,
    foreign key (idLivro) references tbLivro(idLivro)
);

-- 3 Inserir dados
insert into tbAutor (nomeAutor) values 
('Machado de Assis'),
('Clarice Lispector'),
('Jorge Amado');

insert into tbLivro (tituloLivro, idAutor) values 
('Dom Casmurro', 1),
('Memórias Póstumas', 1),
('A Hora da Estrela', 2),
('Laços de Família', 2),
('Capitães da Areia', 3);

insert into tbEmprestimo (dataEmprestimo, nomeLeitor, idLivro) values 
('2024-01-10', 'João Silva', 1),
('2024-01-15', 'Maria Santos', 3),
('2024-01-20', 'Pedro Oliveira', 5);

-- 4 Listar autores
select * from tbAutor;

-- 5 Livros por autor
select l.tituloLivro 
from tbLivro l 
inner join tbAutor a on l.idAutor = a.idAutor 
where a.nomeAutor = 'Machado de Assis';

-- 6 Emprestimos completos
select e.dataEmprestimo, e.nomeLeitor, l.tituloLivro, a.nomeAutor
from tbEmprestimo e
inner join tbLivro l on e.idLivro = l.idLivro
inner join tbAutor a on l.idAutor = a.idAutor;

-- 7 Emprestimos por autor
select a.nomeAutor, count(e.idEmprestimo) as total_emprestimos
from tbAutor a
left join tbLivro l on a.idAutor = l.idAutor
left join tbEmprestimo e on l.idLivro = e.idLivro
group by a.idAutor, a.nomeAutor;
