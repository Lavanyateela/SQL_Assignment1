use sakila;

# 1. Find out the number of documentaries with deleted scenes.

select count(film_id)
from film 
where special_features="Deleted Scenes";

select count(f.film_id) from film f
join film_category fc   
on f.film_id=fc.film_id
join category cat
on fc.category_id=cat.category_id
where cat.name="Documentary" and f.special_features like '%Deleted Scenes%';


# 2. Find out the number of sci-fi movies rented by the store managed by Jon Stephens.

select count(*) from category c
join film_category fc
on fc.category_id=c.category_id and c.name="Sci-fi"
join staff s
join store st
on s.staff_id=st.store_id and first_name="Jon" and last_name="Stephens";






# 3. Find out the total sales from Animation movies.
select count(r.rental_id) from rental r
join inventory i 
on i.inventory_id=r.inventory_id
join film_category fc 
on fc.film_id=i.film_id
join category cat 
on cat.category_id=fc.category_id 
join staff_list sl 
on sl.id=i.store_id
where cat.name="Animation";



# 4. Find out the top 3 rented category of movies by “PATRICIA JOHNSON”.

select * from customer c
join rental r
join film f
on c.customer_id=r.customer_id where c.first_name="PATRICIA" and c.last_name="JOHNSON"
order by f.rental_rate desc
limit  3;






# 5. Find out the number of R rated movies rented by “SUSAN WILSON”.

select count(rating) from customer c
join film f where c.first_name="Susan" and c.last_name="wilson" and f.rating="R";
