import sys
import asyncio
from db.main import Database
from json_files import *


async def __main():
    db = Database()
    await db.create()
    
    # # first time
    
    # # create all tables
    
    await db.create_all_tables()
    
    # await db.create_table_regions()
    # await db.create_table_languages()
    # await db.create_table_modes()
    # await db.create_table_universities()
    # await db.create_table_bloks()
    # await db.create_table_faculties()
    # await db.create_table_faculty_shifres()
    # await db.create_table_selections()
    # await db.create_table_abiturients()
    # await db.create_table_scores()
    # await db.create_table_Choices()
    # await db.create_table_FullChoices()
    # await db.create_boyevoy_selections()
    
    # adding some datas
    await db.add_all_modes()
    await db.add_all_languages()
    
    for region in regions:
        await db.add_region(region)
        
    Universities = get_universities()
    for u in Universities:
        await db.add_university(u['UNCode'], u['UNFName'], u['RegCode'])
        
    Faculties = get_faculties()
    shifr_codes = set()
    for fac in Faculties:
        await db.add_faculty(int(fac['VUZ']), fac['MVDir'], fac['Name'])
        if fac['MVDir'] not in shifr_codes:
            await db.add_faculty_shifr(fac['MVDir'], fac['Name'])
            shifr_codes.add(fac['MVDir'])
    
    emode = get_edumode()
    modes = ['Kunduzgi', 'Sirtqi', 'Kechki', 'Masofaviy']
    i = 0
    for mode in emode:
        i += 1
        m = modes.index(mode['LNameLT']) + 1
        id = await db.execute(
            '''SELECT id FROM Faculties WHERE shifr=$1 AND unCode=$2''',
            str(mode['MVDir']), mode['UNCode'], fetchval=True)
        columns = ['UNcode', 'facultyID', 'langID', 'mode']
        values = [mode['UNCode'], id, mode['lang_id'], m]
        if m > 1:
            columns.append('budget')
            values.append(0)
          
        await db.insert_into('Selections', columns, values)
        
        
    
    print(i, 'ta selection qo\'shildi')
    # # end first time
    
    
    print("finished")
    print("Baza boshlang'ich ma'lumotlar bilan to'ldirildi")


if __name__ == '__main__':
    try:
        if sys.platform == 'win32':
            asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())
        asyncio.run(__main())
    except Exception as e:
        print(e)
