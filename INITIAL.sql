-- Создание схемы
CREATE SCHEMA raw_data;

CREATE TABLE raw_data.sales (
    id SERIAL PRIMARY KEY, -- выбран тип данных SERIAL поскольку  генерирует уникальные значения автоматически, это удобно для первичного ключа.
    auto TEXT,  -- выбран тип данных тип данных TEXT для хранения строк произвольной длины. Описание автомобиля может быть разной длины
    gasoline_consumption REAL,  -- поскольку Расход топлива может иметь дробные значения (например, 7.3 л/100 км), поэтому REAL позволяет хранить такие данные
    price NUMERIC, -- выбраный тип данных NUMERIC позволяет точно хранить значения с плавающей точкой, что особенно важно для финансовых данных.
    date DATE,  -- выбраный  тип данных DATE позволяет хранить только дату, без необходимости учитывать временные компоненты, что здесь не требуется.
    person_name TEXT,  -- поскольку имя покупателя может быть разной длины и может содержать пробелы, поэтому TEXT — подходящий выбор
    phone TEXT,  -- так как  номер телефона может включать символы (например, +, -, пробелы) и может иметь различный формат. TEXT позволяет хранить такие значения.
    discount INTEGER, -- Скидка в процентах — это целое число (например, 20%). INTEGER подходит для хранения таких значений.
    brand_origin TEXT  -- Страна происхождения может быть представлена разными строками. TEXT предоставляет гибкость для хранения различных значений без потери в производительности
);


-- добавление данных из csv файла выполнятеся в psql
-- \copy raw_data.sales (id, auto, gasoline_consumption, price, date, person_name, phone, discount, brand_origin) FROM 'C:\Users\Admin\Desktop\final_project\cars.csv' DELIMITER ',' CSV HEADER NULL 'null';