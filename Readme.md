Mundarija:
- [O'rnatish](#ornatish)
    - [Kerakli dastur va kutubxonalar](#kerakli-dastur-va-kutubxonalar)
    - [Python kutubxonalari](#python-kutubxonalari)
    - [Konfiguratsiya uchun](#konfiguratsiya-uchun)
    - [Ma'lumotlar bazasini noldan qurish uchun](#malumotlar-bazasini-noldan-qurish-uchun)
- [Database](#database)
  - [Structure](#structure)
- [Parser](#parser)
  - [Features](#features)
  - [Foydalanish](#foydalanish)
- [Xulosa](#xulosa)

# O'rnatish
### Kerakli dastur va kutubxonalar
* Python 3.8+
* PostgreSQL baza

<hr>

### Python kutubxonalari
 Parser, ma'lumotlar bazasi uchun kerakli python kutubxonalarni o'rnatish:
```bash
pip install -r requirements.txt
```
<hr>

### Konfiguratsiya uchun
Konfiguratsiya fayllarini `.env.dist `faylida namuna berilgan. Xuddi shunday namunaga qarab `.env` fayl oching. Ichiga ma'lumotlar bazasiga ulanish uchun 
* `DB_USER` -> Bazaga ulanish uchun username 
* `DB_PASS` -> Foydalanuvchi paroli
* `DB_HOST` -> Baza serveri
* `DB_NAME` -> Baza nomi
  
Avval manashularni taxlang. Bazagayam
 ```sql
CREATE DATABASE IF NOT EXISTS $DB_NAME$;
```
qilib keyin ulaning. Aytgancha Baza PostgreSQL bo'lsin.
<hr>

### Ma'lumotlar bazasini noldan qurish uchun
Agar ma'lumotlar bazasini noldan qurmoqchi bo'lsangiz `first_time_runner.py` faylini ishga tushiring. 
```bash
python first_time_runner.py
```
Shunda malumotlar bazasiga kerakli Table larni yaratib, boshlang'ich ma'lumotlar bilan to'ldiradi.


# Database

Database ustida ishlanmoqda haliyam...

## Structure
SQL struktura [link](https://drawsql.app/teams/omadli/diagrams/dtm)
<iframe width="100%" height="500px" style="box-shadow: 0 2px 8px 0 rgba(63,69,81,0.16); border-radius:15px;" allowtransparency="true" allowfullscreen="true" scrolling="no" title="DTM" frameborder="0" src="https://drawsql.app/teams/omadli/diagrams/dtm/embed"></iframe>


<br/><br/>

# Parser

## Features

Parser asinxron ishlaydi!
Oddiygina `aiohttp` va `beautifulsoup4` kutubxonalaridan foydalanib. 


## Foydalanish

Foydalanish ham asinxron bo'lishi kerak. Namuna:
```python
import asyncio
from parser import DTM

abtID = 4000733

async def __main():
    p = DTM()
    await p.start()
    datas = dict(await p.User_detail(abtID))
    print(datas)
    await p.close()
    

if __name__ == '__main__':
    asyncio.run(__main())
```

User_detail() metodi kiritilgan abituriyent ID si bo'yicha uning `Home2022/Details/` + `abtID` sahifasidagi barcha ma'lumotlarini oladi.
<img src="./screenshots/parser_User_detail2.jpg" alt="User detail page">
Natija JSON (python dict) qaytaradi:
<img src="./screenshots/parser_User_detail_example.jpg">


Bundan tashqari `Users_list()` metodi mandat saytidagi ro'yxatdan abturiyentlarni ID raqamlarini va balini oladi.
<img src="./screenshots/parser_Users_list.jpg" alt="Users_list"> Xuddi manashu yeridan oladi.

<br>
<br>

# Xulosa

Hozircha shular.
<br>
&copy; Omadli😎
