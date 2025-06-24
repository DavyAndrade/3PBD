-- CLIENTE
UPDATE cliente
SET nome = 'Novo Nome', email = 'novo@email.com', telefone = '(11) 11111-1111'
WHERE id = 1;

-- QUARTO
UPDATE quarto
SET numero = 'B202', capacidade = 8
WHERE id = 1;

-- PECULIARIDADE
UPDATE peculiaridade
SET descricao = 'Aaaaa'
WHERE id = 1;

-- VAGA
UPDATE vaga
SET descricao = 'Beliche Inferior', quarto_id = 2
WHERE id = 1;

-- RESERVA
UPDATE reserva
SET data_inicio = '2025-07-05', data_fim = '2025-07-15', data_cancelamento = NULL
WHERE id = 1;

-- PAGAMENTO
UPDATE pagamento
SET valor = 750.00, status_pag = 'REEMBOLSADO', data_pag = NOW()
WHERE id = 1;

-- RESERVA_VAGA
UPDATE reserva_vaga
SET vaga_id = 2
WHERE reserva_id = 1 AND vaga_id = 1;

-- VAGA_PECULIARIDADE
UPDATE vaga_peculiaridade
SET peculiaridade_id = 2
WHERE vaga_id = 1 AND peculiaridade_id = 1;

-- QUARTO_PECULIARIDADE
UPDATE quarto_peculiaridade
SET peculiaridade_id = 2
WHERE quarto_id = 1 AND peculiaridade_id = 1;