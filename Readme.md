Mundarija:
- [O'rnatish](#ornatish)
    - [Kerakli dastur va kutubxonalar](#kerakli-dastur-va-kutubxonalar)
    - [Python kutubxonalari](#python-kutubxonalari)
    - [Konfiguratsiya uchun](#konfiguratsiya-uchun)
    - [Ma'lumotlar bazasini noldan qurish uchun](#malumotlar-bazasini-noldan-qurish-uchun)
- [Database](#database)
  - [Bazani clonlash](#bazani-clonlash)
  - [Structure](#structure)
  - [Bazada nimalar bor](#bazada-nimalar-bor)
  - [Ubuntu uchun psql](#ubuntu-uchun-psql)
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
$ pip install -r requirements.txt
```

Aytgancha agar sizdagi tizim ubuntu bo'lsa beautifulsoup bilan ishlashda xatoliklar bo'lishi mumkin. Agar sizda `ImportError: No module named 'bs4'` degan xatolik chiqsa buni to'g'irlash uchun:
```bash
$ apt-cache search beautifulsoup
$ sudo apt-get install python3-bs4
```
manashu ikkita kommandani ishlating. Agar yana biror xatolik bo'lsa Issuesga yozing.

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
$ python first_time_runner.py
```
Shunda malumotlar bazasiga kerakli Table larni yaratib, boshlang'ich ma'lumotlar bilan to'ldiradi.


# Database

## Bazani clonlash
`dtm.sql` fayli ichida ma'lumotlar bazasidagi parsing qilib olingan ma'lumotlar bor.
`pg_dump` dan foydalanib chiqarilgan __backup__ fayl.
O'zizga clonlab olish uchun terminalga
```bash
$ psql -d <DB_NAME> -f dtm.sql -U <DB_USER>
```
deb yozing. `<DB_NAME>` o'rniga bazangiz uchun nom, masalan __DTM__ va `<DB_USER>` o'rniga o'zingizni psql foydalanuvchi username yingiz. Masalan `postgres` bo'lishi mumkin.

Ubuntu uchun `dtm.tar` faylida ham bor. Ayrim muammolar bo'lgani uchun. Clonlashga
```bash
pg_restore --verbose --clean --no-acl --no-owner --dbname=<DB_NAME>  -F tar -U <DB_USER> dtm.tar
```
`DB_NAME` bilan `DB_USER` nimaligini bilasiz.

## Structure
SQL struktura 👉 [link](https://drawsql.app/teams/omadli/diagrams/dtm).
<img src="./screenshots/db_structure.png" alt="Database structure">

## Bazada nimalar bor
Baza hozircha bo'sh. Tets uchun 1000 ta abituriyent ma'lumotlari bor. Mediklardan. Abiturients jadvalida ko'rishiz mumkin.
```SQL
SELECT * FROM Abiturients;
```
<img src="./screenshots/db_abiturients.png" alt="Bazadagi abituriyentlar">

<br/><br/>

## Ubuntu uchun psql
Ubuntuda user authentication va termninalda ishlash boshqacha.
Shuning uchun bazaga `postgres` bilan ulanish tavsiya e'tilmaydi.
Foydalanib turgan useringiz masalan `ubuntu` nomiga postgresql dan foydalanish uchun user ochib oling.
```bash
sudo -u postgres psql
postgres=# create database <DB_NAME>;
postgres=# create user <DB_USER> with encrypted password '<DB_PASS>';
postgres=# grant all privileges on database <DB_NAME> to <DB_USER>;
exit;
```
DB_USER ga ubuntu profil userizni kiriting osonroq.
Keyinchalik xatoliklarni oldini oladi.
Keyin sudo siz ham ishlayverasiz.

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
