-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE "planet" (
    "id" SERIAL   NOT NULL,
    "name" TEXT   NOT NULL,
    "orbit_period" float   NOT NULL,
    CONSTRAINT "pk_planet" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "orbits" (
    "id" SERIAL   NOT NULL,
    "orbits_around" TEXT   NOT NULL,
    CONSTRAINT "pk_orbits" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "galaxy" (
    "id" SERIAL   NOT NULL,
    "galaxy" TEXT   NOT NULL,
    CONSTRAINT "pk_galaxy" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "moons" (
    "id" SERIAL   NOT NULL,
    "planetid" int   NOT NULL,
    "moon" TEXT   NOT NULL,
    CONSTRAINT "pk_moons" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "planets" (
    "planetid" int   NOT NULL,
    "orbitsid" int   NOT NULL,
    "galaxyid" int   NOT NULL
);

ALTER TABLE "moons" ADD CONSTRAINT "fk_moons_planetid" FOREIGN KEY("planetid")
REFERENCES "planet" ("id");

ALTER TABLE "planets" ADD CONSTRAINT "fk_planets_planetid" FOREIGN KEY("planetid")
REFERENCES "planet" ("id");

ALTER TABLE "planets" ADD CONSTRAINT "fk_planets_orbitsid" FOREIGN KEY("orbitsid")
REFERENCES "orbits" ("id");

ALTER TABLE "planets" ADD CONSTRAINT "fk_planets_galaxyid" FOREIGN KEY("galaxyid")
REFERENCES "galaxy" ("id");

INSERT INTO planet
  (name, orbit_period)
VALUES
  ('Earth', 1.00),
  ('Mars', 1.88),
  ('Venus', 0.62),
  ('Neptune', 164.8),
  ('Proxima Centauri b', 0.03),
  ('Gliese 876 b', 0.23);

INSERT INTO orbits
  (orbits_around)
VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

INSERT INTO galaxy
  (galaxy)
VALUES
  ('Milky Way');
  
INSERT INTO moons
  (planetid, moon)
VALUES
  (1,'The Moon'),
  (2,'Phobos'),
  (2,'Deimos'),
  (4,'Naiad'),
  (4,'Thalassa'),
  (4,'Despina'),
  (4,'Galatea'),
  (4,'Larissa'),
  (4,'S/2004 N 1'),
  (4,'Proteus'),
  (4,'Triton'),
  (4,'Nereid'),
  (4,'Halimede'),
  (4,'Sao'),
  (4,'Laomedeia'),
  (4,'Psamathe'),
  (4,'Neso');
  
INSERT INTO planets
  (planetid, orbitsid, galaxyid)
VALUES
    (1,1,1),
    (2,1,1),
    (3,1,1),
    (4,1,1),
    (5,2,1),
    (6,3,1);
