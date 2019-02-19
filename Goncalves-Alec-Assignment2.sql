/**
 *Question 1
 */
Select
C.customer_id,
C.first_name,
C.last_name,
sum(P.amount)
from Customer C
	join payment as P 
		on C.customer_id = P.customer_id
group by P.customer_id
order by C.last_name;

/**
 *Question 2
 */
select
distinct A.district,
C.city
from address as A
	join city as c
		on c.city_id = A.city_id
where A.postal_code is null or A.postal_code = '';

/**
 *Question 3
 */
 select
 title
 from film
 where title like '%FIRE%'
 or title like '%DOCTOR%';
 
 
 
