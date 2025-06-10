USE clinica_estetica;

-- 1) Inserir Especialidades
INSERT INTO
    ESPECIALIDADE (id_especialidade, nome)
VALUES
    (1, 'Cabelos'),
    (2, 'Estética Facial');

-- 2) Inserir Clientes
INSERT INTO
    CLIENTE (id_cliente, nome, telefone, email, saldo_credito)
VALUES
    (
        1,
        'Ana Silva',
        '(11) 91234-5678',
        'ana.silva@example.com',
        0.00
    ),
    (
        2,
        'Beatriz Costa',
        '(11) 99876-5432',
        'bia.costa@example.com',
        0.00
    );

-- 3) Inserir Profissionais
INSERT INTO
    PROFISSIONAL (id_profissional, nome, id_especialidade)
VALUES
    (1, 'Mariana Souza', 1), -- cabelereira
    (2, 'Carla Mendes', 2);  -- esteticista
    
-- 4) Inserir Serviços
INSERT INTO
    SERVICO (
        id_servico,
        nome,
        duracao,
        preco,
        id_especialidade
    )
VALUES
    (1, 'Corte Feminino', 45, 80.00, 1),
    (2, 'Coloração', 90, 150.00, 1),
    (3, 'Limpeza de Pele', 60, 120.00, 2),
    (4, 'Peeling Facial', 30, 80.00, 2);

-- 5) Inserir Pacotes
INSERT INTO
    PACOTE (id_pacote, nome, descricao, preco)
VALUES
    (
        1,
        'Dia da Beleza',
        'Corte + Coloração + Limpeza de Pele',
        330.00
    );

-- 6) Tabelas associativas Profissional_Servico
INSERT INTO
    PROFISSIONAL_SERVICO (id_profissional, id_servico)
VALUES
    (1, 1), -- Mariana faz Corte Feminino
    (1, 2), -- Mariana faz Coloração
    (2, 3), -- Carla faz Limpeza de Pele
    (2, 4);

-- Carla faz Peeling Facial
-- 7) Tabelas associativas Pacote_Servico
INSERT INTO
    PACOTE_SERVICO (id_pacote, id_servico, quantidade)
VALUES
    (1, 1, 1), -- Pacote inclui 1 Corte Feminino
    (1, 2, 1), -- Pacote inclui 1 Coloração
    (1, 3, 1);

-- Pacote inclui 1 Limpeza de Pele
-- 8) Inserir Horários Disponíveis
INSERT INTO
    HORARIO_DISPONIVEL (id_horario, id_profissional, dt_inicio, dt_fim)
VALUES
    (
        1,
        1,
        '2025-06-02 09:00:00',
        '2025-06-02 09:45:00'
    ), -- Mariana
    (
        2,
        1,
        '2025-06-02 10:00:00',
        '2025-06-02 11:30:00'
    ),
    (
        3,
        2,
        '2025-06-02 09:00:00',
        '2025-06-02 10:00:00'
    ), -- Carla
    (
        4,
        2,
        '2025-06-02 10:30:00',
        '2025-06-02 11:00:00'
    );

-- 9) Inserir Reserva (Cliente 1 reserva horário 1)
INSERT INTO
    RESERVA (id_reserva, id_cliente, id_horario, status)
VALUES
    (1, 1, 1, 'RESERVADO');

-- 10) Inserir Reserva_Item (reserva 1 escolhe SERVIÇO 1)
INSERT INTO
    RESERVA_ITEM (id_reserva, id_servico, id_pacote)
VALUES
    (1, 1, NULL);

-- 11) Inserir Pagamento para a Reserva 1
INSERT INTO
    PAGAMENTO (
        id_pagamento,
        id_reserva,
        valor,
        ult4_digitos_cartao,
        status
    )
VALUES
    (1, 1, 80.00, '1234', 'CONCLUÍDO');

-- 12) Inserir Lista de Espera (Cliente 2 para o horário 2)
INSERT INTO
    LISTA_ESPERA (id_espera, id_cliente, id_horario)
VALUES
    (1, 2, 2);