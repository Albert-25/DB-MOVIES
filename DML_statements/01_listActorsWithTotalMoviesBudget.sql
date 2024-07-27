SELECT 
    p.id AS id,
    p.firstName AS firstName,
    p.lastName AS lastName,
    SUM(m.budget) AS totalMoviesBudget
FROM 
    PERSON p
JOIN 
    MOVIE_CHARACTER mc ON p.id = mc.actorId
JOIN 
    MOVIE m ON mc.movieId = m.id
GROUP BY 
    p.id, p.firstName, p.lastName;
