/*
1-) city tablosu ile country tablosunda bulunan şehir (city) ve ülke (country) isimlerini birlikte görebileceğimiz INNER JOIN sorgusunu yazınız.
2-) customer tablosu ile payment tablosunda bulunan payment_id ile customer tablosundaki first_name ve last_name isimlerini birlikte görebileceğimiz INNER JOIN sorgusunu yazınız.
3-) customer tablosu ile rental tablosunda bulunan rental_id ile customer tablosundaki first_name ve last_name isimlerini birlikte görebileceğimiz INNER JOIN sorgusunu yazınız.
*/
 
SELECT * FROM CITY   
LEFT JOIN COUNTRY ON COUNTRY.COUNTRY_ID =  CITY.COUNTRY_ID ;


SELECT CUSTOMER.FIRST_NAME, CUSTOMER.LAST_NAME,PAYMENT.AMOUNT,PAYMENT.PAYMENT_DATE FROM CUSTOMER
INNER JOIN PAYMENT ON PAYMENT.CUSTOMER_ID = CUSTOMER.CUSTOMER_ID
ORDER BY PAYMENT.AMOUNT ASC


SELECT CUSTOMER.FIRST_NAME, CUSTOMER.LAST_NAME FROM CUSTOMER
INNER JOIN RENTAL ON RENTAL.CUSTOMER_ID = CUSTOMER.CUSTOMER_ID
ORDER BY RENTAL.RENTAL_ID ASC
 
