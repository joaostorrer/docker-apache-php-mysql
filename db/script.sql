CREATE USER 'JF'@'hostname' IDENTIFIED BY 'senha';

CREATE USER 'JF'@'localhost' IDENTIFIED BY 'senha';

CREATE DATABASE IF NOT EXISTS combustivelConsumo;

GRANT DELETE, INSERT, SELECT, UPDATE ON combustivelConsumo.* TO 'JF'@'hostname';

GRANT DELETE, INSERT, SELECT, UPDATE ON combustivelConsumo.* TO 'JF'@'localhost';

FLUSH PRIVILEGES;

USE combustivelConsumo;

CREATE TABLE IF NOT EXISTS Consumo (
	id int NOT NULL AUTO_INCREMENT,
	valorTotal decimal(5,2) NOT NULL,
	volumeTotal decimal(4,2) NOT NULL,
	kilometragem decimal(5,2) NOT NULL,
	combustivel enum('Alcool','Gasolina') NOT NULL,
	valorLitro decimal(3,2) NOT NULL,
	consumoKmL decimal(4,2) NOT NULL,
	PRIMARY KEY(id)
) default charset = utf8;

CREATE TABLE IF NOT EXISTS Posto (
	id int NOT NULL AUTO_INCREMENT,
	nome varchar(20) NOT NULL,
	rua varchar(30) NOT NULL,
	numero smallint NOT NULL,
	cep varchar(8),
	PRIMARY KEY(id)
) default charset = utf8;

CREATE TABLE IF NOT EXISTS Consumo_Posto (
	idConsumo int NOT NULL,
    idPosto int NOT NULL,
    dataAbastecimento date NOT NULL,
    PRIMARY KEY(idConsumo, idPosto, dataAbastecimento),
    FOREIGN KEY(idConsumo) REFERENCES Consumo(id),
    FOREIGN KEY(idPosto) REFERENCES Posto(id)
) default charset = utf8;