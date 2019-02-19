/**
 *Question 1
 */
Select
C.customer_id,
C.first_name,
C.last_name,
sum(P.amount) as "Total Spent"
from Customer C
	join payment as P 
		on C.customer_id = P.customer_id
group by customer_id
order by C.last_name, C.first_name;

/**
 *Question 2
 */
select
distinct A.district,
C.city
from address as A
	join city as c
		on c.city_id = A.city_id
where A.postal_code is null 
	or A.postal_code = '';

/**
 *Question 3
 */
 select
 title
 from film
 where title like '%FIRE%'
	or title like '%DOCTOR%';
 
/**
 *Question 4
 */
select
A.actor_id,
A.first_name,
A.last_name,
count(FA.film_id) as "Number of Movies"
from actor A
	join film_actor FA
		on A.actor_id = FA.actor_id
group by actor_id
order by A.last_name, A.first_name;

/**
 *Question 5
 */
select
c.name,
avg(f.length) as "average length"
from film f
	join film_category fc
		on f.film_id = fc.film_id
	join category c
		on fc.category_id = c.category_id
group by c.category_id
order by avg(f.length);

/**
 *Question 6
 */

        




 
