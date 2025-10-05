-- criar e utilizar um banco de dados
create database dbLoja;
use dbLoja; 

-- errei algumas vezes então dropei tudo e refiz, 
-- mas entendi que não é recomendavel usar esse comando
drop database dbLoja; 
drop table tbCategoria;
drop table tbProduto;

-- cria tabela categoria 
create table tbCategoria (
idCategoria int primary key auto_increment, -- numero inteiro , chave primaria, cadastra automaticamente
nomeCategoria varchar(150) NOT NULL UNIQUE
);

-- cria tabela produto
create table tbProduto(
idProduto int primary key auto_increment,
nomeProduto varchar(150),
precoProduto float,
idCategoria int
);

-- inserir categorias
INSERT INTO tbCategoria (nomeCategoria) Values
('Eletronicos'),
('Livros'),
('Roupas');


-- Alter table para adicionar as FKs (esse método é melhor) 
ALTER TABLE tbProduto
ADD CONSTRAINT fk_produto_categoria -- relaciona a chave estrangeira usa-se fk e o nome das tabelas relacionadas
FOREIGN KEY (idCategoria) REFERENCES tbCategoria(idCategoria);

-- inserir categorias
INSERT INTO tbProduto (nomeProduto, precoProduto, idCategoria) Values
('Camiseta vermelha', 29.90, 3),
('Smartphone Samsung', 899.99, 1),
('O Capital', 79.80, 2),
('Boina', 49.80, 3),
('Fone de Ouvido Sem Fio', 129.90, 1),
('Veias Abertas da América Latina', 38.75, 2),
('Jaqueta Corta-Vento', 120.00, 3),
('Tablet Android', 450.00, 1),
('Dom Casmurro', 25.40, 2),
('Vestido', 65.30, 3);


-- ATIVIDADE 4 <<<<<<<
-- teste tbCategoria

select * from tbCategoria;

select * from tbProduto;

-- ATIVIDADE 5 <<<<<<<
-- listar uma categoria (livro)

select idProduto, nomeProduto, precoProduto, idCategoria
from tbProduto 
where idCategoria = 2;

-- ATIVIDADE 6 <<<<<<<
-- media de preco produtpos cadastrados

select round(avg(precoProduto),2) as mediaPreco from tbProduto;

-- ATIVIDADE 7 <<<<<<<
-- inner join

select p.nomeProduto, p.precoProduto, c.nomeCategoria
from tbProduto p
inner join tbCategoria c on c.idCategoria = p.idCategoria;

-- ATIVIDADE 8 <<<<<<<
-- media de preco por categoria

select c.nomeCategoria, round(avg(p.precoProduto),2) as mediaPreco 
from tbProduto p
inner join tbCategoria c on c.idCategoria = p.idCategoria
group by p.idCategoria;


