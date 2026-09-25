CREATE TABLE IF NOT EXISTS avaliacao (
    id_avaliacao INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_atendimento INT NOT NULL UNIQUE,
    nota INT NOT NULL CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    data_avaliacao DATE NOT NULL DEFAULT CURRENT_DATE,

    CONSTRAINT fk_avaliacao_atendimento
        FOREIGN KEY (id_atendimento)
        REFERENCES atendimento(id_atendimento)
);


INSERT INTO avaliacao (id_atendimento, nota, comentario, data_avaliacao)
SELECT a.id_atendimento, 5, 'Atendimento excelente, equipe muito atenciosa!', '2026-09-01'
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
WHERE a.data = '2026-09-01' AND a.hora_entrada = '08:30'
AND c.cpf = '12345678901' AND an.nome = 'Rex'
ON CONFLICT (id_atendimento) DO NOTHING;

INSERT INTO avaliacao (id_atendimento, nota, comentario, data_avaliacao)
SELECT a.id_atendimento, 4, 'Bom atendimento, só demorou um pouco.', '2026-09-02'
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
WHERE a.data = '2026-09-02' AND a.hora_entrada = '08:00'
AND c.cpf = '23456789012' AND an.nome = 'Luna'
ON CONFLICT (id_atendimento) DO NOTHING;

INSERT INTO avaliacao (id_atendimento, nota, comentario, data_avaliacao)
SELECT a.id_atendimento, 5, 'Veterinário muito atencioso, resolveu rápido!', '2026-09-03'
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
WHERE a.data = '2026-09-03' AND a.hora_entrada = '09:00'
AND c.cpf = '45678901234' AND an.nome = 'Nina'
ON CONFLICT (id_atendimento) DO NOTHING;

