

-- Tabela: estado
INSERT INTO dbo.estado (id_estado, sigla, nome) VALUES
(1, 'SP', 'S�o Paulo'),
(2, 'RJ', 'Rio de Janeiro'),
(3, 'MG', 'Minas Gerais');

-- Tabela: genero
INSERT INTO dbo.genero (id_genero, descricao) VALUES
(1, 'Masculino'),
(2, 'Feminino');

-- Tabela: escola
INSERT INTO dbo.escola (id_escola, tipo) VALUES
(1, 'Publica'),
(2, 'Privada');

-- Tabela: renda
INSERT INTO dbo.renda (id_renda, faixa) VALUES
(1, 'Baixa'),
(2, 'Media'),
(3, 'Alta');

-- Tabela: enem (registros principais dos alunos)
INSERT INTO dbo.enem (
  id_aluno, id_estado, id_genero, id_escola, id_renda,
  nota_matematica, nota_redacao, nota_geral, presenca
) VALUES
(101, 1, 1, 1, 1, 450.0, 600.0, 525.0, 'sim'),
(102, 2, 2, 2, 3, 720.0, 880.0, 800.0, 'sim'),
(103, 3, 1, 1, 2, 500.0, 550.0, 525.0, 'nao'),
(104, 1, 2, 2, 2, 670.0, 700.0, 685.0, 'sim')

