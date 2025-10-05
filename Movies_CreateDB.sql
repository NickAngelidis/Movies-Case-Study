-- Create Database
CREATE DATABASE moviesdb;

-- Use Database
USE moviesdb;

-- Table Movies
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(100),
    ReleaseYear INT,
    Genre VARCHAR(50)
);

-- Table Users
CREATE TABLE Users (
	UserID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

-- Table Ratings
CREATE TABLE Ratings (
    RatingID INT PRIMARY KEY,
    MovieID INT,
    UserID INT,
    Rating DECIMAL(2,1),
    RatingDate DATE,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Insert Movies Data
INSERT INTO Movies VALUES
(1, 'The Matrix', 1999, 'Sci-Fi'),
(2, 'Inception', 2010, 'Sci-Fi'),
(3, 'Titanic', 1997, 'Romance'),
(4, 'The Godfather', 1972, 'Crime'),
(5, 'Avengers: Endgame', 2019, 'Action');

-- Insert Users Data
INSERT INTO Users VALUES
(1, 'John', 'Doe', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'jane.smith@example.com'),
(3, 'Ali', 'Khan', 'ali.khan@example.com');

-- Insert Ratings Data
INSERT INTO Ratings VALUES
(1, 1, 1, 9.0, '2025-09-01'),
(2, 2, 1, 8.5, '2025-09-02'),
(3, 3, 2, 7.0, '2025-09-01'),
(4, 4, 2, 9.5, '2025-09-03'),
(5, 5, 3, 8.0, '2025-09-02'),
(6, 1, 3, 9.2, '2025-09-03');
