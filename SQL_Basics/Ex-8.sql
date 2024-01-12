
/*
1-test veritabanınızda employee isimli sütun bilgileri id(INTEGER), name VARCHAR(50), birthday DATE,
 email VARCHAR(100) olan bir tablo oluşturalım.
2-Oluşturduğumuz employee tablosuna 'Mockaroo' servisini kullanarak 50 adet veri ekleyelim.
3-Sütunların her birine göre diğer sütunları güncelleyecek 5 adet UPDATE işlemi yapalım.
4-Sütunların her birine göre ilgili satırı silecek 5 adet DELETE işlemi yapalım.
*/

SELECT * FROM EMPLOYEE WHERE ID= 2

INSERT INTO EMPLOYEE (NAME, BIRTHDAY, EMAIL) VALUES ( 'Fawne', '2023-06-11', 'fclunie0@ebay.co.uk');
INSERT INTO EMPLOYEE (NAME, BIRTHDAY, EMAIL) VALUES ( 'Albertine', '2023-03-20', 'aghidotti1@squarespace.com');
INSERT INTO EMPLOYEE (NAME, BIRTHDAY, EMAIL) VALUES ( 'Care', '2023-01-18', 'chanse2@linkedin.com');
INSERT INTO EMPLOYEE (NAME, BIRTHDAY, EMAIL) VALUES ( 'Carlyle', '2023-05-27', 'ctorrisi3@hostgator.com');
INSERT INTO EMPLOYEE (NAME, BIRTHDAY, EMAIL) VALUES ( 'Leeland', '2024-01-04', 'lcotes4@cbslocal.com');


UPDATE EMPLOYEE SET NAME = 'Albertine' , BIRTHDAY = '2023-03-20' , EMAIL = 'aghidotti1@squarespace.com' WHERE NAME = 'Fawne';


DO $$ 
DECLARE TARGET_ID INT;SET_ID INT;TARGET_NAME VARCHAR(50);TARGET_BIRTHDAY DATE;
BEGIN TARGET_ID := 2;SET_ID := 1;
    SELECT NAME, BIRTHDAY INTO TARGET_NAME, TARGET_BIRTHDAY FROM EMPLOYEE WHERE ID = TARGET_ID; 
    UPDATE EMPLOYEE SET NAME = TARGET_NAME, BIRTHDAY = TARGET_BIRTHDAY WHERE ID = SET_ID;
END $$;

DELETE FROM EMPLOYEE WHERE ID = 1 
DELETE FROM EMPLOYEE WHERE NAME LIKE 'A%'
DELETE FROM EMPLOYEE WHERE BIRTHDAY > '2023-01-01'
DELETE FROM EMPLOYEE WHERE SUBSTRING(EMAIL,3,5) = 'te'

