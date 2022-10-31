/* Приклади роботи з класом Online_order */
DECLARE
    or1 Online_order;
BEGIN 
    or1:= NEW Online_order(TO_TEXT('Я згоден(а) з умовами договору','Print to text'),TO_DATE('25.10.2023','DD/MM/YYYY'));
	    dbms_output.put_line('get order_id: ' || or1.get_order_id);
	    dbms_output.put_line('get date_order: ' || or1.date_order);
      dbms_output.put_line('get text: ' || or1.text);
    or1.display();
END;
/

/* Приклад роботи з класами Online_order, Information_dwelling */
DECLARE 
    or1 Weather_forecast;
    id1 Information_dwelling;
BEGIN 
    or1:= NEW Online_order(TO_TEXT('Я згоден(а) з умовами договору','Print to text'),TO_DATE('25.10.2023','DD/MM/YYYY'));
    id1:= Information_dwelling(12, 'вул.Паркова 28', '25000$', 'Зображення житла', 'Одноповерховий будинок, 3 кімнати, площа 72 кв.м.', or1);
    id1.display();
END;
/

/* Приклад роботи з класами Online_order, Information_dwelling, Recommendation_API */
DECLARE 
   or1 Online_order;
   id1 Information_dwelling;
   ra1 Recommendation_API;
BEGIN
    or1:= NEW Online_order(TO_TEXT('Я згоден(а) з умовами договору','Print to text'),TO_DATE('25.10.2023','DD/MM/YYYY'));
    id1:= Information_dwelling(12, 'вул.Паркова 28', '25000$', 'Зображення житла', 'Одноповерховий будинок, 3 кімнати, площа 72 кв.м.', or1);
    ra1 := Recommendation_API(53, 'Зображення місця', 'Стамбульський парк', 'Сучасний мальовничий сквер площею 2,7 га із впорядкованою територією', 'Одеса, Одеська область', id1);
    ra1.display(); 
END;
/
