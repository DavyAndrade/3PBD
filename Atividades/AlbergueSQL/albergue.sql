-- Criação do banco de dados
CREATE DATABASE albergue_db;
USE albergue_db;

-- Tabela de Clientes
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Características de Quartos
CREATE TABLE CaracteristicaQuarto (
    id_caracteristica_quarto INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL UNIQUE
);

-- Tabela de Quartos
CREATE TABLE Quarto (
    id_quarto INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(10) NOT NULL UNIQUE,
    capacidade INT NOT NULL CHECK (capacidade IN (4, 8, 12)),
    tem_banheiro BOOLEAN NOT NULL
);

-- Tabela Associativa: Quarto-Características
CREATE TABLE QuartoCaracteristica (
    id_quarto INT,
    id_caracteristica_quarto INT,
    PRIMARY KEY (id_quarto, id_caracteristica_quarto),
    FOREIGN KEY (id_quarto) REFERENCES Quarto(id_quarto) ON DELETE CASCADE,
    FOREIGN KEY (id_caracteristica_quarto) REFERENCES CaracteristicaQuarto(id_caracteristica_quarto) ON DELETE CASCADE
);

-- Tabela de Características de Vagas
CREATE TABLE CaracteristicaVaga (
    id_caracteristica_vaga INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL UNIQUE
);

-- Tabela de Vagas
CREATE TABLE Vaga (
    id_vaga INT AUTO_INCREMENT PRIMARY KEY,
    id_quarto INT NOT NULL,
    numero_cama VARCHAR(10) NOT NULL,
    posicao ENUM('superior', 'inferior', 'única') NULL,
    FOREIGN KEY (id_quarto) REFERENCES Quarto(id_quarto) ON DELETE CASCADE,
    UNIQUE (id_quarto, numero_cama)
);

-- Tabela Associativa: Vaga-Características
CREATE TABLE VagaCaracteristica (
    id_vaga INT,
    id_caracteristica_vaga INT,
    PRIMARY KEY (id_vaga, id_caracteristica_vaga),
    FOREIGN KEY (id_vaga) REFERENCES Vaga(id_vaga) ON DELETE CASCADE,
    FOREIGN KEY (id_caracteristica_vaga) REFERENCES CaracteristicaVaga(id_caracteristica_vaga) ON DELETE CASCADE
);

-- Tabela de Reservas
CREATE TABLE Reserva (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_inicio DATE NOT NULL,
    numero_dias INT NOT NULL,
    status ENUM('PENDENTE', 'CONFIRMADA', 'CANCELADA') DEFAULT 'PENDENTE',
    data_reserva DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente) ON DELETE CASCADE
);

-- Tabela Associativa: Reserva-Vagas
CREATE TABLE ReservaVaga (
    id_reserva INT,
    id_vaga INT,
    PRIMARY KEY (id_reserva, id_vaga),
    FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva) ON DELETE CASCADE,
    FOREIGN KEY (id_vaga) REFERENCES Vaga(id_vaga) ON DELETE CASCADE
);

-- Tabela de Pagamentos
CREATE TABLE Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT NOT NULL UNIQUE,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME DEFAULT CURRENT_TIMESTAMP,
    numero_cartao VARCHAR(20) NOT NULL,
    status ENUM('PENDENTE', 'APROVADO', 'RECUSADO') DEFAULT 'PENDENTE',
    FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva) ON DELETE CASCADE
);