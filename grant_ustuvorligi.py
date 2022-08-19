import sys
import asyncio
import progressbar
from db.main import Database
from parser import DTM




RED = '\033[31m'
GREEN = '\033[32m'
YELLOW = '\033[33m'
WHITE = '\033[37m'
RESET = '\033[39m'

def chunks(lst, n):
    """Yield successive n-sized chunks from lst."""
    for i in range(0, len(lst), n):
        yield lst[i:i + n]
        
        
    
async def __main(p1, p2):
    db = Database()
    dtm = DTM()
    await dtm.start()
    await db.create()
    sql = '''
SELECT a.abtID, a.name, a.langID, a.grantPriority, a.ball  
FROM Abiturients a LEFT JOIN Scores s 
ON a.abtID=s.abtID WHERE s.id IS NOT NULL AND s.id BETWEEN $1 AND $2;
'''
    abiturients = await db.execute(sql, p1, p2, fetch=True)

    
    for abt in progressbar.progressbar(abiturients, redirect_stdout=True):
        grant_priority = await dtm.Grant_ustuvor(abt['abtid'])
        if abt['grantpriority'] != grant_priority:
            await db.execute(
                '''UPDATE Abiturients SET grantPriority=$1 WHERE abtID=$2;''',
                grant_priority, abt['abtid'],
                execute=True
            )
            print(GREEN, abt['abtid'], abt['name'], "grant-kontrak", RESET)
        else:
            print(RED, abt['abtid'], abt['name'], "grant-grant", RESET)
        
    print(YELLOW, "\nBajarib bo'ldim\n", RESET)
    await dtm.close()

if __name__ == '__main__':
    p1, p2 = 0, 0
    try:
        p1 = int(sys.argv[1])
        p2 = int(sys.argv[2])
    except Exception as e:
        print("Boshlanadiga ID va tugash ID sini kiriting")
        exit(2)
    if sys.platform == 'win32':
        asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())
    asyncio.run(__main(p1, p2))