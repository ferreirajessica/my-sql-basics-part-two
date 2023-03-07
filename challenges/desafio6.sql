SELECT
(SELECT FORMAT(value, 2) FROM subscriptions WHERE type = 'Gratuito') AS faturamento_minimo,
(SELECT FORMAT(value, 2) FROM subscriptions WHERE type = 'Familiar') AS faturamento_maximo,
(SELECT FORMAT(SUM(s.value)/COUNT(u.id), 2) AS total_value
FROM users AS u
JOIN subscriptions AS s ON s.id = u.subscription_id) AS faturamento_medio,
(SELECT FORMAT(SUM(s.value), 2) AS total_value
FROM users AS u
JOIN subscriptions AS s ON s.id = u.subscription_id) AS faturamento_total;