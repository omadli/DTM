import config
import asyncpg
from pathlib import Path
from typing import Union
from asyncpg import Connection
from asyncpg.pool import Pool


class Database:

    def __init__(self):
        self.pool: Union[Pool, None] = None

    async def create(self):
        self.pool = await asyncpg.create_pool(
            user=config.DB_USER,
            password=config.DB_PASS,
            host=config.DB_HOST,
            database=config.DB_NAME
        )

    async def execute(self, command, *args,
                      fetch: bool = False,
                      fetchval: bool = False,
                      fetchrow: bool = False,
                      execute: bool = False
                      ):
        async with self.pool.acquire() as connection:
            connection: Connection
            async with connection.transaction():
                if fetch:
                    result = await connection.fetch(command, *args)
                elif fetchval:
                    result = await connection.fetchval(command, *args)
                elif fetchrow:
                    result = await connection.fetchrow(command, *args)
                elif execute:
                    result = await connection.execute(command, *args)
            return result


    async def create_table_regions(self):
        sql = """
CREATE TABLE IF NOT EXISTS "regions" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL
);
        """
        await self.execute(sql, execute=True)


    async def create_table_languages(self):
        sql = """
CREATE TABLE IF NOT EXISTS "languages" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL
);
        """
        return await self.execute(sql, execute=True)
     
        
    async def create_table_modes(self):
        sql = """
CREATE TABLE IF NOT EXISTS "modes" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL
);
        """
        return await self.execute(sql, execute=True)
        

    async def create_table_universities(self):
        sql = """
CREATE TABLE IF NOT EXISTS "universities" (
    "id" SERIAL PRIMARY KEY,
    "code" INT NOT NULL UNIQUE,
    "name" VARCHAR(255) NOT NULL,
    "regionid" INT REFERENCES "regions"("id")            
);
        """
        await self.execute(sql, execute=True)
        
        
    async def create_table_bloks(self):
        sql = """
CREATE TABLE IF NOT EXISTS "bloks" (
    "id" SERIAL PRIMARY KEY,
    "main" VARCHAR(255) NOT NULL,
    "second" VARCHAR(255) NOT NULL,
    "langid" INT NOT NULL REFERENCES "languages"("id")
);
        """
        await self.execute(sql, execute=True)
        
             
    async def create_table_faculties(self):
        sql = """
CREATE TABLE IF NOT EXISTS "faculties" (
    "id" SERIAL PRIMARY KEY,
    "uncode" INT NOT NULL REFERENCES "universities" ("code"),
    "shifr" VARCHAR(50) NOT NULL UNIQUE,
    "name" VARCHAR(255) NOT NULL,
    "blokid" INT DEFAULT NULL REFERENCES "bloks" ("id") 
);
        """
        await self.execute(sql, execute=True)
    
            
    async def create_table_faculty_shifres(self):
        sql = """
CREATE TABLE IF NOT EXISTS "facultyshifres" (
    "id" SERIAL PRIMARY KEY,
    "shifr" VARCHAR(50) NOT NULL UNIQUE,
    "name" VARCHAR(255) NOT NULL,
    "blokid" INT DEFAULT NULL REFERENCES "bloks"("id")
);
        """
        await self.execute(sql, execute=True)


    async def create_table_selections(self):
        sql = """
CREATE TABLE IF NOT EXISTS "selections" (
    "id" SERIAL PRIMARY KEY,
    "uncode" INT NOT NULL REFERENCES "universities" ("code"),
    "facultyid" INT NOT NULL REFERENCES "faculties" ("id"),
    "langid" INT NOT NULL REFERENCES "languages" ("id"),
    "mode" INT NOT NULL REFERENCES "modes" ("id"),
    "budget" INT DEFAULT NULL,
    "cantrak" INT DEFAULT NULL
);
        """
        await self.execute(sql, execute=True)
        

    async def create_table_abiturients(self):
        sql = """
CREATE TABLE IF NOT EXISTS "abiturients" (
    "id" SERIAL PRIMARY KEY,
    "abtid" BIGINT NOT NULL UNIQUE,
    "name" VARCHAR(255) NOT NULL,
    "langid" INT NOT NULL REFERENCES "languages",
    "grantpriority" BOOLEAN DEFAULT true,
    "ball" REAL DEFAULT NULL
);
        """
        await self.execute(sql, execute=True)
    
    
    async def create_table_scores(self):
        sql = """
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
        """
        await self.execute(sql, execute=True)
    
    
    async def create_table_Choices(self):
        sql = """
CREATE TABLE IF NOT EXISTS "choices" (
    "id" SERIAL PRIMARY KEY,
    "abtid" BIGINT NOT NULL REFERENCES "abiturients" ("abtid"),
    "selectionid" INT NOT NULL REFERENCES "selections" ("id"),
    "number" INT NOT NULL,
    CONSTRAINT "valid_number" 
      CHECK ("number" <= 10 AND "number" >= 1)
);
        """
        await self.execute(sql, execute=True)
    
    
    async def create_table_FullChoices(self):
        sql = """
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
        """
        await self.execute(sql, execute=True)
    
    
    async def create_boyevoy_selections(self):
        sql = '''

CREATE TABLE IF NOT EXISTS BoyevoySelections(
	id SERIAL NOT NULL PRIMARY KEY,
	selectionID INTEGER NOT NULL UNIQUE REFERENCES Selections(id),
	abts BIGINT NOT NULL
);        
        
        '''
        await self.execute(sql, execute=True)
    
    
    async def create_all_tables(self):
        dir_path = Path(__file__).resolve().parent
        with open(dir_path.joinpath('db_tables_creates.sql'), 'r', encoding='utf8') as f:
            sql = f.read()
        
        return await self.execute(sql, execute=True)
    
    
    async def add_all_languages(self):
        await self.insert_into('Languages', ['name'], ['O`zbek'])
        await self.insert_into('Languages', ['name'], ['Rus'])
        await self.insert_into('Languages', ['name'], ['Qoraqalpoq'])
        await self.insert_into('Languages', ['name'], ['Tadjik'])
        await self.insert_into('Languages', ['name'], ['Qozoq'])
        await self.insert_into('Languages', ['name'], ['Turkman'])
        await self.insert_into('Languages', ['name'], ['Qirgiz'])
    
    
    async def add_all_modes(self):
        await self.insert_into('Modes', ['name'], ['Kunduzgi'])
        await self.insert_into('Modes', ['name'], ['Sirtqi'])
        await self.insert_into('Modes', ['name'], ['Kechki'])
        await self.insert_into('Modes', ['name'], ['Masofaviy'])

               
    @staticmethod
    def format_args(sql, parameters: dict):
        sql += " AND ".join([
            f"{item} = ${num}" for num, item in enumerate(parameters.keys(),
                                                          start=1)
        ])
        return sql, tuple(parameters.values())
    

    async def add_region(self, name):
        sql = "INSERT INTO regions (name) VALUES($1) RETURNING *"
        return await self.execute(sql, name, fetchrow=True)
    
    
    async def add_university(self, code, name, regionID):
        sql = "INSERT INTO Universities (code, name, regionID) VALUES($1, $2, $3) RETURNING *"
        return await self.execute(sql, code, name, regionID, fetchrow=True)
    
    
    async def add_faculty_shifr(self, shifr, name):
        sql = "INSERT INTO FacultyShifres (shifr, name) VALUES ($1, $2) RETURNING *"
        return await self.execute(sql, shifr, name, fetchrow=True)
    
    
    async def add_faculty(self, unCode, shifr, name):
        sql = "INSERT INTO Faculties (unCode, shifr, name) VALUES ($1, $2, $3) RETURNING *"
        return await self.execute(sql, unCode, shifr, name, fetchrow=True)
    
    
    async def insert_into(self, table: str, columns: list, vars: list):
        cols = ", ".join(columns)
        args = ", ".join(map(lambda i: f"${i}", range(1, len(vars)+1)))
        sql = f"INSERT INTO {table}({cols}) VALUES ({args}) RETURNING *"
        return await self.execute(sql, *vars, fetchrow=True)
    
    
    

    
