-- 1. Média geral de notas por estado
SELECT 
  e.nome AS estado,
  ROUND(AVG(n.nota_geral), 2) AS media_geral
FROM enem n
JOIN estado e ON n.id_estado = e.id_estado
GROUP BY e.nome
ORDER BY media_geral DESC;

-- 2. Comparação de desempenho por gênero
SELECT 
  g.descricao AS genero,
  ROUND(AVG(n.nota_matematica), 1) AS media_matematica,
  ROUND(AVG(n.nota_redacao), 1) AS media_redacao,
  ROUND(AVG(n.nota_geral), 1) AS media_geral
FROM enem n
JOIN genero g ON n.id_genero = g.id_genero
GROUP BY g.descricao;

-- 3. Média de nota geral por faixa de renda
SELECT 
  r.faixa AS renda_familiar,
  ROUND(AVG(n.nota_geral), 1) AS media_geral
FROM enem n
JOIN renda r ON n.id_renda = r.id_renda
GROUP BY r.faixa
ORDER BY media_geral DESC;

-- 4. Presença e ausência por tipo de escola
SELECT 
  e.tipo AS tipo_escola,
  SUM(CASE WHEN n.presenca = 'sim' THEN 1 ELSE 0 END) AS presentes,
  SUM(CASE WHEN n.presenca = 'nao' THEN 1 ELSE 0 END) AS ausentes
FROM enem n
JOIN escola e ON n.id_escola = e.id_escola
GROUP BY e.tipo;

-- 5. Ranking dos melhores desempenhos individuais
SELECT 
  n.id_aluno,
  es.sigla AS estado,
  g.descricao AS genero,
  n.nota_geral
FROM enem n
JOIN estado es ON n.id_estado = es.id_estado
JOIN genero g ON n.id_genero = g.id_genero
ORDER BY n.nota_geral DESC
LIMIT 5;