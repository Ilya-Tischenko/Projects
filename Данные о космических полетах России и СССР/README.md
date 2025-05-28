# Данные о космических полетах России и СССР
[Tableau](https://public.tableau.com/app/profile/ilya.tischenko/viz/RC_17445619850800/Dashboard1) | [Jupyter-тетрадь](https://github.com/Ilya-Tischenko/Projects/blob/main/%D0%94%D0%B0%D0%BD%D0%BD%D1%8B%D0%B5%20%D0%BE%20%D0%BA%D0%BE%D1%81%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D1%85%20%D0%BF%D0%BE%D0%BB%D0%B5%D1%82%D0%B0%D1%85%20%D0%A0%D0%BE%D1%81%D1%81%D0%B8%D0%B8%20%D0%B8%20%D0%A1%D0%A1%D0%A1%D0%A0/Roscosmos_parser.ipynb)

Создание скрипта для извлечения данных (парсинга) о космических полетах России и СССР из сайта Роскосмоса. Визуализация полученных данных на дашборде.

Данные находятся в открытом доступе (https://www.roscosmos.ru/launch/2025/)
## Структура датасета
В результате парсинга создан датасет со следующими полями:
* **date** - дата полета
* **name** - название полета
* **port** - название космопорта, откуда был запущен космический аппарат
* **rocket** - название космического аппарата
* **result** - результат пуска

## Дашборд
На основе полученных данных был создан дашборд в [Tableau](https://public.tableau.com/app/profile/ilya.tischenko/viz/RC_17445619850800/Dashboard1)

## Стек
Python, Requests, BeautifulSoup, Pandas, Tableau


