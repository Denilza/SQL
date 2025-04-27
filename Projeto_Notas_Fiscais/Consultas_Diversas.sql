
--Buscar informações da nota fiscal junto com dados do cliente e do vendedor
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


--Listar os itens de cada nota fiscal junto com o nome dos produtos

SELECT
    inf.NUMERO,
    inf.CODIGO_DO_PRODUTO,
    p.NOME_DO_PRODUTO,
    inf.QUANTIDADE,
    inf.PRECO
FROM
    ITENS_NOTAS_FISCAIS inf
INNER JOIN TABELA_DE_PRODUTOS p ON inf.CODIGO_DO_PRODUTO = p.CODIGO_DO_PRODUTO;


--Trazer uma visão geral da venda: Cliente, Produto, Vendedor e Nota Fiscal

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

--Exibir o total pago em cada item (preço × quantidade)

SELECT
    inf.NUMERO,
    p.NOME_DO_PRODUTO,
    inf.QUANTIDADE,
    inf.PRECO,
    (inf.QUANTIDADE * inf.PRECO) AS TOTAL_ITEM
FROM
    ITENS_NOTAS_FISCAIS inf
INNER JOIN TABELA_DE_PRODUTOS p ON inf.CODIGO_DO_PRODUTO = p.CODIGO_DO_PRODUTO;

--Listar todas as compras de um cliente específico (exemplo por CPF)

SELECT
    c.NOME,
    nf.NUMERO,
    nf.DATA_VENDA,
    p.NOME_DO_PRODUTO,
    inf.QUANTIDADE,
    inf.PRECO
FROM
    TABELA_DE_CLIENTES c
INNER JOIN NOTAS_FISCAIS nf ON c.CPF = nf.CPF
INNER JOIN ITENS_NOTAS_FISCAIS inf ON nf.NUMERO = inf.NUMERO
INNER JOIN TABELA_DE_PRODUTOS p ON inf.CODIGO_DO_PRODUTO = p.CODIGO_DO_PRODUTO
WHERE
    c.CPF = '12345678900'; -- Trocar para o CPF desejado
