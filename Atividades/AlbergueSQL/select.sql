-- Selecionar todos os clientes
SELECT * FROM Cliente;

-- Selecionar um cliente específico
SELECT * FROM Cliente WHERE email = 'joao@email.com';

-- Selecionar todos os quartos com suas características
SELECT
    q.*,
    GROUP_CONCAT(cq.descricao) AS caracteristicas
FROM
    Quarto q
    LEFT JOIN QuartoCaracteristica qc ON q.id_quarto = qc.id_quarto
    LEFT JOIN CaracteristicaQuarto cq ON qc.id_caracteristica_quarto = cq.id_caracteristica_quarto
GROUP BY
    q.id_quarto;

-- Selecionar todas as vagas de um quarto com características
SELECT
    v.id_vaga,
    v.id_quarto,
    v.numero_cama,
    v.posicao,
    GROUP_CONCAT(cv.descricao) AS caracteristicas
FROM
    Vaga v
    LEFT JOIN VagaCaracteristica vc ON v.id_vaga = vc.id_vaga
    LEFT JOIN CaracteristicaVaga cv ON vc.id_caracteristica_vaga = cv.id_caracteristica_vaga
WHERE
    v.id_quarto = 1
GROUP BY
    v.id_vaga;

-- Selecionar reserva com detalhes
SELECT r.*, c.nome, c.email, p.valor, p.status AS status_pagamento
FROM Reserva r
JOIN Cliente c ON r.id_cliente = c.id_cliente
JOIN Pagamento p ON r.id_reserva = p.id_reserva
WHERE r.id_reserva = 1;

-- Selecionar vagas de uma reserva
SELECT v.*, q.numero AS numero_quarto
FROM ReservaVaga rv
JOIN Vaga v ON rv.id_vaga = v.id_vaga
JOIN Quarto q ON v.id_quarto = q.id_quarto
WHERE rv.id_reserva = 1;