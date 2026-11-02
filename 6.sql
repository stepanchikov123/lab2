-- 6. Создать групповой запрос, используя агрегатные функции.

SELECT 
    COUNT(*) AS total_disciplin,       -- Общее количество дисциплин
    MIN(god_vvedeniya) AS min_year,    -- Самый ранний год
    MAX(god_vvedeniya) AS max_year,    -- Самый поздний год
    AVG(god_vvedeniya) AS avg_year,    -- Средний год (выдаст число с копейками)
    SUM(kod_disciplini) AS sum_kodov   -- Сумма кодов (чтобы задействовать Sum)
FROM 
    disciplini1;