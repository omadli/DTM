import json
# import requests


regions = [
    "Qoraqalpog‘iston Respublikasi",
    "Andijon viloyati",
    "Namangan viloyati",
    "Farg‘ona viloyati",
    "Buxoro viloyati",
    "Xorazm viloyati",
    "Surxondaryo viloyati",
    "Qashqadaryo viloyati",
    "Jizzax viloyati",
    "Navoiy viloyati",
    "Samarqand viloyati",
    "Sirdaryo viloyati",
    "Toshkent viloyati",
    "Toshkent shahri"
]

def get_universities():
    # res = requests.get("http://mandat.dtm.uz/JsonFiles/Universities.json")
    # json_resp = res.json()
    json_resp = json.loads(open('./jsonFiles/Universities.json', encoding="utf-8-sig").read())
    Universities = json_resp['Universities']
    return Universities


def get_faculties():
    # res = requests.get("https://mandat.dtm.uz/JsonFiles/Faculties.json")
    # json_res = res.json()
    json_res = json.loads(open('./jsonFiles/Faculties.json', encoding="utf-8-sig").read())
    return json_res['Faculties']



def get_edulang():
    # res = requests.get("https://mandat.dtm.uz/JsonFiles/EducLang.json")
    # json_res = res.json()
    json_res = json.loads(open('./jsonFiles/EducLang.json', encoding="utf-8-sig").read())
    return json_res['EducLang']


def get_edumode():
    # res = requests.get("https://mandat.dtm.uz/JsonFiles/Emode.json")
    # json_res = res.json()
    json_res = json.loads(open('./jsonFiles/Emode.json', encoding="utf-8-sig").read())
    return json_res['Emode']


# print(get_universities())