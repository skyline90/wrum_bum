-- 3. Посчитайте среднюю цену всех автомобилей с разбивкой по месяцам в 2022 году с учётом скидки. Результат отсортируйте по месяцам в восходящем порядке. Среднюю цену округлите до второго знака после запятой.
    
    SELECT 
    TO_CHAR(sales.date, 'Month') AS month,  -- Извлекаем название месяца
    ROUND(AVG(sales.price * (1 - COALESCE(sales.discount, 0) / 100.0)), 2) AS avg_price  -- Средняя цена с учётом скидки
FROM 
    car_shop.sales
WHERE 
    EXTRACT(YEAR FROM sales.date) = 2022  -- Фильтр по году 2022
GROUP BY 
    TO_CHAR(sales.date, 'Month'), EXTRACT(MONTH FROM sales.date)  -- Группируем по месяцу
ORDER BY 
    EXTRACT(MONTH FROM sales.date);  -- Сортируем по порядковому номеру месяца