from bs4 import BeautifulSoup as soup
from urllib.request import urlopen

news_url = "https://news.google.com/rss/topics/CAAqKggKIiRDQkFTRlFvSUwyMHZNRGx1YlY4U0JYQjBMVUpTR2dKQ1VpZ0FQAQ?hl=pt-BR&gl=BR&ceid=BR%3Apt-419"

Client = urlopen(news_url)
xml_page = Client.read()
Client.close()

soup_page = soup(xml_page, "xml")

news_list = soup_page.findAll("item")

for news in news_list[:10]:
    print(news.title.text)
    print(" ")
    # print(news.link.text)
    # print(news.pubDate.text)
    # print("-" * 80)


