--when clause
select 	
	m.menu_name,
	i.ingredient_name,
	i.quantity,
	i.unit_of_measure,
CASE
	when  i.quantity >= 150 then 'quantity_A'
	Else 'quantity_B'
	end as section
from menu m, recipe_ingredients r, ingredients i
where m.menu_id = r.menu_id AND
r.ingredient_id = i.ingredient_id
order by section


--aggregate
select 
	AVG(salary) avg_salary,  
	sum(salary) sum_salary,
	MIN(salary) min_salary,
	MAX(salary) max_salary,
	count(salary) count_salary
 FROM staff;

 -- who has the most salary 
 select 
	MAX(salary) max_salary,
	staff_id,
	name,
	position
 FROM staff;

---group by
--- want to know 5 latest transaction
select 	
	t.transaction_date,
	t.quantity,
	m.menu_name,
	m.price	
from transactions t, menu m
where t.menu_id = m.menu_id
GROUP BY transaction_date
order by transaction_date DESC
limit 5

--sub query
select name, salary, position from 
	(select * from staff where salary > 25000);

