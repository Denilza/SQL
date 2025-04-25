CREATE TABLE [estado] (
  [id_estado] int PRIMARY KEY,
  [sigla] varchar(2),
  [nome] varchar(50)
)
GO

CREATE TABLE [genero] (
  [id_genero] int PRIMARY KEY,
  [descricao] varchar(20)
)
GO

CREATE TABLE [escola] (
  [id_escola] int PRIMARY KEY,
  [tipo] varchar(20)
)
GO

CREATE TABLE [renda] (
  [id_renda] int PRIMARY KEY,
  [faixa] varchar(20)
)
GO

CREATE TABLE [enem] (
  [id_aluno] int PRIMARY KEY,
  [id_estado] int,
  [id_genero] int,
  [id_escola] int,
  [id_renda] int,
  [nota_matematica] float,
  [nota_redacao] float,
  [nota_geral] float,
  [presenca] varchar(3)
)
GO

ALTER TABLE [enem] ADD FOREIGN KEY ([id_estado]) REFERENCES [estado] ([id_estado])
GO

ALTER TABLE [enem] ADD FOREIGN KEY ([id_genero]) REFERENCES [genero] ([id_genero])
GO

ALTER TABLE [enem] ADD FOREIGN KEY ([id_escola]) REFERENCES [escola] ([id_escola])
GO

ALTER TABLE [enem] ADD FOREIGN KEY ([id_renda]) REFERENCES [renda] ([id_renda])
GO
