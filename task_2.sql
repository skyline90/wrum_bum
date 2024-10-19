-- 2. Напишите запрос, который покажет название бренда и среднюю цену его автомобилей в разбивке по всем годам с учётом скидки. Итоговый результат отсортируйте по названию бренда и году в восходящем порядке. Среднюю цену округлите до второго знака после запятой.

SELECT 
    cars.brand_origin AS brand, 
    EXTRACT(YEAR FROM sales.date) AS year,  -- Извлекаем год из даты продажи
    ROUND(AVG(sales.price * (1 - COALESCE(sales.discount, 0) / 100.0)), 2) AS avg_price  -- Средняя цена с учётом скидки, округлённая до 2 знаков
FROM 
    car_shop.cars
JOIN 
    car_shop.sales ON cars.id = sales.car_id  -- Объединяем таблицы по идентификатору автомобиля
GROUP BY 
    cars.brand_origin, year  -- Группируем по бренду и году
ORDER BY 
    cars.brand_origin ASC, year ASC;  -- Сортировка по названию бренда и году