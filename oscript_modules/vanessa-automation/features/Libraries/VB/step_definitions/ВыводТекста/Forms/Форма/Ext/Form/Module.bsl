﻿//начало текста модуля

///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Служебная функция.
Функция ДобавитьШагВМассивТестов(МассивТестов,Снипет,ИмяПроцедуры,ПредставлениеТеста = Неопределено,Транзакция = Неопределено,Параметр = Неопределено)
	Структура = Новый Структура;
	Структура.Вставить("Снипет",Снипет);
	Структура.Вставить("ИмяПроцедуры",ИмяПроцедуры);
	Структура.Вставить("ИмяПроцедуры",ИмяПроцедуры);
	Структура.Вставить("ПредставлениеТеста",ПредставлениеТеста);
	Структура.Вставить("Транзакция",Транзакция);
	Структура.Вставить("Параметр",Параметр);
	МассивТестов.Добавить(Структура);
КонецФункции

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ОбратитеВнимание(Парам01)","ОбратитеВнимание","И обратите внимание ""Текст обратите внимание""","Выводит в автовидеоинструкцию нужный текст в виде вставки. Белые буквы на черном фоне.","Прочее.Автоинструкции.Устаревшее");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВидеоВставка(Парам01)","ВидеоВставка","И видеовставка ""Текст""","Выводит в автовидеоинструкцию нужный текст в виде вставки. Белые буквы на черном фоне.","Прочее.Автоинструкции");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ТекстСубтитров(Парам01)","ТекстСубтитров","Дано текст субтитров ""Текст""","Выводит в автовидеоинструкцию нужный текст в виде субтитров. В качестве фона кадра будет взято текущее состояние экрана.","Прочее.Автоинструкции");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//Когда обратите внимание "Текст обратите внимание"
//@ОбратитеВнимание(Парам01)
Процедура ОбратитеВнимание(ТекстСообщения) Экспорт
	Сообщить(Ванесса.ПолучитьТекстСообщенияПользователю(ТекстСообщения));
КонецПроцедуры

&НаКлиенте
//Когда видео вставка "Текст обратите внимание"
//@ВидеоВставка(Парам01)
Процедура ВидеоВставка(ТекстСообщения) Экспорт
	Сообщить(Ванесса.ПолучитьТекстСообщенияПользователю(ТекстСообщения));
КонецПроцедуры

&НаКлиенте
//Дано текст субтитров "Текст"
//@ТекстСубтитров(Парам01)
Процедура ТекстСубтитров(Текст) Экспорт
	Ванесса.УстановитьТекстИнструкции(Текст);
КонецПроцедуры
