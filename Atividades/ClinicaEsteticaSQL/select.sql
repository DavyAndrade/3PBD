-- Criar inicialmente somente o "SELECT" para listar o agendamento existente de cada profissional.
SELECT
    p.nome AS profissional,
    c.nome AS cliente,
    hd.dt_inicio,
    hd.dt_fim,
    s.nome AS servico,
    pa.nome AS pacote
FROM
    RESERVA r
    JOIN HORARIO_DISPONIVEL hd ON r.id_horario = hd.id_horario
    JOIN PROFISSIONAL p ON hd.id_profissional = p.id_profissional
    JOIN CLIENTE c ON r.id_cliente = c.id_cliente
    JOIN RESERVA_ITEM ri ON r.id_reserva = ri.id_reserva
    LEFT JOIN SERVICO s ON ri.id_servico = s.id_servico
    LEFT JOIN PACOTE pa ON ri.id_pacote = pa.id_pacote
WHERE
    r.status IN ('RESERVADO', 'ATENDIDO')
ORDER BY
    p.nome,
    hd.dt_inicio;

-- Criar tambem a agenda livre de cada profissional num determinado dia.
SELECT
    p.nome AS profissional,
    hd.dt_inicio,
    hd.dt_fim
FROM
    HORARIO_DISPONIVEL hd
    JOIN PROFISSIONAL p ON hd.id_profissional = p.id_profissional
    LEFT JOIN RESERVA r ON r.id_horario = hd.id_horario
WHERE
    DATE (hd.dt_inicio) = '2025-06-02'
    AND r.id_reserva IS NULL
ORDER BY
    p.nome,
    hd.dt_inicio;