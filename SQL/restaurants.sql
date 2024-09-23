CREATE TABLE staff (
  staff_id INT PRIMARY KEY,
  name TEXT ,
  position TEXT ,
  salary REAL
); 

INSERT INTO staff 
VALUES
  (1, 'Kenny', 'Cashier', 25000),
  (2, 'Lisa', 'Chef', 30000),
  (3, 'Stuart', 'Cashier', 25000),
  (4, 'Sheldon', 'Head Chef', 55000),
  (5, 'Amy', 'Waitress', 25000),
  (6, 'Jenny', 'Waitress', 25000),
  (7, 'Tarn', 'Waitress', 25000),
  (8, 'Scoob', 'Chef', 30000),
  (9, 'Lissy', 'Cashier', 25000),
  (10, 'Film', 'Chef', 30000);
  
 CREATE TABLE menu (
  menu_id INT PRIMARY KEY,
  menu_name TEXT,
  price REAL
); 

INSERT INTO menu 
VALUES
  (1, 'Penne Carbonara', 230),
  (2, 'Truffle Angle Hair', 590),
  (3, 'Chicken Steak', 499),
  (4, 'Lasagna', 250),
  (5, 'Beef Wellington', 990),
  (6, 'Pad Thai', 350),
  (7, 'Sushi Platter', 420),
  (8, 'Pizza Margherita', 280),
  (9, 'Salmon Teriyaki', 480),
  (10, 'Vegetarian Burger', 320); 
  
  
  CREATE TABLE ingredients (
  ingredient_id INT PRIMARY KEY,  
  ingredient_name TEXT ,              
  quantity INT,                       
  unit_of_measure TEXT                         
); 

 INSERT INTO ingredients 
VALUES
  (1,'Penne pasta', 200, 'grams'),
  (2,'Parmesan cheese', 50, 'grams'),
  (3,'Eggs', 2, 'each'),
  (4,'Truffle paste', 10, 'grams'),
  (5,'Beef sirloin', 200, 'grams'),
  (6,'Rice noodles', 250, 'gramh'),
  (7,'Sushi rice', 300, 'grams'),  
  (8,'Mozzarella cheese', 150, 'grams'), 
  (9,'Salmon fillet', 1, 'each'),    
  (10,'Black bean patty', 1, 'each'); 
  
  CREATE TABLE recipe_ingredients (
  menu_id INT,
  ingredient_id INT,
  quantity INT,
  FOREIGN KEY (menu_id) REFERENCES menu(menu_id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id),
  PRIMARY KEY (menu_id, ingredient_id)
);

INSERT INTO recipe_ingredients (menu_id, ingredient_id, quantity)
VALUES
  (1, 1, 200),
  (1, 2, 50),
  (3, 3, 2),
  (2, 4, 10),
  (5, 5, 200),
  (4, 6, 250),
  (6, 7, 300),
  (7, 8, 150),
  (8, 9, 1), 
  (9, 10, 1); 
  CREATE TABLE transactions ( 
    transaction_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    menu_id INT,
    quantity INT,
    price REAL,
    transaction_date DATE,
    FOREIGN KEY (menu_id) REFERENCES menu(menu_id) );
    
    insert INTO transactions VALUES
    
    ('1001','John Doe','1','2','230.0','2024-03-30'),
	('1002','Jane Smith','2','1','590.0','2024-03-30'),
	('1004','Matt Lee','1','1','230.0','2024-03-28'),
	('1005','Guest','4','2','500.0','2024-03-23'),
	('1006','Alice Johnson','5','1','990.0','2024-03-27'),
	('1007','Unknown','2','2','1180.0','2024-03-16'),
	('1008','Bob Garcia','6','3','1050.0','2024-03-29'),
	('1009','Emily Wang','7','1','280.0','2024-03-25'),
	('1010','Guest','8','2','960.0','2024-03-09')
   



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

