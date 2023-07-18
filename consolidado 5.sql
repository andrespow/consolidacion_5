--Construye las siguientes consultas:
--Aquellas usadas para insertar, modificar y eliminar un Customer, Staff y Actor.
--CUSTOMER 
--Insertar
insert into customer values 
(default, 2, 'Alan', 'Garcia', 'alan_g@gmail.com', 46, true, default, default, 1)
--Modificar
update customer set email = 'alangarcia@edutecno.cl' where customer_id = 600;
--Eliminar
delete from customer where customer_id = 600;
--Consultar
select * from customer where customer_id = 600;
--STAFF
--Insertar
insert into staff values
(default, 'Alan', 'Garcia', 4, 'alangarcia@edutecno.cl', 1, true, 'Alan', default),
(default, 'Nelson', 'Ramirez', 3, 'nelsonramirez@edutecno.cl', 2, true, 'Nelson', default)
--Modificar
update staff set password = '48653215dfg535338' where staff_id = 3;
update staff set password = '4868sade68637868' where staff_id = 4;
update staff set active = false where staff_id = 3;
update staff set active = false where staff_id = 4;
--Eliminar
delete from staff where active = false;
--Consultar
select * from staff;
select * from staff where active = true;
--Actor
--Insertar
insert into actor values
(default, 'José', 'Davila', default)
--Modificar
update actor set first_name = 'Arturo' where actor_id = 201;
--Eliminar
delete from actor where last_update > '2013-05-27';
--Consultar
select * from actor;
--Listar todas las “rental” con los datos del “customer” dado un año y mes.
select
	r.rental_id,
	r.rental_date,
	c.first_name,
	c.last_name,
	c.email
from rental r join customer c on r.customer_id = c.customer_id
where
	extract (year from rental_date) = 2005 and
	extract (month from rental_date) = 7
--Consultar
select * from rental;
select * from customer;
--Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”.
--Descendente
select payment_id, payment_date, amount from payment order by payment_date desc;
--Ascendente
select payment_id, payment_date, amount from payment order by payment_date asc;
--Consultar
select * from payment;
--Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0
select * from film where rental_rate > 4.0 and release_year = 2006 order by film_id asc;
--Consultar
select * from film;

--Realiza un Diccionario de datos que contenga el nombre de las tablas y columnas, si éstas pueden ser nulas, y su tipo de dato correspondiente.
--DICIONARIO
select
	t1.table_name as nombre_tabla,
	t1.column_name as nombre_columna,
	t1.column_default as columna_defecto,
	t1.is_nullable as columna_nulos,
	t1.data_type as tipo_dato_columna
from
	information_schema.columns t1
	inner join pg_class t2 on (t2.relname = t1.table_name)
where 
	t1.table_schema = 'public'
order by
	t1.table_name;

