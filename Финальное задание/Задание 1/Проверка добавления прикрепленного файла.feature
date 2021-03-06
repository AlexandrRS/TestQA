#language: ru

@tree

Функционал: Проверка добавление нового изображения в форму справочника Товары

Как Администратор я хочу
прикреплять к товару необходимое изображение
чтобы иметь представление о том, как выглядит товар 

Контекст:
Дано я подключаю профиль TestClient "Администратор"
И я закрываю все окна клиентского приложения

Сценарий: _01 Подготовительный сценарий
	И Загрузка констант
	И Загрузка тестовых данных
Сценарий: _02 Проверка добавление нового изображения в форму справочника Товары

И Я открываю навигационную ссылку "e1cib/data/Справочник.Товары?ref=8ca0000d8843cd1b11dc8cfecc6a7df4"
И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"
И я нажимаю на кнопку с именем 'ФормаСоздать'
И в поле с именем 'Наименование' я ввожу текст 'Молоко'
И я выбираю файл "C:\Users\dmitrova\Desktop\КурсТестирования\TestQA\Финальное задание\Задание 1\Молоко.jpg"
И я нажимаю на кнопку 'Выбрать файл с диска и записать'
И я запоминаю значение поля с именем 'Код' как 'КодКартинки'
И я нажимаю на кнопку "Записать и закрыть"
Тогда таблица "Список" содержит строки:
	| 'Код'           |
	| '$КодКартинки$' |
И в таблице "Список" я перехожу к строке:
	| 'Код'           |
	| '$КодКартинки$' |
И я нажимаю на кнопку с именем 'ФормаВыбрать'
@screenshot
И я нажимаю кнопку очистить у поля с именем "ФайлКартинки"
