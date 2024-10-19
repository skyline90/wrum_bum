-- нпаолнение таблицы покупателей из основной таблицы
INSERT INTO car_shop.customers (person_name, phone)
SELECT DISTINCT person_name, phone
FROM raw_data.sales;

-- наполнение таблицы автомобилей

INSERT INTO car_shop.cars(id, auto, color, gasoline_consumption, brand_origin)
SELECT id,
	SPLIT_PART(auto, ',', 1) AS auto,
    TRIM(SPLIT_PART(auto, ',', 2)) AS color,
	gasoline_consumption,
	brand_origin
FROM raw_data.sales;

-- наполнение таблицы с продажами

INSERT INTO car_shop.sales (id, car_id, customer_id, price, discount, date)
SELECT s.id AS id, 
		c.id AS car_id, 
		cs.id AS customer_id,
		s.price AS price,
		s.discount AS discount,
		s.date AS date
FROM raw_data.sales AS s
INNER JOIN car_shop.cars AS c ON s.id = c.id
INNER JOIN car_shop.customers as cs ON s.person_name = cs.person_name AND s.phone = cs.phone;