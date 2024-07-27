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
        'lastName', p.lastName,
        'photo', JSON_OBJECT(
            'fileName', pf.fileName,
            'mimeType', pf.mimeType,
            'url', pf.url
        )
    ) AS director,
    JSON_ARRAYAGG(
        JSON_OBJECT(
            'id', a.id,
            'firstName', a.firstName,
            'lastName', a.lastName,
            'photo', JSON_OBJECT(
                'fileName', af.fileName,
                'mimeType', af.mimeType,
                'url', af.url
            )
        )
    ) AS actors,
    JSON_ARRAYAGG(
        JSON_OBJECT(
            'id', g.id,
            'name', g.name
        )
    ) AS genres
FROM 
    MOVIE m
JOIN 
    FILE f ON m.posterFileId = f.id
JOIN 
    PERSON p ON m.directorId = p.id
LEFT JOIN 
    FILE pf ON p.primaryPhotoFileId = pf.id
LEFT JOIN 
    MOVIE_CHARACTER mc ON m.id = mc.movieId
LEFT JOIN 
    PERSON a ON mc.actorId = a.id
LEFT JOIN 
    FILE af ON a.primaryPhotoFileId = af.id
LEFT JOIN 
    MOVIE_GENRE mg ON m.id = mg.movieId
LEFT JOIN 
    GENRE g ON mg.genreId = g.id
WHERE 
    m.id = 1
GROUP BY 
    m.id, m.title, m.releaseDate, m.duration, m.description, f.fileName, f.mimeType, f.url, p.id, p.firstName, p.lastName, pf.fileName, pf.mimeType, pf.url;
