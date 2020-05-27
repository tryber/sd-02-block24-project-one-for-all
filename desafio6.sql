use SpotifyClone;
create view faturamento_atual as
select
min(pl.valor_plano) as faturamento_minimo,
max(pl.valor_plano) as faturamento_maximo,
round(avg(pl.valor_plano), 6) as faturamento_medio,
sum(pl.valor_plano) as faturamento_total
from SpotifyClone.usuarios as us
inner join SpotifyClone.planos as pl on pl.id = us.plano_id;
