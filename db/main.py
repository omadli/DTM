import config
import asyncpg
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
        CREATE TABLE IF NOT EXISTS Regions (
        id SERIAL PRIMARY KEY,
        name VARCHAR(255) NOT NULL
        );
        """
        await self.execute(sql, execute=True)


    async def create_table_faculties(self):
        sql = """
        CREATE TABLE IF NOT EXISTS Faculties (
        id SERIAL PRIMARY KEY,
        shifr VARCHAR(50) NOT NULL UNIQUE,
        name VARCHAR(255) NOT NULL
        );
        """
        await self.execute(sql, execute=True)
        
        
    async def create_table_faculties_json(self):
        sql = """
CREATE TABLE IF NOT EXISTS FacultiesJson (
    id SERIAL PRIMARY KEY,
    unCode INT NOT NULL REFERENCES Universities(code),
    shifr VARCHAR(50) NOT NULL,
    Name VARCHAR(255) NOT NULL 
);
"""
        await self.execute(sql, execute=True)
    
    
    async def create_table_abiturients(self):
        sql = """
        CREATE TABLE IF NOT EXISTS Abiturients (
        id SERIAL PRIMARY KEY,
        abtID BIGINT NOT NULL UNIQUE,
        Name VARCHAR(255) NOT NULL,
        langID INT NOT NULL REFERENCES Languages,
        grantPriority BOOLEAN DEFAULT true,
        ball REAL DEFAULT NULL
        );
        """
        await self.execute(sql, execute=True)
    
    
    async def create_table_scores(self):
        sql = """
CREATE TABLE IF NOT EXISTS "Scores"(
    "id" SERIAL PRIMARY KEY,
    "abtID" BIGINT NOT NULL UNIQUE REFERENCES Abiturients(abtID),
    "ball" REAL NOT NULL,
    "blok1" INTEGER NOT NULL,
    "blok2" INTEGER NOT NULL,
    "blok3" INTEGER NOT NULL,
    "blok4" INTEGER NOT NULL,
    "blok5" INTEGER NOT NULL,
    "mainFan" VARCHAR(255) NOT NULL,
    "secondFan" VARCHAR(255) NOT NULL
);
"""
        await self.execute(sql, execute=True)
    
    
    async def create_table_choices(self):
        sql = """
        CREATE TABLE IF NOT EXISTS Choices (
        id SERIAL PRIMARY KEY,
        abtID BIGINT NOT NULL UNIQUE REFERENCES Abiturients(abtID),
        f1 INT REFERENCES Selections,
        f2 INT REFERENCES Selections,
        f3 INT REFERENCES Selections,
        f4 INT REFERENCES Selections,
        f5 INT REFERENCES Selections,
        f6 INT REFERENCES Selections,
        f7 INT REFERENCES Selections,
        f8 INT REFERENCES Selections,
        f9 INT REFERENCES Selections,
        f10 INT REFERENCES Selections
        );
        """
        await self.execute(sql, execute=True)
    
    
    async def create_table_languages(self):
        sql = """
        CREATE TABLE IF NOT EXISTS Languages (
        id SERIAL PRIMARY KEY,
        name VARCHAR(255) NOT NULL
        );
        """
        await self.execute(sql, execute=True)
        
        sql2 = """
        INSERT INTO 
            Languages(name)
        VALUES
            (O`zbek),
            (Rus),
            (Qoraqalpoq);
        """
        # await self.execute(sql2, execute=True)
        
        await self.insert_into('Languages', ['name'], ['O`zbek'])
        await self.insert_into('Languages', ['name'], ['Rus'])
        await self.insert_into('Languages', ['name'], ['Qoraqalpoq'])
        await self.insert_into('Languages', ['name'], ['Tadjik'])
        await self.insert_into('Languages', ['name'], ['Qozoq'])
        await self.insert_into('Languages', ['name'], ['Turkman'])
        await self.insert_into('Languages', ['name'], ['Qirgiz'])
    
    
    async def create_table_modes(self):
        sql = """
        CREATE TABLE IF NOT EXISTS Modes (
        id SERIAL PRIMARY KEY,
        name VARCHAR(255) NOT NULL
        );
        """
        
        sql2 = """
        INSERT INTO 
            Modes(name)
        VALUES
            (Kunduzgi),
            (Sirtqi),
            (Kechki),
            (Masofaviy);
        """
        await self.execute(sql, execute=True)
        
        await self.insert_into('Modes', ['name'], ['Kunduzgi'])
        await self.insert_into('Modes', ['name'], ['Sirtqi'])
        await self.insert_into('Modes', ['name'], ['Kechki'])
        await self.insert_into('Modes', ['name'], ['Masofaviy'])


    async def create_table_universities(self):
        sql = """
CREATE TABLE IF NOT EXISTS Universities (
    id SERIAL PRIMARY KEY,
    code INT NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    regionID INT,
    CONSTRAINT fk_region
        FOREIGN KEY(regionID) 
            REFERENCES Regions(id)
);
"""
        await self.execute(sql, execute=True)
        
    @staticmethod
    def format_args(sql, parameters: dict):
        sql += " AND ".join([
            f"{item} = ${num}" for num, item in enumerate(parameters.keys(),
                                                          start=1)
        ])
        return sql, tuple(parameters.values())
    

    async def add_region(self, name):
        sql = "INSERT INTO regions (name) VALUES($1) returning *"
        return await self.execute(sql, name, fetchrow=True)
    
    
    async def add_university(self, code, name, regionID):
        sql = "INSERT INTO Universities (code, name, regionID) VALUES($1, $2, $3) returning *"
        return await self.execute(sql, code, name, regionID, fetchrow=True)
    
    
    async def add_faculty(self, shifr, name):
        sql = "INSERT INTO Faculties (shifr, name) VALUES ($1, $2) returning *"
        return await self.execute(sql, shifr, name, fetchrow=True)
    
    
    async def add_faculty_json(self, unCode, shifr, name):
        sql = "INSERT INTO FacultiesJson (unCode, shifr, name) VALUES ($1, $2, $3) returning *"
        return await self.execute(sql, unCode, shifr, name, fetchrow=True)
    
    
    async def insert_into(self, table: str, columns: list, vars: list):
        cols = ", ".join(columns)
        args = ", ".join(map(lambda i: f"${i}", range(1, len(vars)+1)))
        sql = f"INSERT INTO {table}({cols}) VALUES ({args}) returning *"
        return await self.execute(sql, *vars, fetchrow=True)
    
    
    async def create_table_selections(self):
        sql = """
        CREATE TABLE IF NOT EXISTS Selections(
          id SERIAL PRIMARY KEY,
          UNcode INT NOT NULL REFERENCES Universities(code),
          facultyShifr VARCHAR(50) NOT NULL REFERENCES Faculties(shifr),
          langID INT NOT NULL REFERENCES Languages,
          mode INT NOT NULL REFERENCES Modes,
          budget INT DEFAULT NULL,
          cantrak INT DEFAULT NULL
        );
        """
        await self.execute(sql, execute=True)

    
