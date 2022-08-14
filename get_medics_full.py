import asyncio
from db.main import Database
from parser import DTM

async def __main():
    db = Database()
    dtm = DTM()
    await dtm.start()
    await db.create()
    
    shifr = "60910200"
    unCode = 364
    regionID = 14
    langID = 1
    ok = True
    p = 1
    
    
    abiturients = await db.execute(
        '''SELECT * FROM Abiturients a LEFT JOIN Scores s ON a.abtID=s.abtID WHERE s.abtID IS NULL AND a.ball IS NOT NULL;''',
        fetch=True
    )
    
    for abt in abiturients:
        abtID = abt[1]
        abtDetail = await dtm.User_detail(abtID)
        langID = abtDetail['til_id']
        fan1 = abtDetail['bloks'][4]['fan']
        fan2 = abtDetail['bloks'][3]['fan']
        if abt['grantpriority'] != abtDetail['grant_ustuvor']:
            await db.execute(
                '''UPDATE Abiturients SET grantpriority=$1 WHERE abtID=$2;''',
                abtDetail['grant_ustuvor'], abtID,
                execute=True
            )
        blokID = await db.execute(
            '''SELECT id FROM Bloks 
            WHERE main=$1 AND second=$2 AND langID=$3;''',
            fan1, fan2, langID,
            fetchval=True    
        )
        
        if blokID is None:
            blokID = await db.execute(
                '''INSERT INTO Bloks (main, second, langID) 
                VALUES ($1, $2, $3) RETURNING id;''',
                fan1, fan2, langID,
                fetchval=True    
            )
        selections = []
        for yonalish in abtDetail['yonalishlar']:
            unCode = await db.execute(
                '''SELECT code FROM Universities WHERE name=$1;''',
                yonalish["otm"], fetchval=True 
            )
            faculty = await db.execute(
                '''SELECT * FROM Faculties WHERE unCode=$1 AND shifr=$2;''',
                unCode, yonalish['shifr'],
                fetchrow=True
            )
            facID = faculty[0]
            if faculty[4] is None:
                await db.execute(
                    '''UPDATE Faculties SET blokID=$1 WHERE shifr=$2;''',
                    blokID, faculty[2],
                    execute=True
                )
                
                await db.execute(
                    '''UPDATE FacultyShifres SET blokID=$1 WHERE shifr=$2;''',
                    blokID, faculty[2],
                    execute=True
                )
                
            select1 = await db.execute(
                '''SELECT * FROM Selections WHERE unCode=$1 AND facultyID=$2 AND langID=$3 AND mode=$4;''',
                unCode, facID, langID, yonalish['mode_id'],
                fetchrow=True
            )
            
            if select1['budget'] is None or select1['cantrak'] is None:
                await db.execute(
                    '''UPDATE Selections SET budget=$1, cantrak=$2 WHERE id=$3;''',
                    yonalish['grant'], yonalish['kantrak'], select1['id'],
                    execute=True
                )
                
            selections.append(select1['id'])
        n = len(selections)
        values_1 = ",\n".join([f"($1, ${i}, ${i+n})" for i in range(2, 2+n)])
        # ($1, $2, $7),
        # ($1, $3, $8),
        # ($1, $4, $9),
        # ($1, $5, $10),
        # ($1, $6, $11)
    
        sql1 = f'''INSERT INTO Choices (abtID, selectionID, number) VALUES {values_1};'''
        await db.execute(
            sql1,
            *([abtID] + selections + list(range(1, n+1))),
            execute=True
        )
        await db.insert_into(
            'FullChoices',
            ['abtID']+[f"f{i}" for i in range(1, n+1)],
            [abtID] + selections
        )
        yechganlariSoni = [blok['yechganlariSoni'] for blok in abtDetail['bloks']]
        await db.insert_into(
            'Scores',
            ['abtID', 'ball', 'blok1', 'blok2', 'blok3', 'blok4', 'blok5', 'blokID'],
            [abtID, abtDetail['ball'], *yechganlariSoni, blokID]
        )
        print(abtID, abtDetail['fish'], "boyevoy bo'ldi")
    await dtm.close()
    print("Tugadi")
    
if __name__ == '__main__':
    # try:
    asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())
    asyncio.run(__main())
    # except Exception as e:
    #     print(e)
