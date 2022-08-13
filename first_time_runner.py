import asyncio
from db.main import Database
from json_files import *


async def __main():
    db = Database()
    await db.create()
    
    # # first time
    await db.create_table_regions()
    await db.create_table_universities()
    await db.create_table_languages()
    await db.create_table_modes()
    await db.create_table_faculties()
    await db.create_table_faculties_json()
    await db.create_table_selections()
    await db.create_table_abiturients()
    await db.create_table_scores
    await db.create_table_choices()
    
    for region in regions:
        await db.add_region(region)
        
    Universities = get_universities()
    for u in Universities:
        await db.add_university(u['UNCode'], u['UNFName'], u['RegCode'])
        
    Faculties = get_faculties()
    shifr_codes = set()
    for fac in Faculties:
        await db.add_faculty_json(int(fac['VUZ']), fac['MVDir'], fac['Name'])
        if fac['MVDir'] not in shifr_codes:
            await db.add_faculty(fac['MVDir'], fac['Name'])
            shifr_codes.add(fac['MVDir'])
    
    emode = get_edumode()
    modes = ['Kunduzgi', 'Sirtqi', 'Kechki', 'Masofaviy']
    i = 0
    for mode in emode:
        i += 1
        m = modes.index(mode['LNameLT']) + 1
        columns = ['UNcode', 'facultyShifr', 'langID', 'mode']
        values = [mode['UNCode'], str(mode['MVDir']), mode['lang_id'], m]
        if m > 1:
            columns.append('budget')
            values.append(0)
            
        await db.insert_into('Selections', columns, values)
    
    print(i, 'ta qo\'shildi')
    # # end first time
    
    
    print("finished")



if __name__ == '__main__':
    asyncio.run(__main())
