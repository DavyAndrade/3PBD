-- Inserir características de quarto
INSERT INTO CaracteristicaQuarto (descricao) VALUES 
('Banheiro privativo'),
('Vista para o mar'),
('Ar condicionado');

-- Inserir quartos
INSERT INTO Quarto (numero, capacidade, tem_banheiro) VALUES 
('101', 4, TRUE),
('102', 8, FALSE),
('103', 12, TRUE);

-- Associar características aos quartos
INSERT INTO QuartoCaracteristica (id_quarto, id_caracteristica_quarto) VALUES 
(1, 1), (1, 3),
(2, 3),
(3, 1), (3, 2);

-- Inserir características de vaga
INSERT INTO CaracteristicaVaga (descricao) VALUES 
('Beliche superior'),
('Beliche inferior'),
('Perto da janela'),
('Perto da porta'),
('Sol da manhã');

-- Inserir vagas
INSERT INTO Vaga (id_quarto, numero_cama, posicao) VALUES 
(1, 'A1', 'superior'),
(1, 'A2', 'inferior'),
(2, 'B1', 'superior'),
(2, 'B2', 'inferior');

-- Associar características às vagas
INSERT INTO VagaCaracteristica (id_vaga, id_caracteristica_vaga) VALUES 
(1, 1), (1, 3),
(2, 2), (2, 4);

-- Inserir cliente
INSERT INTO Cliente (nome, email, telefone) VALUES 
('João Silva', 'joao@email.com', '(11) 99999-9999');

-- Inserir reserva
INSERT INTO Reserva (id_cliente, data_inicio, numero_dias) VALUES 
(1, '2025-07-01', 3);

-- Associar vagas à reserva
INSERT INTO ReservaVaga (id_reserva, id_vaga) VALUES 
(1, 1), (1, 2);

-- Inserir pagamento
INSERT INTO Pagamento (id_reserva, valor, numero_cartao) VALUES 
(1, 300.00, '1234567812345678');