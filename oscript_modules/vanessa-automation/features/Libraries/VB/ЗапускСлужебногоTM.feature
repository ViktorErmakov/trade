﻿# language: ru

@IgnoreOnCIMainBuild

@ExportScenarios


Функционал: Запуск служебного сеанса TesnManager
 

Сценарий: Я запускаю служебный сеанс TestClient с ключом TestManager в той же базе

	И Я запоминаю значение выражения 'ИмяПользователя()' в переменную "ИмяПользователя"
	Когда Я подключаю клиент тестирования с параметрами:
		| 'Имя подключения' |  'Строка соединения' | 'Логин'             | 'Пароль' | 'Запускаемая обработка' |  'Дополнительные параметры строки запуска'  |
		| 'TM'              |  ''                  | '$ИмяПользователя$' | ''       | ''                      |  '/TestManager'                             |	

		
Сценарий: Я запускаю служебный сеанс TestClient с ключом TestManager толстый клиент в той же базе

	И Я запоминаю значение выражения 'ИмяПользователя()' в переменную "ИмяПользователя"
	Когда Я подключаю клиент тестирования с параметрами:
		| 'Имя подключения' | 'Дополнительные параметры строки запуска' | 'Тип клиента' | 'Логин'            |
		| 'TM_Толстый'      | '/TestManager'                            | 'Толстый'     |'$ИмяПользователя$' |
		