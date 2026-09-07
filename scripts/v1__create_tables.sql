CREATE TABLE IF NOT EXISTS cliente (
    id_cliente INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS animal (
    id_animal INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    especie VARCHAR(100) NOT NULL,
    sexo VARCHAR(20) NOT NULL,
    data_nascimento DATE NOT NULL,
    foto VARCHAR(500) NOT NULL,
    id_cliente INT NOT NULL,

    CONSTRAINT uq_animal_cliente_nome UNIQUE (id_cliente, nome),

    CONSTRAINT fk_animal_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente)
);

CREATE TABLE IF NOT EXISTS atendente (
    id_atendente INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    id_cliente INT UNIQUE,

    CONSTRAINT fk_atendente_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente)
);

CREATE TABLE IF NOT EXISTS veterinario (
    id_veterinario INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(150) NOT NULL,
    especialidade VARCHAR(150) NOT NULL
);

CREATE TABLE IF NOT EXISTS produto (
    id_produto INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL,
    marca VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    valor_compra DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,

    CONSTRAINT uq_produto UNIQUE (tipo, marca, descricao)
);

CREATE TABLE IF NOT EXISTS servico (
    id_servico INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(150) NOT NULL UNIQUE,
    descricao TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS administracao (
    id_administracao INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS atendimento (
    id_atendimento INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    data DATE NOT NULL,
    hora_entrada TIME NOT NULL,
    hora_saida TIME NOT NULL,
    informacao_inicial TEXT NOT NULL,
    descricao_consulta TEXT NOT NULL,
    id_cliente INT NOT NULL,
    id_animal INT NOT NULL,
    id_atendente INT NOT NULL,
    id_veterinario INT NOT NULL,

    CONSTRAINT uq_atendimento UNIQUE (data, hora_entrada, id_animal),

    CONSTRAINT fk_atendimento_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente),

    CONSTRAINT fk_atendimento_animal
        FOREIGN KEY (id_animal)
        REFERENCES animal(id_animal),

    CONSTRAINT fk_atendimento_atendente
        FOREIGN KEY (id_atendente)
        REFERENCES atendente(id_atendente),

    CONSTRAINT fk_atendimento_veterinario
        FOREIGN KEY (id_veterinario)
        REFERENCES veterinario(id_veterinario)
);

CREATE TABLE IF NOT EXISTS atendimento_produto (
    id_atendimento INT NOT NULL,
    id_produto INT NOT NULL,
    valor_utilizado DECIMAL(10,2) NOT NULL,
    id_administracao INT NOT NULL,

    PRIMARY KEY (id_atendimento, id_produto),

    CONSTRAINT fk_atendimento_produto_atendimento
        FOREIGN KEY (id_atendimento)
        REFERENCES atendimento(id_atendimento),

    CONSTRAINT fk_atendimento_produto_produto
        FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto),

    CONSTRAINT fk_atendimento_produto_administracao
        FOREIGN KEY (id_administracao)
        REFERENCES administracao(id_administracao)
);

CREATE TABLE IF NOT EXISTS atendimento_servico (
    id_atendimento INT NOT NULL,
    id_servico INT NOT NULL,
    valor_cobrado DECIMAL(10,2) NOT NULL,

    PRIMARY KEY (id_atendimento, id_servico),

    CONSTRAINT fk_atendimento_servico_atendimento
        FOREIGN KEY (id_atendimento)
        REFERENCES atendimento(id_atendimento),

    CONSTRAINT fk_atendimento_servico_servico
        FOREIGN KEY (id_servico)
        REFERENCES servico(id_servico)
);
