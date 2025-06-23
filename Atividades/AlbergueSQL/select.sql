-- Todos os clientes
SELECT id, nome, email, telefone FROM cliente;

-- Cliente específico por ID
SELECT id, nome, email, telefone 
FROM cliente 
WHERE id = 1;

-- Todos os quartos
SELECT id, numero, capacidade, tem_banheiro 
FROM quarto;

-- Quarto específico por ID
SELECT id, numero, capacidade, tem_banheiro 
FROM quarto 
WHERE id = 1;

-- Quartos com banheiro
SELECT id, numero, capacidade 
FROM quarto 
WHERE tem_banheiro = TRUE;

-- Todas as peculiaridades
SELECT id, descricao FROM peculiaridade;

-- Peculiaridade específica por ID
SELECT id, descricao 
FROM peculiaridade 
WHERE id = 1;

-- Todas as vagas
SELECT v.id, v.descricao, q.numero AS quarto, q.tem_banheiro
FROM vaga v
JOIN quarto q ON v.quarto_id = q.id;

-- Vaga específica por ID
SELECT v.id, v.descricao, q.numero AS quarto, q.tem_banheiro
FROM vaga v
JOIN quarto q ON v.quarto_id = q.id
WHERE v.id = 1;

-- Características de uma vaga específica
SELECT p.descricao AS caracteristica
FROM vaga_peculiaridade vp
JOIN peculiaridade p ON vp.peculiaridade_id = p.id
WHERE vp.vaga_id = 1;

-- Todas as reservas
SELECT 
    r.id,
    r.data_inicio,
    r.data_fim,
    c.nome AS cliente,
    COUNT(rv.vaga_id) AS total_vagas,
    p.status_pag
FROM reserva r
JOIN cliente c ON r.cliente_id = c.id
LEFT JOIN reserva_vaga rv ON r.id = rv.reserva_id
LEFT JOIN pagamento p ON r.id = p.reserva_id
GROUP BY r.id;

-- Reserva específica por ID
SELECT 
    r.id,
    r.data_inicio,
    r.data_fim,
    c.nome AS cliente,
    c.email,
    p.valor,
    p.status_pag,
    p.forma_pag
FROM reserva r
JOIN cliente c ON r.cliente_id = c.id
LEFT JOIN pagamento p ON r.id = p.reserva_id
WHERE r.id = 1;

-- Vagas de uma reserva específica
SELECT v.id, v.descricao, q.numero AS quarto
FROM reserva_vaga rv
JOIN vaga v ON rv.vaga_id = v.id
JOIN quarto q ON v.quarto_id = q.id
WHERE rv.reserva_id = 1;

-- Todas as reservas
SELECT 
    r.id,
    r.data_inicio,
    r.data_fim,
    c.nome AS cliente,
    COUNT(rv.vaga_id) AS total_vagas,
    p.status_pag
FROM reserva r
JOIN cliente c ON r.cliente_id = c.id
LEFT JOIN reserva_vaga rv ON r.id = rv.reserva_id
LEFT JOIN pagamento p ON r.id = p.reserva_id
GROUP BY r.id;

-- Reserva específica por ID
SELECT 
    r.id,
    r.data_inicio,
    r.data_fim,
    c.nome AS cliente,
    c.email,
    p.valor,
    p.status_pag,
    p.forma_pag
FROM reserva r
JOIN cliente c ON r.cliente_id = c.id
LEFT JOIN pagamento p ON r.id = p.reserva_id
WHERE r.id = 1;

-- Vagas de uma reserva específica
SELECT v.id, v.descricao, q.numero AS quarto
FROM reserva_vaga rv
JOIN vaga v ON rv.vaga_id = v.id
JOIN quarto q ON v.quarto_id = q.id
WHERE rv.reserva_id = 1;

-- Todos os pagamentos
SELECT 
    p.id,
    p.valor,
    p.status_pag,
    p.data_pag,
    p.forma_pag,
    r.id AS reserva_id,
    c.nome AS cliente
FROM pagamento p
JOIN reserva r ON p.reserva_id = r.id
JOIN cliente c ON r.cliente_id = c.id;

-- Pagamento específico por ID
SELECT 
    p.id,
    p.valor,
    p.status_pag,
    p.data_pag,
    p.forma_pag,
    r.id AS reserva_id,
    c.nome AS cliente
FROM pagamento p
JOIN reserva r ON p.reserva_id = r.id
JOIN cliente c ON r.cliente_id = c.id
WHERE p.id = 1;

