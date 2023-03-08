SELECT art.name AS artista,
       alb.name AS album,
       COUNT(fol.artist_id) AS pessoas_seguidoras
FROM artists AS art
JOIN albums AS alb ON art.id = alb.artist_id
JOIN following AS fol ON art.id = fol.artist_id
GROUP BY art.name, alb.name
ORDER BY COUNT(fol.artist_id) DESC, art.name, alb.name;