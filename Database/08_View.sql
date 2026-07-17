CREATE VIEW V_TeamRanking
AS
SELECT TeamName, CountryID, FIFARanking
FROM Team
GO

SELECT * FROM V_TeamRanking
GO
-------------------------------------------------
CREATE VIEW V_TeamPlayers
AS
SELECT T.TeamName, P.PlayerName, P.Position
FROM Team T
JOIN Player P
ON T.TeamID = P.TeamID 
GO

SELECT * FROM V_TeamPlayers
GO
  
-------------------------------------------------
CREATE VIEW V_MatchDetails
AS
SELECT M.MatchDate, HT.TeamName HomeTeam, 
       AT.TeamName AwayTeam, M.HomeGoals, M.AwayGoals
FROM Match M 
INNER JOIN Team HT
    ON HT.TeamID=M.HomeTeamID
INNER JOIN Team AT
    ON AT.TeamID=M.AwayTeamID
GO

SELECT * FROM V_MatchDetails
GO
-------------------------------------------------
CREATE VIEW V_TeamCoaches
AS
SELECT T.TeamName, C.CoachName
FROM Team T
INNER JOIN Coach C
    ON T.TeamID = C.TeamID
GO

SELECT * FROM V_TeamCoaches
GO
-------------------------------------------------
CREATE VIEW V_PlayerStats
AS
SELECT P.PlayerName, SUM(PMS.Goals) Goals, SUM(PMS.Assists) Assists
FROM Player P
JOIN PlayerMatchStatistics PMS
ON P.PlayerID=PMS.PlayerID
GROUP BY P.PlayerName
GO

SELECT * FROM V_PlayerStats
GO 
-------------------------------------------------
CREATE VIEW V_Player
AS
SELECT PlayerID, PlayerName, Position, BirthDate, TshirtNo, TeamID
FROM Player
WITH CHECK OPTION
GO

INSERT INTO V_Player
VALUES
(101,'Ahmed Fatouh','LB','1998-03-22',13,1)

