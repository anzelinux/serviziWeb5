--create database webservices;

use webservices;
create table cliente (
  id_cliente smallint AUTO_INCREMENT not null,
  nome varchar(30) not null,
  contatti varchar(30) not null,
  azienda varchar(30) not null,
  primary key (id_cliente));


create table stato (
	id_stato_consulenza smallint not null,
	stato varchar(10),
	primary key(id_stato_consulenza));

create table consulenza (
	id_consulenza int not null AUTO_INCREMENT,
	data_creazione date , 
	check (data_creazione >= '2025-01-01'),
	note varchar(200) null,
	id_stato_consulenza smallint not null,
	id_cliente smallint not null,
	primary key (id_consulenza),
	foreign key(id_stato_consulenza) references stato(id_stato_consulenza),
	foreign key(id_cliente) references cliente(id_cliente)
);

create table servizio (
	id_servizio smallint not null AUTO_INCREMENT,
	nome varchar(50) not null,
	primary key (id_servizio)	

);
