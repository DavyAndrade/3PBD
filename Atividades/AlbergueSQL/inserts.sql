-- CLIENTE
INSERT INTO cliente (nome, email, telefone) VALUES
('João Silva', 'joao@email.com', '(11) 99999-1111'),
('Maria Oliveira', 'maria@email.com', '(21) 98888-2222'),
('Carlos Souza', 'carlos@email.com', '(31) 97777-3333');

-- QUARTO
INSERT INTO quarto (numero, capacidade) VALUES
('101', 4),   -- Quarto com banheiro
('201', 8),   -- Quarto sem banheiro
('301', 12);  -- Quarto com banheiro

-- PECULIARIDADE
INSERT INTO peculiaridade (descricao) VALUES
('Banheiro Privativo'),
('Sol da Manhã'),
('Perto da Janela'),
('Beliche Superior'),
('Beliche Inferior'),
('Ar Condicionado'),
('Ventilador de Teto'),
('Perto da Porta');

-- VAGA
-- Quarto 101 (4 vagas)
INSERT INTO vaga (descricao, quarto_id) VALUES
('Cama 1 - Superior', 1),
('Cama 1 - Inferior', 1),
('Cama 2 - Superior', 1),
('Cama 2 - Inferior', 1);

-- Quarto 201 (8 vagas)
INSERT INTO vaga (descricao, quarto_id) VALUES
('Cama 1 - Superior', 2),
('Cama 1 - Inferior', 2),
('Cama 2 - Superior', 2),
('Cama 2 - Inferior', 2),
('Cama 3 - Superior', 2),
('Cama 3 - Inferior', 2),
('Cama 4 - Superior', 2),
('Cama 4 - Inferior', 2);

-- Quarto 301 (12 vagas)
INSERT INTO vaga (descricao, quarto_id) VALUES
('Cama 1 - Superior', 3),
('Cama 1 - Inferior', 3),
('Cama 2 - Superior', 3),
('Cama 2 - Inferior', 3),
('Cama 3 - Superior', 3),
('Cama 3 - Inferior', 3),
('Cama 4 - Superior', 3),
('Cama 4 - Inferior', 3),
('Cama 5 - Superior', 3),
('Cama 5 - Inferior', 3),
('Cama 6 - Superior', 3),
('Cama 6 - Inferior', 3);

-- RESERVA
INSERT INTO reserva (data_inicio, data_fim, cliente_id) VALUES
('2025-07-01', '2025-07-05', 1),   -- Reserva do João
('2025-07-10', '2025-07-15', 2),   -- Reserva da Maria
('2025-08-01', '2025-08-10', 3);   -- Reserva do Carlos

-- PAGAMENTO
INSERT INTO pagamento (valor, status_pag, data_pag, forma_pag, reserva_id) VALUES
(250.00, 'CONFIRMADO', '2025-06-25 14:30:00', 'CARTAO_CREDITO', 1),
(500.00, 'PENDENTE', NULL, 'CARTAO_CREDITO', 2),
(900.00, 'CONFIRMADO', '2025-07-20 10:15:00', 'PIX', 3);

-- RESERVA_VAGA
-- João reserva 2 vagas no quarto 101
INSERT INTO reserva_vaga (reserva_id, vaga_id) VALUES
(1, 1),  -- Vaga 1 (Superior)
(1, 2);  -- Vaga 2 (Inferior)

-- Maria reserva 3 vagas no quarto 201
INSERT INTO reserva_vaga (reserva_id, vaga_id) VALUES
(2, 5),  -- Vaga 5
(2, 6),  -- Vaga 6
(2, 7);  -- Vaga 7

-- Carlos reserva 4 vagas no quarto 301
INSERT INTO reserva_vaga (reserva_id, vaga_id) VALUES
(3, 13), -- Vaga 13
(3, 14), -- Vaga 14
(3, 15), -- Vaga 15
(3, 16); -- Vaga 16

-- VAGA_PECULIARIDADE
-- Características para vagas do quarto 101
INSERT INTO vaga_peculiaridade (vaga_id, peculiaridade_id) VALUES
(1, 4),  -- Beliche Superior
(1, 2),  -- Sol da Manhã
(2, 5),  -- Beliche Inferior
(2, 3),  -- Perto da Janela
(3, 4),  -- Beliche Superior
(4, 5);  -- Beliche Inferior

-- Características para vagas do quarto 201
INSERT INTO vaga_peculiaridade (vaga_id, peculiaridade_id) VALUES
(5, 4),  -- Beliche Superior
(5, 8),  -- Perto da Porta
(6, 5),  -- Beliche Inferior
(7, 4),  -- Beliche Superior
(8, 5);  -- Beliche Inferior

-- QUARTO_PECULIARIDADE
-- Quarto 101 (com banheiro)
INSERT INTO quarto_peculiaridade (quarto_id, peculiaridade_id) VALUES
(1, 1),  -- Banheiro Privativo
(1, 6);  -- Ar Condicionado

-- Quarto 201 (sem banheiro)
INSERT INTO quarto_peculiaridade (quarto_id, peculiaridade_id) VALUES
(2, 7);  -- Ventilador de Teto

-- Quarto 301 (com banheiro)
INSERT INTO quarto_peculiaridade (quarto_id, peculiaridade_id) VALUES
(3, 1),  -- Banheiro Privativo
(3, 6);  -- Ar Condicionado