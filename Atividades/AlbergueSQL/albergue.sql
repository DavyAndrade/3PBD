-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS albergue_db;
USE albergue_db;

-- Tabela CLIENTE
CREATE TABLE IF NOT EXISTS cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20) NOT NULL
);

-- Tabela QUARTO
CREATE TABLE IF NOT EXISTS quarto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(10) UNIQUE NOT NULL,
    capacidade INT NOT NULL CHECK (capacidade IN (4, 8, 12)),
    tem_banheiro BOOLEAN GENERATED ALWAYS AS (IF(capacidade != 8, TRUE, FALSE)) VIRTUAL
);

-- Tabela PECULIARIDADE
CREATE TABLE IF NOT EXISTS peculiaridade (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) UNIQUE NOT NULL
);

-- Tabela VAGA
CREATE TABLE IF NOT EXISTS vaga (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    quarto_id INT NOT NULL,
    FOREIGN KEY (quarto_id) REFERENCES quarto(id) ON DELETE CASCADE
);

-- Tabela RESERVA
CREATE TABLE IF NOT EXISTS reserva (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    data_cancelamento DATETIME DEFAULT NULL,
    cliente_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id) ON DELETE CASCADE,
    CONSTRAINT check_cancelamento CHECK (
        data_cancelamento IS NULL OR 
        DATEDIFF(data_inicio, DATE(data_cancelamento)) >= 3
    )
);

-- Tabela de junção RESERVA_VAGA
CREATE TABLE IF NOT EXISTS reserva_vaga (
    reserva_id INT NOT NULL,
    vaga_id INT NOT NULL,
    PRIMARY KEY (reserva_id, vaga_id),
    FOREIGN KEY (reserva_id) REFERENCES reserva(id) ON DELETE CASCADE,
    FOREIGN KEY (vaga_id) REFERENCES vaga(id) ON DELETE CASCADE
);

-- Tabela de junção VAGA_PECULIARIDADE
CREATE TABLE IF NOT EXISTS vaga_peculiaridade (
    vaga_id INT NOT NULL,
    peculiaridade_id INT NOT NULL,
    PRIMARY KEY (vaga_id, peculiaridade_id),
    FOREIGN KEY (vaga_id) REFERENCES vaga(id) ON DELETE CASCADE,
    FOREIGN KEY (peculiaridade_id) REFERENCES peculiaridade(id) ON DELETE CASCADE
);

-- Tabela de junção QUARTO_PECULIARIDADE
CREATE TABLE IF NOT EXISTS quarto_peculiaridade (
    quarto_id INT NOT NULL,
    peculiaridade_id INT NOT NULL,
    PRIMARY KEY (quarto_id, peculiaridade_id),
    FOREIGN KEY (quarto_id) REFERENCES quarto(id) ON DELETE CASCADE,
    FOREIGN KEY (peculiaridade_id) REFERENCES peculiaridade(id) ON DELETE CASCADE
);

-- Tabela PAGAMENTO
CREATE TABLE IF NOT EXISTS pagamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(10,2) NOT NULL,
    status_pag VARCHAR(20) NOT NULL DEFAULT 'PENDENTE',
    data_pag DATETIME DEFAULT NULL,
    forma_pag VARCHAR(20) NOT NULL DEFAULT 'CARTAO_CREDITO',
    reserva_id INT NOT NULL UNIQUE,
    FOREIGN KEY (reserva_id) REFERENCES reserva(id) ON DELETE CASCADE
);