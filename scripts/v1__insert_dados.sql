INSERT INTO cliente (nome, cpf) VALUES
('João Silva', '12345678901'),
('Maria Santos', '23456789012'),
('Carlos Oliveira', '34567890123'),
('Ana Costa', '45678901234'),
('Bruno Almeida', '56789012345'),
('Juliana Ferreira', '67890123456'),
('Rafael Martins', '78901234567'),
('Camila Rodrigues', '89012345678'),
('Lucas Pereira', '90123456789'),
('Beatriz Souza', '01234567890')
ON CONFLICT (cpf) DO NOTHING;


INSERT INTO veterinario (cpf, nome, especialidade) VALUES
('11223344556', 'Dr. Carlos Mendes', 'Clínica Geral'),
('22334455667', 'Dra. Ana Paula', 'Cirurgia Veterinária'),
('33445566778', 'Dr. Pedro Souza', 'Dermatologia Veterinária'),
('44556677889', 'Dra. Mariana Lopes', 'Cardiologia Veterinária'),
('55667788990', 'Dr. Felipe Rocha', 'Ortopedia Veterinária')
ON CONFLICT (cpf) DO NOTHING;


INSERT INTO produto
(tipo, marca, descricao, valor_compra, estoque)
VALUES
('Vacina', 'Zoetis', 'Vacina antirrábica para cães e gatos', 25.00, 20),
('Medicamento', 'Ourofino', 'Antibiótico veterinário em comprimidos', 35.00, 10),
('Vermífugo', 'MSD Saúde Animal', 'Vermífugo de uso oral para cães', 18.00, 15),
('Material hospitalar', 'Descarpack', 'Seringa descartável para aplicação de medicamentos', 1.50, 100),
('Higiene', 'Vetnil', 'Shampoo veterinário para cães e gatos', 22.00, 12),
('Medicamento', 'Elanco', 'Anti-inflamatório veterinário', 42.00, 18),
('Medicamento', 'Ceva', 'Medicamento para tratamento de infecções', 38.00, 14),
('Suplemento', 'Avert', 'Suplemento vitamínico para animais', 30.00, 20),
('Antisséptico', 'Vic Pharma', 'Solução antisséptica para uso veterinário', 15.00, 25),
('Curativo', 'Cremer', 'Material para curativos veterinários', 8.00, 40)
ON CONFLICT (tipo, marca, descricao) DO NOTHING;


INSERT INTO servico (nome, descricao) VALUES
('Consulta veterinária', 'Avaliação clínica do animal realizada pelo veterinário'),
('Exame', 'Realização de exames para auxiliar no diagnóstico'),
('Banho', 'Higienização do animal'),
('Tosa', 'Serviço de corte e cuidados com os pelos'),
('Vacinação', 'Aplicação de vacina no animal'),
('Cirurgia', 'Procedimento cirúrgico realizado no animal'),
('Ultrassonografia', 'Exame de imagem para avaliação interna do animal'),
('Limpeza dentária', 'Procedimento de higiene e limpeza dos dentes do animal')
ON CONFLICT (nome) DO NOTHING;


INSERT INTO administracao (nome) VALUES
('Fernanda Lima'),
('Roberto Alves'),
('Patrícia Gomes')
ON CONFLICT (nome) DO NOTHING;


INSERT INTO atendente (nome, cpf, id_cliente)
SELECT 'Fernanda Lima', '66778899001', id_cliente
FROM cliente
WHERE cpf = '45678901234'
ON CONFLICT (cpf) DO NOTHING;

INSERT INTO atendente (nome, cpf, id_cliente)
SELECT 'Roberto Alves', '77889900112', id_cliente
FROM cliente
WHERE cpf = '67890123456'
ON CONFLICT (cpf) DO NOTHING;

INSERT INTO atendente (nome, cpf, id_cliente)
VALUES ('Patrícia Gomes', '88990011223', NULL)
ON CONFLICT (cpf) DO NOTHING;


INSERT INTO animal
(nome, especie, sexo, data_nascimento, foto, id_cliente)
SELECT 'Rex', 'Cachorro', 'Macho', '2020-05-10', 'fotos/rex.jpg', id_cliente
FROM cliente WHERE cpf = '12345678901'
ON CONFLICT (id_cliente, nome) DO NOTHING;

INSERT INTO animal
(nome, especie, sexo, data_nascimento, foto, id_cliente)
SELECT 'Mel', 'Cachorro', 'Fêmea', '2021-08-15', 'fotos/mel.jpg', id_cliente
FROM cliente WHERE cpf = '12345678901'
ON CONFLICT (id_cliente, nome) DO NOTHING;

INSERT INTO animal
(nome, especie, sexo, data_nascimento, foto, id_cliente)
SELECT 'Luna', 'Gato', 'Fêmea', '2022-03-20', 'fotos/luna.jpg', id_cliente
FROM cliente WHERE cpf = '23456789012'
ON CONFLICT (id_cliente, nome) DO NOTHING;

INSERT INTO animal
(nome, especie, sexo, data_nascimento, foto, id_cliente)
SELECT 'Thor', 'Cachorro', 'Macho', '2019-11-05', 'fotos/thor.jpg', id_cliente
FROM cliente WHERE cpf = '34567890123'
ON CONFLICT (id_cliente, nome) DO NOTHING;

INSERT INTO animal
(nome, especie, sexo, data_nascimento, foto, id_cliente)
SELECT 'Nina', 'Gato', 'Fêmea', '2023-01-12', 'fotos/nina.jpg', id_cliente
FROM cliente WHERE cpf = '45678901234'
ON CONFLICT (id_cliente, nome) DO NOTHING;

INSERT INTO animal
(nome, especie, sexo, data_nascimento, foto, id_cliente)
SELECT 'Bob', 'Cachorro', 'Macho', '2021-02-18', 'fotos/bob.jpg', id_cliente
FROM cliente WHERE cpf = '56789012345'
ON CONFLICT (id_cliente, nome) DO NOTHING;

INSERT INTO animal
(nome, especie, sexo, data_nascimento, foto, id_cliente)
SELECT 'Maggie', 'Cachorro', 'Fêmea', '2020-09-30', 'fotos/maggie.jpg', id_cliente
FROM cliente WHERE cpf = '67890123456'
ON CONFLICT (id_cliente, nome) DO NOTHING;

INSERT INTO animal
(nome, especie, sexo, data_nascimento, foto, id_cliente)
SELECT 'Simba', 'Gato', 'Macho', '2022-06-14', 'fotos/simba.jpg', id_cliente
FROM cliente WHERE cpf = '78901234567'
ON CONFLICT (id_cliente, nome) DO NOTHING;

INSERT INTO animal
(nome, especie, sexo, data_nascimento, foto, id_cliente)
SELECT 'Amora', 'Cachorro', 'Fêmea', '2023-04-22', 'fotos/amora.jpg', id_cliente
FROM cliente WHERE cpf = '89012345678'
ON CONFLICT (id_cliente, nome) DO NOTHING;

INSERT INTO animal
(nome, especie, sexo, data_nascimento, foto, id_cliente)
SELECT 'Max', 'Cachorro', 'Macho', '2018-12-03', 'fotos/max.jpg', id_cliente
FROM cliente WHERE cpf = '90123456789'
ON CONFLICT (id_cliente, nome) DO NOTHING;

INSERT INTO animal
(nome, especie, sexo, data_nascimento, foto, id_cliente)
SELECT 'Melody', 'Gato', 'Fêmea', '2021-07-11', 'fotos/melody.jpg', id_cliente
FROM cliente WHERE cpf = '01234567890'
ON CONFLICT (id_cliente, nome) DO NOTHING;

INSERT INTO animal
(nome, especie, sexo, data_nascimento, foto, id_cliente)
SELECT 'Toby', 'Cachorro', 'Macho', '2022-10-05', 'fotos/toby.jpg', id_cliente
FROM cliente WHERE cpf = '23456789012'
ON CONFLICT (id_cliente, nome) DO NOTHING;

INSERT INTO animal
(nome, especie, sexo, data_nascimento, foto, id_cliente)
SELECT 'Belinha', 'Cachorro', 'Fêmea', '2020-03-17', 'fotos/belinha.jpg', id_cliente
FROM cliente WHERE cpf = '34567890123'
ON CONFLICT (id_cliente, nome) DO NOTHING;

INSERT INTO animal
(nome, especie, sexo, data_nascimento, foto, id_cliente)
SELECT 'Oliver', 'Gato', 'Macho', '2023-02-09', 'fotos/oliver.jpg', id_cliente
FROM cliente WHERE cpf = '56789012345'
ON CONFLICT (id_cliente, nome) DO NOTHING;

INSERT INTO animal
(nome, especie, sexo, data_nascimento, foto, id_cliente)
SELECT 'Jade', 'Cachorro', 'Fêmea', '2019-06-25', 'fotos/jade.jpg', id_cliente
FROM cliente WHERE cpf = '89012345678'
ON CONFLICT (id_cliente, nome) DO NOTHING;


INSERT INTO atendimento
(data, hora_entrada, hora_saida, informacao_inicial, descricao_consulta,
 id_cliente, id_animal, id_atendente, id_veterinario)
SELECT
'2026-09-01', '08:30', '09:15',
'Tutor informou que o animal está com falta de apetite.',
'Animal avaliado e diagnosticado com quadro leve de indisposição.',
c.id_cliente, a.id_animal, at.id_atendente, v.id_veterinario
FROM cliente c
JOIN animal a ON a.id_cliente = c.id_cliente AND a.nome = 'Rex'
JOIN atendente at ON at.cpf = '66778899001'
JOIN veterinario v ON v.cpf = '11223344556'
WHERE c.cpf = '12345678901'
ON CONFLICT (data, hora_entrada, id_animal) DO NOTHING;

INSERT INTO atendimento
(data, hora_entrada, hora_saida, informacao_inicial, descricao_consulta,
 id_cliente, id_animal, id_atendente, id_veterinario)
SELECT
'2026-09-01', '09:30', '10:30',
'Tutor informou que o animal apresenta coceira intensa.',
'Animal avaliado e encaminhado para tratamento dermatológico.',
c.id_cliente, a.id_animal, at.id_atendente, v.id_veterinario
FROM cliente c
JOIN animal a ON a.id_cliente = c.id_cliente AND a.nome = 'Mel'
JOIN atendente at ON at.cpf = '77889900112'
JOIN veterinario v ON v.cpf = '33445566778'
WHERE c.cpf = '12345678901'
ON CONFLICT (data, hora_entrada, id_animal) DO NOTHING;

INSERT INTO atendimento
(data, hora_entrada, hora_saida, informacao_inicial, descricao_consulta,
 id_cliente, id_animal, id_atendente, id_veterinario)
SELECT
'2026-09-02', '08:00', '08:30',
'Tutor trouxe o animal para vacinação anual.',
'Animal avaliado e considerado apto para vacinação.',
c.id_cliente, a.id_animal, at.id_atendente, v.id_veterinario
FROM cliente c
JOIN animal a ON a.id_cliente = c.id_cliente AND a.nome = 'Luna'
JOIN atendente at ON at.cpf = '88990011223'
JOIN veterinario v ON v.cpf = '11223344556'
WHERE c.cpf = '23456789012'
ON CONFLICT (data, hora_entrada, id_animal) DO NOTHING;

INSERT INTO atendimento
(data, hora_entrada, hora_saida, informacao_inicial, descricao_consulta,
 id_cliente, id_animal, id_atendente, id_veterinario)
SELECT
'2026-09-02', '10:00', '11:30',
'Tutor informou que o animal apresenta dificuldade para caminhar.',
'Após avaliação, foi indicada intervenção cirúrgica.',
c.id_cliente, a.id_animal, at.id_atendente, v.id_veterinario
FROM cliente c
JOIN animal a ON a.id_cliente = c.id_cliente AND a.nome = 'Thor'
JOIN atendente at ON at.cpf = '66778899001'
JOIN veterinario v ON v.cpf = '22334455667'
WHERE c.cpf = '34567890123'
ON CONFLICT (data, hora_entrada, id_animal) DO NOTHING;

INSERT INTO atendimento
(data, hora_entrada, hora_saida, informacao_inicial, descricao_consulta,
 id_cliente, id_animal, id_atendente, id_veterinario)
SELECT
'2026-09-03', '09:00', '10:00',
'Tutor informou que o animal está com vômitos.',
'Animal avaliado e indicado tratamento medicamentoso.',
c.id_cliente, a.id_animal, at.id_atendente, v.id_veterinario
FROM cliente c
JOIN animal a ON a.id_cliente = c.id_cliente AND a.nome = 'Nina'
JOIN atendente at ON at.cpf = '77889900112'
JOIN veterinario v ON v.cpf = '11223344556'
WHERE c.cpf = '45678901234'
ON CONFLICT (data, hora_entrada, id_animal) DO NOTHING;

INSERT INTO atendimento
(data, hora_entrada, hora_saida, informacao_inicial, descricao_consulta,
 id_cliente, id_animal, id_atendente, id_veterinario)
SELECT
'2026-09-03', '11:00', '12:00',
'Tutor solicitou avaliação geral do animal.',
'Consulta realizada sem alterações clínicas significativas.',
c.id_cliente, a.id_animal, at.id_atendente, v.id_veterinario
FROM cliente c
JOIN animal a ON a.id_cliente = c.id_cliente AND a.nome = 'Bob'
JOIN atendente at ON at.cpf = '88990011223'
JOIN veterinario v ON v.cpf = '44556677889'
WHERE c.cpf = '56789012345'
ON CONFLICT (data, hora_entrada, id_animal) DO NOTHING;

INSERT INTO atendimento
(data, hora_entrada, hora_saida, informacao_inicial, descricao_consulta,
 id_cliente, id_animal, id_atendente, id_veterinario)
SELECT
'2026-09-04', '08:30', '09:30',
'Tutor informou que o animal apresenta irritação na pele.',
'Avaliação dermatológica realizada e tratamento indicado.',
c.id_cliente, a.id_animal, at.id_atendente, v.id_veterinario
FROM cliente c
JOIN animal a ON a.id_cliente = c.id_cliente AND a.nome = 'Maggie'
JOIN atendente at ON at.cpf = '66778899001'
JOIN veterinario v ON v.cpf = '33445566778'
WHERE c.cpf = '67890123456'
ON CONFLICT (data, hora_entrada, id_animal) DO NOTHING;

INSERT INTO atendimento
(data, hora_entrada, hora_saida, informacao_inicial, descricao_consulta,
 id_cliente, id_animal, id_atendente, id_veterinario)
SELECT
'2026-09-04', '10:00', '11:00',
'Tutor informou que o animal está mais cansado que o normal.',
'Avaliação cardiológica realizada e exames solicitados.',
c.id_cliente, a.id_animal, at.id_atendente, v.id_veterinario
FROM cliente c
JOIN animal a ON a.id_cliente = c.id_cliente AND a.nome = 'Simba'
JOIN atendente at ON at.cpf = '77889900112'
JOIN veterinario v ON v.cpf = '44556677889'
WHERE c.cpf = '78901234567'
ON CONFLICT (data, hora_entrada, id_animal) DO NOTHING;

INSERT INTO atendimento
(data, hora_entrada, hora_saida, informacao_inicial, descricao_consulta,
 id_cliente, id_animal, id_atendente, id_veterinario)
SELECT
'2026-09-05', '09:00', '09:45',
'Tutor trouxe o animal para vacinação.',
'Animal avaliado e vacinação realizada.',
c.id_cliente, a.id_animal, at.id_atendente, v.id_veterinario
FROM cliente c
JOIN animal a ON a.id_cliente = c.id_cliente AND a.nome = 'Amora'
JOIN atendente at ON at.cpf = '88990011223'
JOIN veterinario v ON v.cpf = '11223344556'
WHERE c.cpf = '89012345678'
ON CONFLICT (data, hora_entrada, id_animal) DO NOTHING;

INSERT INTO atendimento
(data, hora_entrada, hora_saida, informacao_inicial, descricao_consulta,
 id_cliente, id_animal, id_atendente, id_veterinario)
SELECT
'2026-09-05', '10:30', '11:30',
'Tutor informou dificuldade de locomoção.',
'Avaliação ortopédica realizada.',
c.id_cliente, a.id_animal, at.id_atendente, v.id_veterinario
FROM cliente c
JOIN animal a ON a.id_cliente = c.id_cliente AND a.nome = 'Max'
JOIN atendente at ON at.cpf = '66778899001'
JOIN veterinario v ON v.cpf = '55667788990'
WHERE c.cpf = '90123456789'
ON CONFLICT (data, hora_entrada, id_animal) DO NOTHING;

INSERT INTO atendimento
(data, hora_entrada, hora_saida, informacao_inicial, descricao_consulta,
 id_cliente, id_animal, id_atendente, id_veterinario)
SELECT
'2026-09-06', '08:00', '09:00',
'Tutor solicitou avaliação odontológica.',
'Foi identificada necessidade de limpeza dentária.',
c.id_cliente, a.id_animal, at.id_atendente, v.id_veterinario
FROM cliente c
JOIN animal a ON a.id_cliente = c.id_cliente AND a.nome = 'Melody'
JOIN atendente at ON at.cpf = '77889900112'
JOIN veterinario v ON v.cpf = '11223344556'
WHERE c.cpf = '01234567890'
ON CONFLICT (data, hora_entrada, id_animal) DO NOTHING;

INSERT INTO atendimento
(data, hora_entrada, hora_saida, informacao_inicial, descricao_consulta,
 id_cliente, id_animal, id_atendente, id_veterinario)
SELECT
'2026-09-06', '09:30', '10:30',
'Tutor informou que o animal perdeu o apetite.',
'Animal avaliado e indicado tratamento de suporte.',
c.id_cliente, a.id_animal, at.id_atendente, v.id_veterinario
FROM cliente c
JOIN animal a ON a.id_cliente = c.id_cliente AND a.nome = 'Toby'
JOIN atendente at ON at.cpf = '88990011223'
JOIN veterinario v ON v.cpf = '11223344556'
WHERE c.cpf = '23456789012'
ON CONFLICT (data, hora_entrada, id_animal) DO NOTHING;

INSERT INTO atendimento
(data, hora_entrada, hora_saida, informacao_inicial, descricao_consulta,
 id_cliente, id_animal, id_atendente, id_veterinario)
SELECT
'2026-09-06', '11:00', '12:00',
'Tutor informou presença de lesão na pata.',
'Lesão avaliada e indicado curativo.',
c.id_cliente, a.id_animal, at.id_atendente, v.id_veterinario
FROM cliente c
JOIN animal a ON a.id_cliente = c.id_cliente AND a.nome = 'Belinha'
JOIN atendente at ON at.cpf = '66778899001'
JOIN veterinario v ON v.cpf = '55667788990'
WHERE c.cpf = '34567890123'
ON CONFLICT (data, hora_entrada, id_animal) DO NOTHING;

INSERT INTO atendimento
(data, hora_entrada, hora_saida, informacao_inicial, descricao_consulta,
 id_cliente, id_animal, id_atendente, id_veterinario)
SELECT
'2026-09-06', '13:00', '14:00',
'Tutor solicitou exame de rotina.',
'Exame realizado para avaliação geral do animal.',
c.id_cliente, a.id_animal, at.id_atendente, v.id_veterinario
FROM cliente c
JOIN animal a ON a.id_cliente = c.id_cliente AND a.nome = 'Oliver'
JOIN atendente at ON at.cpf = '77889900112'
JOIN veterinario v ON v.cpf = '44556677889'
WHERE c.cpf = '56789012345'
ON CONFLICT (data, hora_entrada, id_animal) DO NOTHING;

INSERT INTO atendimento
(data, hora_entrada, hora_saida, informacao_inicial, descricao_consulta,
 id_cliente, id_animal, id_atendente, id_veterinario)
SELECT
'2026-09-06', '15:00', '16:00',
'Tutor informou que o animal apresenta dor abdominal.',
'Animal avaliado e encaminhado para ultrassonografia.',
c.id_cliente, a.id_animal, at.id_atendente, v.id_veterinario
FROM cliente c
JOIN animal a ON a.id_cliente = c.id_cliente AND a.nome = 'Jade'
JOIN atendente at ON at.cpf = '88990011223'
JOIN veterinario v ON v.cpf = '44556677889'
WHERE c.cpf = '89012345678'
ON CONFLICT (data, hora_entrada, id_animal) DO NOTHING;


INSERT INTO atendimento_produto
(id_atendimento, id_produto, valor_utilizado, id_administracao)
SELECT
a.id_atendimento,
p.id_produto,
35.00,
ad.id_administracao
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN produto p ON p.tipo = 'Medicamento'
    AND p.marca = 'Ourofino'
    AND p.descricao = 'Antibiótico veterinário em comprimidos'
JOIN administracao ad ON ad.nome = 'Fernanda Lima'
WHERE a.data = '2026-09-01'
AND a.hora_entrada = '08:30'
AND c.cpf = '12345678901'
AND an.nome = 'Rex'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_produto
(id_atendimento, id_produto, valor_utilizado, id_administracao)
SELECT
a.id_atendimento,
p.id_produto,
18.00,
ad.id_administracao
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN produto p ON p.tipo = 'Vermífugo'
    AND p.marca = 'MSD Saúde Animal'
    AND p.descricao = 'Vermífugo de uso oral para cães'
JOIN administracao ad ON ad.nome = 'Roberto Alves'
WHERE a.data = '2026-09-01'
AND a.hora_entrada = '09:30'
AND c.cpf = '12345678901'
AND an.nome = 'Mel'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_produto
(id_atendimento, id_produto, valor_utilizado, id_administracao)
SELECT a.id_atendimento, p.id_produto, 25.00, ad.id_administracao
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN produto p ON p.tipo = 'Vacina' AND p.marca = 'Zoetis'
JOIN administracao ad ON ad.nome = 'Fernanda Lima'
WHERE a.data = '2026-09-02' AND a.hora_entrada = '08:00'
AND c.cpf = '23456789012' AND an.nome = 'Luna'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_produto
(id_atendimento, id_produto, valor_utilizado, id_administracao)
SELECT a.id_atendimento, p.id_produto, 1.50, ad.id_administracao
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN produto p ON p.tipo = 'Material hospitalar' AND p.marca = 'Descarpack'
JOIN administracao ad ON ad.nome = 'Roberto Alves'
WHERE a.data = '2026-09-02' AND a.hora_entrada = '10:00'
AND c.cpf = '34567890123' AND an.nome = 'Thor'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_produto
(id_atendimento, id_produto, valor_utilizado, id_administracao)
SELECT a.id_atendimento, p.id_produto, 42.00, ad.id_administracao
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN produto p ON p.tipo = 'Medicamento' AND p.marca = 'Elanco'
JOIN administracao ad ON ad.nome = 'Patrícia Gomes'
WHERE a.data = '2026-09-03' AND a.hora_entrada = '09:00'
AND c.cpf = '45678901234' AND an.nome = 'Nina'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_produto
(id_atendimento, id_produto, valor_utilizado, id_administracao)
SELECT a.id_atendimento, p.id_produto, 30.00, ad.id_administracao
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN produto p ON p.tipo = 'Suplemento' AND p.marca = 'Avert'
JOIN administracao ad ON ad.nome = 'Fernanda Lima'
WHERE a.data = '2026-09-03' AND a.hora_entrada = '11:00'
AND c.cpf = '56789012345' AND an.nome = 'Bob'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_produto
(id_atendimento, id_produto, valor_utilizado, id_administracao)
SELECT a.id_atendimento, p.id_produto, 15.00, ad.id_administracao
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN produto p ON p.tipo = 'Antisséptico' AND p.marca = 'Vic Pharma'
JOIN administracao ad ON ad.nome = 'Roberto Alves'
WHERE a.data = '2026-09-04' AND a.hora_entrada = '08:30'
AND c.cpf = '67890123456' AND an.nome = 'Maggie'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_produto
(id_atendimento, id_produto, valor_utilizado, id_administracao)
SELECT a.id_atendimento, p.id_produto, 38.00, ad.id_administracao
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN produto p ON p.tipo = 'Medicamento' AND p.marca = 'Ceva'
JOIN administracao ad ON ad.nome = 'Patrícia Gomes'
WHERE a.data = '2026-09-04' AND a.hora_entrada = '10:00'
AND c.cpf = '78901234567' AND an.nome = 'Simba'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_produto
(id_atendimento, id_produto, valor_utilizado, id_administracao)
SELECT a.id_atendimento, p.id_produto, 25.00, ad.id_administracao
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN produto p ON p.tipo = 'Vacina' AND p.marca = 'Zoetis'
JOIN administracao ad ON ad.nome = 'Fernanda Lima'
WHERE a.data = '2026-09-05' AND a.hora_entrada = '09:00'
AND c.cpf = '89012345678' AND an.nome = 'Amora'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_produto
(id_atendimento, id_produto, valor_utilizado, id_administracao)
SELECT a.id_atendimento, p.id_produto, 42.00, ad.id_administracao
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN produto p ON p.tipo = 'Medicamento' AND p.marca = 'Elanco'
JOIN administracao ad ON ad.nome = 'Roberto Alves'
WHERE a.data = '2026-09-05' AND a.hora_entrada = '10:30'
AND c.cpf = '90123456789' AND an.nome = 'Max'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_produto
(id_atendimento, id_produto, valor_utilizado, id_administracao)
SELECT a.id_atendimento, p.id_produto, 22.00, ad.id_administracao
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN produto p ON p.tipo = 'Higiene' AND p.marca = 'Vetnil'
JOIN administracao ad ON ad.nome = 'Patrícia Gomes'
WHERE a.data = '2026-09-06' AND a.hora_entrada = '08:00'
AND c.cpf = '01234567890' AND an.nome = 'Melody'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_produto
(id_atendimento, id_produto, valor_utilizado, id_administracao)
SELECT a.id_atendimento, p.id_produto, 35.00, ad.id_administracao
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN produto p ON p.tipo = 'Medicamento' AND p.marca = 'Ourofino'
JOIN administracao ad ON ad.nome = 'Fernanda Lima'
WHERE a.data = '2026-09-06' AND a.hora_entrada = '09:30'
AND c.cpf = '23456789012' AND an.nome = 'Toby'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_produto
(id_atendimento, id_produto, valor_utilizado, id_administracao)
SELECT a.id_atendimento, p.id_produto, 8.00, ad.id_administracao
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN produto p ON p.tipo = 'Curativo' AND p.marca = 'Cremer'
JOIN administracao ad ON ad.nome = 'Roberto Alves'
WHERE a.data = '2026-09-06' AND a.hora_entrada = '11:00'
AND c.cpf = '34567890123' AND an.nome = 'Belinha'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_produto
(id_atendimento, id_produto, valor_utilizado, id_administracao)
SELECT a.id_atendimento, p.id_produto, 1.50, ad.id_administracao
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN produto p ON p.tipo = 'Material hospitalar' AND p.marca = 'Descarpack'
JOIN administracao ad ON ad.nome = 'Fernanda Lima'
WHERE a.data = '2026-09-06' AND a.hora_entrada = '13:00'
AND c.cpf = '56789012345' AND an.nome = 'Oliver'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_produto
(id_atendimento, id_produto, valor_utilizado, id_administracao)
SELECT a.id_atendimento, p.id_produto, 15.00, ad.id_administracao
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN produto p ON p.tipo = 'Antisséptico' AND p.marca = 'Vic Pharma'
JOIN administracao ad ON ad.nome = 'Patrícia Gomes'
WHERE a.data = '2026-09-06' AND a.hora_entrada = '15:00'
AND c.cpf = '89012345678' AND an.nome = 'Jade'
ON CONFLICT DO NOTHING;


INSERT INTO atendimento_servico
(id_atendimento, id_servico, valor_cobrado)
SELECT a.id_atendimento, s.id_servico, 80.00
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN servico s ON s.nome = 'Consulta veterinária'
WHERE a.data = '2026-09-01' AND a.hora_entrada = '08:30'
AND c.cpf = '12345678901' AND an.nome = 'Rex'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_servico
(id_atendimento, id_servico, valor_cobrado)
SELECT a.id_atendimento, s.id_servico, 80.00
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN servico s ON s.nome = 'Consulta veterinária'
WHERE a.data = '2026-09-01' AND a.hora_entrada = '09:30'
AND c.cpf = '12345678901' AND an.nome = 'Mel'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_servico
(id_atendimento, id_servico, valor_cobrado)
SELECT a.id_atendimento, s.id_servico, 60.00
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN servico s ON s.nome = 'Tosa'
WHERE a.data = '2026-09-01' AND a.hora_entrada = '09:30'
AND c.cpf = '12345678901' AND an.nome = 'Mel'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_servico
(id_atendimento, id_servico, valor_cobrado)
SELECT a.id_atendimento, s.id_servico, 50.00
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN servico s ON s.nome = 'Vacinação'
WHERE a.data = '2026-09-02' AND a.hora_entrada = '08:00'
AND c.cpf = '23456789012' AND an.nome = 'Luna'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_servico
(id_atendimento, id_servico, valor_cobrado)
SELECT a.id_atendimento, s.id_servico, 500.00
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN servico s ON s.nome = 'Cirurgia'
WHERE a.data = '2026-09-02' AND a.hora_entrada = '10:00'
AND c.cpf = '34567890123' AND an.nome = 'Thor'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_servico
(id_atendimento, id_servico, valor_cobrado)
SELECT a.id_atendimento, s.id_servico, 80.00
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN servico s ON s.nome = 'Consulta veterinária'
WHERE a.data = '2026-09-03' AND a.hora_entrada = '09:00'
AND c.cpf = '45678901234' AND an.nome = 'Nina'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_servico
(id_atendimento, id_servico, valor_cobrado)
SELECT a.id_atendimento, s.id_servico, 80.00
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN servico s ON s.nome = 'Consulta veterinária'
WHERE a.data = '2026-09-03' AND a.hora_entrada = '11:00'
AND c.cpf = '56789012345' AND an.nome = 'Bob'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_servico
(id_atendimento, id_servico, valor_cobrado)
SELECT a.id_atendimento, s.id_servico, 40.00
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN servico s ON s.nome = 'Banho'
WHERE a.data = '2026-09-03' AND a.hora_entrada = '11:00'
AND c.cpf = '56789012345' AND an.nome = 'Bob'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_servico
(id_atendimento, id_servico, valor_cobrado)
SELECT a.id_atendimento, s.id_servico, 80.00
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN servico s ON s.nome = 'Consulta veterinária'
WHERE a.data = '2026-09-04' AND a.hora_entrada = '08:30'
AND c.cpf = '67890123456' AND an.nome = 'Maggie'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_servico
(id_atendimento, id_servico, valor_cobrado)
SELECT a.id_atendimento, s.id_servico, 100.00
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN servico s ON s.nome = 'Exame'
WHERE a.data = '2026-09-04' AND a.hora_entrada = '10:00'
AND c.cpf = '78901234567' AND an.nome = 'Simba'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_servico
(id_atendimento, id_servico, valor_cobrado)
SELECT a.id_atendimento, s.id_servico, 50.00
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN servico s ON s.nome = 'Vacinação'
WHERE a.data = '2026-09-05' AND a.hora_entrada = '09:00'
AND c.cpf = '89012345678' AND an.nome = 'Amora'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_servico
(id_atendimento, id_servico, valor_cobrado)
SELECT a.id_atendimento, s.id_servico, 80.00
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN servico s ON s.nome = 'Consulta veterinária'
WHERE a.data = '2026-09-05' AND a.hora_entrada = '10:30'
AND c.cpf = '90123456789' AND an.nome = 'Max'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_servico
(id_atendimento, id_servico, valor_cobrado)
SELECT a.id_atendimento, s.id_servico, 70.00
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN servico s ON s.nome = 'Limpeza dentária'
WHERE a.data = '2026-09-06' AND a.hora_entrada = '08:00'
AND c.cpf = '01234567890' AND an.nome = 'Melody'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_servico
(id_atendimento, id_servico, valor_cobrado)
SELECT a.id_atendimento, s.id_servico, 80.00
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN servico s ON s.nome = 'Consulta veterinária'
WHERE a.data = '2026-09-06' AND a.hora_entrada = '09:30'
AND c.cpf = '23456789012' AND an.nome = 'Toby'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_servico
(id_atendimento, id_servico, valor_cobrado)
SELECT a.id_atendimento, s.id_servico, 80.00
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN servico s ON s.nome = 'Consulta veterinária'
WHERE a.data = '2026-09-06' AND a.hora_entrada = '11:00'
AND c.cpf = '34567890123' AND an.nome = 'Belinha'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_servico
(id_atendimento, id_servico, valor_cobrado)
SELECT a.id_atendimento, s.id_servico, 100.00
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN servico s ON s.nome = 'Exame'
WHERE a.data = '2026-09-06' AND a.hora_entrada = '13:00'
AND c.cpf = '56789012345' AND an.nome = 'Oliver'
ON CONFLICT DO NOTHING;

INSERT INTO atendimento_servico
(id_atendimento, id_servico, valor_cobrado)
SELECT a.id_atendimento, s.id_servico, 120.00
FROM atendimento a
JOIN cliente c ON c.id_cliente = a.id_cliente
JOIN animal an ON an.id_animal = a.id_animal
JOIN servico s ON s.nome = 'Ultrassonografia'
WHERE a.data = '2026-09-06' AND a.hora_entrada = '15:00'
AND c.cpf = '89012345678' AND an.nome = 'Jade'
ON CONFLICT DO NOTHING;
