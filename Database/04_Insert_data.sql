INSERT INTO Country (CountryID,CountryName,Continent)
VALUES
(1, 'Egypt', 'AFRICA'),
(2, 'Algeria', 'AFRICA'),
(3, 'Morocco', 'AFRICA'),
(4, 'Senegal', 'AFRICA'),
(5, 'England', 'Europe'),
(6, 'France', 'Europe'),
(7, 'Germany', 'Europe'),
(8, 'Spain', 'Europe'),
(9, 'Portugal', 'Europe'),
(10, 'Belgium', 'Europe'),
(11, 'Netherlands', 'Europe'),
(12, 'Argentina', 'South America'),
(13, 'Brazil', 'South America'),
(14, 'Uruguay', 'South America'),
(15, 'Colombia', 'South America'),
(16, 'Japan', 'Asia'),
(17, 'South Korea', 'Asia'),
(18, 'USA', 'North America'),
(19, 'Mexico', 'North America'),
(20, 'New Zealand', 'Oceania')


INSERT INTO Tournament (TournamentID,TournamentName, StartDate,EndDate,Season)
VALUES 
(1,'FIFA World Cup','2026-06-11','2026-07-19','2026')



INSERT INTO Stadium (StadiumID, StadiumName, City, Capacity)
VALUES
(1, 'MetLife Stadium', 'New Jersey', 82500),
(2, 'Los Angeles Stadium', 'Los Angeles', 70240),
(3, 'AT&T Stadium', 'Arlington', 80000),
(4, 'Mercedes-Benz Stadium', 'Atlanta', 71000),
(5, 'Estadio Azteca', 'Mexico City', 87523),
(6, 'BC Place', 'Vancouver', 54500),
(7, 'BMO Field', 'Toronto', 30000)



INSERT INTO Team (TeamID, TeamName, CountryID, FIFARanking)
VALUES
(1, 'Egypt', 1, 29),
(2, 'Algeria', 2, 38),
(3, 'Morocco', 3, 7),
(4, 'Senegal', 4, 15),
(5, 'England', 5, 4),
(6, 'France', 6, 3),
(7, 'Germany', 7, 10),
(8, 'Spain', 8, 2),
(9, 'Portugal', 9, 6),
(10, 'Belgium', 10, 9),
(11, 'Netherlands', 11, 8),
(12, 'Argentina', 12, 1),
(13, 'Brazil', 13, 5),
(14, 'Uruguay', 14, 16),
(15, 'Colombia', 15, 13),
(16, 'Japan', 16, 18),
(17, 'South Korea', 17, 23),
(18, 'USA', 18, 17),
(19, 'Mexico', 19, 14),
(20, 'New Zealand', 20, 86)


INSERT INTO Coach (CoachID, CoachName, TeamID)
VALUES
(1, 'Hossam Hassan', 1),
(2, 'Vladimir Petkovic', 2),
(3, 'Mohamed Ouahbi', 3),
(4, 'Pape Thiaw', 4),
(5, 'Thomas Tuchel', 5),
(6, 'Didier Deschamps', 6),
(7, 'Julian Nagelsmann', 7),
(8, 'Luis de la Fuente', 8),
(9, 'Roberto Martinez', 9),
(10, 'Rudi Garcia', 10),
(11, 'Ronald Koeman', 11),
(12, 'Lionel Scaloni', 12),
(13, 'Carlo Ancelotti', 13),
(14, 'Marcelo Bielsa', 14),
(15, 'Nestor Lorenzo', 15),
(16, 'Hajime Moriyasu', 16),
(17, 'Hong Myung-bo', 17),
(18, 'Mauricio Pochettino', 18),
(19, 'Javier Aguirre', 19),
(20, 'Darren Bazeley', 20)


INSERT INTO TournamentTeam (TournamentID, TeamID)
VALUES
(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),
(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20)


INSERT INTO Referee (RefereeID, RefereeName, CountryID)
VALUES
(1, 'Amin Omar', 1),
(2, 'Mustapha Ghorbal', 2),
(3,'Michael Oliver',5),
(4,'Anthony Taylor',5),
(5,'Clement Turpin',6),
(6,'Andres Rojas',15),
(7,'Felix Zwayer',7),
(8,'Danny Makkelie',11),
(9,'Kathryn Nesbitt',18),
(10,'Wilton Sampaio',13),
(11,'Raphael Claus',13),
(12,'Ismail Elfath',18),
(13,'Cesar Ramos',19),
(14, 'Francois Letexier', 6),
(15,'Ramon Abatti Abel',13),
(16,'Jalal Jayed',3),
(17,'Brooke Mayo',18),
(18,'Abdelatif Kherradji',2),
(19,'Tori Penso',18),
(20,'Facundo Tello',12)




INSERT INTO Player
(PlayerID, PlayerName, BirthDate, Position, TshirtNo, TeamID)
VALUES
(1,'Mohamed Salah','1992-06-15','RW',10,1),
(2,'Omar Marmoush','1999-02-07','LW',22,1),
(3,'Mostafa Zico','1997-04-27','LW',11,1),
(4,'Emam Ashour','1998-02-20','AM',8,1),
(5,'Mohamed El Shenawy','1988-12-18','GK',1,1),

(6,'Riyad Mahrez','1991-02-21','RW',7,2),
(7,'Amine Gouiri','2000-02-16','ST',9,2),
(8,'Rayan Ait Nouri','2001-06-06','LB',15,2),
(9,'Houssem Aouar','1998-06-30','CM',8,2),
(10,'Luca Zidane','1998-05-13','GK',23,2),

(11,'Achraf Hakimi','1998-11-04','RB',2,3),
(12,'Yassine Bounou','1991-04-05','GK',1,3),
(13,'Sofyan Amrabat','1996-08-21','CDM',4,3),
(14,'Azzedine Ounahi','2000-04-19','CM',8,3),
(15,'Ismael Saibari','2001-01-28','CAM',11,3),

(16,'Sadio Mane','1992-04-10','LW',10,4),
(17,'Kalidou Koulibaly','1991-06-20','CB',3,4),
(18,'Edouard Mendy','1992-03-01','GK',16,4),
(19,'Idrissa Gueye','1989-09-26','CM',5,4),
(20,'Nicolas Jackson','2001-06-20','ST',11,4),

(21,'Harry Kane','1993-07-28','ST',9,5),
(22,'Jude Bellingham','2003-06-29','CM',10,5),
(23,'Bukayo Saka','2001-09-05','RW',7,5),
(24,'Declan Rice','1999-01-14','CDM',4,5),
(25,'Jordan Pickford','1994-03-07','GK',1,5),

(26,'Kylian Mbappe','1998-12-20','ST',10,6),
(27,'Ousmane Dembele','1997-05-15','RW',7,6),
(28,'Aurelien Tchouameni','2000-01-27','CDM',8,6),
(29,'William Saliba','2001-03-24','CB',17,6),
(30,'Mike Maignan','1995-07-03','GK',16,6),

(31,'Jamal Musiala','2003-02-26','AM',10,7),
(32,'Florian Wirtz','2003-05-03','AM',17,7),
(33,'Joshua Kimmich','1995-02-08','RB',6,7),
(34,'Antonio Rudiger','1993-03-03','CB',2,7),
(35,'Kai Havertz','1999-06-11','ST',7,7),

(36,'Lamine Yamal','2007-07-13','RW',19,8),
(37,'Pedri','2002-11-25','CM',20,8),
(38,'Rodri','1996-06-22','CDM',16,8),
(39,'Nico Williams','2002-07-12','LW',17,8),
(40,'Unai Simon','1997-06-11','GK',23,8),

(41,'Cristiano Ronaldo','1985-02-05','ST',7,9),
(42,'Bruno Fernandes','1994-09-08','AM',8,9),
(43,'Bernardo Silva','1994-08-10','RW',10,9),
(44,'Ruben Dias','1997-05-14','CB',3,9),
(45,'Diogo Costa','1999-09-19','GK',1,9),

(46,'Kevin De Bruyne','1991-06-28','CM',7,10),
(47,'Jeremy Doku','2002-05-27','LW',11,10),
(48,'Romelu Lukaku','1993-05-13','ST',9,10),
(49,'Amadou Onana','2001-08-16','CDM',24,10),
(50,'Youri Tielemans','1997-05-07','CM',8,10),

(51,'Virgil van Dijk','1991-07-08','CB',4,11),
(52,'Frenkie de Jong','1997-05-12','CM',21,11),
(53,'Denzel Dumfries','1996-04-18','RB',22,11),
(54,'Cody Gakpo','1999-05-07','LW',11,11),
(55,'Bart Verbruggen','2002-08-18','GK',1,11),

(56,'Lionel Messi','1987-06-24','RW',10,12),
(57,'Julian Alvarez','2000-01-31','ST',9,12),
(58,'Alexis Mac Allister','1998-12-24','CM',20,12),
(59,'Enzo Fernandez','2001-01-17','CM',24,12),
(60,'Emiliano Martinez','1992-09-02','GK',23,12),

(61,'Vinicius Junior','2000-07-12','LW',7,13),
(62,'Raphinha','1996-12-14','RW',11,13),
(63,'Casemiro','1992-02-23','CDM',5,13),
(64,'Marquinhos','1994-05-14','CB',4,13),
(65,'Alisson Becker','1992-10-02','GK',1,13),

(66,'Federico Valverde','1998-07-22','CM',8,14),
(67,'Darwin Nunez','1999-06-24','ST',9,14),
(68,'Ronald Araujo','1999-03-07','CB',4,14),
(69,'Rodrigo Bentancur','1997-06-25','CM',6,14),
(70,'Manuel Ugarte','2001-04-11','CDM',5,14),

(71,'Luis Diaz','1997-01-13','LW',7,15),
(72,'James Rodriguez','1991-07-12','AM',10,15),
(73,'Daniel Munoz','1996-05-26','RB',2,15),
(74,'Richard Rios','2000-06-02','CM',6,15),
(75,'Camilo Vargas','1989-01-09','GK',12,15),

(76,'Takehiro Tomiyasu','1998-11-05','CB',22,16),
(77,'Daichi Kamada','1996-08-05','AM',15,16),
(78,'Keito Nakamura','2000-07-28','LW',13,16),
(79,'Kaishu Sano','2000-12-30','CDM',24,16),
(80,'Zion Suzuki','2002-08-21','GK',1,16),

(81,'Son Heung-min','1992-07-08','LW',7,17),
(82,'Kim Min-jae','1996-11-15','CB',4,17),
(83,'Lee Kang-in','2001-02-19','RW',19,17),
(84,'Hwang Hee-chan','1996-01-26','LW',11,17),
(85,'Lee Han-beom','2002-06-17','CB',2,17),

(86,'Christian Pulisic','1998-09-18','LW',10,18),
(87,'Weston McKennie','1998-08-28','CM',8,18),
(88,'Tyler Adams','1999-02-14','CDM',4,18),
(89,'Chris Richards','2000-03-28','CB',3,18),
(90,'Matt Freese','1998-09-02','GK',24,18),

(91,'Jorge Sanchez','1997-12-10','RB',2,19),
(92,'Johan Vasquez','1998-10-22','CB',5,19),
(93,'Raul Jimenez','1991-05-05','ST',9,19),
(94,'Cesar Montes','1997-02-24','CB',3,19),
(95,'Roberto Alvarado','1998-09-07','RW',25,19),

(96,'Chris Wood','1991-12-07','ST',9,20),
(97,'Liberato Cacace','2000-09-27','LB',13,20),
(98,'Marko Stamenic','2002-02-19','CM',8,20),
(99,'Joe Bell','1999-04-27','CM',6,20),
(100,'Max Crocombe','1993-08-12','GK',1,20)




INSERT INTO Match
(MatchID, MatchStage, HomeGoals, AwayGoals, MatchDate,
HomeTeamID, AwayTeamID, StadiumID, TournamentID)
VALUES
(1,'Group Stage',1,1,'2026-06-12',1,10,1,1),      -- Egypt vs Belgium (GROUP)
(2,'Group Stage',3,1,'2026-06-17',1,20,2,1),      -- Egypt vs New Zealand (GROUP)
(3,'Round of 16',2,0,'2026-06-29',1,12,3,1),      -- Egypt vs Argentina (16)
(4,'Quarter Final',4,3,'2026-07-04',1,9,4,1),     -- Egypt vs Portugal (8)
(5,'Semi Final',1,0,'2026-07-08',1,6,5,1),        -- Egypt vs France (SEMI)
(6,'Final',2,1,'2026-07-19',1,5,1,1);             -- Egypt vs England (FINAL)




INSERT INTO MatchReferee
(MatchID, RefereeID, Role)
VALUES
(1,5,'Main_Referee'),
(1,3,'Assistant_1'),
(1,9,'Assistant_2'),
(1,17,'Fourth_Official'),

(2,7,'Main_Referee'),
(2,8,'Assistant_1'),
(2,19,'Assistant_2'),
(2,12,'Fourth_Official'),

(3,13,'Main_Referee'),
(3,18,'Assistant_1'),
(3,9,'Assistant_2'),
(3,3,'Fourth_Official'),

(4,14,'Main_Referee'),
(4,10,'Assistant_1'),
(4,17,'Assistant_2'),
(4,5,'Fourth_Official'),

(5,2,'Main_Referee'),
(5,16,'Assistant_1'),
(5,9,'Assistant_2'),
(5,8,'Fourth_Official'),

(6,1,'Main_Referee'),
(6,3,'Assistant_1'),
(6,19,'Assistant_2'),
(6,13,'Fourth_Official')




INSERT INTO PlayerMatchStatistics
(PlayerID,MatchID,MinutesPlayed,Goals,Assists,Y_Cards,R_Cards)
VALUES
(1,1,90,0,1,0,0),      
(4,1,90,1,0,1,0),      
(2,1,90,0,0,0,0),      
(5,1,90,0,0,0,0),      

(46,1,90,0,1,0,0),     
(48,1,90,1,0,0,0),     
(50,1,90,0,0,1,0),      
(49,1,90,0,0,0,0),     

(1,2,90,1,0,0,0),      
(2,2,90,1,0,0,0),     
(3,2,90,1,0,0,0),      
(4,2,90,0,2,1,0),    
(5,2,90,0,0,0,0),

(96,2,90,1,0,0,0),  
(98,2,90,0,1,1,0),
(100,2,90,0,0,0,0),


(1,3,90,1,0,0,0),
(3,3,90,1,0,0,0),
(4,3,90,0,2,0,0),
(5,3,90,0,0,0,0),

(56,3,90,0,0,1,0),
(57,3,90,0,0,0,0),
(58,3,90,0,0,1,0),
(60,3,90,0,0,0,0),


(1,4,90,3,0,0,0),      
(4,4,90,1,1,1,0),
(2,4,90,0,1,0,0),
(5,4,90,0,0,0,0),

(41,4,90,3,0,0,0),     
(42,4,90,0,2,0,0),
(43,4,90,0,1,1,0),
(45,4,90,0,0,0,0),

(1,5,90,1,0,0,0),
(4,5,90,0,1,0,0),
(5,5,90,0,0,0,0),

(26,5,90,0,0,1,0),
(28,5,90,0,0,1,0),
(30,5,90,0,0,0,0),


(1,6,90,1,0,0,0),
(4,6,90,1,1,1,0),
(5,6,90,0,0,0,0),

(21,6,90,1,0,0,0),
(22,6,90,0,1,1,0),
(25,6,90,0,0,0,0)