﻿#language: ru

Функционал: <описание фичи>

Как <Роль>
Я хочу <описание функционала> 
Чтобы <бизнес-эффект> 

Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий


Сценарий: <описание сценария>

	И Пауза 5
	И В панели функций я выбираю 'Номенклатура'
	Тогда открылось окно 'Номенклатура'
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Ручка (Номенклатура)'
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна 'Ручка (Номенклатура)' в течение 20 секунд
	Тогда открылось окно 'Номенклатура'
	И Я закрываю окно 'Номенклатура'

