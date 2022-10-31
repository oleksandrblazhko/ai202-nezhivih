/* Створення об'єктного типу (класу) User */
CREATE OR REPLACE TYPE User AS OBJECT ( 
	user_id NUMBER(5), -- id 
	fullname VARCHAR(20), -- прізвище 
	age NUMBER(2), -- вік
	phone VARCHAR(10), -- телефон
	e-mail NUMBER(20), -- електронна адреса
	photo_user BINARY(1) -- зображення
  /* Процедура виводу на екран значень атрибутів */
  MEMBER PROCEDURE display
);
/

/* Створення типу для зберігання списку користувачів - "Колекція екземплярів об`єктів класу User */
CREATE TYPE User_List IS TABLE OF User;
/

/* Створення об'єктного типу (класу) Information_API */
CREATE OR REPLACE TYPE Information_API AS OBJECT (
	api_id NUMBER(5), -- id 
	region VARCHAR(10), -- регіон
	humidity VARCHAR(10) -- вологість
  date DATE, -- дата 
  /* Процедура виводу на екран значень атрибутів */
  MEMBER PROCEDURE display
); 
/

/* Створення об'єктного типу (класу) Online_order */
CREATE OR REPLACE TYPE Online_order AS OBJECT ( 
	order_id NUMBER(5), -- id 
	text VARCHAR(20), -- текст
  date_order DATE, -- дата
	user_id NUMBER(5) -- fk
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
		/* Процедура зміни значення атрибутів */
		MEMBER PROCEDURE set_date_order(p_order_id NUMBER, p_date_order DATE),
    		/* Функції отримання значень атрибутів */
		MEMBER FUNCTION get_order_id RETURN NUMBER,
		MEMBER FUNCTION get_date_order RETURN DATE,
    	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
);
/

/* Створення типу для зберігання списку замовлень - "Колекція екземплярів об`єктів класу Online_order */
CREATE TYPE Online_order_List IS TABLE OF Online_order;
/

/* Створення об'єктного типу (класу) Information_dwelling */
CREATE OR REPLACE TYPE Information_dwelling AS OBJECT ( -- опис житла
	dwelling_id NUMBER(5), -- id 
	address_dwelling VARCHAR(20), -- адреса
	price NUMBER(5), -- ціна
	photo_dwelling BINARY(1), -- зображення
	description_dwelling NUMBER(5), -- опис
	api_id NUMBER(5) -- fk
  /* Процедура виводу на екран значень атрибутів */
  MEMBER PROCEDURE display
);
/

/* Створення типу для зберігання списку житла - "Колекція екземплярів об`єктів класу Information_dwelling */
CREATE TYPE Information_dwelling_List IS TABLE OF Information_dwelling;
/

/* Створення об'єктного типу (класу) Recommendation_API */
CREATE OR REPLACE TYPE Recommendation_API AS OBJECT ( -- опис рекомендацій
	rec_id NUMBER(5), -- id 
	photo_rec BINARY(1), -- зображення
	name VARCHAR(20), -- назва
	description_rec NUMBER(5), -- опис
	address_rec VARCHAR(20) -- адреса
  /* Процедура виводу на екран значень атрибутів */
  MEMBER PROCEDURE display
);
/

/* Створення типу для зберігання списку рекомендацій - "Колекція екземплярів об`єктів класу Recommendation_API */
CREATE TYPE Recommendation_API_List IS TABLE OF Recommendation_API;
/

/* Створення об'єктного типу (класу) User_API */
CREATE OR REPLACE TYPE User_API AS OBJECT ( -- таблиця яка зв'язує користувача і інформацію яку надає ПП
	user_api_id NUMBER(5), -- id 
	user_id NUMBER(5), -- fk 
	api_id NUMBER(5) -- fk 
);
/

/* Створення об'єктного типу (класу) User_dwelling */
CREATE OR REPLACE TYPE User_dwelling AS OBJECT ( -- таблиця яка зв'язує користувача і інформацію про житло
	user_dwelling_id NUMBER(5), -- id 
	user_id NUMBER(5), -- fk 
	dwelling_id NUMBER(5) -- fk 
);
/

/* Створення об'єктного типу (класу) Dwelling_rec */
CREATE OR REPLACE TYPE Dwelling_rec AS OBJECT ( -- таблиця яка зв'язує інформацію про житло і рекомендації
	rec_dwelling_id NUMBER(5), -- id 
	rec_id NUMBER(5), -- fk 
	dwelling_id NUMBER(5) -- fk 
);
/
