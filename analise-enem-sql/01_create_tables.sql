CREATE TABLE estado (
  id_estado INT PRIMARY KEY,
  sigla VARCHAR(2),
  nome VARCHAR(100)
);

CREATE TABLE genero (
  id_genero INT PRIMARY KEY,
  descricao VARCHAR(20)
);

CREATE TABLE escola (
  id_escola INT PRIMARY KEY,
  tipo VARCHAR(20)
);

CREATE TABLE renda (
  id_renda INT PRIMARY KEY,
  faixa VARCHAR(20)
);

CREATE TABLE enem (
  id_aluno INT PRIMARY KEY,
  id_estado INT,
  id_genero INT,
  id_escola INT,
  id_renda INT,
  nota_matematica FLOAT,
  nota_redacao FLOAT,
  nota_geral FLOAT,
  presenca VARCHAR(10),
  FOREIGN KEY (id_estado) REFERENCES estado(id_estado),
  FOREIGN KEY (id_genero) REFERENCES genero(id_genero),
  FOREIGN KEY (id_escola) REFERENCES escola(id_escola),
  FOREIGN KEY (id_renda) REFERENCES renda(id_renda)
);