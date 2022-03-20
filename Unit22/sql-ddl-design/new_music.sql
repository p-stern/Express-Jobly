-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE "artists" (
    "id" SERIAL   NOT NULL,
    "artist" TEXT   NOT NULL,
    CONSTRAINT "pk_artists" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "albums" (
    "id" SERIAL   NOT NULL,
    "album" TEXT   NOT NULL,
    CONSTRAINT "pk_albums" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "album_detail" (
    "id" SERIAL   NOT NULL,
    "release_date" DATE   NOT NULL,
    "title" TEXT   NOT NULL,
    "duration_in_seconds" int   NOT NULL,
    "albumid" int   NOT NULL,
    CONSTRAINT "pk_album_detail" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "producers" (
    "id" SERIAL   NOT NULL,
    "producer" TEXT   NOT NULL,
    CONSTRAINT "pk_producers" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "songs" (
    "id" serial   NOT NULL,
    "artistid" int   NOT NULL,
    "albumid" int   NOT NULL,
    "producerid" int   NOT NULL,
    CONSTRAINT "pk_songs" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "album_detail" ADD CONSTRAINT "fk_album_detail_albumid" FOREIGN KEY("albumid")
REFERENCES "albums" ("id");

ALTER TABLE "songs" ADD CONSTRAINT "fk_songs_artistid" FOREIGN KEY("artistid")
REFERENCES "artists" ("id");

ALTER TABLE "songs" ADD CONSTRAINT "fk_songs_albumid" FOREIGN KEY("albumid")
REFERENCES "albums" ("id");

ALTER TABLE "songs" ADD CONSTRAINT "fk_songs_producerid" FOREIGN KEY("producerid")
REFERENCES "producers" ("id");

INSERT INTO artists
  (artist)
VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Cary'),
  ('Boyz II Men'),
  ('Lady Gaga'),
  ('Bradley Cooper'),
  ('Nickelback'),
  ('Jay Z'),
  ('Alicia Keys'),
  ('Katy Perry'),
  ('Juicy J'),
  ('Maroon 5'),
  ('Christina Aguilera'),
  ('Avril Lavigne'),
  ('Destiny''s Child');

INSERT INTO albums
  (album)
VALUES
  ('Middle of Nowhere'),
  ('A Night at the Opera'),
  ('Daydream'),
  ('A Star Is Born'),
  ('Silver Side Up'),
  ('The Blueprint 3'),
  ('Prism'),
  ('Hands All Over'),
  ('Let Go'),
  ('The Writing''s on the Wall');

INSERT INTO album_detail
  (release_date, title, duration_in_seconds, albumid)
VALUES
  ('04-15-1997', 'MMMBop', 238, 1),
  ('10-31-1975', 'Bohemian Rhapsody', 355, 2),
  ('11-14-1995', 'One Sweet Day', 282, 3),
  ('09-27-2018', 'Shallow', 216, 4),
  ('08-21-2001', 'How You Remind Me', 223, 5),
  ('10-20-2009', 'New York State of Mind', 276, 6),
  ('12-17-2013', 'Dark Horse', 215, 7),
  ('06-21-2011', 'Moves Like Jagger', 201, 8),
  ('05-14-2002', 'Complicated', 244, 9),
  ('11-07-1999', 'Say My Name', 240, 10);
  
INSERT INTO producers
  (producer)
VALUES
  ('Dust Brothers'),
  ('Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin'),
  ('Cirkut'),
  ('Shellback'),
  ('Benny Blanco'),
  ('The Matrix'),
  ('Darkchild');

INSERT INTO songs
  (artistid, albumid, producerid)
VALUES
  (1, 1, 1),
  (1, 1, 2),
  (2, 2, 3),
  (3, 3, 4),
  (4, 3, 4),
  (5, 4, 5),
  (6, 4, 5),
  (7, 5, 6),
  (8, 6, 7),
  (9, 6, 7),
  (10, 7, 8),
  (10, 7, 9),
  (11, 7, 8),
  (11, 7, 9),
  (12, 8, 10),
  (12, 8, 11),
  (13, 8, 10),
  (13, 8, 11),
  (14, 9, 12),
  (15, 10, 13);
