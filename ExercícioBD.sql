-- Questão 01
create database Revisao;

use Revisao;

create table Pais(
id_pais char(3) primary key,
nome_pais varchar(90)
);

create table Autor(
id_autor int primary key,
id_pais char(3),
nome_autor varchar(75)
);

alter table Autor 
add foreign key (id_pais)
references Pais (id_pais)

create table Obra(
id_obra int primary key,
nome_obra varchar(80)
);

create table Autoria(
id_autoria int primary key,
id_obra int,
id_autor int
);

alter table Autoria 
add foreign key (id_obra)
references Obra (id_obra)

alter table Autoria 
add foreign key (id_autor)
references Autor (id_autor)

create table TipoUsuario(
id_tipo_usuario int primary key,
tipo varchar(45)
);

create table Usuario(
id_usuario int primary key,
id_tipo_usuario int,
nome varchar(80),
sexo char(1)
);

alter table Usuario 
add foreign key (id_tipo_usuario)
references TipoUsuario (id_tipo_usuario)

create table Editora(
id_editora int primary key,
nome_editora varchar(80)
);

create table Exemplar(
numero_exemplar int,
id_obra int,
id_editora int,
valor decimal (13,2)
constraint PK_Composta primary key (numero_exemplar, id_obra)
);

alter table Exemplar 
add foreign key (id_editora)
references Editora (id_editora)

create table Emprestimo(
numero_exemplar int,
id_obra int,
id_usuario int,
data_inicio date,
data_fim date not null,
devolucao date
constraint PK_Composta_Emprestimo primary key (numero_exemplar, id_obra, id_usuario,data_inicio)
);

-- Questão 02

insert into Pais values ('CAN', 'Canadá')
insert into Pais values ('POR', 'Portugal')
insert into Pais values	('FRA','França')
insert into Pais values	('BRA','Brasil')
insert into Pais values	('ARG', 'Argentina')

insert into autor values (1, 'CAN', 'Ramez Elmasri')
insert into autor values (2, 'CAN', 'Shamkant B. Navathe')
insert into autor values (3, 'POR', 'Henry F. Kort')
insert into autor values (4, 'FRA', 'Abraham Silberchatz')
insert into autor values (5, 'FRA', 'Valduriez Patrick')
insert into autor values (6, 'BRA', 'Nívio Ziviani')
insert into autor values (7, 'ARG', 'Marcos Viana Villas')

insert into Obra values (1, 'Sistemas de Banco de Dados: Fundamentos e Aplicações')
insert into Obra values (2, 'Sistemas de Banco de Dados')
insert into Obra values (3, 'Princípios de Sistemas de Banco de Dados Distribuídos')
insert into Obra values (4, 'Projeto de Algoritmos com Implementação em C e Pascal')
insert into Obra values (5, 'Estrutura de Dados')

insert into Autoria values (1,1,1)
insert into Autoria values (2,1,2)
insert into Autoria values (3,2,3)
insert into Autoria values (4,3,4)
insert into Autoria values (5,3,5)
insert into Autoria values (6,4,6)
insert into Autoria values (7,5,7)

insert into Editora values ('1', 'LTC')
insert into Editora values ('2', 'Campus')
insert into Editora values ('3', 'FTD')
insert into Editora values ('4', 'Atlas')
insert into Editora values ('5', 'Bookman')


insert into TipoUsuario values ('1', 'Aluno')
insert into TipoUsuario values ('2', 'Professor')
insert into TipoUsuario values ('3', 'Funcionário')

insert into Exemplar values ('1', '1', '1', '99.00')
insert into Exemplar values ('2', '2', '2', '100.00')
insert into Exemplar values ('3', '3', '3', '50.00')
insert into Exemplar values ('4', '4', '4', '45.00')
insert into Exemplar values ('5', '4', '4', '50.00')
insert into Exemplar values ('6', '5', '5', '110.00')
insert into Exemplar values ('7', '5', '5', '110.00')

insert into usuario values ('1', '2', 'Cris dos Santos', 'F')
insert into usuario values ('2', '2', 'Diego Augusto Barros', 'M')
insert into usuario values ('3', '1', 'Marcelo Andrade', 'M')
insert into usuario values ('4', '1', 'Márcio Duarte', 'M')
insert into usuario values ('5', '1', 'Ana Maria Silva', 'F')
insert into usuario values ('6', '1', 'Ana Luiza da Silva', 'F')
insert into usuario values ('7', '1', 'Francisco Diniz', 'F')
insert into usuario values ('8', '1', 'Carlos Rodrigues', 'M')
insert into usuario values ('9', '1', 'Ana Carolina Costa', 'F')
insert into usuario values ('10', '1', 'Francisca Diniz', 'F')
insert into usuario values ('11', '3', 'Maria dos Santos', 'F')
insert into usuario values ('12', '3', 'André Silva', 'M')

insert into Emprestimo values ('1', '1', '1', '10/06/2018', '20/06/2018', '19/06/2018')
insert into Emprestimo values ('1', '1', '1', '10/07/2018', '20/07/2018', '15/07/2018')
insert into Emprestimo values ('1', '2', '1', '12/07/2018', '23/07/2018', NULL)
insert into Emprestimo values ('1', '3', '2', '08/07/2018', '15/07/2018', '16/07/2018')
insert into Emprestimo values ('1', '3', '3', '16/07/2018', '20/07/2018', '22/07/2018')
insert into Emprestimo values ('1', '3', '4', '23/07/2018', '28/07/2018', '25/07/2018')
insert into Emprestimo values ('1', '3', '4', '28/07/2018', '05/08/2018', NULL)
insert into Emprestimo values ('1', '4', '5', '12/07/2018', '19/07/2018', '20/01/2018')
insert into Emprestimo values ('2', '4', '6', '20/07/2018', '28/07/2018', NULL)
insert into Emprestimo values ('3', '5', '7', '20/07/2018', '28/07/2018', '28/01/2018')

-- Questão 03
select nome_pais, id_pais from Pais where id_pais = 'POR'

-- Questão 04
select id_usuario, nome from usuario where sexo = 'F'

-- Questão 05
select id_usuario, nome from usuario where sexo = 'M'

-- Questão 06
select id_usuario, nome from usuario where nome not like '%Ana%'

-- Questão 07
select id_usuario, nome from usuario where nome like '%dos Santos%'

-- Questão 08
select id_usuario, nome from usuario where id_usuario in
(select id_usuario from Emprestimo where id_usuario <> 0)

-- Questão 09
select id_autor, nome_autor from Autor where id_pais in 
(select id_pais from Pais where id_pais = 'CAN') 

-- Questão 10
select id_usuario, nome from usuario where id_usuario in
(select id_usuario from Emprestimo where devolucao is not null)

-- Questao 11 e Questão 16
select u.id_usuario as 'Usuário', u.nome as 'Nome do usuário', b.devolucao as 'Data de devolução' from usuario as u
join Emprestimo as b on b.id_usuario = u.id_usuario where devolucao is not null

-- Questão 12
select g.nome_editora as 'Nome da Editora', d.nome_obra as 'Nome da obra' from Obra as d
join Editora as g on g.id_editora = d.id_obra

-- Questão 13
select g.nome_editora as 'Nome da Editora', d.nome_autor as 'Nome do Autor' from Editora as g
join Autor as d on d.id_autor = g.id_editora

-- Questão 14
select g.nome_pais as 'Nome do País', d.nome_obra as 'Nome das obras' from Pais as g
join Obra as d on d.id_obra = g.id_pais 

-- Questão 15
select d.id_usuario as 'Usuário', d.nome as 'Nome do usuário' from usuario as d
join Emprestimo as u on u.id_usuario = d.id_usuario where devolucao is null

--Questão 17
select g.nome_editora as 'Nome da editora', d.nome_obra as 'Nome da obra' from Editora as g
inner join Obra as d on d.id_obra = g.id_editora

--Questão 18
select g.id_obra as 'ID Obra', g.nome_obra as 'Nome das Obras', b.nome_autor as 'Nome do Autor', e.valor as 'Valor' from Obra as g
inner join Autor as b on b.id_autor = g.id_obra
inner join Exemplar as e on e.numero_exemplar = g.id_obra

-- Questão 19
select g.id_obra as 'ID Obra', g.nome_obra as 'Nome da Obra' from Obra as g
inner join Exemplar as e on e.numero_exemplar = g.id_obra where e.valor < 100

-- Questão 20
select b.id_usuario as 'ID Usuario', b.nome as 'Nome Do Usuario', e.tipo as 'Descrição do usuario' from usuario as b
inner join TipoUsuario as e on e.id_tipo_usuario = b.id_usuario

-- Questão 21
select g.nome_autor as 'Nome do Autor', d.nome_obra as 'Nome da Obra' from Autor as g 
inner join Obra as d on d.id_obra = g.id_autor 
inner join Pais as p on p.id_pais = g.id_autor where p.id_pais = 'BRA'


-- Questão 22
create view UsuarioView as select * from usuario as b

select * from UsuarioView

-- Questão 23
create view UsuarioFemininoView as select * from usuario where sexo = 'F'

select * from UsuarioFemininoView

-- Questão 24
create view ProfessoresView as select * from usuario as c where id_tipo_usuario = '2'

select * from ProfessoresView

--Questão 25
create view DevedoresView as select c.id_usuario as 'ID usuario', c.nome as 'Nome do usuario', b.valor as 'Valor do Exemplar' from usuario as c
join Exemplar as b on b.numero_exemplar = c.id_usuario
join Emprestimo as e on e.id_usuario = c.id_usuario  where devolucao is null

select * from DevedoresView

