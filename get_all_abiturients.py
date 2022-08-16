import sys
import asyncio
import progressbar
from db.main import Database
from parser import DTM
from asyncpg.exceptions import UniqueViolationError

RED = '\033[31m'
GREEN = '\033[32m'
BLUE = '\033[36m'
WHITE = '\033[37m'
RESET = '\033[39m'

try:
    regionID = int(sys.argv[1])
except Exception as e:
    print("Regionni ID sini kiriting")
    exit(2)
    
progressbar.streams.wrap_stderr()
def up():
    sys.stdout.write('\x1b[1A')
    sys.stdout.flush()

def down():
    sys.stdout.write('\n')
    sys.stdout.flush()


async def __main():
    db = Database()
    dtm = DTM()
    await dtm.start()
    await db.create()
    sql1 = '''
    
SELECT s.id, u.RegionID, s.Uncode, u.name AS uname, s.facultyID, f.name AS fname, f.shifr, s.langID, s.mode  FROM Selections s 
INNER JOIN Universities u ON s.Uncode=u.code INNER JOIN Faculties f ON s.facultyID=f.id 
LEFT JOIN BoyevoySelections b ON b.selectionID=s.id WHERE b.selectionID IS NULL AND u.regionID=$1;    
    
    '''
    selections_list = await db.execute(sql1, regionID, fetch=True)
    
    down()
    total = progressbar.ProgressBar(maxval=len(selections_list), redirect_stdout=True)
    total.start()
    for ssID, sel in enumerate(selections_list, 1):
        regionID = sel['regionid']
        unCode = sel['uncode']
        shifr = sel['shifr']
        selectionID = sel['id']
        ok = True
        p = 1
        n = 0
        res = await dtm.Users_list(p, regionID, unCode, shifr, 1, 1)
        if res is not None and res and isinstance(res['jami'], int):
            
            sub = progressbar.ProgressBar(maxval=res['jami'], redirect_stdout=True)
            sub.start()
            up()
            
            while ok:
                try:
                    res = await dtm.Users_list(p, regionID, unCode, shifr, 1, 1)
                    if res is not None and res:
                        # res['jami'] // 10 + 1  # max_page
                        if n >= res['jami']:
                            ok = False
                            break
                        for abt in res['result']:
                            ball = abt['ball']
                            columns = ['abtID', 'name', 'langID']
                            values = [int(abt['abtID']), abt['abtName'], 1]
                            if ball is not None:
                                columns.append('ball')
                                values.append(ball)
                            
                            try:
                                await db.insert_into('abiturients',columns, values)
                                print(GREEN, f"{n+1})", abt['abtID'], abt['abtName'], ball, "bazaga qo'shildi", RESET)
                            except UniqueViolationError as e:
                                abt_baza = await db.execute('''SELECT * FROM Abiturients WHERE abtID=$1;''', abt['abtID'], fetchrow=True)
                                if abt_baza['ball'] != ball:
                                    await db.execute(
                                        '''UPDATE Abiturients SET ball=$1 WHERE abtID=$2;''',
                                        ball, abt['abtID'], execute=True
                                    )
                                    
                                    print(BLUE, f"{n+1})", abt['abtID'], abt['abtName'], ball, "bazaga bali kiritildi", RESET)
                                else:
                                    print(RED, f"{n+1})", abt['abtID'], abt['abtName'], ball, "bazada mavjud", RESET)
                            n += 1
                        p += 1
                    else:
                        ok = False
                        break
                except Exception as e:
                    print(e)
                    p += 1
                    
                sub.update(n)
                
            await db.execute('''INSERT INTO BoyevoySelections(selectionID, abts) VALUES ($1, $2);''', selectionID, n, execute=True)
            
            print(GREEN + f"\n\n\n{selectionID} {sel['uname']} {sel['fname']} bo'ldi\n\n\n" + RESET)
            sub.finish()
        else:
            print(RED + f"\n\n\n{selectionID} {sel['uname']} {sel['fname']} o'xshamayapti.\nAbiturientlar ro'yxati bo'sh shekilli\n\n\n" + RESET)
        
        
        
        dtm.change_user_agent()
        total.update(ssID)
        print()
            
    await dtm.close()
    total.finish()
    print("Tugadi")
    
if __name__ == '__main__':
    # try:
    if sys.platform == 'win32':
        asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())
    asyncio.run(__main())
    # except Exception as e:
    #     print(e)
