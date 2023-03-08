DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE artists (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  name VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE albums (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
  name VARCHAR(50) NOT NULL,
  artist_id INT,
  release_year YEAR NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artists (id)
) engine = InnoDB;

CREATE TABLE songs (
  id INT AUTO_INCREMENT NOT NULL,
  title VARCHAR(50) NOT NULL,
  artist_id INT,
  album_id INT, 
  length INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY(artist_id) REFERENCES artists (id),
  FOREIGN KEY (album_id) REFERENCES albums (id)
) engine = InnoDB;

CREATE TABLE subscriptions (
  id INT AUTO_INCREMENT NOT NULL,
  type VARCHAR(50) NOT NULL,
  value DOUBLE NOT NULL,
  PRIMARY KEY (id)
) engine = InnoDB;

CREATE TABLE users (
  id INT AUTO_INCREMENT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  age VARCHAR(3) NOT NULL,
  subscription_id INT,
  signed_up DATE,
  PRIMARY KEY (id),
  FOREIGN KEY (subscription_id) REFERENCES subscriptions (id)
) engine = InnoDB;

CREATE TABLE following (
   user_id INT,
   artist_id INT,
   CONSTRAINT PRIMARY KEY (user_id, artist_id),
   FOREIGN KEY (user_id) REFERENCES users (id),
   FOREIGN KEY (artist_id) REFERENCES artists (id)
) engine = InnoDB;

CREATE TABLE history (
    user_id INT,
    song_id INT,
    last_played DATETIME,
    CONSTRAINT PRIMARY KEY (user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (song_id) REFERENCES songs (id)
) engine = InnoDB;

INSERT INTO artists (name)
VALUES 
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');
  
 INSERT INTO albums (name, artist_id, release_year)
 VALUES
     ('Renaissance',  1,  2022),
     ('Jazz',  2, 1978 ),
     ('Hot Space', 2, 1982),
     ('Falso Brilhante', 3, 1998),
     ('Vento de Maio', 3, 2001),
     ('QVVJFA?', 4, 2003),
     ('Somewhere Far Beyond', 5, 2007),
     ('I Put A Spell On You', 6, 2012);
   
   INSERT INTO songs (title, artist_id, album_id, length)
   VALUES 
     ('Break My Soul', 1, 1, 279),
     ('Virgo\'s Groove', 1, 1, 369),
     ('Alien Superstar', 1, 1, 116),
     ('Don\'t Stop Me Now', 2, 2, 203),
     ('Under Pressure', 2, 3, 152),
     ('Como Nossos Pais', 3, 4, 105),
     ('O Medo de Amar é o Medo de Ser Livre', 3, 5, 207),
     ('Samba em Paris', 4, 6, 267),
     ('The Bards Song', 5, 7, 244),
     ('Feeling Good', 6, 8, 100);
   
   INSERT INTO subscriptions (type, value)
   VALUES
     ('Gratuito', 0.00),
     ('Pessoal', 6.99),
     ('Universitario', 5.99),
     ('Familiar', 7.99);
     


     
INSERT INTO users (first_name, last_name, age, subscription_id, signed_up)
VALUES 
  ('Barbara', 'Liskov', 82, 1, '2019-10-20'),
  ('Robert', 'Cecil Martin', 58, 1, '2017-01-06'),
  ('Ada', 'Lovelace', 37, 4,  '2017-12-30'),
  ('Martin', 'Fowler', 46, 4, '2017-01-17'),
  ('Sandi', 'Metz', 58, 4, '2018-04-29'),
  ('Paulo', 'Freire', 19, 3, '2018-02-14'),
  ('Bell', 'Hooks', 26, 3, '2018-01-05'),
  ('Christopher', 'Alexander', 85, 2, '2019-06-05'),
  ('Judith', 'Butler', 45, 2, '2020-05-13'),
  ('Jorge', 'Amado', 58, 2, '2017-02-17');
  
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
      

  