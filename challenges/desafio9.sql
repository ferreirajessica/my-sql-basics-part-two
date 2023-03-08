SELECT COUNT(h.song_id) AS musicas_no_historico
FROM users AS u
JOIN history AS h ON u.id = h.user_id
WHERE CONCAT(u.first_name, ' ', u.last_name) = 'Barbara Liskov'
GROUP BY CONCAT(u.first_name, ' ', u.last_name);