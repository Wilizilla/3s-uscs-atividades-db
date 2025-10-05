-- ATIVIDADE 3 >>>>>>>>
-- Locadora - Criar estrutura

-- drop em caso de erro
drop database dbLocadora;

-- 1 Criar banco
create database dbLocadora;
use dbLocadora;

-- 2 Criar tabelas
create table tbGenero (
    idGenero int auto_increment primary key,
    nomeGenero varchar(100) not null
);

create table tbFilme (
    idFilme int auto_increment primary key,
    tituloFilme varchar(100) not null,
    anoLancamento int not null,
    idGenero int
);

create table tbAluguel (
    idAluguel int auto_increment primary key,
    dataAluguel date not null,
    nomeCliente varchar(100) not null,
    idFilme int
);

-- 2.1 Adicionar FK
alter table tbFilme
add constraint fk_filme_genero
foreign key (idGenero) references tbGenero(idGenero);

alter table tbAluguel
add constraint fk_aluguel_filme
foreign key (idFilme) references tbFilme(idFilme);

-- 3 Inserir dados
insert into tbGenero (nomeGenero) values 
('Ação'),
('Drama'),
('Comédia');

insert into tbFilme (tituloFilme, anoLancamento, idGenero) values 
('O Protetor', 2014, 1),
('Missão Impossível', 1996, 1),
('Forrest Gump', 1994, 2),
('O Poderoso Chefão', 1972, 2),
('Se Beber, Não Case', 2009, 3);

insert into tbAluguel (dataAluguel, nomeCliente, idFilme) values 
('2024-01-02', 'Carlos Silva', 1),
('2024-01-05', 'Ana Costa', 3),
('2024-01-07', 'Paulo Santos', 2),
('2024-01-10', 'Mariana Oliveira', 5),
('2024-01-12', 'Ricardo Alves', 4);

-- 4 Listar generos
select * from tbGenero;

-- 5 Filmes por genero
select f.tituloFilme, f.anoLancamento
from tbFilme f
inner join tbGenero g on f.idGenero = g.idGenero
where g.nomeGenero = 'Ação';

-- 6 Alugues completos
select a.dataAluguel, a.nomeCliente, f.tituloFilme, f.anoLancamento, g.nomeGenero
from tbAluguel a
inner join tbFilme f on a.idFilme = f.idFilme
inner join tbGenero g on f.idGenero = g.idGenero;

-- 7 Alugueis por gênero
select g.nomeGenero, count(a.idAluguel) as total_alugueis
from tbGenero g
left join tbFilme f on g.idGenero = f.idGenero
left join tbAluguel a on f.idFilme = a.idFilme
group by g.idGenero, g.nomeGenero;