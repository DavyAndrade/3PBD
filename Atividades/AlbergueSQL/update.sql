-- Atualizar status de uma reserva
UPDATE Reserva SET status = 'CONFIRMADA' WHERE id_reserva = 1;

-- Atualizar status de pagamento
UPDATE Pagamento SET status = 'APROVADO' WHERE id_reserva = 1;

-- Atualizar telefone de cliente
UPDATE Cliente SET telefone = '(11) 88888-8888' WHERE id_cliente = 1;

-- Adicionar característica apenas se não existir
INSERT INTO VagaCaracteristica (id_vaga, id_caracteristica_vaga)
SELECT 3, 5
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1
    FROM VagaCaracteristica
    WHERE id_vaga = 3 AND id_caracteristica_vaga = 5
);