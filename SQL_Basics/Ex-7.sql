/*
1-) film tablosunda bulunan filmleri rating değerlerine göre gruplayınız.
*/
SELECT RATING FROM FILM GROUP BY RATING
/*
2-) film tablosunda bulunan filmleri replacement_cost sütununa göre grupladığımızda film sayısı 50 den fazla olan 
replacement_cost değerini ve karşılık gelen film sayısını sıralayınız.
*/

SELECT REPLACEMENT_COST,COUNT(*)  FROM FILM GROUP BY REPLACEMENT_COST HAVING COUNT(*) > 50 ORDER BY REPLACEMENT_COST ASC
/*
3-) customer tablosunda bulunan store_id değerlerine karşılık gelen müşteri sayılarını nelerdir? 
*/
SELECT  STORE_ID , COUNT(*) "CUSTOMER_CNT"  FROM CUSTOMER GROUP BY STORE_ID
/*
4-) city tablosunda bulunan şehir verilerini country_id sütununa göre gruplandırdıktan sonra en fazla şehir sayısı 
barındıran country_id bilgisini ve şehir sayısını paylaşınız.
*/
SELECT COUNTRY_ID, COUNT(*) FROM CITY GROUP BY COUNTRY_ID ORDER BY COUNT(*) DESC LIMIT 1 
