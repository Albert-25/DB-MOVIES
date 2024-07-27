SELECT 
    p.id AS directorId,
    CONCAT(p.firstName, ' ', p.lastName) AS directorName,
    AVG(m.budget) AS averageBudget
FROM 
    PERSON p
JOIN 
    MOVIE m ON p.id = m.directorId
GROUP BY 
    p.id, p.firstName, p.lastName;
