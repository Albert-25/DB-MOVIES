SELECT 
    m.id AS id,
    m.title AS title,
    m.releaseDate AS releaseDate,
    m.duration AS duration,
    m.description AS description,
    JSON_OBJECT(
        'fileName', f.fileName,
        'mimeType', f.mimeType,
        'url', f.url
    ) AS poster,
    JSON_OBJECT(
        'id', p.id,
        'firstName', p.firstName,
        'lastName', p.lastName
    ) AS director
FROM 
    MOVIE m
JOIN 
    FILE f ON m.posterFileId = f.id
JOIN 
    PERSON p ON m.directorId = p.id
JOIN 
    MOVIE_GENRE mg ON m.id = mg.movieId
JOIN 
    GENRE g ON mg.genreId = g.id
WHERE 
    m.countryId = 1 
    AND m.releaseDate >= '2022-01-01'
    AND m.duration > 135
    AND (g.name = 'Action' OR g.name = 'Drama');
