import asyncio
from db.main import Database
from parser import DTM
from asyncpg.exceptions import UniqueViolationError


async def __main():
    db = Database()
    dtm = DTM()
    await dtm.start()
    await db.create()
    
    shifr = "60910200"
    unCode = 364
    regionID = 14
    ok = True
    p = 9
    max_page = 100
    while p <= max_page and ok:
        res = await dtm.Users_list(p, regionID, unCode, shifr, 1, 1)
        if res is not None and res:
            # res['jami'] // 10 + 1  # max_page
            for abt in res['result']:
                ball = abt['ball']
                columns = ['abtID', 'name', 'langID']
                values = [int(abt['abtID']), abt['abtName'], 1]
                if ball is not None:
                    columns.append('ball')
                    values.append(ball)
                
                try:
                    await db.insert_into('abiturients',columns, values)
                    print(abt['abtID'], abt['abtName'], ball, "bazaga qo'shildi")
                except UniqueViolationError as e:
                    print(abt['abtID'], abt['abtName'], ball, "bazada mavjud ekan")
            p += 1
            
        else:
            ok = False
            break
            
    await dtm.close()
    print("Tugadi")
    
if __name__ == '__main__':
    # try:
    asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())
    asyncio.run(__main())
    # except Exception as e:
    #     print(e)
