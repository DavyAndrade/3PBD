/* Criação da Tabela */
CREATE TABLE
    IF NOT EXISTS alunos (
        alunoId INT NOT NULL AUTO_INCREMENT,
        nome VARCHAR(100) NOT NULL,
        matricula VARCHAR(14) NOT NULL UNIQUE,
        email VARCHAR(100) NOT NULL UNIQUE,
        cpf VARCHAR(14) NOT NULL UNIQUE,
        PRIMARY KEY (alunoId)
    ) DEFAULT CHARSET = utf8;

/* Inserção de Alunos */
INSERT INTO
    alunos
VALUES
    (
        DEFAULT,
        'Aluno',
        '12345678',
        'email@domain.com',
        '123.456.789-10'
    );

/* Listar Alunos */
SELECT
    *
FROM
    alunos;

/* Atualizar Aluno */
UPDATE alunos
SET
    nome = 'Exemplo',
    matricula = '12345678901234',
    email = 'exemplo@domain.com',
    cpf = '123.456.789-11'
where
    alunoId = 1;

/* Deletar Aluno */

DELETE FROM alunos
WHERE
    alunoId = 1;