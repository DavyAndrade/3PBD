-- 1) Cria a database
CREATE DATABASE IF NOT EXISTS clinica_estetica CHARACTER
SET
    utf8mb4 COLLATE utf8mb4_unicode_ci;

USE clinica_estetica;

-- 2) Entidades principais
CREATE TABLE
    ESPECIALIDADE (
        id_especialidade INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(100) NOT NULL
    ) ENGINE = InnoDB;

CREATE TABLE
    CLIENTE (
        id_cliente INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(150) NOT NULL,
        telefone VARCHAR(20),
        email VARCHAR(150) UNIQUE,
        saldo_credito DECIMAL(10, 2) NOT NULL DEFAULT 0.00
    ) ENGINE = InnoDB;

CREATE TABLE
    PROFISSIONAL (
        id_profissional INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(150) NOT NULL,
        id_especialidade INT NOT NULL,
        FOREIGN KEY (id_especialidade) REFERENCES ESPECIALIDADE (id_especialidade) ON UPDATE CASCADE ON DELETE RESTRICT
    ) ENGINE = InnoDB;

CREATE TABLE
    SERVICO (
        id_servico INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(150) NOT NULL,
        duracao INT NOT NULL, -- em minutos
        preco DECIMAL(10, 2) NOT NULL,
        id_especialidade INT NOT NULL,
        FOREIGN KEY (id_especialidade) REFERENCES ESPECIALIDADE (id_especialidade) ON UPDATE CASCADE ON DELETE RESTRICT
    ) ENGINE = InnoDB;

CREATE TABLE
    PACOTE (
        id_pacote INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(150) NOT NULL,
        descricao TEXT,
        preco DECIMAL(10, 2) NOT NULL
    ) ENGINE = InnoDB;

-- 3) Tabelas associativas (muitos-para-muitos)
CREATE TABLE
    PROFISSIONAL_SERVICO (
        id_profissional INT NOT NULL,
        id_servico INT NOT NULL,
        PRIMARY KEY (id_profissional, id_servico),
        FOREIGN KEY (id_profissional) REFERENCES PROFISSIONAL (id_profissional) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (id_servico) REFERENCES SERVICO (id_servico) ON UPDATE CASCADE ON DELETE CASCADE
    ) ENGINE = InnoDB;

CREATE TABLE
    PACOTE_SERVICO (
        id_pacote INT NOT NULL,
        id_servico INT NOT NULL,
        quantidade INT NOT NULL DEFAULT 1,
        PRIMARY KEY (id_pacote, id_servico),
        FOREIGN KEY (id_pacote) REFERENCES PACOTE (id_pacote) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (id_servico) REFERENCES SERVICO (id_servico) ON UPDATE CASCADE ON DELETE CASCADE
    ) ENGINE = InnoDB;

-- 4) Horários disponíveis
CREATE TABLE
    HORARIO_DISPONIVEL (
        id_horario INT AUTO_INCREMENT PRIMARY KEY,
        id_profissional INT NOT NULL,
        dt_inicio DATETIME NOT NULL,
        dt_fim DATETIME NOT NULL,
        FOREIGN KEY (id_profissional) REFERENCES PROFISSIONAL (id_profissional) ON UPDATE CASCADE ON DELETE CASCADE
    ) ENGINE = InnoDB;

-- 5) Reserva e seus itens
CREATE TABLE
    RESERVA (
        id_reserva INT AUTO_INCREMENT PRIMARY KEY,
        id_cliente INT NOT NULL,
        id_horario INT NOT NULL,
        dt_reserva DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        status ENUM (
            'RESERVADO',
            'ATENDIDO',
            'NÃO_COMPARECEU',
            'ATRASADO',
            'CANCELADO'
        ) NOT NULL DEFAULT 'RESERVADO',
        FOREIGN KEY (id_cliente) REFERENCES CLIENTE (id_cliente) ON UPDATE CASCADE ON DELETE RESTRICT,
        FOREIGN KEY (id_horario) REFERENCES HORARIO_DISPONIVEL (id_horario) ON UPDATE CASCADE ON DELETE RESTRICT
    ) ENGINE = InnoDB;

CREATE TABLE
    RESERVA_ITEM (
        id_reserva INT NOT NULL,
        id_servico INT NULL,
        id_pacote INT NULL,
        PRIMARY KEY (id_reserva),
        FOREIGN KEY (id_reserva) REFERENCES RESERVA (id_reserva) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (id_servico) REFERENCES SERVICO (id_servico) ON UPDATE CASCADE ON DELETE SET NULL,
        FOREIGN KEY (id_pacote) REFERENCES PACOTE (id_pacote) ON UPDATE CASCADE ON DELETE SET NULL,
        CHECK (
            (
                id_servico IS NOT NULL
                AND id_pacote IS NULL
            )
            OR (
                id_servico IS NULL
                AND id_pacote IS NOT NULL
            )
        )
    ) ENGINE = InnoDB;

-- 6) Pagamentos
CREATE TABLE
    PAGAMENTO (
        id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
        id_reserva INT NOT NULL,
        valor DECIMAL(10, 2) NOT NULL,
        dt_pagamento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        metodo ENUM ('CARTAO_CREDITO') NOT NULL DEFAULT 'CARTAO_CREDITO',
        ult4_digitos_cartao CHAR(4) NOT NULL,
        status ENUM ('CONCLUÍDO', 'ESTORNADO', 'EM_CREDITO') NOT NULL DEFAULT 'CONCLUÍDO',
        FOREIGN KEY (id_reserva) REFERENCES RESERVA (id_reserva) ON UPDATE CASCADE ON DELETE CASCADE
    ) ENGINE = InnoDB;

-- 7) Lista de Espera
CREATE TABLE
    LISTA_ESPERA (
        id_espera INT AUTO_INCREMENT PRIMARY KEY,
        id_cliente INT NOT NULL,
        id_horario INT NOT NULL,
        dt_entrada DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (id_cliente) REFERENCES CLIENTE (id_cliente) ON UPDATE CASCADE ON DELETE RESTRICT,
        FOREIGN KEY (id_horario) REFERENCES HORARIO_DISPONIVEL (id_horario) ON UPDATE CASCADE ON DELETE RESTRICT
    ) ENGINE = InnoDB;