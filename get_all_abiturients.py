import sys
import asyncio
from db.main import Database
from parser import DTM
from asyncpg.exceptions import UniqueViolationError


async def __main():
    db = Database()
    dtm = DTM()
    await dtm.start()
    await db.create()
    sql1 = '''
    
SELECT s.id, u.RegionID, s.Uncode, u.name AS uname, s.facultyID, f.name AS fname, f.shifr, s.langID, s.mode  FROM Selections s 
INNER JOIN Universities u ON s.Uncode=u.code INNER JOIN Faculties f ON s.facultyID=f.id 
LEFT JOIN BoyevoySelections b ON b.selectionID=s.id WHERE b.selectionID IS NULL AND s.langID=1 ORDER BY u.regionID;    
    
    '''
    selections_list = await db.execute(sql1, fetch=True)
    for sel in selections_list:
        regionID = sel['regionid']
        unCode = sel['uncode']
        shifr = sel['shifr']
        selectionID = sel['id']
        ok = True
        p = 1
        n = 0
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
                            print(f"{n+1})", abt['abtID'], abt['abtName'], ball, "bazaga qo'shildi")
                        except UniqueViolationError as e:
                            print(f"{n+1})", abt['abtID'], abt['abtName'], ball, "bazada mavjud ekan")
                            
                        n += 1
                    p += 1
                else:
                    ok = False
                    break
            except Exception as e:
                print(e)
                p += 1
        
        await db.execute('''UPDATE BoyevoySelections SET selectionID=$1, abts=$2''', selectionID, n, execute=True)
        print(f"\n\n\n{selectionID} {sel['uname']} {sel['fname']} bo'ldi\n\n\n")
        dtm.change_user_agent()
            
    await dtm.close()
    print("Tugadi")
    
if __name__ == '__main__':
    # try:
    if sys.platform == 'win32':
        asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())
    asyncio.run(__main())
    # except Exception as e:
    #     print(e)
