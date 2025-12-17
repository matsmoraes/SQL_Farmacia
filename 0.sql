-- criar

CREATE TABLE fornecedor (
    CPF_CNPJ varchar(20),
    nome varchar(225),
    endereco text,
    telefone varchar(20),
    ramo_de_atividade varchar(225),
    PRIMARY KEY (CPF_CNPJ)
);

CREATE TYPE atributo_composto AS (
    registro_anvisa TEXT,
    tarja TEXT,
    controlado INTEGER,
    receita INTEGER 
);

CREATE TABLE produto (
    codigo char(13),
    nome varchar(225),
    unidade varchar(20),
    apresentacao varchar(20),
    tipo_produto varchar(20),
    dados_medicamento atributo_composto,
    PRIMARY KEY (codigo)
);
                      
CREATE TABLE cliente (
    CPF_CNPJ varchar(20),
    nome varchar(225),
    endereco text,
    telefone varchar(20),
    data_nascimento date,
    data_cadastro date,
    ramo_de_atividade varchar(225),
    necessidades_especiais boolean,
    aposentado boolean,
    PRIMARY KEY (CPF_CNPJ)
);
                      
CREATE TABLE compra (
    id_compra int2 PRIMARY KEY,
    fornecedor text,
    codigo_compra char(13),
    data_compra date,
    data_validade date,
    unidade_compra varchar(20),
    quantidade_compra int2,
    preco_unitario_compra decimal(6,2),
    FOREIGN KEY (fornecedor) REFERENCES fornecedor(CPF_CNPJ),
    FOREIGN KEY (codigo_compra) REFERENCES produto(codigo)
);
                    
CREATE TABLE venda (
    id_venda int2 PRIMARY KEY,
    codigo_venda char(13),
    cliente varchar(225),
    data_venda date,
    unidade_venda varchar(20),
    quantidade_venda int2,
    preco_unitario_venda decimal(6,2),
    FOREIGN KEY (codigo_venda) REFERENCES produto(codigo),
    FOREIGN KEY (cliente) REFERENCES cliente(CPF_CNPJ)
);
                   
CREATE TABLE dados_saude (
    cpf_cliente varchar(20),
    alergias varchar(225),
    medicamentos_controlados varchar(225),
    observacoes_medicas text,
    FOREIGN KEY (cpf_cliente) REFERENCES cliente(CPF_CNPJ)
);

-- preencher

INSERT INTO fornecedor (CPF_CNPJ, nome, endereco, telefone, ramo_de_atividade) VALUES
('12345678000199', 'Distribuidora Saúde LTDA', 'Rua das Flores, 123 - Centro', '11988887777', 'Medicamentos'),
('98765432000188', 'Farmabem Distribuições', 'Av. Paulista, 1000 - Bela Vista', '1122223333', 'Cosméticos'),
('11122233000100', 'BemEstar Suplementos', 'Rua Verde, 45 - Jardim', '1133334444', 'Suplementos'),
('22233344000177', 'Vida e Higiene S.A.', 'Rua Azul, 200 - Industrial', '1144445555', 'Higiene');

INSERT INTO produto (codigo, nome, unidade, apresentacao, tipo_produto, dados_medicamento) VALUES
('7891001234567', 'Paracetamol', 'mg', 'caixa', 'Medicamento', ROW('1234567','Tarja Vermelha', 0, 0)),
('7891002345674' , 'Clonazepam', 'mg', 'caixa', 'Medicamento', ROW('2345678','Tarja Preta', 1, 1)),
('7891003456781', 'Shampoo Anticaspa', 'ml', 'frasco', 'Cosmético', NULL),
('7891004567898', 'Vitamina C', 'mg', 'caixa', 'Suplemento', NULL),
('7891005678904', 'Amoxicilina', 'mg', 'caixa', 'Medicamento', ROW('3456789','Tarja Vermelha', 0, 1)),
('7891006789011', 'Sabonete Neutro', 'g', 'barra', 'Higiene', NULL),
('7891007890128', 'Dipirona Sódica', 'mg', 'caixa', 'Medicamento', ROW('4567890','Tarja Vermelha', 0, 0)),
('7891008901235', 'Escova Dental', 'unidade', 'embalagem', 'Higiene', NULL),
('7891009012342', 'Colágeno Hidrolisado', 'g', 'frasco', 'Suplemento', NULL),
('7891010123459', 'Álcool 70%', 'ml', 'frasco', 'Higiene', NULL),
('7891011234566', 'Protetor Solar FPS 60', 'ml', 'frasco', 'Cosmético', NULL),
('7891012345673', 'Ômega 3', 'mg', 'caixa', 'Suplemento', NULL),
('7891013456780', 'Ivermectina', 'mg', 'caixa', 'Medicamento', ROW('6789012','Tarja Vermelha', 0, 1)),
('7891014567897', 'Lenço Umedecido', 'unidade', 'pacote', 'Higiene', NULL),
('7891015678903', 'Sabonete Íntimo', 'ml', 'frasco', 'Cosmético', NULL);

INSERT INTO cliente (CPF_CNPJ, nome, endereco, telefone, data_nascimento, data_cadastro, ramo_de_atividade, necessidades_especiais, aposentado) VALUES
('12345678900', 'João da Silva', 'Rua das Acácias, 123, Centro, Belo Horizonte - MG', '31999998888', '1950-05-10', '2024-01-15', 'Cliente PF', FALSE, TRUE),
('98765432111', 'Maria Oliveira', 'Av. Brasil, 456, Savassi, Belo Horizonte - MG', '31988887777', '1992-11-23', '2024-02-20', 'Cliente PF', FALSE, FALSE),
('11122233344', 'Carlos Souza', 'Rua das Flores, 789, Funcionários, Belo Horizonte - MG', '31977776666', '1975-08-30', '2024-03-10', 'Cliente PF', TRUE, FALSE),
('12345678000101', 'Comercial ABC Ltda', 'Rua do Comércio, 1000, Centro, Contagem - MG', '3133334444', NULL, '2024-01-05', 'Varejo', FALSE, FALSE),
('98765432000199', 'Construtora XYZ S/A', 'Av. dos Trabalhadores, 2000, Industrial, Betim - MG', '3134445555', NULL, '2024-02-01', 'Construção Civil', FALSE, FALSE),
('11223344000155', 'Tech Solutions ME', 'Rua da Inovação, 300, Santa Efigênia, Belo Horizonte - MG', '3135556666', NULL, '2024-03-01', 'Tecnologia', FALSE, FALSE);

INSERT INTO compra (id_compra, fornecedor, codigo_compra, data_compra, data_validade, unidade_compra, quantidade_compra, preco_unitario_compra) VALUES
(1, '12345678000199', '7891001234567', '2025-01-10', '2026-01-10', 'caixa', 10, 2.50),
(2, '98765432000188', '7891003456781', '2025-02-15', '2026-02-15', 'frasco', 20, 5.75),
(3, '11122233000100', '7891004567898', '2025-03-01', '2026-03-01', 'caixa', 15, 3.20),
(4, '22233344000177', '7891006789011', '2025-03-10', '2026-03-10', 'barra', 30, 1.99),
(5, '12345678000199', '7891005678904', '2025-03-20', '2026-03-20', 'caixa', 8, 4.10),
(6, '98765432000188', '7891011234566', '2025-04-01', '2026-04-01', 'frasco', 6, 15.90),
(7, '11122233000100', '7891004567898', '2025-04-05', '2026-04-05', 'caixa', 20, 3.10),
(8, '22233344000177', '7891010123459', '2025-04-10', '2026-04-10', 'frasco', 50, 2.75),
(9, '12345678000199', '7891013456780', '2025-04-15', '2026-04-15', 'caixa', 12, 6.00),
(10, '98765432000188', '7891015678903', '2025-04-20', '2026-04-20', 'frasco', 18, 8.40);

INSERT INTO venda (id_venda, codigo_venda, cliente, data_venda, unidade_venda, quantidade_venda, preco_unitario_venda) VALUES
(1, '7891001234567', '12345678900', '2025-04-01', 'caixa', 2, 3.50),
(2, '7891003456781', '98765432111', '2025-04-02', 'frasco', 1, 6.00),
(3, '7891004567898', '11122233344', '2025-04-03', 'caixa', 3, 3.50),
(4, '7891001234567', '12345678900', '2025-04-05', 'caixa', 1, 3.50),
(5, '7891003456781', '98765432111', '2025-04-06', 'frasco', 2, 6.00),
(6, '7891006789011', '12345678000101', '2025-04-07', 'barra', 10, 2.10),
(7, '7891006789011', '98765432111', '2025-04-08', 'barra', 5, 2.10),
(8, '7891013456780', '11122233344', '2025-04-09', 'caixa', 1, 6.50),
(9, '7891013456780', '12345678900', '2025-04-10', 'caixa', 2, 6.50),
(10, '7891001234567', '98765432111', '2025-04-11', 'caixa', 1, 3.50);

INSERT INTO dados_saude (cpf_cliente, alergias, medicamentos_controlados, observacoes_medicas) VALUES
('12345678900', 'Amoxicilina', 'Clonazepam', 'Histórico de AVC');

-- juntar

SELECT * 
FROM fornecedor 
INNER JOIN compra ON compra.fornecedor = fornecedor.CPF_CNPJ;

SELECT * 
FROM compra 
INNER JOIN produto ON compra.codigo_compra = produto.codigo;

SELECT * 
FROM produto 
INNER JOIN venda ON venda.codigo_venda = produto.codigo;

SELECT * 
FROM venda 
INNER JOIN cliente ON venda.cliente = cliente.CPF_CNPJ;

SELECT * 
FROM cliente 
LEFT JOIN dados_saude ON cliente.CPF_CNPJ = dados_saude.CPF_CLIENTE;

SELECT * 
FROM produto 
FULL OUTER JOIN venda ON produto.codigo = venda.codigo_venda 
FULL OUTER JOIN cliente ON venda.cliente = cliente.CPF_CNPJ;

-- inserir

INSERT INTO produto (codigo, nome, unidade, apresentacao, tipo_produto, dados_medicamento) VALUES
(7891016789010, 'Multivitaminico Adulto', 'ml', 'caixa', 'Suplemento', NULL),
(7891017890127, 'Desodorante Roll-On', 'ml', 'frasco', 'Cosmético', NULL),
(7891018901234, 'Antiácido Mastigável', 'mg', 'frasco', 'Suplemento', ROW('5678901','Tarja Vermelha', 0, 0)),
(7891019012341, 'Sabonete Líquido', 'ml', 'frasco', 'Higiene', NULL);

INSERT INTO compra (id_compra, fornecedor, codigo_compra, data_compra, data_validade, unidade_compra, quantidade_compra, preco_unitario_compra) VALUES
(11, '12345678000199', 7891016789010, '2025-04-01', '2026-04-01', 'caixa', 10, 4.50),
(12, '98765432000188', 7891017890127, '2025-04-02', '2026-02-28', 'frasco', 20, 3.20),
(13, '11122233000100', 7891018901234, '2025-04-03', '2026-04-30', 'caixa', 15, 5.10),
(14, '22233344000177', 7891019012341, '2025-04-04', '2026-03-31', 'frasco', 12, 2.80);

SELECT * FROM compra WHERE id_compra >= 11;

-- Reduzir

INSERT INTO venda (id_venda, codigo_venda, cliente, data_venda, unidade_venda, quantidade_venda, preco_unitario_venda) VALUES
(11, '7891016789010', '12345678900', '2025-04-05', 'caixa', 10, 4.50),
(12, '7891017890127', '98765432111', '2025-04-06', 'frasco', 20, 3.20),
(13, '7891018901234', '12345678900', '2025-04-07', 'caixa', 5, 5.10),
(14, '7891019012341', '98765432111', '2025-04-08', 'frasco', 6, 2.80),
(15, '7891018901234', '11122233344', '2025-04-09', 'caixa', 3, 5.10);

SELECT produto.codigo, produto.nome, sum(venda.quantidade_venda) AS quantidade 
FROM venda 
INNER JOIN produto ON venda.codigo_venda = produto.codigo 
WHERE venda.id_venda >= 11 
GROUP BY produto.codigo 
ORDER BY produto.nome;

SELECT produto.codigo, produto.nome, sum(compra.quantidade_compra - venda.quantidade_venda) AS estoque_restante 
FROM venda 
INNER JOIN compra ON venda.codigo_venda = compra.codigo_compra 
INNER JOIN produto ON compra.codigo_compra = produto.codigo 
GROUP BY produto.codigo 
ORDER BY nome;

SELECT produto.codigo, produto.nome, sum(compra.quantidade_compra - venda.quantidade_venda) AS estoque_restante 
FROM venda 
INNER JOIN compra ON venda.codigo_venda = compra.codigo_compra 
INNER JOIN produto ON compra.codigo_compra = produto.codigo 
GROUP BY produto.codigo 
HAVING sum(compra.quantidade_compra - venda.quantidade_venda) = 0;

-- Remover

SELECT produto.codigo 
FROM venda 
INNER JOIN compra ON venda.codigo_venda = compra.codigo_compra 
INNER JOIN produto ON compra.codigo_compra = produto.codigo 
GROUP BY produto.codigo 
HAVING sum(compra.quantidade_compra - venda.quantidade_venda) = 0;

DELETE FROM compra 
WHERE codigo_compra IN (
    SELECT produto.codigo 
    FROM venda 
    INNER JOIN compra ON venda.codigo_venda = compra.codigo_compra 
    INNER JOIN produto ON compra.codigo_compra = produto.codigo 
    GROUP BY produto.codigo 
    HAVING sum(compra.quantidade_compra - venda.quantidade_venda) = 0
);

DELETE FROM venda 
WHERE codigo_venda IN (
    SELECT produto.codigo 
    FROM venda 
    INNER JOIN compra ON venda.codigo_venda = compra.codigo_compra 
    INNER JOIN produto ON compra.codigo_compra = produto.codigo 
    GROUP BY produto.codigo 
    HAVING sum(compra.quantidade_compra - venda.quantidade_venda) = 0
);

DELETE FROM produto 
WHERE codigo IN (
    SELECT produto.codigo 
    FROM venda 
    INNER JOIN compra ON venda.codigo_venda = compra.codigo_compra 
    INNER JOIN produto ON compra.codigo_compra = produto.codigo 
    GROUP BY produto.codigo 
    HAVING sum(compra.quantidade_compra - venda.quantidade_venda) = 0
);

-- Alterar

UPDATE produto
SET 
    nome = 'Multivitamínico Adulto',
    unidade = 'mg'
WHERE codigo = '7891016789010';

UPDATE produto
SET 
    apresentacao = 'caixa',
    tipo_produto = 'Medicamento'
WHERE codigo = '7891018901234';

-- Relatorio 1

DROP VIEW mais_vendidos;

CREATE VIEW mais_vendidos AS 
SELECT codigo, nome, unidade, apresentacao, tipo_produto, sum(quantidade_venda) 
FROM produto 
INNER JOIN venda ON produto.codigo = venda.codigo_venda 
GROUP BY codigo 
ORDER BY sum(quantidade_venda) DESC, nome;

-- Relatorio 2

SELECT produto.codigo, produto.nome, produto.tipo_produto, sum(quantidade_venda * (preco_unitario_venda -preco_unitario_compra)) AS valor_total 
FROM compra 
INNER JOIN produto ON produto.codigo = compra.codigo_compra 
INNER JOIN venda ON produto.codigo = venda.codigo_venda 
GROUP BY produto.codigo 
ORDER BY tipo_produto, sum(quantidade_venda * (preco_unitario_venda -preco_unitario_compra)) DESC, nome;

DROP VIEW lucro_prejuizo;

CREATE VIEW lucro_prejuizo AS 
SELECT produto.codigo, produto.nome, produto.tipo_produto, 
    SUM(quantidade_venda * (
        (1 - (
            (COALESCE((EXTRACT(YEAR FROM AGE(data_venda, data_nascimento)) > 60)::int, 0) + 
            COALESCE((EXTRACT(YEAR FROM AGE(data_venda, data_cadastro)) > 2)::int, 0) + 
            COALESCE(aposentado::int, 0) + 
            COALESCE(necessidades_especiais::int, 0)
        ) * 0.10)
    ) * preco_unitario_venda - preco_unitario_compra)) AS valor_total 
FROM compra 
INNER JOIN produto ON produto.codigo = compra.codigo_compra 
INNER JOIN venda ON produto.codigo = venda.codigo_venda 
INNER JOIN cliente ON venda.cliente = cliente.cpf_cnpj 
GROUP BY produto.codigo 
ORDER BY tipo_produto, SUM(quantidade_compra * preco_unitario_compra) DESC, produto.nome;

-- Relatorio 3

DROP VIEW estoque;

CREATE VIEW estoque AS 
SELECT codigo, nome, SUM(quantidade_compra - COALESCE(quantidade_venda,0)) AS quantidade_estoque
FROM compra 
INNER JOIN produto ON produto.codigo = compra.codigo_compra 
LEFT JOIN venda ON produto.codigo = venda.codigo_venda 
GROUP BY codigo 
ORDER BY nome;