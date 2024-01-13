/*
1-) actor ve customer tablolarında bulunan first_name sütunları için tüm verileri sıralayalım.
2-) actor ve customer tablolarında bulunan first_name sütunları için kesişen verileri sıralayalım.
3-) actor ve customer tablolarında bulunan first_name sütunları için ilk tabloda bulunan ancak ikinci tabloda bulunmayan verileri sıralayalım.
4-) İlk 3 sorguyu tekrar eden veriler için de yapalım.
*/

SELECT COUNT(*) AS "TOTAL_DATA_COUNT" FROM 
(
SELECT FIRST_NAME FROM ACTOR 
UNION
SELECT FIRST_NAME FROM CUSTOMER
) 

	
SELECT COUNT(*) AS "INTERSECT_DATA_COUNT" FROM 
(
SELECT FIRST_NAME FROM ACTOR 
INTERSECT
SELECT FIRST_NAME FROM CUSTOMER
) 

SELECT COUNT(*) AS "EXCEPT_DATA_COUNT" FROM 
(
SELECT FIRST_NAME FROM ACTOR 
EXCEPT
SELECT FIRST_NAME FROM CUSTOMER
) 


SELECT FIRST_NAME, COUNT(*) AS "REPAET_DATA_COUNT" 
FROM (
    SELECT FIRST_NAME FROM ACTOR 
    UNION ALL
    SELECT FIRST_NAME FROM CUSTOMER
) 
GROUP BY FIRST_NAME
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC




	
	

