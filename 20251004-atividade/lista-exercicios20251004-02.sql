-- ATIVIDADE 2 >>>>>>>>
-- Clínica - Criar estrutura

-- dropar caso eu erre alguma coisa
drop database dbClinica;

-- 1 Criar banco
create database dbClinica;
use dbClinica;

-- 2 Criar tabelas
create table tbMedico (
    idMedico int auto_increment primary key,
    nomeMedico varchar(100) not null,
    especialidade varchar(100) not null
);

create table tbPaciente (
    idPaciente int auto_increment primary key,
    nomePaciente varchar(100) not null,
    dataNascimento date not null
);

create table tbConsulta (
    idConsulta int auto_increment primary key,
    dataConsulta date not null,
    idMedico int,
    idPaciente int,
    foreign key (idMedico) references tbMedico(idMedico),
    foreign key (idPaciente) references tbPaciente(idPaciente)
);

-- 3 Inserir dados
insert into tbMedico (nomeMedico, especialidade) values 
('Dr. Carlos Silva', 'Cardiologia'),
('Dra. Ana Santos', 'Pediatria'),
('Dr. Paulo Oliveira', 'Ortopedia');

insert into tbPaciente (nomePaciente, dataNascimento) values 
('João Pereira', '1980-05-15'),
('Maria Costa', '1995-08-22'),
('Pedro Alves', '1972-12-03'),
('Ana Rodrigues', '2000-03-10');

insert into tbConsulta (dataConsulta, idMedico, idPaciente) values 
('2024-01-05', 1, 1),
('2024-01-08', 2, 2),
('2024-01-12', 3, 3),
('2024-01-15', 1, 4),
('2024-01-18', 2, 1);

-- 4 Listar médicos
select * from tbMedico;

-- 5 Consultas por paciente
select c.dataConsulta, m.nomeMedico, m.especialidade
from tbConsulta c
inner join tbMedico m on c.idMedico = m.idMedico
inner join tbPaciente p on c.idPaciente = p.idPaciente
where p.nomePaciente = 'João Pereira';

-- 6 Consultas completas
select c.dataConsulta, p.nomePaciente, m.nomeMedico, m.especialidade
from tbConsulta c
inner join tbPaciente p on c.idPaciente = p.idPaciente
inner join tbMedico m on c.idMedico = m.idMedico;

-- 7 Consultas por especialidade
select m.especialidade, count(c.idConsulta) as total_consultas
from tbMedico m
left join tbConsulta c on m.idMedico = c.idMedico
group by m.especialidade;
