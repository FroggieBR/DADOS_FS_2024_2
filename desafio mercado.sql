create database desafio;

use desafio;

set sql_safe_updates = 0;
create table funcionarios
(
	id_funcionario int not null,
	primeiro_nome varchar(20) not null,
	sobrenome varchar(20) not null,
	idade int not null,
	salario float,
	sexo char(1) not null,
	primary key(id_funcionario)
 );
 
 create table estoque
 (
	id_estoque int not null,
    frutas varchar(15) not null,
    verduras varchar(15) not null,
    laticinios varchar(25) not null,
    legumes varchar(25) not null,
    frios varchar(25) not null,
    bebidas varchar(25) not null,
    massas varchar(25) not null,
    frutos_do_mar varchar(25) not null,
    guloseimas varchar(30) not null,
    primary key(id_estoque)
);
 
 create table vendas
 (
	id_vendas int not null,
    valor float,
    quantidade int,
    primary key(id_vendas)
 );
 
 alter table vendas
 add column id_estoque int,
 add constraint fk_vendas_estoque
 foreign key(id_estoque)
 references estoque(id_estoque);
 
 create table clientes
 (
	id_clientes int not null,
    primary key(id_clientes)
);
 
 alter table clientes
 add column id_vendas int,
 add constraint fk_clientes_vendas
 foreign key(id_vendas)
 references vendas(id_vendas);
 
 create table venda_estoque
 (
	id_vendas int not null,
    id_estoque int not null,
    quantidade int not null,
    primary key(id_vendas, id_estoque),
    foreign key(id_vendas) references vendas(id_vendas),
    foreign key(id_estoque) references estoque(id_estoque)
);
 
 rename table funcionarios to funcionario ;
 
 insert into funcionarios
 (
	id_funcionario,
    primeiro_nome,
    sobrenome,
    idade,
    sexo,
    departamento
) values
(
	012,
    'Brunno',
    'Mendoça',
    21,
    'M',
    'Produção'
);

insert into estoque
(
	id_estoque,
    guloseimas,
    qntd_guloseimas
) values
(
	61,
    'caixa de chocolate',
    700
);

select * from estoque;

delete from estoque
where id_estoque = 2;

update estoque
set  laticinios = null;
 
ALTER TABLE estoque
ADD COLUMN qntd_guloseimas int;
 
 select * from funcionarios;
 
 update funcionarios
 set sexo = 'M'
 where primeiro_nome = 'Roberto';
 
 alter table estoque
 modify frutas varchar(25);
 
alter table funcionarios
add column salario float;

select * from funcionarios;

# UPDATE DE SALÁRIOS
update funcionarios
set salario = 1400
where id_funcionario = 12;

# SELECT PARA SALARIOS
select salario from funcionarios;

# SELECT COM FUNÇÃO DE CONTAGEM (CONTAR QUANTAS PESSOAS COM MESMO NOME TEM)	
select primeiro_nome, count(id_funcionario) as 'Contagem de Funcionários' from funcionarios group by primeiro_nome;

# SELECT MAIOR SALARIO
select primeiro_nome, max(salario) as "Maior Salário" from funcionarios;

# SELECT MENOR SALARIO
select primeiro_nome, min(salario) as "Menor Salário" from funcionarios;

#SELECT MÉDIA SALARIAL
select primeiro_nome, avg(salario) as "Média Salarial" from funcionarios;