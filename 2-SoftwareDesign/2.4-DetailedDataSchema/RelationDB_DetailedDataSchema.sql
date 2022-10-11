/* видалення таблиць з каскадним видаленням 
можливих описів цілісності */
drop table User CASCADE CONSTRAINTS;
drop table User_API CASCADE CONSTRAINTS;
drop table Information_API CASCADE CONSTRAINTS;
drop table User_dwelling CASCADE CONSTRAINTS;
drop table Information_dwelling CASCADE CONSTRAINTS;
drop table Dwelling_rec CASCADE CONSTRAINTS;
drop table Online_order CASCADE CONSTRAINTS;
drop table Recommendation_API CASCADE CONSTRAINTS;

CREATE TABLE User ( -- опис користувача
	user_id NUMBER(5), -- id 
	fullname VARCHAR(20), -- прізвище 
	age NUMBER(2), -- вік
	phone VARCHAR(10), -- телефон
	e-mail NUMBER(20), -- електронна адреса
	photo_user BINARY(1) -- зображення
);

-- обмеження первинного ключа
ALTER TABLE User ADD CONSTRAINT user_pk
	PRIMARY KEY (user_id);
	
CREATE TABLE Information_API ( -- опис інформації яку надає ПП
	api_id NUMBER(5), -- id 
	region VARCHAR(10), -- регіон
	humidity VARCHAR(10) -- вологість
);	
	
-- обмеження первинного ключа
ALTER TABLE Information_API ADD CONSTRAINT api_id_pk
	PRIMARY KEY (api_id);	
	
CREATE TABLE Online_order ( -- опис online-замовлення
	order_id NUMBER(5), -- id 
	text VARCHAR(20), -- текст
	user_id NUMBER(5) -- fk
);	
	
-- обмеження первинного ключа
ALTER TABLE Online_order ADD CONSTRAINT order_id_pk
	PRIMARY KEY (order_id);

-- обмеження зовнішнього ключа
ALTER TABLE Online_order ADD CONSTRAINT user_id_fk
	FOREIGN KEY (user_id) REFERENCES User(user_id);	
	
CREATE TABLE Information_dwelling ( -- опис житла
	dwelling_id NUMBER(5), -- id 
	address_dwelling VARCHAR(20), -- адреса
	price NUMBER(5), -- ціна
	photo_dwelling BINARY(1), -- зображення
	description_dwelling NUMBER(5), -- опис
	api_id NUMBER(5) -- fk
);	

-- обмеження первинного ключа
ALTER TABLE Information_dwelling ADD CONSTRAINT dwelling_id_pk
	PRIMARY KEY (dwelling_id);

-- обмеження зовнішнього ключа
ALTER TABLE Information_dwelling ADD CONSTRAINT api_id_fk
	FOREIGN KEY (api_id) REFERENCES Information_API(api_id);	
	
CREATE TABLE Recommendation_API ( -- опис рекомендацій
	rec_id NUMBER(5), -- id 
	photo_rec BINARY(1), -- зображення
	name VARCHAR(20), -- назва
	description_rec NUMBER(5), -- опис
	address_rec VARCHAR(20) -- адреса
);
	
-- обмеження первинного ключа
ALTER TABLE Recommendation_API ADD CONSTRAINT rec_id_pk
	PRIMARY KEY (rec_id);	
	
CREATE TABLE User_API ( -- таблиця яка зв'язує користувача і інформацію яку надає ПП
	user_api_id NUMBER(5), -- id 
	user_id NUMBER(5), -- fk 
	api_id NUMBER(5) -- fk 
);

-- обмеження первинного ключа
ALTER TABLE User_API ADD CONSTRAINT user_api_id_pk
	PRIMARY KEY (user_api_id);

-- обмеження зовнішнього ключа
ALTER TABLE User_API ADD CONSTRAINT user_id_fk
	FOREIGN KEY (user_id) REFERENCES User(user_id);

-- обмеження зовнішнього ключа
ALTER TABLE User_API ADD CONSTRAINT api_id_fk
	FOREIGN KEY (api_id) REFERENCES Information_API(api_id);

CREATE TABLE User_dwelling ( -- таблиця яка зв'язує користувача і інформацію про житло
	user_dwelling_id NUMBER(5), -- id 
	user_id NUMBER(5), -- fk 
	dwelling_id NUMBER(5) -- fk 
);

-- обмеження первинного ключа
ALTER TABLE User_dwelling ADD CONSTRAINT user_dwelling_id_pk
	PRIMARY KEY (user_dwelling_id);

-- обмеження зовнішнього ключа
ALTER TABLE User_dwelling ADD CONSTRAINT user_id_fk
	FOREIGN KEY (user_id) REFERENCES User(user_id);

-- обмеження зовнішнього ключа
ALTER TABLE User_dwelling ADD CONSTRAINT dwelling_id_fk
	FOREIGN KEY (dwelling_id) REFERENCES Information_dwelling(dwelling_id);

CREATE TABLE Dwelling_rec ( -- таблиця яка зв'язує інформацію про житло і рекомендації
	rec_dwelling_id NUMBER(5), -- id 
	rec_id NUMBER(5), -- fk 
	dwelling_id NUMBER(5) -- fk 
);

-- обмеження первинного ключа
ALTER TABLE Dwelling_rec ADD CONSTRAINT rec_dwelling_id_pk
	PRIMARY KEY (rec_dwelling_id);

-- обмеження зовнішнього ключа
ALTER TABLE Dwelling_rec ADD CONSTRAINT rec_id_fk
	FOREIGN KEY (rec_id) REFERENCES Recommendation_API(rec_id);

-- обмеження зовнішнього ключа
ALTER TABLE Dwelling_rec ADD CONSTRAINT dwelling_id_fk
	FOREIGN KEY (dwelling_id) REFERENCES Information_dwelling(dwelling_id);
	
-- обмеження вмісту стовпчика таблиці
ALTER TABLE User ADD CONSTRAINT age_range
    CHECK ( age between 18 and 99 );

-- обмеження вмісту стовпчика таблиці
ALTER TABLE User ADD CONSTRAINT phone_template
    CHECK ( regexp_like(phone, 
	           '^(\([0-9]{3}\))?[0-9]{3}-[0-9]{4}$'));

-- обмеження вмісту стовпчика таблиці
ALTER TABLE User ADD CONSTRAINT email_template
    CHECK ( regexp_like(email, 
	          '^([a-z0-9][a-z0-9._-]*@[a-z][a-z0-9._-]*\.[a-z]{2,4})$'));
	
	
	