/*
1-) film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
2-) film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
3-) film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.
4-) payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.
*/

SELECT COUNT(*) FROM FILM WHERE LENGTH > (SELECT AVG(LENGTH) AS "AVG_MOVIE_LEN" FROM FILM ) 

SELECT COUNT(*) FROM FILM WHERE RENTAL_RATE = (SELECT MAX(RENTAL_RATE) AS "MAX_RANTAL_RATE" FROM FILM ) 


SELECT TITLE FROM FILM WHERE RENTAL_RATE = (SELECT MIN(RENTAL_RATE) AS "MIN_RANTAL_RATE" FROM FILM ) 
UNION ALL
SELECT TITLE FROM FILM WHERE REPLACEMENT_COST = (SELECT MIN(REPLACEMENT_COST) AS "MIN_REPLACEMENT_COST" FROM FILM ) 


SELECT 
(SELECT CONCAT(FIRST_NAME , ' ' , UPPER(LAST_NAME))  FROM CUSTOMER WHERE CUSTOMER_ID = PAYMENT.CUSTOMER_ID)
FROM PAYMENT  GROUP BY CUSTOMER_ID ORDER BY COUNT(*) DESC LIMIT 1 


