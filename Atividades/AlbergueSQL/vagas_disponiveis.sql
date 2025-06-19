-- Vagas disponíveis em um período específico
SELECT
    v.id_vaga,
    v.numero_cama,
    v.posicao,
    q.numero AS numero_quarto,
    q.tem_banheiro,
    GROUP_CONCAT(cv.descricao) AS caracteristicas_vaga
FROM
    Vaga v
    JOIN Quarto q ON v.id_quarto = q.id_quarto
    LEFT JOIN VagaCaracteristica vc ON v.id_vaga = vc.id_vaga
    LEFT JOIN CaracteristicaVaga cv ON vc.id_caracteristica_vaga = cv.id_caracteristica_vaga
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            ReservaVaga rv
            JOIN Reserva r ON rv.id_reserva = r.id_reserva
        WHERE
            rv.id_vaga = v.id_vaga
            AND r.status != 'CANCELADA'
            AND r.data_inicio <= '2025-07-03'
            AND DATE_ADD(r.data_inicio, INTERVAL r.numero_dias DAY) >= '2025-07-01'
    )
GROUP BY
    v.id_vaga
ORDER BY
    q.numero,
    v.numero_cama;

-- Vagas ocupadas no mesmo período
SELECT
    r.id_reserva,
    v.id_vaga,
    r.data_inicio,
    DATE_ADD(r.data_inicio, INTERVAL r.numero_dias DAY) AS data_fim
FROM
    ReservaVaga rv
    JOIN Reserva r ON rv.id_reserva = r.id_reserva
    JOIN Vaga v ON rv.id_vaga = v.id_vaga
WHERE
    r.status != 'CANCELADA'
    AND r.data_inicio <= '2025-07-03'
    AND DATE_ADD(r.data_inicio, INTERVAL r.numero_dias DAY) >= '2025-07-01';