# -*- coding: utf-8 -*-
"""ZEJLI Oualid NBA Scraping CC.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1rnKf2vFQ32cA0AC_xKf7UC_NB5fIOzcJ

**Contrôle continu Web Scraping**

Web Scraping   partir du Site:
https://www.basketball-reference.com/leagues/NBA_2022_per_game.html
"""

from urllib.request import urlopen
from bs4 import BeautifulSoup
import pandas as pd

year = 2022

url = "https://www.basketball-reference.com/leagues/NBA_2022_per_game.html".format(year)

html = urlopen(url)
soup = BeautifulSoup(html)

soup.findAll('tr', limit=2)

headers = [th.getText() for th in soup.findAll('tr', limit=2)[0].findAll('th')]

headers = headers[1:]
headers

rows = soup.findAll('tr')[1:]
player_stats = [[td.getText() for td in rows[i].findAll('td')]
            for i in range(len(rows))]

NBA22_Player_Stats = pd.DataFrame(player_stats, columns = headers)
NBA22_Player_Stats

from pandas.core.frame import DataFrame
csv = NBA22_Player_Stats.to_csv('ZEJLI_Oualid_NBAScraping_CC_.csv', index=True)

