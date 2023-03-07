SELECT  s.title AS cancao,	  
       COUNT(h.song_id) AS reproducoes
FROM history AS h
JOIN songs AS s ON s.id = h.song_id
GROUP BY h.song_id
ORDER BY COUNT(h.song_id) DESC, title ASC LIMIT 2;