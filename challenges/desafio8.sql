SELECT art.name AS artista,
       alb.name AS album
FROM artists AS art
JOIN albums AS alb ON art.id = alb.artist_id
HAVING art.name = 'Elis Regina';