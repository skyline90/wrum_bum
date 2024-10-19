-- 5. Напишите запрос, который вернёт самую большую и самую маленькую цену продажи автомобиля с разбивкой по стране без учёта скидки. Цена в колонке price дана с учётом скидки.

SELECT 
    cars.brand_origin AS country, 
    MAX(sales.price / (1 - COALESCE(sales.discount, 0) / 100.0)) AS max_price,  -- Самая большая цена без учёта скидки
    MIN(sales.price / (1 - COALESCE(sales.discount, 0) / 100.0)) AS min_price   -- Самая маленькая цена без учёта скидки
FROM 
    car_shop.sales
JOIN 
    car_shop.cars ON sales.car_id = cars.id  -- Объединение таблиц продаж и автомобилей
GROUP BY 
    cars.brand_origin  -- Группировка по стране происхождения бренда
ORDER BY 
    cars.brand_origin ASC;  -- Сортировка по странам