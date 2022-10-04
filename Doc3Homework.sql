--Question 1 List of all customers who live in Texas

select customer.first_name, customer.last_name
from customer
inner join address
on customer.address_id = address.address_id
where district = 'Texas'; 

--Question 2 Get all payments above $6.99 with customers full name

select first_name, last_name, payment.amount
from customer
inner join payment
on customer.customer_id = payment.customer_id 
where amount > 6.99

--Question 3 Show all customers names who have made payments over $175 (use subquery)
select first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) > 175
	order by sum(amount)desc
	)
group by first_name, last_name;

--Question 4 List all customers that live in Nepal
select customer.first_name, customer.last_name, country
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id 
full join country
on city.country_id = country.country_id
where country = 'Nepal';

--Question 5 Which staff members had the most transactions
select count(rental_id), staff_id
from rental 
group by staff_id;

--Question 6 How many movies of each rating are there?
select rating, count(rating)
from film
group by rating
order by count(rating)desc;

--Question 7 Show all customers who made a single payment above 6.99 using subquery
--ask about this
select customer_id, first_name, last_name
from customer
where customer_id in (
	select customer_id, amount 
	from payment 
	group by customer_id
	having amount > 6.99
	order by amount desc
	)
group by first_name, last_name;

--Question 8 - How many free rentals did the store give away
select amount
from payment
where amount = 0;



