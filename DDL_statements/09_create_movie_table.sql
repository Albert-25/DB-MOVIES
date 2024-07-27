CREATE TABLE MOVIE (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    budget DECIMAL(15, 2),
    releaseDate DATE,
    duration INT,
    directorId INT,
    countryId INT,
    posterFileId INT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (directorId) REFERENCES PERSON(id),
    FOREIGN KEY (countryId) REFERENCES COUNTRY(id),
    FOREIGN KEY (posterFileId) REFERENCES FILE(id)
);