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
group by C.customer_id
order by C.last_name, sum(P.amount);

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
order by A.last_name, count(FA.film_id);

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
select
	S.store_id,
	sum(P.amount) as "Total Amount"
from store as S
join customer as C
	on S.store_id = C.store_id
join payment as P
	on P.customer_id = C.customer_id
group by S.store_id
order by sum(P.amount) desc;

/**
 *Question 7
 */
select
	C.first_name,
    C.last_name,
    C.email,
    sum(P.amount) as "Total spent"
from customer as C
join store as S
	on S.store_id = C.store_id
join address as A
	on S.address_id = A.address_id
join city as CI
	on A.city_id = CI.city_id
join country as CO
	on CI.country_id = CO.country_id
join payment as P
	on P.customer_id = C.customer_id
where CO.country = "Canada"
group by C.customer_id
order by C.last_name;

/**
 *Question 8
 */
start transaction;

insert into 
rental(rental_date, inventory_id, customer_id, staff_id)
	values(
		now(),
		(select min(inventory_id) from Inventory I
			join film F
				on I.film_id = F.film_id
			where F.title = "Hunger Roof" and I.store_id = 2),
        (select customer_id from customer
			where first_name = "Mathew" and last_name = "Bolin"),
        (select staff_id from staff
			where first_name = "Jon" and last_name = "Stephens" and store_id = 2)
            );
insert into
payment(customer_id, staff_id, rental_id, amount, payment_date)
	select customer_id, staff_id, rental_id, 2.99, rental_date
    from rental where last_update = now();
    
/** for testing Question 8
select * from payment
order by last_update desc;
select * from rental
order by last_update desc;
*/
Rollback;
commit;

/**
*Question 9
*/
start transaction;

update rental
	join inventory on rental.inventory_id = inventory.inventory_id
    join film on inventory.film_id = film.film_id
    join customer on rental.customer_id = customer.customer_id
	set rental.return_date = now()
	where customer.first_name = "Tracy" and customer.last_name = "Cole" and film.title = "Ali Forever";

Rollback;
commit;

-- select * from rental where rental_id = 15294;

/**
*Question 10
*/
start transaction;

update film
	join film_category fc 
		on film.film_id = fc.film_id
	join category c 
		on fc.category_id = c.category_id
	set original_language_id = (
							select language_id
                            from language
                            where name = "Japanese"
                            )
	where c.name = "Animation";

Rollback;
commit;

-- select * from film;

 
