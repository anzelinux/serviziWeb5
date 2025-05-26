create database webservices;

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

-- inserimento dati

INSERT INTO cliente (nome, contatti, azienda) VALUES 
('Gavino Piras', 'gavino@email.com', 'Agricola Sarda'),
('Francesca Mura', 'francesca@email.com', 'SardiniaWeb'),
('Antonio Cossu', 'antonio@email.com', 'Artigianato Nuorese'),
('Maria Dessì', 'maria@email.com', 'Sarda Consulting'),
('Salvatore Fadda', 'salvatore@email.com', 'Cannonau Import'),
('Elisa Lai', 'elisa@email.com', 'Turismo Sardegna'),
('Giuseppe Meloni', 'giuseppe@email.com', 'EdilSardegna'),
('Federica Oppo', 'federica@email.com', 'Moda Sarda'),
('Paolo Serra', 'paolo@email.com', 'Ristorante La Barbagia'),
('Claudia Sanna', 'claudia@email.com', 'TechNuraghe');

INSERT INTO stato (id_stato_consulenza, stato) VALUES 
(1, 'In corso'),
(2, 'Scaduta'),
(3, 'Annullata');


INSERT INTO consulenza (data_creazione, note, id_stato_consulenza, id_cliente) VALUES 
('2025-03-10', 'Aggiornare policy di sicurezza informatica per GDPR', 1, 1),
('2025-04-15', NULL, 2, 2),
('2025-05-02', 'Implementare nuovo sistema di analisi dati con AI', 3, 3),
('2025-06-01', 'Ottimizzare il SEO per piattaforma e-commerce', 4, 4),
('2025-07-20', NULL, 5, 5),
('2025-08-05', 'Integrare gestione social media con CRM aziendale', 6, 6),
('2025-09-12', NULL, 7, 7),
('2025-10-25', 'Formazione avanzata su strategie di cyber security', 8, 8),
('2025-11-10', 'Migliorare infrastruttura cloud per riduzione costi', 9, 9),
('2025-12-05', NULL, 10, 10);

INSERT INTO saldo (id_saldo, descrizione) VALUES 
(1, 'Pagato'),
(2, 'In sospeso');

INSERT INTO modalita_pagamento (id_modalita, tipo_pagamento) VALUES 
(1, 'Contanti'),
(2, 'PayPal'),
(3, 'Bonifico');

INSERT INTO contratto (data_inizio, data_fine, id_servizio, id_consulenza) VALUES 
('2025-03-15', '2026-03-15', 1, 1),
('2025-04-20', '2026-04-20', 2, 2),
('2025-05-10', '2026-05-10', 3, 3),
('2025-06-25', '2026-06-25', 4, 4),
('2025-07-30', '2026-07-30', 5, 5),
('2025-08-15', '2026-08-15', 6, 6),
('2025-09-10', '2026-09-10', 7, 7),
('2025-10-05', '2026-10-05', 8, 8),
('2025-11-20', '2026-11-20', 9, 9),
('2025-12-12', '2026-12-12', 10, 10);

INSERT INTO contratto (data_inizio, data_fine, id_servizio, id_consulenza) VALUES 
('2025-03-15', '2026-03-15', 1, 1),
('2025-04-20', '2026-04-20', 2, 2),
('2025-05-10', '2026-05-10', 3, 3),
('2025-06-25', '2026-06-25', 4, 4),
('2025-07-30', '2026-07-30', 5, 5),
('2025-08-15', '2026-08-15', 6, 6),
('2025-09-10', '2026-09-10', 7, 7),
('2025-10-05', '2026-10-05', 8, 8),
('2025-11-20', '2026-11-20', 9, 9),
('2025-12-12', '2026-12-12', 10, 10);

INSERT INTO pagamento (data_pagamento, importo_pagato, id_fattura, id_modalita, id_saldo) VALUES 
('2025-03-22', 400.00, 1, 1, 1),
('2025-04-30', 900.50, 2, 2, 1),
('2025-05-25', 375.00, 3, 3, 2),
('2025-07-05', 1050.00, 4, 4, 1),
('2025-07-15', 550.00, 5, 5, 1),
('2025-08-22', 875.25, 6, 6, 1),
('2025-09-30', 650.00, 7, 7, 2),
('2025-10-27', 680.80, 8, 8, 1),
('2025-11-15', 480.00, 9, 9, 3),
('2025-12-18', 1500.00, 10, 10, 1);


