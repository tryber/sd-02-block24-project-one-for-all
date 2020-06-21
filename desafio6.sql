use SpotifyClone;
create view faturamento_atual as
select
min(price) as faturamento_minimo,
max(price) as faturamento_maxima,
avg(price) as faturamento_medio,
sum(price) as faturamento_total
from users u
inner join plans p on p.id = u.plan_id;
