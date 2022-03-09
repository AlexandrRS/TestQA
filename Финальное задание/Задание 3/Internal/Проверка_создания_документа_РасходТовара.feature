﻿#language: ru

@tree

Функционал: Проверка создания документа РасходТовара

Как как менеджер по продажам я хочу
проверить корректную работу функционала по созданию, проведению, заполнению и формированию Расходной товарной накладной документа РасходТовара
чтобы корректно выполнялись и фиксировались операции по продаже товара

Контекст:
Дано я подключаю профиль TestClient "Менеджер по продажам"
И я закрываю все окна клиентского приложения

Сценарий: _01 Подготовительный сценарий (загрузка тестовых данных)
	И Подготовка данных
	И Загрузка констант
*Проводка загруженных документов
	И Я открываю навигационную ссылку "e1cib/list/ЖурналДокументов.ДокументыПродаж"
	И в таблице "Список" я выделяю все строки
	И я нажимаю на кнопку с именем 'ФормаПровести'

Сценарий: _02 Проверка заполнения шапки нового документа и расчета итоговой суммы и количества
*Заполнение шапки документа Продажи
	И В командном интерфейсе я выбираю 'Продажи' 'Продажи'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	И из выпадающего списка с именем "Организация" я выбираю по строке 'ООО "Все для дома"'
	И из выпадающего списка "Покупатель" я выбираю по строке "Животноводство ООО"
	И элемент формы с именем "Покупатель" стал равен "Животноводство ООО "
	//проверка, что автоматически заполнился вид цены
	И элемент формы с именем 'ВидЦен' стал равен 'Оптовая'
	И из выпадающего списка с именем "Склад" я выбираю по строке 'Малый'
	И элемент формы с именем "Склад" стал равен "Малый"	
	И из выпадающего списка с именем "Валюта" я выбираю по строке 'Рубли'
	И элемент формы с именем "Валюта" стал равен "Рубли"	
*Заполнение таблицы Товары
	//добваление обуви
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	И в таблице "Список" я перехожу к строке
		| 'Наименование' |
		| 'Обувь'        |
	И в таблице  "Список" я перехожу на один уровень вниз
	И в таблице "Список" я перехожу к строке
		| 'Наименование' |
		| 'Сапоги'       |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '12,00'
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2,00'
	И в таблице "Товары" я завершаю редактирование строки
*Проверка, что сумма по товару посчитана верно и итоговая сумма и количество верны
	И в таблице 'Товары' поле с именем 'ТоварыСумма' имеет значение '24,00'	
	И элемент формы с именем "ТоварыИтогСумма" стал равен '24'
	//добавление услуги
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	И в таблице "Список" я перехожу к строке
		| 'Наименование' |
		| 'Услуги'       |
	И в таблице  "Список" я перехожу на один уровень вниз
	И в таблице "Список" я перехожу к строке
		| 'Наименование' |
		| 'Доставка'       |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '2,00'
	И в таблице "Товары" я завершаю редактирование строки
*Проверка, что сумма по услуге посчитана верно и итоговая сумма и количество верны
	И в таблице 'Товары' поле с именем 'ТоварыСумма' имеет значение '2,00'
	И элемент формы с именем "ТоварыИтогКоличество" стал равен '3'
	И элемент формы с именем "ТоварыИтогСумма" стал равен '26'
*Изменение количества и цены и проверка расчета итогового количества и цены
	И в таблице "Товары" я перехожу к строке:
		| 'Количество' | 'Сумма' | 'Товар'  | 'Цена'  |
		| '2,00'       | '24,00' | 'Сапоги' | '12,00' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '10'
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я перехожу к строке:
		| 'Сумма' | 'Товар'    | 'Цена' |
		| '2,00'  | 'Доставка' | '2,00' |
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '10'
	И в таблице "Товары" я завершаю редактирование строки
	И элемент формы с именем "ТоварыИтогКоличество" стал равен '2'		
	И элемент формы с именем "ТоварыИтогСумма" стал равен '20'
	И я нажимаю на кнопку с именем 'ФормаПровести'
	И я запоминаю значение поля с именем "Номер" как "НомерДокументаПродажи"
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
*Проверка, что документ записан в базу
	И Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
	И таблица "Список" содержит строки:
		| 'Номер'                 |
		| $НомерДокументаПродажи$ |
Сценарий: _03 Проверка отображения поля взаиморасчетов
	И Я открываю навигационную ссылку "e1cib/data/Документ.РасходТовара?ref=9e8f00d8615acb7511ec9c60616b4285"
	И из выпадающего списка с именем "Покупатель" я выбираю по строке 'Пантера АО'
	И элемент формы с именем 'ВидЦен' стал равен 'Закупочная'
	И элемент формы с именем "Валюта" доступен
	И элемент формы с именем "Валюта" присутствует на форме
	И из выпадающего списка с именем "Организация" я выбираю по строке 'ООО "1000 мелочей"'
	И элемент формы "Заголовок поля" отсутствует на форме

Сценарий: _04 Проверка печатной формы Печать расходной накладной
	И Я открываю навигационную ссылку "e1cib/data/Документ.РасходТовара?ref=9e8f00d8615acb7511ec9c60616b4285"
	И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'

	Дано Табличный документ 'SpreadsheetDocument' равен макету "ПечатьРасходнойНакладной" по шаблону

Сценарий: _05 Проверка, что если товара нет на складе, то документ не проведется
	И Я открываю навигационную ссылку "e1cib/data/Документ.РасходТовара?ref=9e8f00d8615acb7511ec9c60616b4285"
	//изменим дату проведения документа
	И в поле с именем "Дата" я ввожу текущую дату и текущее время		
	И в таблице "Товары" я нажимаю на кнопку с именем 'КомандаПодбор'
	И в таблице "СписокТоваров" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000001' | 'Обувь'        |
	И в таблице  "СписокТоваров" я перехожу на один уровень вниз
	И в таблице "СписокТоваров" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000031' | 'Босоножки'    |
	И в таблице "СписокТоваров" я выбираю текущую строку
	И я нажимаю на кнопку с именем 'ОК'
	И в таблице "Товары" я перехожу к строке:
		| 'Товар'     |
		| 'Босоножки' |
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1 001,00'
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '12,00'
	И в таблице "Товары" я завершаю редактирование строки	
	И я нажимаю на кнопку с именем 'ФормаПровести'
*Появилось предупреждение, что документ не проведен, так как товара нет на складе
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку с именем 'OK'				

Сценарий: _06 Проверка движения документов по регистру взаиморасчетов с контрагентами
	И Я открываю навигационную ссылку "e1cib/data/Документ.РасходТовара?ref=9e8f00d8615acb7511ec9c60616b4285"
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр взаиморасчетов с контрагентами'
	Тогда таблица "Список" содержит строки:
		| 'Регистратор'            | 'Контрагент'          | 'Сумма'    | 'Валюта' |
		| 'Продажа 000000108 от *' | 'Животноводство ООО ' | '3 250,00' | 'Рубли'  |

Сценарий: _07 Проверка движения документов по регистру продаж
	И Я открываю навигационную ссылку "e1cib/data/Документ.РасходТовара?ref=9e8f00d8615acb7511ec9c60616b4285"
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр продаж'
	Тогда таблица "Список" содержит строки:
		| 'Регистратор'                              | 'Покупатель'          | 'Товар'    | 'Количество' | 'Сумма'    |
		| 'Продажа 000000108 от 05.03.2022 14:17:55' | 'Животноводство ООО ' | 'Доставка' | '1,00'       | '200,00'   |
		| 'Продажа 000000108 от 05.03.2022 14:17:55' | 'Животноводство ООО ' | 'Сапоги'   | '1,00'       | '3 050,00' |

Сценарий: _08 Проверка движения документов по регистру товарных запасов
	И Я открываю навигационную ссылку "e1cib/data/Документ.РасходТовара?ref=9e8f00d8615acb7511ec9c60616b4285"
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр товарных запасов'
	Тогда таблица "Список" содержит строки:
		| 'Склад' | 'Регистратор'                              | 'Товар'  | 'Количество' |
		| 'Малый' | 'Продажа 000000108 от 05.03.2022 14:17:55' | 'Сапоги' | '1,00'       |


	

		
				
