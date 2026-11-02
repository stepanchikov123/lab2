DROP TABLE IF EXISTS new_table;

-- Создаем таблицу заново с данными из запроса
CREATE TABLE new_table AS
SELECT 
    kod_disciplini, 
    nazvanie, 
    opisanie, 
    god_vvedeniya
FROM 
    disciplini1
WHERE 
    god_vvedeniya < (EXTRACT(YEAR FROM CURRENT_DATE) - 5);