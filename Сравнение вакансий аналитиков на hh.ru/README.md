# Сравнение вакансий аналитиков на hh.ru
[Jupyter тетрадь](https://github.com/Ilya-Tischenko/Projects/blob/main/%D0%A1%D1%80%D0%B0%D0%B2%D0%BD%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B2%D0%B0%D0%BA%D0%B0%D0%BD%D1%81%D0%B8%D0%B9%20%D0%B0%D0%BD%D0%B0%D0%BB%D0%B8%D1%82%D0%B8%D0%BA%D0%BE%D0%B2%20%D0%BD%D0%B0%20hh.ru/%D0%90%D0%BD%D0%B0%D0%BB%D0%B8%D0%B7%20%D0%B2%D0%B0%D0%BA%D0%B0%D0%BD%D1%81%D0%B8%D0%B9%20%D0%B0%D0%BD%D0%B0%D0%BB%D0%B8%D1%82%D0%B8%D0%BA%D0%BE%D0%B2%20%D0%BD%D0%B0%20hh.ru.ipynb)

Сравнение различных признаков вакансий (зарплаты, график, требуемые навыки и пр.) для системных аналитиков и аналитиков данных на hh.ru

**Цель исследования**: выявить различия в предлагаемых вакансиях для аналитиков данных и системных аналитиков.

## Стек
Python, Pandas, Matplotlib, Seaborn, SciPy

## Выводы
Исследование показало как сходства, так и некоторые различия в вакансия для двух профессий.

Основной набор объявлений направлен на поиск специалистов Junior+ и Middle, готовых работать полный рабочий день. Основные работодатели отличаются, но компания Сбер ищет активно как системных аналитиков, так и аналитиков данных.
Зарплаты системных аналитиков, как правило выше, чем у аналитиков данных. 

Для обоих специальностей важны как "мягкие", так и "жесткие" навыки, но для системных аналитиков "мягкие" навыки важны в большей мере, чем для аналитиков данных. 
Для системных аналитиков важны такие soft skills как работа с документацией коммуникация и др. 
Для аналитиков данных важны аналитический склад ума, коммуникация, проактивность и другие. 
Важные hard skills для системных аналитиков: SQL, BPMN, confluence и др. 
Для дата аналитиков важнейшими "жесткими" навыками являются SQL, python, pandas и другие.

## Описание данных
Данные получены из API hh.ru и представлены двумя датасетами:

`vacancies_sa.xlsx` - данные о вакансиях системных аналитиков;

`vacancies_da.xlsx` - данные о вакансиях аналитиков данных

Данные в датасетах представлены следующими полями:
* `id` - Уникальный идентификатор вакансии;
* `name` - Название вакансии;
* `published_at` - Дата публикации;
* `alternate_url` - Ссылка на вакансию;
* `type` - Статус вакансии на момент получения данных от api и передачи
их в базу;
* `employer` - Работодатель;
* `department` - Работодатель, отдел;
* `area` - Регион места работы;
* `experience` - Требуемый опыт работы;
* `key_skills` - Ключевые навыки, в том числе найденные при анализе
полного текста вакансии. Поле генерируется после получения
информации от api;
* `schedule` - График работы;
* `employment` - Тип занятости;
* `description` - Описание вакансии;
* `description_lemmatized` - Лемматизированное описание вакансии;
* `salary_from` - Нижняя граница предлагаемой заработной платы;
* `salary_to` - Верхняя граница предлагаемой заработной платы;
* `salary_bin` - Категория зарплаты;
* `key_skills_from_key_skills_field` - Ключевые навыки из поля вакансии
key_skills;
* `hard_skills_from_description` - “Твердые” навыки, найденные при
обработке полей с навыками. Поле генерируется после получения
информации от api;
* `soft_skills_from_description` - “Мягкие” навыки,
найденные при обработке полей с навыками. Поле генерируется после
получения информации от api.

Данные актуальны на 29 декабря 2024 года.

## План исследования
1. Импорт библиотек, загрузка датасетов и изучение основной информации
2. Предобработка данных
3. Исследовательский анализ данных
    1. Анализ количественных данных
    2. Анализ категориальных данных
4. Определение доли навыков
5. Определение самых важных навыков
6. Выводы и рекоммендации


