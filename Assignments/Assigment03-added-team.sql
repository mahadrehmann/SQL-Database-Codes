
Select* from Team

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




--DROP TABLE IF EXISTS Match;
CREATE TABLE Match (
    MATCH_ID NUMERIC(4) NOT NULL,
    DATE DATE,
    TIME TIME(0) Default '19:30:00',
    STADIUM_ID NUMERIC(4),
    MATCH_TYPE VARCHAR(10),
  /*  TEAM1_ID int NOT NULL,
    TEAM2_ID int NOT NULL,
    FOREIGN KEY (STADIUM_ID) REFERENCES Stadium (STADIUM_ID),
    FOREIGN KEY (TEAM1_ID) REFERENCES Team (Team_ID),
    FOREIGN KEY (TEAM2_ID) REFERENCES Team (Team_ID),
	*/
    PRIMARY KEY (MATCH_ID)
);
Select* from Team

INSERT INTO Match VALUES (1, '2024-02-01', '19:30:00', 101, 'Qualifier');
INSERT INTO Match VALUES (2, '2024-02-02', '14:30:00', 101, 'Qualifier');
INSERT INTO Match VALUES (3, '2024-02-02', '19:30:00', 101, 'Qualifier');
INSERT INTO Match VALUES (4, '2024-02-03', '19:30:00', 101, 'Qualifier');
INSERT INTO Match VALUES (5, '2024-02-04', '19:30:00', 101, 'Qualifier');
INSERT INTO Match VALUES (6, '2024-02-05', '19:30:00', 101, 'Qualifier');
INSERT INTO Match VALUES (7, '2024-02-06', '19:30:00', 102, 'Qualifier');
INSERT INTO Match VALUES (8, '2024-02-07', '14:30:00', 102, 'Qualifier');
INSERT INTO Match VALUES (9, '2024-02-07', '19:30:00', 102, 'Qualifier');
INSERT INTO Match VALUES (10, '2024-02-08', '19:30:00', 102, 'Qualifier');
INSERT INTO Match VALUES (11, '2024-02-09', '19:30:00', 102, 'Qualifier');
INSERT INTO Match VALUES (12, '2024-02-10', '19:30:00', 102, 'Qualifier');
INSERT INTO Match VALUES (13, '2024-02-11', '14:30:00', 104, 'Qualifier');
INSERT INTO Match VALUES (14, '2024-02-11', '19:30:00', 104, 'Qualifier');
INSERT INTO Match VALUES (15, '2024-02-12', '19:30:00', 105, 'Qualifier');
INSERT INTO Match VALUES (16, '2024-02-14', '19:30:00', 105, 'Qualifier');
INSERT INTO Match VALUES (17, '2024-02-16', '19:30:00', 106, 'Qualifier');
INSERT INTO Match VALUES (18, '2024-02-17', '19:30:00', 103, 'Eliminator');
INSERT INTO Match VALUES (19, '2024-02-18', '19:30:00', 103, 'Eliminator');
INSERT INTO Match VALUES (20, '2024-02-20', '20:00:00', 102, 'Final');

select * from Match

DROP TABLE IF EXISTS Performance;
CREATE TABLE Performance (
    Performance_ID NUMERIC(4) NOT NULL,
	Match_ID Numeric(4),
	Player_ID tinyint,
	Runs_Scored int DEFAULT NULL,
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
