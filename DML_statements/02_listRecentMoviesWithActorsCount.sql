SELECT
	m.id AS id,
	m.title AS title,
	COUNT(mc.actorId) AS actorsCount
FROM
	MOVIE m
LEFT JOIN 
    MOVIE_CHARACTER mc ON
	m.id = mc.movieId
WHERE
	m.releaseDate >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR)
GROUP BY
	m.id,
	m.title;