&НаКлиенте
Процедура ПотоковаяЗапись(Команда)
	ПотоковаяЗаписьНаСервере();
КонецПроцедуры

&НаСервере
Процедура ПотоковаяЗаписьНаСервере()
	
// Задать параметры записи JSON.	
	ПараметрыJSON	=	Новый ПараметрыЗаписиJSON(ПереносСтрокJSON.Нет, "", Истина);
 
		
// Создать объект записи и открыть файл, в который будет выполняться запись. 
	Запись = Новый ЗаписьJSON;
	Запись.ОткрытьФайл("C:\Users\Asus\Desktop\1С\Базы\Интеграции_Примеры работы\streamWrite.json", , , ПараметрыJSON);

//	Записать	начало	корневого	объекта.	
	Запись.ЗаписатьНачалоОбъекта();	//	Записать	имя	свойства	корневого	объекта.

	Запись.ЗаписатьИмяСвойства("Контрагент1");
	Запись.ЗаписатьНачалоОбъекта(); 
	
// Заполнить свойство Код типа Строка. 
	Запись.ЗаписатьИмяСвойства("Код");
	Запись.ЗаписатьЗначение("000000017"); 
  // Заполнить свойство Наименование типа Строка. 
	Запись.ЗаписатьИмяСвойства("Наименование");
	Запись.ЗаписатьЗначение("ОАО Топаз"); 
  // Заполнить свойство Телефоны типа Массив.
 // Поэтому после имени свойства записываем массив, состоящий из значений – строк. 
	Запись.ЗаписатьИмяСвойства("Телефоны");
	Запись.ЗаписатьНачалоМассива();
	Запись.ЗаписатьЗначение("8-999-777-55-33");
	Запись.ЗаписатьЗначение("+71112223344");
	Запись.ЗаписатьКонецМассива(); 
 // Заполнить свойство ОбъемПродаж типа Число. 
	Запись.ЗаписатьИмяСвойства("ОбъемПродаж");
	Запись.ЗаписатьЗначение(5000000); 
 // Заполнить свойство Поставщик? типа Булево. 
	Запись.ЗаписатьИмяСвойства("Поставщик?");
	Запись.ЗаписатьЗначение(Ложь); 
 // Записать конец нашего объекта. 
	Запись.ЗаписатьКонецОбъекта();
	Запись.ЗаписатьИмяСвойства("Контрагент2");
	Запись.ЗаписатьНачалоОбъекта(); 
	
// Заполнить свойство Код типа Строка. 
	Запись.ЗаписатьИмяСвойства("Код");
	Запись.ЗаписатьЗначение("000000018"); 
  // Заполнить свойство Наименование типа Строка. 
	Запись.ЗаписатьИмяСвойства("Наименование");
	Запись.ЗаписатьЗначение("ОАО Алмаз"); 
  // Заполнить свойство Телефоны типа Массив.
 // Поэтому после имени свойства записываем массив, состоящий из значений – строк. 
	Запись.ЗаписатьИмяСвойства("Телефоны");
	Запись.ЗаписатьНачалоМассива();
	Запись.ЗаписатьЗначение("8-999-777-55-33");
	Запись.ЗаписатьЗначение("+71112223344");
	Запись.ЗаписатьКонецМассива(); 
 // Заполнить свойство ОбъемПродаж типа Число. 
	Запись.ЗаписатьИмяСвойства("ОбъемПродаж");
	Запись.ЗаписатьЗначение(5000001); 
 // Заполнить свойство Поставщик? типа Булево. 
	Запись.ЗаписатьИмяСвойства("Поставщик?");
	Запись.ЗаписатьЗначение(Истина); 
 // Записать конец нашего объекта. 
	Запись.ЗаписатьКонецОбъекта();
	
//	Записать	конец	корневого	объекта.	
	Запись.ЗаписатьКонецОбъекта();  
 // Завершить работу с файлом. 
	Запись.Закрыть();

КонецПроцедуры

&НаКлиенте
Процедура СериализацияСФункциейПреобразования(Команда)
	СериализацияСФункциейПреобразованияНаСервере();
КонецПроцедуры

&НаСервере
Процедура СериализацияСФункциейПреобразованияНаСервере()
	
	// Создать структуру с данными контрагента. 
	Данные = Новый Структура;
	Данные.Вставить("Контрагент", "ОАО Топаз");
	Данные.Вставить("ОбъемПродаж", 5000000);
 
 // Записать свойство Адрес, имеющее тип ДанныеАдреса. 
	ДопИнфо = Новый ДанныеАдреса(Новый Структура("Город, Страна, Индекс", "Москва", "Россия", "112233"));
	Данные.Вставить("Адрес", ДопИнфо);
	Данные.Вставить("Поставщик", Ложь);
  // Создать объект записи и открыть файл, в который будет выполняться запись. 
	Запись = Новый ЗаписьJSON;
	ПараметрыЗаписиJSON = Новый ПараметрыЗаписиJSON(ПереносСтрокJSON.Авто, Символы.Таб);
	Запись.ОткрытьФайл("C:\Users\Asus\Desktop\1С\Базы\Интеграции_Примеры работы\streamWrite.json", , ,
		ПараметрыЗаписиJSON);
  // Выполнить запись данных (Данные) с помощью объекта записи (Запись). 
	ЗаписатьJSON(Запись, Данные, , "ФункцияПреобразованияЗаписи", ЭтотОбъект);
  // Завершить работу с файлом. 
	Запись.Закрыть();

КонецПроцедуры

&НаКлиенте
Процедура ДесериализацияСФункциейВосстановлени(Команда)
	ДесериализацияСФункциейВосстановлениНаСервере();
КонецПроцедуры

&НаСервере
Процедура ДесериализацияСФункциейВосстановлениНаСервере()
	
	// Создать объект чтения и открыть файл, из которого будет выполняться чтение. 
	Чтение = Новый ЧтениеJSON;
	Чтение.ОткрытьФайл("C:\Users\Asus\Desktop\1С\Базы\Интеграции_Примеры работы\streamWrite.json");
  // Выполнить чтение данных в структуру Данные с помощью объекта чтения (Чтение).
  
  РеквизитыДляВосстановления = Новый Массив();
  РеквизитыДляВосстановления.Добавить("Телефоны");

	Данные = ПрочитатьJSON(Чтение, Ложь, , , "ФункцияВосстановленияЧтения", ЭтотОбъект,, РеквизитыДляВосстановления);
  // Завершить работу с файлом. 
	Чтение.Закрыть();
 
 // Вывести результат чтения в сообщение. 
	Сообщение = Новый СообщениеПользователю;
	Сообщение.Текст = "Контрагент: " + Данные.Контрагент + ", Объем продаж: " + Данные.ОбъемПродаж + ", Поставщик?: "
		+ Данные.Поставщик + ", Телефоны: ";
	Для Каждого Телефон Из Данные.Телефоны Цикл
		Сообщение.Текст = Сообщение.Текст + Телефон + ", ";
	КонецЦикла;
	Сообщение.Сообщить();
КонецПроцедуры


&НаСервере
Функция ФункцияВосстановленияЧтения(Свойство, Значение, ДополнительныеПараметры) Экспорт
	Если Свойство = "Телефоны" И ТипЗнч(Значение) = Тип("Массив") Тогда
		Телефоны = Новый Массив;
		Для Каждого Телефон Из Значение Цикл
			СтрокаТелефона = Лев(Телефон, 2) + "-" + Сред(Телефон, 3, 3) + "-" + Сред(Телефон, 6, 3) + "-" + "-" + Сред(
				Телефон, 9, 2) + "-" + Прав(Телефон, 2);
			Телефоны.Добавить(СтрокаТелефона);
		КонецЦикла;
		Возврат Телефоны;
	КонецЕсли;
КонецФункции


&НаСервере
Функция ФункцияПреобразованияЗаписи(Свойство, Значение, ДополнительныеПараметры, Отказ) Экспорт

	Если Свойство = "Адрес" Тогда
		Адрес = "Страна: " + Значение.Страна + ", Индекс: " + Значение.Индекс + ", Город: " + Значение.Город;
		Возврат Адрес;
	КонецЕсли;
	Отказ = Истина;

КонецФункции

&НаКлиенте
Процедура СериализацияПростыхТипов(Команда)
	СериализацияПростыхТиповНаСервере();
КонецПроцедуры

&НаСервере
Процедура СериализацияПростыхТиповНаСервере()
	
// Создать структуру с данными контрагента. 
	Данные = Новый Структура;
	Данные.Вставить("Контрагент", "ОАО Топаз");
	Данные.Вставить("ОбъемПродаж", 5000000);
 
// Добавить элемент структуры Телефоны типа Массив. 
	Телефоны = Новый Массив;
	Телефоны.Добавить("+71112223344");
	Телефоны.Добавить("+79998887766");
	Данные.Вставить("Телефоны", Телефоны);
	Данные.Вставить("Поставщик", Ложь);
 // Создать объект записи и открыть файл, в который будет выполняться запись. 
	Запись = Новый ЗаписьJSON;
	ПараметрыЗаписиJSON = Новый ПараметрыЗаписиJSON(ПереносСтрокJSON.Авто, Символы.Таб);
	Запись.ОткрытьФайл("C:\Users\Asus\Desktop\1С\Базы\Интеграции_Примеры работы\streamWrite.json", , ,
		ПараметрыЗаписиJSON);
 // Выполнить запись данных (Данные) с помощью объекта записи (Запись). 
	ЗаписатьJSON(Запись, Данные);
// Завершить работу с файлом. 
	Запись.Закрыть();

КонецПроцедуры

&НаКлиенте
Процедура ДесериализацияПростыхТипов(Команда)
	ДесериализацияПростыхТиповНаСервере();
КонецПроцедуры

&НаСервере
Процедура ДесериализацияПростыхТиповНаСервере()

// Создать объект чтения и открыть файл, из которого будет выполняться чтение. 
	Чтение = Новый ЧтениеJSON;
	Чтение.ОткрытьФайл("C:\Users\Asus\Desktop\1С\Базы\Интеграции_Примеры работы\streamWrite.json");
// Выполнить чтение данных в структуру Данные с помощью объекта чтения (Чтение). 
	Данные = ПрочитатьJSON(Чтение, Истина);

 // Завершить работу с файлом. 
	Чтение.Закрыть(); // Вывести результат чтения в сообщение. 
	Сообщение = Новый СообщениеПользователю;
	Сообщение.Текст = "Контрагент: " + Данные["Контрагент №2"] + ", Объем продаж: " + Данные["Объем Продаж"] + ", Поставщик?: "
		+ Данные["Поставщик"] + ", Телефоны: " + Данные["Телефоны"];
  // Обойти в цикле элемент структуры данных Телефоны типа Массив. 
//	Для Каждого Телефон Из Данные.Телефоны Цикл
//		Сообщение.Текст = Сообщение.Текст + Телефон + ", ";
//	КонецЦикла;
	Сообщение.Сообщить();

КонецПроцедуры

&НаКлиенте
Процедура ПотоковоеЧтение(Команда)
	ПотоковоеЧтениеНаСервере();
КонецПроцедуры

&НаСервере
Процедура ПотоковоеЧтениеНаСервере()

	Сообщение = Новый СообщениеПользователю;
 // Создать объект чтения и открыть файл, из которого будет выполняться чтение. 
	Чтение = Новый ЧтениеJSON;
	Чтение.ОткрытьФайл("C:\Users\Asus\Desktop\1С\Базы\Интеграции_Примеры работы\streamWrite.json");
  // Выполнить чтение поэлементно в цикле. 
	Пока Чтение.Прочитать() Цикл
		Если Чтение.ТипТекущегоЗначения = ТипЗначенияJSON.ИмяСвойства Тогда
			Сообщение.Текст = "Имя = " + Чтение.ТекущееЗначение;
			Сообщение.Сообщить();
		КонецЕсли;

		Если Чтение.ТипТекущегоЗначения = ТипЗначенияJSON.Булево Или Чтение.ТипТекущегоЗначения = ТипЗначенияJSON.Строка
			Или Чтение.ТипТекущегоЗначения = ТипЗначенияJSON.Число Или Чтение.ТипТекущегоЗначения
			= ТипЗначенияJSON.Комментарий Тогда
			Сообщение.Текст = "Значение = " + Чтение.ТекущееЗначение;
			Сообщение.Сообщить();
		КонецЕсли;
	КонецЦикла;
	
  // Завершить работу с файлом. 
	Чтение.Закрыть();

КонецПроцедуры

&НаКлиенте
Процедура РаботаСоСтрокой(Команда)
	РаботаСоСтрокойНаСервере();
КонецПроцедуры

&НаСервере
Процедура РаботаСоСтрокойНаСервере()

	Сообщение = Новый СообщениеПользователю;
  // Создать объект записи и записать строковое значение в строку JSON. 
	Запись = Новый ЗаписьJSON;
	Запись.УстановитьСтроку();
	Запись.ЗаписатьЗначение("строковое значение");
	СтрокаJSON	=	Запись.Закрыть();
  // Показать результат. 
	Сообщение.Текст = СтрокаJSON;
	Сообщение.Сообщить();
  // Создать объект чтения и прочитать JSON из строки. 
	Чтение = Новый ЧтениеJSON;
	Чтение.УстановитьСтроку(СтрокаJSON);
	Пока Чтение.Прочитать() Цикл
		Если Чтение.ТипТекущегоЗначения = ТипЗначенияJSON.ИмяСвойства Тогда
			Сообщение.Текст = "Имя = " + Чтение.ТекущееЗначение;
			Сообщение.Сообщить();
		КонецЕсли;
		Если Чтение.ТипТекущегоЗначения = ТипЗначенияJSON.Булево Или Чтение.ТипТекущегоЗначения
			= ТипЗначенияJSON.Строка Или Чтение.ТипТекущегоЗначения = ТипЗначенияJSON.Число
			Или Чтение.ТипТекущегоЗначения = ТипЗначенияJSON.Комментарий Тогда
			Сообщение.Текст = "Значение = " + Чтение.ТекущееЗначение;
			Сообщение.Сообщить();
		КонецЕсли;
	КонецЦикла;
  // Завершить чтение. Чтение.Закрыть();
КонецПроцедуры