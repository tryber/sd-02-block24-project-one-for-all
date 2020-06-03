/* Desafio 6 Queremos algumas informações sobre o faturamento da empresa.Tenha como base o valor dos
planos e o plano que cada usuário ou usuária cadastrado possui no banco.Crie uma VIEW chamada faturamento_atual
que deve exibir quatro dados.A primeira coluna deve exibir o mínimo faturado com planos da Spotify,
com o apelido de "faturamento_minimo".A segunda coluna deve exibir o valor máximo faturado,
com o apelido de "faturamento_maximo".A terceira coluna deve exibir o valor médio faturado até o momento,
com o apelido de "faturamento_medio".Por fim, a quarta coluna deve exibir o faturamento total,
com o apelido de "faturamento_total".
 */

CREATE VIEW faturamento_atual AS
SELECT
  MIN(pl.price) AS faturamento_minimo,
  MAX(pl.price) AS faturamento_maximo,
  AVG(pl.price) AS faturamento_medio,
  SUM(pl.price) AS faturamento_total
FROM
  SpotifyClone.plans AS pl
INNER JOIN SpotifyClone.plans_purchases AS ppur ON pl.id = ppur.plan_id;
