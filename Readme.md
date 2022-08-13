# DTM

## O'rnatish
### Kerakli dastur va kutubxonalar
* Python 3.8+
* PostgreSQL baza

<hr>

#### Parser, ma'lumotlar bazasi uchun kerakli python kutubxonalarni o'rnatish:
```bash
pip install -r requirements.txt
```
<hr>

#### Konfiguratsiya uchun
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

#### Ma'lumotlar bazasini noldan qurish uchun
Agar ma'lumotlar bazasini noldan qurmoqchi bo'lsangiz `first_time_runner.py` faylini ishga tushiring. 
```bash
python first_time_runner.py
```
Shunda malumotlar bazasiga kerakli Table larni yaratib, boshlang'ich ma'lumotlar bilan to'ldiradi.



<br>
<br>
Hozircha shular.
<br>
&copy; Omadli😎
