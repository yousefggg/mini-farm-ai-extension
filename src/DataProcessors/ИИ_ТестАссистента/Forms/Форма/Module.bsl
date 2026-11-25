&НаКлиенте
Процедура Спросить(Команда)
	
	Если Не ЗначениеЗаполнено(ТекстВопроса) Тогда
		ПоказатьПредупреждение(, "Введите текст вопроса.");
		Возврат;
	КонецЕсли;
	
	ЧатHTML = "<html><body style='font-family:Segoe UI, Arial; padding:15px; color:#555;'>Запрашиваю ответ у GigaChat...</body></html>";
	Результат = ОтправитьЗапросНаСервере(ТекстВопроса);
	
	Если Результат.Успех Тогда
		ТекстДляПоказа = СтрЗаменить(Результат.Текст, Символы.ПС, "<br>");
		ЧатHTML = "<html><body style='font-family:Segoe UI, Arial; font-size:14px; line-height:1.5; background:#f6f8fa; padding:14px;'>"
			+ "<div style='background:#ffffff; border:1px solid #d0d7de; border-radius:10px; padding:14px;'>"
			+ ТекстДляПоказа
			+ "</div></body></html>";
	Иначе
		ЧатHTML = "<html><body style='font-family:Segoe UI, Arial; padding:14px; color:#b00020;'>" + Результат.Ошибка + "</body></html>";
	КонецЕсли;
	
КонецПроцедуры

&НаСервереБезКонтекста
Функция ОтправитьЗапросНаСервере(ТекстВопроса)
	
	Возврат ИИ_АналитикаФермыСервер.ОтветитьНаВопросПоБазе(ТекстВопроса);
	
КонецФункции
