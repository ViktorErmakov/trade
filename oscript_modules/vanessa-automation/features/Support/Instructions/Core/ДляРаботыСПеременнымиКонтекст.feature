﻿# language: ru

@IgnoreOnCIMainBuild

Функционал: Работа с переменными Контекста
	Как Разработчик
	Хочу Разобраться как работать с переменными контекста
	Чтобы Использовать этот функционал

Сценарий: Работа с переменными Контекста. Сложение двух чисел
	Когда Я указал первое слагаемое 5
	И Я указал второе слагаемое 10
	Тогда я получу сумму 15

Сценарий: Проверка значений переменной КонтекстСохраняемый
	И я вывожу на экран значение структуры "КонтекстСохраняемый" 

	
Сценарий: Проверка значений переменной Контекст
	И я вывожу на экран значение структуры "Контекст" 
