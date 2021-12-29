﻿#language: ru

@tree

Функционал: проверка итоговой суммы документа Заказ при изменении количества и цены

Как Менеджер по закупкам я хочу
проверка расчета провильности расчета итоговой суммы 
чтобы при изменении количества и цены менялась итоговая сумма Заказа 
Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий
Сценарий: Проверка итоговой суммы документа Заказ при изменении количества и цены
* Открытие Заказа
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Когда открылось окно 'Заказы товаров'
	И в таблице "Список" я выбираю текущую строку
	Когда открылось окно 'Заказ * от *'
*Редактирование Цены и Количества
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '140,00'		
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И я запоминаю значение поля "ТоварыЦена" таблицы "Товары" как "$ТоварыЦена$"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10'	
	И в таблице "Товары" я завершаю редактирование строки
	И я запоминаю значение поля "ТоварыКоличество" таблицы "Товары" как "$ТоварыКоличество$"
	//запоминаем значение рассчитанной итоговой суммы до записи в базу
	И я запоминаю значение поля "ТоварыСумма" таблицы "Товары" как "$ТоварыСумма$"
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
* Проверка итоговой суммы
	Тогда таблица "Товары" содержит строки:
		| 'Товар'     | 'Цена'  | 'Количество' | 'Сумма'  |
		| 'Veko345MO' | '$ТоварыЦена$' | '$ТоварыКоличество$'         | '$ТоварыСумма$' |
	