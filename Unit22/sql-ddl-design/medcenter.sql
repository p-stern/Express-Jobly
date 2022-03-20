-- from the terminal run:
-- psql < med_center.sql

DROP DATABASE IF EXISTS med_center;

CREATE DATABASE med_center;

\c med_center

CREATE TABLE "doctor" (
    "doctorID" SERIAL   NOT NULL,
    "doctor" TEXT   NOT NULL,
    CONSTRAINT "pk_doctor" PRIMARY KEY (
        "doctorID"
     )
);

CREATE TABLE "patient" (
    "patientID" SERIAL   NOT NULL,
    "firstname" TEXT   NOT NULL,
    "lastname" TEXT   NOT NULL,
    CONSTRAINT "pk_patient" PRIMARY KEY (
        "patientID"
     )
);

CREATE TABLE "disease" (
    "diseaseID" SERIAL   NOT NULL,
    "desc" TEXT   NOT NULL,
    CONSTRAINT "pk_disease" PRIMARY KEY (
        "diseaseID"
     )
);

CREATE TABLE "hospital" (
    "doctorID" int   NOT NULL,
    "patientID" int   NOT NULL,
    "diseaseID" int   NOT NULL,
    "visitDate" date   NOT NULL
);

ALTER TABLE "hospital" ADD CONSTRAINT "fk_hospital_doctorID" FOREIGN KEY("doctorID")
REFERENCES "doctor" ("doctorID");

ALTER TABLE "hospital" ADD CONSTRAINT "fk_hospital_patientID" FOREIGN KEY("patientID")
REFERENCES "patient" ("patientID");

ALTER TABLE "hospital" ADD CONSTRAINT "fk_hospital_diseaseID" FOREIGN KEY("diseaseID")
REFERENCES "disease" ("diseaseID");