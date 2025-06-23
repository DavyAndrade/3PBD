-- Parâmetro: Dia a ser consultado (formato YYYY-MM-DD)
SET @dia_consulta = '2025-07-10';

-- Vagas disponíveis no dia consultado
SELECT 
    v.id AS vaga_id,
    v.descricao,
    q.numero AS quarto,
    q.capacidade,
    q.tem_banheiro,
    GROUP_CONCAT(DISTINCT p.descricao SEPARATOR ', ') AS peculiaridades_vaga
FROM vaga v
JOIN quarto q ON v.quarto_id = q.id
LEFT JOIN vaga_peculiaridade vp ON v.id = vp.vaga_id
LEFT JOIN peculiaridade p ON vp.peculiaridade_id = p.id
WHERE v.id NOT IN (
    SELECT rv.vaga_id
    FROM reserva_vaga rv
    JOIN reserva r ON rv.reserva_id = r.id
    WHERE 
        r.data_cancelamento IS NULL AND
        r.data_inicio <= DATE_ADD(@dia_consulta, INTERVAL 1 DAY) AND
        r.data_fim > @dia_consulta
)
GROUP BY v.id, v.descricao, q.numero, q.capacidade, q.tem_banheiro;

-- Camas reservadas no dia consultado
SELECT 
    r.id AS reserva_id,
    r.data_inicio,
    r.data_fim,
    c.nome AS cliente,
    v.id AS vaga_id,
    v.descricao AS vaga,
    q.numero AS quarto,
    GROUP_CONCAT(DISTINCT p.descricao SEPARATOR ', ') AS peculiaridades_vaga
FROM reserva_vaga rv
JOIN reserva r ON rv.reserva_id = r.id
JOIN cliente c ON r.cliente_id = c.id
JOIN vaga v ON rv.vaga_id = v.id
JOIN quarto q ON v.quarto_id = q.id
LEFT JOIN vaga_peculiaridade vp ON v.id = vp.vaga_id
LEFT JOIN peculiaridade p ON vp.peculiaridade_id = p.id
WHERE 
    r.data_cancelamento IS NULL AND
    r.data_inicio <= DATE_ADD(@dia_consulta, INTERVAL 1 DAY) AND
    r.data_fim > @dia_consulta
GROUP BY r.id, r.data_inicio, r.data_fim, c.nome, v.id, v.descricao, q.numero;