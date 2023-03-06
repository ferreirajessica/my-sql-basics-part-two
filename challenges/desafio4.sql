SELECT CONCAT(u.first_name, ' ', u.last_name) AS pessoa_usuaria,
      IF(YEAR(MAX(h.last_played)) >= 2021, 'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM user AS u
JOIN history AS h ON u.id = h.user_id
GROUP BY u.id
ORDER BY CONCAT(u.first_name, ' ', u.last_name);
