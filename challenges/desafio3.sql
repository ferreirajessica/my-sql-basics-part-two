SELECT CONCAT(u.first_name, ' ', u.last_name) AS pessoa_usuaria,
       COUNT(h.song_id) AS musicas_ouvidas,
       ROUND(SUM(s.length/60), 2) AS total_minutos
FROM user AS u 
JOIN history AS h ON u.id = h.user_id 
JOIN song AS s ON h.song_id = s.id 
GROUP BY u.id
ORDER BY CONCAT(u.first_name, ' ', u.last_name) ASC;