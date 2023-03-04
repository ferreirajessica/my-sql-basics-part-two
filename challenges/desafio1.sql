DROP DATABASE IF EXISTS SpotiFyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE artist (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE album (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
  name VARCHAR(50) NOT NULL,
  artist_id INT,
  release_year YEAR NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artist (id)
);

CREATE TABLE song (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  title VARCHAR(50) NOT NULL,
  artist_id INT,
  album_id INT, 
  length INT NOT NULL
);

CREATE TABLE subscription (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  type VARCHAR(50) NOT NULL,
  value DOUBLE NOT NULL
);

CREATE TABLE user (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  age VARCHAR(3) NOT NULL,
  subscription_id INT,
  signed_up DATE,
  FOREIGN KEY (subscription_id) REFERENCES subscription (id)
);

CREATE TABLE following (
   user_id INT,
   artist_id INT,
   FOREIGN KEY (user_id) REFERENCES user (id),
   FOREIGN KEY (artist_id) REFERENCES artist (id)
);

CREATE TABLE history (
    user_id INT,
    song_id INT,
    last_played DATETIME,
    FOREIGN KEY (user_id) REFERENCES user (id),
    FOREIGN KEY (song_id) REFERENCES song (id)
);

INSERT INTO artist (name)
VALUES 
    ('beyonce'),
    ('queen'),
    ('elis regina'),
    ('baco exu do blues'),
    ('blind guardian'),
    ('nina simone');
  
 INSERT INTO album (name, artist_id, release_year)
 VALUES
     ('renaissance',  1,  2022),
     ('jazz',  2, 1978 ),
     ('hot space', 2, 1982),
     ('falso brilhante', 3, 1998),
     ('vento de maio', 3, 2001),
     ('qvvjfa', 4, 2003),
     ('somewhere far beyond', 5, 2007),
     ('i put a spell on you', 6, 2012);
   
   INSERT INTO song (title, artist_id, album_id, length)
   VALUES 
     ('break my soul', 1, 1, 279),
     ('virgo\'s groove', 1, 1, 369),
     ('alien superstar', 1, 1, 116),
     ('don\'t stop me now', 2, 2, 203),
     ('under pressure', 2, 3, 152),
     ('como nossos pais', 3, 4, 105),
     ('o medo de amar é o medo de ser livre', 3, 5, 207),
     ('samba em paris', 4, 6, 267),
     ('the bards song', 5, 7, 244),
     ('feeling good', 6, 8, 100);
   
   INSERT INTO subscription (type, value)
   VALUES
     ('gratuito', 0.00),
     ('pessoal', 6.99),
     ('universitario', 5.99),
     ('familiar', 7.99);
     


     
INSERT INTO user (first_name, last_name, age, subscription_id, signed_up)
VALUES 
  ('barbara', 'liskov', 82, 1, '2019-10-20'),
  ('robert', 'cecil martin', 58, 1, '2017-01-06'),
  ('ada', 'lovelace', 37, 4,  '2017-12-30'),
  ('martin', 'fowler', 46, 4, '2017-01-17'),
  ('sandi', 'metz', 58, 4, '2018-04-29'),
  ('paulo', 'freire', 19, 3, '2018-02-14'),
  ('bell', 'hooks', 26, 3, '2018-01-05'),
  ('christopher', 'alexander', 85, 2, '2019-06-05'),
  ('judith', 'butler', 45, 2, '2020-05-13'),
  ('jorge', 'amado', 58, 2, '2017-02-17');
  
  INSERT INTO following (user_id, artist_id)
  VALUES
  (1, 1),
  (1, 3),
  (1, 2),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (8, NULL),
  (9, 3),
  (10, 2);
  
  
    INSERT into history (user_id, song_id, last_played)
    VALUES
	  (1, 8, '2022-02-28 10:45:55'),
	  (1, 2, '2020-05-02 05:30:35'),
	  (1, 10, '2020-03-06 11:22:33'),
	  (2, 10, '2022-08-05 08:05:17' ),
      (2, 7, '2020-01-02 07:40:33'),
      (3, 2, '2020-11-13 16:55:13'),
	  (3, 10, '2020-12-05 18:38:30'),
	  (4, 8, '2021-08-15 17:10:10'),
	  (5, 8, '2022-01-09 01:44:33'),
      (5, 5, '2020-08-06 15:23:43'),
      (6, 7, '2017-01-24 00:31:17'),
      (6, 1, '2017-10-12 12:35:20'),
      (7, 4, '2011-12-15 22:30:49'),
      (8, 4, '2012-03-17 14:56:41'),
      (9, 9, '2022-02-24 21:14:22'),
      (10, 3, '2015-12-13 08:30:22');
      

  