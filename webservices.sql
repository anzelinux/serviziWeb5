--create database webservices;

use webservices;
create table cliente (
  id_cliente smallint AUTO_INCREMENT not null,
  nome varchar(30) not null,
  contatti varchar(30) not null,
  azienda varchar(30) not null,
  primary key (id_cliente));
