INSERT INTO new_table (kod_disciplini, nazvanie, opisanie, god_vvedeniya)
SELECT 
    d.kod_disciplini, 
    d.nazvanie, 
    d.opisanie, 
    d.god_vvedeniya
FROM 
    disciplini1 d
JOIN 
    nagruzka2 n ON d.kod_disciplini = n.kod_disciplini
WHERE 
    n.pochasovaya_oplata = true;