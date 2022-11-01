/* Методи класу Online_order */
CREATE OR REPLACE TYPE BODY Online_order AS
  /* конструктор екземплярів об'єктів класів.
       	Вхідні параметри:
	   1) p_date_order - дата
	   умова 1) якщо в таблиці Online_order вже існує вказана дата,
	   створюється екземпляр класу на основі даних таблиці,
	   інакше в таблиці Online_order створюється новий рядок з одночасним
	   створюється екземпляр класу 
	  Вихідний параметр - екземпляр обєкту класу */
    CONSTRUCTOR FUNCTION Online_order(p_date_order DATE)
        RETURN SELF AS RESULT,
    IS
        v_order_id Online_order.order_id%TYPE;
    BEGIN
        SELECT order_id INTO v_order_id
        FROM Online_order
        WHERE 
            date_order = p_date_order;
        SELF.order_id := v_order_id;
        SELF.date_order := p_date_order;
        RETURN;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        INSERT INTO Online_order (date_order)
            VALUES ( p_date_order)
        RETURNING order_id INTO v_order_id;
        SELF.order_id := v_order_id;
        SELF.date_order := p_date_order;
        RETURN;
    END Online_order;
    
        /* Процедура зміни значень атрибутів */
	      MEMBER PROCEDURE formOnlineOrder(p_order_id NUMBER, p_date_order DATE, p_text VARCHAR(20))
	      IS
	      BEGIN
        UPDATE Online_order SET date_order = p_date_order, text = p_text
		      WHERE order_id = p_order_id;
		      SELF.date_order := p_date_order, SELF.text := p_text;;
	      END formOnlineOrder;
    
        /* Функції отримання значень атрибутів */
	      /* get_order_id */
        MEMBER FUNCTION get_order_id
	        RETURN NUMBER 
	      IS
        BEGIN
          RETURN SELF.order_id;
        END get_order_id;
        
        /* get_date_order */
        MEMBER FUNCTION get_date_order
	        RETURN NUMBER 
	      IS
        BEGIN
          RETURN SELF.date_order;
        END get_date_order;

        /* Процедура виводу на екран значень атрибутів */
        MEMBER PROCEDURE display 
        IS
        BEGIN 
          dbms_output.put_line('order_id: ' || order_id);
          dbms_output.put_line('date_order: ' || date_order);
          dbms_output.put_line('text: ' || text);
        END display;
END; 
/
