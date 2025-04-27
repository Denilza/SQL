
-- Informações de Nota Fiscal + Cliente + Vendedor
CREATE VIEW vw_NotasFiscais_Clientes_Vendedores AS
SELECT
    nf.NUMERO,
    nf.DATA_VENDA,
    nf.IMPOSTO,
    c.NOME AS Nome_Cliente,
    v.NOME AS Nome_Vendedor
FROM
    NOTAS_FISCAIS nf
INNER JOIN TABELA_DE_CLIENTES c ON nf.CPF = c.CPF
INNER JOIN TABELA_DE_VENDEDORES v ON nf.MATRICULA = v.MATRICULA;


--Itens da Nota Fiscal + Produtos

CREATE VIEW vw_ItensNotas_Produtos AS
SELECT
    inf.NUMERO,
    inf.CODIGO_DO_PRODUTO,
    p.NOME_DO_PRODUTO,
    inf.QUANTIDADE,
    inf.PRECO
FROM
    ITENS_NOTAS_FISCAIS inf
INNER JOIN TABELA_DE_PRODUTOS p ON inf.CODIGO_DO_PRODUTO = p.CODIGO_DO_PRODUTO;


--Visão Geral de Vendas (Cliente + Produto + Vendedor)

CREATE VIEW vw_Venda_Completa2 AS
SELECT
    nf.NUMERO,
    nf.DATA_VENDA,
    c.NOME AS Nome_Cliente,
    v.NOME AS Nome_Vendedor,
    p.NOME_DO_PRODUTO,
    inf.QUANTIDADE,
    inf.PRECO
FROM
    NOTAS_FISCAIS nf
INNER JOIN TABELA_DE_CLIENTES c ON nf.CPF = c.CPF
INNER JOIN TABELA_DE_VENDEDORES v ON nf.MATRICULA = v.MATRICULA
INNER JOIN ITENS_NOTAS_FISCAIS inf ON nf.NUMERO = inf.NUMERO
INNER JOIN TABELA_DE_PRODUTOS p ON inf.CODIGO_DO_PRODUTO = p.CODIGO_DO_PRODUTO;

--Total por Item (Preço × Quantidade)

CREATE VIEW vw_Total_Item AS
SELECT
    inf.NUMERO,
    p.NOME_DO_PRODUTO,
    inf.QUANTIDADE,
    inf.PRECO,
    (inf.QUANTIDADE * inf.PRECO) AS TOTAL_ITEM
FROM
    ITENS_NOTAS_FISCAIS inf
INNER JOIN TABELA_DE_PRODUTOS p ON inf.CODIGO_DO_PRODUTO = p.CODIGO_DO_PRODUTO;




