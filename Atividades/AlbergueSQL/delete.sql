-- CLIENTE
DELETE FROM cliente WHERE id = 1;

-- QUARTO
DELETE FROM quarto WHERE id = 1;

-- PECULIARIDADE
DELETE FROM peculiaridade WHERE id = 1;

-- VAGA
DELETE FROM vaga WHERE id = 1;

-- RESERVA
DELETE FROM reserva WHERE id = 1;

-- PAGAMENTO
DELETE FROM pagamento WHERE id = 1;

-- RESERVA_VAGA
DELETE FROM reserva_vaga
WHERE reserva_id = 1 AND vaga_id = 1;

-- VAGA_PECULIARIDADE
DELETE FROM vaga_peculiaridade
WHERE vaga_id = 1 AND peculiaridade_id = 1;

-- QUARTO_PECULIARIDADE
DELETE FROM quarto_peculiaridade
WHERE quarto_id = 1 AND peculiaridade_id = 1;