# Приоритизация гипотез и анализ A/B-теста для интернет магазина
[Jupyter тетрадь](https://github.com/Ilya-Tischenko/Projects/blob/main/%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D0%B4%D0%B5%D0%BD%D0%B8%D0%B5%20AB-%D1%82%D0%B5%D1%81%D1%82%D0%B0%20%D0%B4%D0%BB%D1%8F%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%BD%D0%B5%D1%82-%D0%BC%D0%B0%D0%B3%D0%B0%D0%B7%D0%B8%D0%BD%D0%B0/%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D0%B4%D0%B5%D0%BD%D0%B8%D0%B5%20AB-%D1%82%D0%B5%D1%81%D1%82%D0%B0%20%D0%B4%D0%BB%D1%8F%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%BD%D0%B5%D1%82-%D0%BC%D0%B0%D0%B3%D0%B0%D0%B7%D0%B8%D0%BD%D0%B0.ipynb)

Приоритизация предложенных гипотез фреймворками ICE и RICE. Анализ A/B-теста.

**Цель исследования:** приоритизировать имеющиеся гипотезы, провести A/B-тест.

Данные о гипотезах представлены файлом `hypothesis.csv`, состоящего из следующих полей (параметров):
+ `Reach` -  оценка охвата пользователей, которых затронет изменение,
+ `Impact` - оценка влияния на пользовательский опыт,
+ `Confidence` - уверенность во влиянии изменений,
+ `Efforts` - оценка ресурсов, необходимых для тестирования гипотезы

Данные о заказах (id заказа, id пользователя, дата, выручка, группа A/B-теста) хранятся в файле `orders.csv`. Данные о количестве пользователей взяты из файла `visitors.csv`.



Исследование будет проводиться по следующему плану: импорт необходимых библиотек и данных, приоритизация гипотез (методом ICE и методом RICE), анализ A/B-теста (анализ графиков кумулятивных метрик, анализ выбросов, применение статистических тест, формулировка выводов).

## Выводы

Тест показал, что существует статистически значимая разница между группами по количеству заказов: в группе B оно выше. По средним чекам A/B-тест 
показал отсутствие статистически значимой разницы между группами, как по сырым данным, так и по отфильтрованным.
## Стек
Python, Pandas, Matplotlib, SciPy, Numpy
