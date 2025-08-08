/*
			IGNORE THIS 

Drop table if exists Team
CREATE TABLE Team (
    Team_ID INT,
    Name VARCHAR(100),
    [Home Stadium] VARCHAR(100),
    [Number of Wins] INT,
    [Number of Losses] INT
);


BULK INSERT Team
FROM 'C:\Users\HASHIM\Desktop\team_data.csv'
WITH (
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n'  , 
   FIRSTROW = 2
);



*/
--								START       

CREATE TABLE Stadium (
STADIUM_ID NUMERIC(4) NOT NULL,
NAME VARCHAR(30),
LOCATION VARCHAR(30),
CAPACITY NUMERIC(8),
PRIMARY KEY(STADIUM_ID));

INSERT INTO Stadium VALUES (101,'National Stadium','Karachi',34000)
INSERT INTO Stadium VALUES (102,'Gaddafi Stadium','Lahore',27000)
INSERT INTO Stadium VALUES (103,'Rawalpindi Cricket Stadium','Rawalpindi',40000)
INSERT INTO Stadium VALUES (104,'Arbab Niaz Stadium','Peshawar',35000)
INSERT INTO Stadium VALUES (105,'Bugti Stadium','Quetta',20000)
INSERT INTO Stadium VALUES (106,'Multan Cricket Stadium','Multan',35000)


SELECT * FROM Stadium

SELECT * FROM team
--Select* from player_data


--DROP TABLE IF EXISTS Match;
CREATE TABLE Match (
    MATCH_ID NUMERIC(4) NOT NULL,
    DATE DATE,
    TIME TIME(0) Default '19:30:00',
    STADIUM_ID NUMERIC(4),
    MATCH_TYPE VARCHAR(10),
    TEAM1_ID tinyint,
    TEAM2_ID tinyint,
    FOREIGN KEY (STADIUM_ID) REFERENCES Stadium (STADIUM_ID),
    FOREIGN KEY (TEAM1_ID) REFERENCES Team (Team_ID),
    FOREIGN KEY (TEAM2_ID) REFERENCES Team (Team_ID),
    PRIMARY KEY (MATCH_ID)
);

INSERT INTO Match VALUES (1, '2024-02-01', '19:30:00', 101, 'Qualifier', 201, 203);
INSERT INTO Match VALUES (2, '2024-02-02', '14:30:00', 101, 'Qualifier', 202, 204);
INSERT INTO Match VALUES (3, '2024-02-02', '19:30:00', 101, 'Qualifier', 201, 205);
INSERT INTO Match VALUES (4, '2024-02-03', '19:30:00', 101, 'Qualifier', 201, 202);
INSERT INTO Match VALUES (5, '2024-02-04', '19:30:00', 101, 'Qualifier', 203, 204);
INSERT INTO Match VALUES (6, '2024-02-05', '19:30:00', 101, 'Qualifier', 201, 206);
INSERT INTO Match VALUES (7, '2024-02-06', '19:30:00', 102, 'Qualifier', 202, 206);
INSERT INTO Match VALUES (8, '2024-02-07', '14:30:00', 102, 'Qualifier', 203, 205);
INSERT INTO Match VALUES (9, '2024-02-07', '19:30:00', 102, 'Qualifier', 204, 206);
INSERT INTO Match VALUES (10, '2024-02-08', '19:30:00', 102, 'Qualifier', 205, 202);
INSERT INTO Match VALUES (11, '2024-02-09', '19:30:00', 102, 'Qualifier', 205, 206);
INSERT INTO Match VALUES (12, '2024-02-10', '19:30:00', 102, 'Qualifier', 201, 202);
INSERT INTO Match VALUES (13, '2024-02-11', '14:30:00', 104, 'Qualifier', 202, 204);
INSERT INTO Match VALUES (14, '2024-02-11', '19:30:00', 104, 'Qualifier', 203, 205);
INSERT INTO Match VALUES (15, '2024-02-12', '19:30:00', 105, 'Qualifier', 203, 204);
INSERT INTO Match VALUES (16, '2024-02-14', '19:30:00', 105, 'Qualifier', 202, 205);
INSERT INTO Match VALUES (17, '2024-02-16', '19:30:00', 106, 'Qualifier', 201, 206);
INSERT INTO Match VALUES (18, '2024-02-17', '19:30:00', 103, 'Eliminator', 204, 206);
INSERT INTO Match VALUES (19, '2024-02-18', '19:30:00', 103, 'Eliminator', 201, 203);
INSERT INTO Match VALUES (20, '2024-02-20', '20:00:00', 102, 'Final', 202, 206);

select * from Match

DROP TABLE IF EXISTS Performance;
CREATE TABLE Performance (
    Performance_ID NUMERIC(4) NOT NULL,
	Match_ID Numeric(4),
	Player_ID tinyint,
	[Runs_Scored] varchar(1000),
    Wickets_taken NUMERIC(4),
    Catches Numeric(4),

    FOREIGN KEY (Match_ID) REFERENCES Match (MATCH_ID),
    FOREIGN KEY (Player_ID) REFERENCES Player (Player_ID),
    PRIMARY KEY (Performance_ID)
);

INSERT INTO Performance VALUES (111, 1, 7, '42', 2, 1);
INSERT INTO Performance VALUES (112, 1, 1, '100', 1, 0);
INSERT INTO Performance VALUES (113, 1, 3, '50', 1, 2);
INSERT INTO Performance VALUES (114, 1, 9, '14', 0, 1);
INSERT INTO Performance VALUES (115, 7, 8, '56', 0, 3);
INSERT INTO Performance VALUES (116, 7, 2, '0', 4, 0);
INSERT INTO Performance VALUES (117, 7, 18, '43', 0, 2);
INSERT INTO Performance VALUES (118, 8, 3, '30', 2, 2);
INSERT INTO Performance VALUES (119, 8, 17, '3', 0, 1);
INSERT INTO Performance VALUES (120, 8, 15, '23', 0, 1);
INSERT INTO Performance VALUES (121, 18, 4, '20', 3, 1);
INSERT INTO Performance VALUES (122, 18, 10, '0', 4, 0);
INSERT INTO Performance VALUES (123, 18, 13, '40', 0, 0);
INSERT INTO Performance VALUES (124, 18, 6, '70', 0, 3);
INSERT INTO Performance VALUES (125, 19, 1, '30', 0, 2);
INSERT INTO Performance VALUES (126, 19, 3, '32', 2, 2);
INSERT INTO Performance VALUES (127, 19, 7, '50', 5, 1);
INSERT INTO Performance VALUES (128, 20, 2, '0', 4, 1);
INSERT INTO Performance VALUES (129, 20, 8, '80', 0, 2);
INSERT INTO Performance VALUES (130, 20, 18, '40', 0, 4);

Select * from Performance




DROP TABLE IF EXISTS Winner;
CREATE TABLE Winner (
	
    Match_ID NUMERIC(4) NOT NULL,
	Winnig_Team_Name varchar(50),


    FOREIGN KEY (Match_ID) REFERENCES Match (MATCH_ID),
 --   FOREIGN KEY (Winnig_Team_Name) REFERENCES Team (Name),
  
);

INSERT INTO Winner VALUES (1,'Islamabad United');
INSERT INTO Winner VALUES (2,'Peshawar Zalmi');
INSERT INTO Winner VALUES (3,'Karachi Kings');
INSERT INTO Winner VALUES (4,'Lahore Qalandars');
INSERT INTO Winner VALUES (5,'Islamabad United');
INSERT INTO Winner VALUES (6,'Multan Sultans');
INSERT INTO Winner VALUES (7,'Lahore Qalandars');
INSERT INTO Winner VALUES (8,'Islamabad United');
INSERT INTO Winner VALUES (9,'Peshawar Zalmi');
INSERT INTO Winner VALUES (10,'Quetta Gladiators');
INSERT INTO Winner VALUES (11,'Multan Sultans');
INSERT INTO Winner VALUES (12,'Lahore Qalandars');
INSERT INTO Winner VALUES (13,'Lahore Qalandars');
INSERT INTO Winner VALUES (14,'Islamabad United');
INSERT INTO Winner VALUES (15,'Peshawar Zalmi');
INSERT INTO Winner VALUES (16,'Lahore Qalandars');
INSERT INTO Winner VALUES (17,'Multan Sultans');
INSERT INTO Winner VALUES (18,'Peshawar Zalmi');
INSERT INTO Winner VALUES (19,'Islamabad United');
INSERT INTO Winner VALUES (20,'Lahore Qalandars');

Select * from Winner


/*--------------------------------------------------------------------------------------*/



/*    ---- Query 2 -------*/
select  TOP(1) player.Name, SUM( Performance.Catches ) as Total_catches
from Performance
inner join player
ON player.Player_ID = Performance.Player_ID

group by player.Name
order by Total_catches desc


/*    ---- Query 3 -------*/
Select Name as Team_Name,Home_Stadium
From Team
order by Name


/*    ---- Query 4 -------*/
Select Stadium.NAME,Stadium.CAPACITY
from Stadium
order by Stadium.CAPACITY desc


/*    ---- Query 6  -------*/ 

select Stadium.NAME, count(match.MATCH_ID) as Matches_Played
from Stadium 
inner join Match
ON match.STADIUM_ID=Stadium.STADIUM_ID
group by Stadium.NAME


/*    ---- Query 8 -------*/ --done

Select team.Name, team.Number_of_Wins
from team
where Number_of_Wins>3


/*    ---- Query 10 -------*/  --done

select Player.Name ,Performance.Runs_Scored, Performance.Wickets_taken
from Performance
inner join player
ON Performance.Player_ID = Player.Player_ID

where Performance.Runs_Scored > 50 AND Performance.Wickets_taken >=3


/*    ---- Query 12 -------*/  --done, but add team names?

select Match.TEAM1_ID, Match.TEAM2_ID, Winner.Winnig_Team_Name
from Match
inner join Winner
ON Match.MATCH_ID = Winner.Match_ID


/*    ---- Query 14 -------*/  --done

select Stadium.NAME, COUNT( Match.MATCH_ID) as Matches_Hosted
from Stadium

inner join Match
ON Stadium.STADIUM_ID= Match.STADIUM_ID 

group by Stadium.NAME

/*    ---- Query 16 -------*/   --doneee


select TOP(3) Player.Name , Performance.Runs_Scored, Match.MATCH_TYPE
from Performance

inner join player
ON Performance.Player_ID = Player.Player_ID

inner join Match
ON Performance.Match_ID=Match.MATCH_ID

where Performance.Runs_Scored > 50 AND Match.MATCH_TYPE = 'Final'
order by CAST(Performance.Runs_Scored as INTEGER ) desc



/*    ---- Query 18 -------*/  --yess done hai jee

select TOP(3) Player_Name, Total_Runs
from (
	select Player.Name as Player_Name ,SUM(CAST(Performance.Runs_Scored as INTEGER )) as Total_Runs
	from Performance

	inner join player
	ON Performance.Player_ID = Player.Player_ID

	group by player.Name
	) as SumRuns 

order by Total_Runs desc


/*    ---- Query 20 -------*/  --are wah

select team.Name , Stadium.NAME as Home_Stadium ,COUNT(Winner.Match_ID) as Home_Wins
from team

inner join Stadium
ON Stadium.NAME = team.Home_Stadium

inner join Match
ON team.Team_ID = Match.TEAM1_ID OR  team.Team_ID = Match.TEAM2_ID

inner join Winner
ON  team.Name = Winner.Winnig_Team_Name ANd Match.MATCH_ID = Winner.Match_ID 

group by team.name, Stadium.NAME


/*    ---- Query 22 -------*/  

SELECT distinct p.Player_ID, pl.Name AS Player_Name
FROM Performance P
INNER JOIN Winner w ON p.Match_ID = w.Match_ID  -- Finding the match id
INNER JOIN Team t ON t.Name = w.Winnig_Team_Name  --- Finding the team name (winning)
INNER JOIN Player pl ON p.Player_ID = pl.Player_ID  --- Joining performance player id and player player id to get information about Player
WHERE p.Runs_Scored > 30 AND p.Wickets_taken >=1 AND p.Catches>0
  AND p.Player_ID IN 
  (
    SELECT Player_ID  
    FROM Player
    WHERE Team_Name = t.Name
  );





	  /*---------- Query 23  -------*/

/**

CORELATED NESTED QUERIES

Printing ID and name of those players with zero catches

*/

Select* from Performance


Select player_id,name
from player P
where p.Player_ID IN
(
	Select Player_ID
	From Performance
	where p.Player_ID = Player_ID AND Catches =0
);


/* ---- UNION  -----*/   --Prints player names and role who scored more than 40 runs regardless of their role

select player.Name, player.Role
from player
union
select player.Name, player.Role
from player
INNER JOIN Performance ON player.Player_ID = Performance.Player_ID
where Performance.Runs_Scored > 40


/* ---- GROUP BY ------ */  --Finding player with maximum catches

select TOP(1) player.Name, Sum(Performance.Catches) as Total_Catches
from player

INNER JOIN Performance 
ON player.Player_ID = Performance.Player_ID

group by player.Name
order by Total_Catches desc


/**

----- LIKE OPERATOR
Printing name of those players whose name starts with A 

*/

Select Player.Name
from Player
where name like 'A%'


/**
----- HAVING CLAUSE



*/

Select* from Performance


SELECT p.Player_ID, p1.Name
FROM Performance p
INNER JOIN Winner ON p.Match_ID = Winner.Match_ID
INNER JOIN Player p1 ON p.Player_ID = p1.Player_ID
GROUP BY p.Player_ID, p1.Name
HAVING SUM(CAST(p.Runs_Scored AS INTEGER)) < 50;


