-- Cancelar reserva (atualiza status)
UPDATE Reserva SET status = 'CANCELADA' WHERE id_reserva = 1;

-- Remover característica de uma vaga
DELETE FROM VagaCaracteristica 
WHERE id_vaga = 1 AND id_caracteristica_vaga = 3;

-- Excluir cliente (cascateia para reservas e pagamentos)
DELETE FROM Cliente WHERE id_cliente = 1;