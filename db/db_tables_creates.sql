CREATE TABLE IF NOT EXISTS "regions" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS "languages" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS "modes" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS "universities" (
    "id" SERIAL PRIMARY KEY,
    "code" INT NOT NULL UNIQUE,
    "name" VARCHAR(255) NOT NULL,
    "regionid" INT REFERENCES "regions"("id")            
);

CREATE TABLE IF NOT EXISTS "bloks" (
    "id" SERIAL PRIMARY KEY,
    "main" VARCHAR(255) NOT NULL,
    "second" VARCHAR(255) NOT NULL,
    "langid" INT NOT NULL REFERENCES "languages"("id")
);

CREATE TABLE IF NOT EXISTS "faculties" (
    "id" SERIAL PRIMARY KEY,
    "uncode" INT NOT NULL REFERENCES "universities" ("code"),
    "shifr" VARCHAR(50) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "blokid" INT DEFAULT NULL REFERENCES "bloks" ("id") 
);

CREATE TABLE IF NOT EXISTS "facultyshifres" (
    "id" SERIAL PRIMARY KEY,
    "shifr" VARCHAR(50) NOT NULL UNIQUE,
    "name" VARCHAR(255) NOT NULL,
    "blokid" INT DEFAULT NULL REFERENCES "bloks"("id")
);

CREATE TABLE IF NOT EXISTS "selections" (
    "id" SERIAL PRIMARY KEY,
    "uncode" INT NOT NULL REFERENCES "universities" ("code"),
    "facultyid" INT NOT NULL REFERENCES "faculties" ("id"),
    "langid" INT NOT NULL REFERENCES "languages" ("id"),
    "mode" INT NOT NULL REFERENCES "modes" ("id"),
    "budget" INT DEFAULT NULL,
    "cantrak" INT DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "abiturients" (
    "id" SERIAL PRIMARY KEY,
    "abtid" BIGINT NOT NULL UNIQUE,
    "name" VARCHAR(255) NOT NULL,
    "langid" INT NOT NULL REFERENCES "languages",
    "grantpriority" BOOLEAN DEFAULT true,
    "ball" REAL DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "scores"(
    "id" SERIAL PRIMARY KEY,
    "abtid" BIGINT NOT NULL UNIQUE REFERENCES "abiturients" ("abtid"),
    "ball" REAL NOT NULL,
    "blok1" INT NOT NULL,
    "blok2" INT NOT NULL,
    "blok3" INT NOT NULL,
    "blok4" INT NOT NULL,
    "blok5" INT NOT NULL,
    "blokid" INT NOT NULL REFERENCES "bloks" ("id")
);

CREATE TABLE IF NOT EXISTS "choices" (
    "id" SERIAL PRIMARY KEY,
    "abtid" BIGINT NOT NULL REFERENCES "abiturients" ("abtid"),
    "selectionid" INT NOT NULL REFERENCES "selections" ("id"),
    "number" INT NOT NULL,
    CONSTRAINT "valid_number" 
      CHECK ("number" <= 10 AND "number" >= 1)
);

CREATE TABLE IF NOT EXISTS "fullchoices" (
    "id" SERIAL PRIMARY KEY,
    "abtid" BIGINT NOT NULL UNIQUE REFERENCES "abiturients"("abtid"),
    "f1" INT REFERENCES "selections" ("id"),
    "f2" INT REFERENCES "selections" ("id"),
    "f3" INT REFERENCES "selections" ("id"),
    "f4" INT REFERENCES "selections" ("id"),
    "f5" INT REFERENCES "selections" ("id"),
    "f6" INT REFERENCES "selections" ("id"),
    "f7" INT REFERENCES "selections" ("id"),
    "f8" INT REFERENCES "selections" ("id"),
    "f9" INT REFERENCES "selections" ("id"),
    "f10" INT REFERENCES "selections" ("id")
);