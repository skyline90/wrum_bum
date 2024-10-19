-- 6. Напишите запрос, который покажет количество всех пользователей из США. Это пользователи, у которых номер телефона начинается на +1.

SELECT 
    COUNT(*) AS user_count  -- Подсчёт общего количества пользователей
FROM 
    car_shop.customers  -- Таблица пользователей
WHERE 
    phone LIKE '+1%'  -- Фильтр по номеру телефона, начинающемуся с +1
