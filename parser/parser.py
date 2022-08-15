import re
import sys
import json
import random
import asyncio
import aiohttp 
from bs4 import BeautifulSoup


class DTM:
    def __init__(self):
        self.headers = {
            'Accept': '*/*',
            'Connection': 'keep-alive',
            "User-Agent": DTM.RandomUserAgent()
        }
        self.s = None
        self.url = 'https://mandat.dtm.uz/'
        self.modes = ['Kunduzgi', 'Sirtqi', 'Kechki', 'Masofaviy']
        self.languages = ["O'zbekcha", "Русский", "Qoraqalpoq", "Tadjik", "Qozoq", "Turkman"]
    
    
    @staticmethod
    def RandomUserAgent():
        with open("./parser/user_agents.json", "r") as agents:
            user_agents = json.load(agents)["agents"]
        return random.choice(user_agents)
    
    async def start(self):
        self.s = aiohttp.ClientSession()
    
    
    def change_user_agent(self):
        self.headers['User-Agent'] = DTM.RandomUserAgent()
    
    
    async def close(self):
        return await self.s.close()
    
    
    async def __getPage(self, url: str, data: dict=None) -> BeautifulSoup|None:
        if not url.startswith('https://mandat.dtm.uz/'):
            url = self.url + url
        try:
            resp: aiohttp.ClientResponse = await self.s.get(url, params=data, headers=self.headers)
            if resp.status != 200:
                return print(f"Bunday sahifa mavjud emas!\n {url}")
            txt = await resp.text()
            return BeautifulSoup(txt, 'html.parser')
        except Exception as e:
            return print(e)
        


    async def User_detail(self, abt_id: int):
        bs = await self.__getPage('Home2022/Details/' + str(abt_id))
        if bs is None:
            return None
        try:
            result = {'abt_id': abt_id}
            main_element = bs.find('main')
            divs = main_element.find_all('div', attrs={'class':'card-header'})
            result['fish'] = divs[1].strong.text.strip()
            divCom = main_element.find('div', attrs={'id': 'divCom'}).div
            result['til'] = divCom.find_all('div', attrs={'class': 'col-md-4'})[1].u.text.strip()
            result['til_id'] = self.languages.index(result['til']) + 1
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
                res['mode_id'] = self.modes.index(res['mode']) + 1
                res['shifr'] = td[4].text.strip()
                grant = td[5].text.strip()
                res['grant'] = 0 if grant == '-' else int(grant)
                kantrak = td[6].text.strip()
                res['kantrak'] = 0 if kantrak == '-' else int(kantrak)
                result['yonalishlar'].append(res)
            
            result['ball'] = None
            result['bloks'] = None
            if 'TEST SINOVLARIDA ISHTIROK ETMAGAN!' not in divCom.text:
                collaps = divCom.find('div', attrs={'id': 'collaps'})
                result['ball'] = float(collaps.div.h5.b.text.strip().replace('Umumiy ball: ', '').replace(',', '.'))
                table = collaps.find('table', attrs={'class': 'table table-bordered'})
                tds = table.thead.tr.find_all('td')[:5]
                bloks = []
                for i, td in enumerate(tds):
                    blokcha = {}
                    txt = td.text.strip().replace('\r', '').replace('\n', '').replace('\t', '')
                    # 1 - blokOna tili10 ta savol
                    match = re.search(str(i+1) + r" - blok(.+)([13]0) ta savol", txt)
                    blokcha['fan'] = match.groups()[0]
                    if blokcha['fan'] == 'Биология':
                        blokcha['fan'] = "Biologiya"
                    blokcha['savollarSoni'] = int(match.groups()[1])
                    bloks.append(blokcha)
                
                corrects = table.tbody.tr.find_all('td')[::2]
                for i in range(5):
                    bloks[i]['yechganlariSoni'] = int(corrects[i].text.strip())
                result['bloks'] = bloks
                
            return result
        except Exception as e:
            print(e)
            raise Exception(f"{abt_id} ni parsing qilishda xatolik")
        
        
    
    async def Users_list(self, page: int, region: int, university: int, faculty: int, lang: int=1, mode: int=1) -> list|None:
        # https://mandat.dtm.uz/Home2022/AfterFilter?page=1275&region=11&university=363&faculty=60910200&
        # edLang=1&edType=1&nog=False&muy=False&soldier=False&iiv=False&prez=0&notC=0&bans=0&covid=0&olis=False&sortorder=ResultDesc
        '''
        Mandat saytidagi abituriyentlar ro'yxatini oladi
        :param int page: sahifa raqami
        :param int region: Hudud id raqami
        ...
        :return: list[dict] yoki None qaytaradi
        '''
        bs: BeautifulSoup = await self.__getPage(
            url='Home2022/AfterFilter',
            data={
                'page': page,
                'region': region,
                'university': university,
                'faculty': faculty,
                'edLang': lang,
                'edType': mode,
                'nog': "False",
                'muy': "False",
                'soldier': "False",
                'iiv': "False",
                'prez': 0,
                'notC': 0,
                'bans': 0,
                'covid': 0,
                'olis': "False",
                'sortorder': 'ResultDesc'
            }
        )
        if bs is None:
            return None
        asosiy = bs.find('div', attrs={'id': 'Asosiy'})
        table = asosiy.find('table', attrs={'id': 'myTable'})
        if "Ma'lumot topilmadi" in asosiy.text:
            return []
        rows = table.find_all('tr')[1:]
        result = []
        for row in rows:
            tds = row.find_all('td')
            res1 = dict()
            res1['abtID'] = int(tds[0].text.strip())
            res1['abtName'] = tds[1].text.strip()
            res1['yonalish'] = tds[2].text.strip()
            res1['otm'] = tds[3].text.strip()
            ball = tds[4].text.strip()
            if ball == "Qiymatlanmagan!":
                res1['ball'] = None
            elif ball == "Test sinovlaridan chetlashtirilgan!":
                res1['ball'] = -1
            else:
                ball = ball.replace(',', '.')
                res1['ball'] = float(ball)
            res1['til'] = tds[5].text.strip()
            res1['tilID'] = self.languages.index(res1['til']) + 1
            res1['mode'] = tds[6].text.strip()
            result.append(res1)
            
        n = asosiy.find_all('div', attrs={'class': 'alert'})[-1].find_all('b')[2]
        n = int(n.text.strip())
        return {'result': result, 'jami': n}



async def __main():
    # test
    p = DTM()
    await p.start()
    datas = dict(await p.User_detail(4000733))
    # pprint(datas)
    # print(str(datas))
    with open('./parser/test/result_example.json', 'w', encoding='utf8') as f:
        f.write(json.dumps(datas, indent=4, sort_keys=True))
    await p.close()
    

if __name__ == '__main__':
    if sys.platform == 'win32':
        asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())
    asyncio.run(__main())