import os
from environs import Env

env = Env()
if os.path.exists('.env'):
    env.read_env()
    # .env fayl ichidan quyidagilarni o'qiymiz

    DB_USER = env.str('DB_USER')
    DB_PASS = env.str('DB_PASS')
    DB_HOST = env.str('DB_HOST')
    DB_NAME = env.str('DB_NAME')
    
else:
    print('.env fayli topilmadi!')
    print('.env.dist faylidan nusxa ko\'chirib db ni o\'zizga moslang.')
    print('Aks holda db dan foydalana olmaysiz')
    exit(1)

