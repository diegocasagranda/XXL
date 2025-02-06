from bs4 import BeautifulSoup as soup
from urllib.request import urlopen
from urllib.parse import quote
import os
import sys


def news(noticia):
    string_formatada = quote(noticia)

    news_url = f"https://news.google.com/rss/search?q={string_formatada}&hl=pt-BR&gl=BR&ceid=BR:pt-419"

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


if __name__ == "__main__":

    while True:
        noticia = input("> ")

        if noticia == "sair":
            exit()
        elif noticia in ["cls", "clear"]:
            os.system("clear")
        else:
            news(noticia)
