from bs4 import BeautifulSoup

html = open('./parser/test/test_mandat.html', encoding='utf8').read()
bs = BeautifulSoup(html, 'html.parser')

asosiy = bs.html.find('div', attrs={'id': 'Asosiy'})
# print(asosiy)

table = asosiy.find('table', attrs={'id': 'myTable'})
if "Ma'lumot topilmadi" in asosiy.text:
    print("tugadi")
    exit()
rows = table.find_all('tr')[1:]
result = []
for row in rows:
    tds = row.find_all('td')
    res1 = dict()
    res1['abtID'] = tds[0].text.strip()
    res1['abtName'] = tds[1].text.strip()
    res1['yonalish'] = tds[2].text.strip()
    res1['otm'] = tds[3].text.strip()
    ball = tds[4].text.strip()
    if ball == "Qiymatlanmagan!":
        res1['ball'] = None
    else:
        ball = ball.replace(',', '.')
        res1['ball'] = float(ball)
    res1['til'] = tds[5].text.strip()
    # res1['tilID'] = languages.index(res1['til']) + 1
    res1['mode'] = tds[6].text.strip()
    result.append(res1)
    
n = asosiy.find_all('div', attrs={'class': 'alert'})[-1]
print(n)
n = n.find_all('b')[2]
n = int(n.text.strip())
print( {'result': result, 'jami': n})
print("ok")