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

create table contratto (
	id_contratto smallint not null AUTO_INCREMENT,
	data_inizio date not null,
	check (data_inizio>= '2025-01-01'),
	data_fine date null,
	id_servizio smallint,
	id_consulenza int not null,

	primary key (id_contratto),
	foreign key (id_consulenza) references consulenza(id_consulenza),
	foreign key (id_servizio) references servizio (id_servizio)

);

CREATE TABLE fattura (
    id_fattura smallint NOT NULL AUTO_INCREMENT,
    importo DECIMAL(5,2) NOT NULL,
    data_emissione DATE NOT NULL,
    CHECK (data_emissione >= '2025-01-01'),
    id_consulenza int NULL,
    id_contratto smallint NULL,
    PRIMARY KEY (id_fattura),
    FOREIGN KEY (id_consulenza) REFERENCES consulenza(id_consulenza),
    FOREIGN KEY (id_contratto) REFERENCES contratto(id_contratto)
);

create table saldo (	
	id_saldo smallint not null,
	descrizione varchar(9) not null,
	primary key (id_saldo)
	);

create table modalita_pagamento (
	id_modalita smallint not null,
	tipo_pagamento varchar(9) not null,
	primary key (id_modalita)
	);

create table pagamento (
	id_pagamento smallint not null AUTO_INCREMENT,
	data_pagamento date not null,
	check (data_pagamento >= '2005-01-01'),
	importo_pagato decimal(6,2) not null,
	id_fattura smallint not null,
	id_modalita smallint not null,
	id_saldo smallint not null,
	primary key (id_pagamento),
	foreign key (id_fattura) references fattura(id_fattura),	
	foreign key (id_modalita) references modalita_pagamento(id_modalita),	
	foreign key (id_saldo) references saldo(id_saldo)
);
