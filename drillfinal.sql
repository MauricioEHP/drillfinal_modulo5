--Evaluacion realizada por Mauricio Henríquez.
--Construccion de consultas,

--Tabla Customer.

insert into customer(store_id, first_name, last_name, email, activebool, create_date, active)
values (,'','', '', ,,, );

update customer 
set store_id = , email = '', last_update = now()
where first_name = 'Mauricio' and last_name = 'Henríquez' ;

delete * from customer where customer_id =  ;

--staff
insert into staff(first_name, last_name, address_id,email, store_id, active, username, password, last_update, picture)
values ('','',,'',, '',,);

update staff
set store_id = , email = , last_update = now()
where staff_id = ;

delete * from staff where staff_id =  ;

--Actor.

insert into actor(first_name, last_name, last_update)
values ('','','');

update actor
set last_name = ''
where actor_id = ;

delete * from actor where actor_id =  ;

--Listar todas las “rental” con los datos del “customer” dado un año y mes. 
--Importante el filtro por mes y año fue realizado con "rental_date" ya que maneja valores entre 05-2005 y 02-2006
--

select r.* , c.first_name as "Customer Nombre", last_name as "Apellido", store_id as "Tienda"
from rental r
inner join customer c on c.customer_id = r.customer_id
where extract (month from r.rental_date)= 02
	and extract (year from r.rental_date)= 2006;


--Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”. 
select count(payment_id )as "Número", cast(payment_date as date) as "Fecha", sum (amount) as "Total" from payment 

group by cast(payment_date as date)

--Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0.

select *
from film 
where release_year = 2006 and rental_rate > 4.0;


--Realiza un Diccionario de datos que contenga el nombre de las tablas y columnas, si éstas pueden ser nulas, y su tipo de dato correspondiente.

select table_name, column_name, is_nullable, data_type
from information_schema.columns 
where table_schema = 'public'
order by table_name;

