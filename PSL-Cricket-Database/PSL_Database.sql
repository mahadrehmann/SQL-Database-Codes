---------- Data Definition Language (DDL) ---------

CREATE DATABASE PSL_DATABASE
DROP DATABASE PSL_DATABASE
--------------------------------------------------- Stadium Table -----------------------------------------------------------------

CREATE TABLE STADIUM (
	StadiumID int NOT NULL,
	StadiumName varchar(255) NOT NULL UNIQUE,
	StadiumLocation varchar(255) NOT NULL,
	StadiumCapacity int NOT NULL,
	PRIMARY KEY(StadiumID)
)

INSERT INTO STADIUM(StadiumID, StadiumName, StadiumLocation, StadiumCapacity)
VALUES
(1, 'National Stadium', 'Karachi', 34328),
(2, 'Gaddafi Stadium', 'Lahore', 27000),
(3, 'Rawalpindi Cricket Stadium', 'Rawalpindi', 18000),
(4, 'Abrar Niaz Stadium', 'Peshawar', 35000),
(5, 'Bugti Stadium', 'Quetta', 20000),
(6, 'Multan Cricket Stadium', 'Multan', 35000)

--------------------------------------------------- Team Table -----------------------------------------------------------------

CREATE TABLE TEAM (
	TeamID int NOT NULL,
	TeamName varchar(255) NOT NULL,
	HomeStadium varchar(255) NOT NULL,
	Wins int DEFAULT 0,
	Loses int DEFAULT 0,
	PRIMARY KEY(TeamName),
	--FOREIGN KEY(HomeStadium) REFERENCES STADIUM(StadiumName)
)

INSERT INTO TEAM(TeamID, TeamName, HomeStadium, Wins)
VALUES
(1, 'Karachi Kings', 'National Stadium', 0),
(2, 'Lahore Qalandars', 'Gaddafi Stadium', 0),
(3, 'Islamabad United', 'Rawalpindi Cricket Stadium', 0),
(4, 'Peshawar Zalmi', 'Abrar Niaz Stadium', 0),
(5, 'Quetta Gladiators', 'Bugti Stadium', 0),
(6, 'Multan Sultans', 'Multan Cricket Stadium', 0)

--------------------------------------------------- Player Table -----------------------------------------------------------------

CREATE TABLE PLAYER (
	PlayerID int NOT NULL,
	PlayerName varchar(255) NOT NULL,
	PlayerRole varchar(255) NOT NULL,
	TeamName varchar(255),
	PRIMARY KEY(PlayerID)

)

INSERT INTO PLAYER(PlayerID, PlayerName, PlayerRole, TeamName)
VALUES 
(1, 'Babar Azam', 'Batsman', 'Karachi Kings'),
(2, 'Shaheen Afridi', 'Bowler', 'Lahore Qalandars'),
(3, 'Shadab Khan', 'All-Rounder', 'Islamabad United'),
(4, 'Wahab Riaz', 'Bowler', 'Peshawar Zalmi'),
(5, 'Sarfraz Ahmed', 'Wicketkeeper', 'Quetta Gladiators'),
(6, 'Mohamamd Rizwan', 'Wicketkeeper', 'Multan Sultans'),
(7, 'Imad Wasim', 'All-Rounder', 'Karachi Kings'),
(8, 'Fakhar Zaman', 'Batsman', 'Lahore Qalandars'),
(9, 'Asif Ali', 'Batsman', 'Islamabad United'),
(10, 'Haris Rauf', 'Bowler', 'Peshawar Zalmi'),
(11, 'Hassan Ali', 'Bowler', 'Quetta Gladiators'),
(12, 'Faheem Ashraf', 'All-Rounder', 'Multan Sultans'),
(13, 'Mohammad Hafeez', 'All-Rounder', 'Karachi Kings'),
(14, 'Shoaib Malik', 'All-Rounder', 'Lahore Qalandars'),
(15, 'Ahmed Shehzad', 'Batsman', 'Islamabad United'),
(16, 'Umer Akmal', 'Batsman', 'Peshawar Zalmi'),
(17, 'Shan Masood', 'Batsman', 'Quetta Gladiators'),
(18, 'Kamran Akmal', 'Wicketkeeper', 'Multan Sultans'),
(19, 'Yasir Shah', 'Bowler', 'Karachi Kings'),
(20, 'Junaid  Khan', 'Bowler', 'Lahore Qalandars')

--------------------------------------------------- Fixture Table -----------------------------------------------------------------

CREATE TABLE FIXTURE (
	MatchID int NOT NULL,
	MatchDate date NOT NULL,
	MatchTime time NOT NULL,
	StadiumID int NOT NULL,
	MatchType varchar(255) NOT NULL,
	Team1ID int NOT NULL,
	Team2ID int NOT NULL
	PRIMARY KEY(MatchID),
	FOREIGN KEY(StadiumID) REFERENCES STADIUM(StadiumID)
)

INSERT INTO FIXTURE(MatchID, MatchDate, MatchTime, StadiumID, MatchType, Team1ID, Team2ID)
VALUES
(1, '2024-02-17', '07:00:00', 3, 'Group Stage', 1, 2),
(2, '2024-02-19', '07:00:00', 4, 'Group Stage', 1, 3),
(3, '2024-02-21', '07:00:00', 1, 'Group Stage', 1, 4),
(4, '2024-02-24', '07:00:00', 5, 'Group Stage', 1, 5),
(5, '2024-02-27', '07:00:00', 1, 'Group Stage', 1, 6),
(6, '2024-03-02', '07:00:00', 2, 'Group Stage', 2, 3),
(7, '2024-03-04', '07:00:00', 6, 'Group Stage', 2, 4),
(8, '2024-03-05', '07:00:00', 1, 'Group Stage', 2, 5),
(9, '2024-03-07', '02:00:00', 4, 'Group Stage', 2, 6),
(10, '2024-03-07', '07:00:00', 5, 'Group Stage', 3, 4),
(11, '2024-03-08', '07:00:00', 2, 'Group Stage', 3, 5),
(12, '2024-03-09', '02:00:00', 3, 'Group Stage', 3, 6),
(13, '2024-03-09', '07:00:00', 4, 'Group Stage', 4, 5),
(14, '2024-03-11', '07:00:00', 1, 'Group Stage', 4, 6),
(15, '2024-03-14', '07:00:00', 2, 'Group Stage', 5, 6),
(16, '2024-03-17', '09:00:00', 1, 'Qualifier', 1, 4),
(17,'2024-03-19', '09:00:00', 3, 'Eliminator', 2, 3),
(18, '2024-03-21', '09:00:00', 4, 'Qualifier', 4, 2),
(19, '2024-03-23', '09:00:00', 6, 'Third Place', 2, 3),
(20, '2024-03-27', '09:00:00', 5, 'Final', 1, 4)

--------------------------------------------------- Performance Table ---------------------------------------------------------------

CREATE TABLE PERFORMANCE (
	PerformanceID int NOT NULL,
	MatchID int NOT NULL,
	PlayerID int NOT NULL,
	Runs int DEFAULT 0,
	Wickets int DEFAULT 0,
	Catches int DEFAULT 0,
	PRIMARY KEY(PerformanceID),
	FOREIGN KEY(MatchID) REFERENCES FIXTURE(MatchID),
	FOREIGN KEY(PlayerID) REFERENCES PLAYER(PlayerID)
)

INSERT INTO PERFORMANCE (PerformanceID, MatchID, PlayerID, Runs, Wickets, Catches)
VALUES
(1, 1, 1, 78, 0, 1),
(2, 2, 2, 33, 3, 1),
(3, 3, 6, 111, 0, 2),
(4, 4, 1, 86, 0, 2),
(5, 5, 3, 54, 3, 1),
(6, 6, 2, 0, 4, 1),
(7, 7, 1, 69, 0, 1),
(8, 8, 3, 66, 2, 2),
(9, 9, 6, 120, 0, 4),
(10, 10, 2, 0, 5, 2),
(11, 11, 7, 65, 2, 1),
(12, 12, 1, 97, 0, 0),
(13, 13, 6, 88, 0, 2),
(14, 14, 8, 88, 0, 2),
(15, 15, 14, 60, 2, 0),
(16, 16, 1, 101, 0, 0),
(17, 17, 9, 51, 0, 4),
(18, 18, 20, 0, 6, 2),
(19, 19, 2, 11, 4, 3),
(20, 20, 6, 0, 0, 0)

--------------------------------------------------- Winner Table ---------------------------------------------------------------

CREATE TABLE WINNER (
	MatchID int NOT NULL,
	TeamName varchar(255) NOT NULL,
	PRIMARY KEY(MatchID),
	FOREIGN KEY(MatchID) REFERENCES FIXTURE(MatchID),
	FOREIGN KEY(TeamName) REFERENCES TEAM(TeamName)
)

INSERT INTO WINNER(MatchID, TeamName)
VALUES
(1, 'Karachi Kings'),
(2, 'Karachi Kings'),
(3, 'Peshawar Zalmi'),
(4, 'Karachi Kings'),
(5, 'Multan Sultans'),
(6, 'Lahore Qalandars'),
(7, 'Peshawar Zalmi'),
(8, 'Lahore Qalandars'),
(9, 'Multan Sultans'),
(10, 'Peshawar Zalmi'),
(11, 'Islamabad United'),
(12, 'Islamabad United'),
(13, 'Peshawar Zalmi'),
(14, 'Peshawar Zalmi'),
(15, 'Quetta Gladiators'),
(16, 'Karachi Kings'),
(17, 'Lahore Qalandars'),
(18, 'Islamabad United'),
(19, 'Peshawar Zalmi'),
(20, 'Peshawar Zalmi')

---------- Data Manipulation Language (DDL) ---------

SELECT * FROM STADIUM
SELECT * FROM FIXTURE
SELECT * FROM PERFORMANCE
SELECT * FROM WINNER
SELECT * FROM TEAM
SELECT * FROM PLAYER

DROP TABLE TEAM
DROP TABLE PLAYER
DROP TABLE STADIUM
DROP TABLE FIXTURE
DROP TABLE PERFORMANCE
DROP TABLE WINNER