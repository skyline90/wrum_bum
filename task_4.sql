-- 4. Используя функцию STRING_AGG, напишите запрос, который выведет список купленных машин у каждого пользователя через запятую. Пользователь может купить две одинаковые машины — это нормально. Название машины покажите полное, с названием бренда — например: Tesla Model 3. Отсортируйте по имени пользователя в восходящем порядке. Сортировка внутри самой строки с машинами не нужна.

SELECT 
    customers.person_name AS customer_name, 
    STRING_AGG(cars.auto, ', ') AS cars_purchased  -- Собираем список машин через запятую
FROM 
    car_shop.sales
JOIN 
    car_shop.customers ON sales.customer_id = customers.id  -- Соединяем таблицы продаж и клиентов
JOIN 
    car_shop.cars ON sales.car_id = cars.id  -- Соединяем таблицы продаж и машин
GROUP BY 
    customers.person_name  -- Группируем по имени пользователя
ORDER BY 
    customers.person_name ASC;  -- Сортировка по имени пользователя