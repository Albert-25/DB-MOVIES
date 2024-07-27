SELECT 
    u.id AS id,
    u.username AS username,
    CASE 
        WHEN COUNT(ufm.movieId) = 0 THEN NULL
        ELSE JSON_ARRAYAGG(ufm.movieId)
    END AS favoriteMovieIds
FROM 
    USER u
LEFT JOIN 
    USER_FAVORITE_MOVIE ufm ON u.id = ufm.userId
GROUP BY 
    u.id, u.username;
