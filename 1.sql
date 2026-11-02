SELECT * FROM disciplini1 WHERE god_vvedeniya < (EXTRACT(YEAR FROM CURRENT_DATE) - 5);

SELECT DISTINCT d.* 
FROM disciplini1 d
JOIN nagruzka2 n ON d.kod_disciplini = n.kod_disciplini
WHERE n.pochasovaya_oplata = true;

DROP TABLE IF EXISTS result_variant17;
CREATE TABLE result_variant17 AS
SELECT d.nazvanie, d.opisanie, d.god_vvedeniya, d.kod_disciplini 
FROM disciplini1 d
WHERE d.god_vvedeniya < (EXTRACT(YEAR FROM CURRENT_DATE) - 5) 
   OR d.kod_disciplini IN (SELECT kod_disciplini FROM nagruzka2 WHERE pochasovaya_oplata = true);

INSERT INTO result_variant17 (nazvanie, opisanie, god_vvedeniya, kod_disciplini)
SELECT nazvanie, opisanie, god_vvedeniya, kod_disciplini 
FROM disciplini1
WHERE nazvanie ILIKE 'Основы % %';

UPDATE result_variant17 SET god_vvedeniya = 2009 WHERE kod_disciplini % 2 = 0;

DELETE FROM result_variant17 WHERE nazvanie ILIKE '%математика%';

SELECT 
    (1990 + ((god_vvedeniya - 1990) / 5) * 5) AS period_start,
    COUNT(*) AS count_disciplin
FROM disciplini1
WHERE god_vvedeniya >= 1990
GROUP BY (1990 + ((god_vvedeniya - 1990) / 5) * 5)
ORDER BY period_start;