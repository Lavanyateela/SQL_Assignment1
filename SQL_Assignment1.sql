USE sakila;

# 1.Find out the PG-13 rated comedy movies
select f.film_id,f.title,f.rating,c.name from film f 
join film_category fc on f.film_id=fc.film_id
join category c on c.category_id=fc.category_id
where f.rating="PG-13" and c.name="Comedy";



# 2. Find out the top 3 rented horror movies.

select distinct f.film_id, f.title, c.name, f.rental_rate from film f
join film_category fc
on fc.film_id=f.film_id
join category c
on fc.category_id=c.category_id
where c.name="Horror"
order by f.rental_rate
desc
limit 3;



#3. Find out the list of customers from India who have rented sports movies.

select c.customer_id, c.first_name, c.last_name, c.address_id,co.country,cat.name from customer c
join address ad
on c.address_id = ad.address_id
join city ci
on ad.city_id=ci.city_id
join country co
on ci.country_id=co.country_id
join  rental re 
on c.customer_id=re.customer_id
join inventory inv 
on re.inventory_id=inv.inventory_id
join film f 
on inv.film_id=f.film_id
join film_category fc 
on f.film_id=fc.film_id
join category cat 
on fc.category_id = cat.category_id
where co.country="India" and cat.name="Sports";



#4. Find out the list of customers from Canada who have rented “NICK WAHLBERG” movies.

select c.customer_id, c.first_name, c.last_name, c.address_id, co.country, a.first_name, a.last_name from customer c
join address ad
on c.address_id = ad.address_id
join city ci
on ad.city_id=ci.city_id
join country co
on ci.country_id=co.country_id
join  rental re 
on c.customer_id=re.customer_id
join inventory inv 
on re.inventory_id=inv.inventory_id
join film f 
on inv.film_id=f.film_id
join film_category fc 
on f.film_id=fc.film_id
join category cat 
on fc.category_id = cat.category_id
join film_actor fia
on fia.film_id= f.film_id
join actor a
on fia.actor_id=a.actor_id
where co.country="Canada" and a.first_name="NICK" and a.last_name="WAHLBERG";




#5. Find out the number of movies in which “SEAN WILLIAMS” acted.

select count(f.film_id) from film f
join film_actor fa
on f.film_id=fa.film_id
join actor a 
on fa.actor_id=a.actor_id
where a.first_name="SEAN" and a.last_name="WILLIAMS";

# (or)

select actor_id from actor where first_name="SEAN" and last_name="WILLIAMS";
select  count(*) from film_actor where actor_id=72;







