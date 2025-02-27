/* Criação da Tabela */
CREATE TABLE
    IF NOT EXISTS disciplinas (
        disciplinaId INT NOT NULL AUTO_INCREMENT,
        sigla VARCHAR(4) NOT NULL UNIQUE,
        nome VARCHAR(100) NOT NULL UNIQUE,
        cargaHoraria INT UNSIGNED NOT NULL,
        periodo SMALLINT NOT NULL,
        limiteDeFaltas SMALLINT UNSIGNED NOT NULL,
        PRIMARY KEY (disciplinaId)
    ) DEFAULT CHARSET = utf8;

/* Inserção de Disciplinas */
INSERT INTO
    disciplinas
values
    (
        DEFAULT,
        '2FPR',
        'Fundamentos de Programação',
        '80',
        '2',
        '20'
    );

/* Listar Disciplinas */
SELECT
    *
FROM
    disciplinas;

/* Atualizar Disciplina */
UPDATE disciplinas
SET
    sigla = '1IHM',
    nome = 'Interface Homem-Máquina',
    cargaHoraria = '40',
    periodo = '1',
    limiteDeFaltas = '10'
WHERE
    disciplinaId = 1;

/* Deletar Disciplinas */
DELETE FROM disciplinas
WHERE
    disciplinaId = 1;