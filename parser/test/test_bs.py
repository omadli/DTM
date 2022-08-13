import re
from bs4 import BeautifulSoup
from pprint import pprint



html = open('./parser/test/test2.html', encoding='utf8').read()
bs = BeautifulSoup(html, 'html.parser')

modes = ['Kunduzgi', 'Sirtqi', 'Kechki', 'Masofaviy']
languages = ["O'zbekcha", "Русский", "Qoraqalpoq", "Tadjik", "Qozoq", "Turkman"]
    
abt_id = 4499249
result = {'abt_id': abt_id}
main_element = bs.find('main')
divs = main_element.find_all('div', attrs={'class':'card-header'})
result['fish'] = divs[1].strong.text.strip()
divCom = main_element.find('div', attrs={'id': 'divCom'}).div
result['til'] = divCom.find_all('div', attrs={'class': 'col-md-4'})[1].u.text.strip()
result['til_id'] = languages.index(result['til']) + 1
result['grant_ustuvor'] = "avval davlat granti, so'ngra to'lov-kontrakt asosida ko'rib chiqiladi!" in divCom.text
        
tbody = divCom.find('tbody')
tr_list = tbody.find_all('tr')
result['yonalishlar'] = []
for tr in tr_list:
    td = tr.find_all('td')
    res = {}
    res['maqsadli'] = 'Maqsadli' in td[0].text.strip()
    res['otm'] = td[1].text.strip()
    res['faculty'] = td[2].text.strip()
    res['mode'] = td[3].text.strip()
    res['mode_id'] = modes.index(res['mode']) + 1
    res['shifr'] = td[4].text.strip()
    grant = td[5].text.strip()
    res['grant'] = 0 if grant == '-' else int(grant)
    kantrak = td[6].text.strip()
    res['kantrak'] = 0 if kantrak == '-' else int(kantrak)
    
    result['yonalishlar'].append(res)

result['ball'] = None
result['natija'] = None
if 'TEST SINOVLARIDA ISHTIROK ETMAGAN!' not in divCom.text:
    collaps = divCom.find('div', attrs={'id': 'collaps'})
    result['ball'] = float(collaps.div.h5.b.text.strip().replace('Umumiy ball: ', '').replace(',', '.'))
    table = collaps.find('table', attrs={'class': 'table table-bordered'})
    tds = table.find_all('td')
    bloks = {}
    for i, td in enumerate(tds):
        txt = td.text.strip().replace('\n', '').replace('\t', '')
        # 1 - blok (1.1 ball)Ona tili10 ta savol
        match = re.search(str(i+1) + r" - blok \(([0-9]\.[0-9]) ball\)([A-Za-z ]+)([0-9]+) ta savol", txt)
        bloks[f'blok{i+1}']['bali'] = float(match.group(0))
        bloks[f'blok{i+1}']['fan'] = match.group(1)
        bloks[f'blok{i+1}']['savollarSoni'] = int(match.group(2))
        
    result['natija'] = bloks
                  
pprint(result)
# print(result)
