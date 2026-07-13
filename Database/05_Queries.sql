-- SELECT
SELECT * 
FROM player

SELECT * FROM player
WHERE TeamID= 1

SELECT *
FROM Team
ORDER BY FIFARanking

SELECT TOP(10) *
FROM Team
ORDER BY FIFARanking

SELECT CONCAT(PlayerName, ' ', TshirtNo) AS Player_Info
FROM Player

SELECT *
FROM Player
WHERE BirthDate > '2000-01-01'


SELECT * FROM player 
WHERE PlayerName like '%sala%'

SELECT *
FROM Coach
ORDER BY CoachName

SELECT *
FROM Match
WHERE MatchStage='Final'


SELECT P.PlayerName, T.TeamName
FROM Player P INNER JOIN Team T
ON P.TeamID = T.TeamID
WHERE T.TeamID = 1;


-- Aggregate FUNCTIONS
SELECT COUNT(*) AS 'Total Number OF Players'
FROM Player


SELECT COUNT(*) AS 'Total Number OF Teams'
FROM Team


SELECT MAX(HomeGoals + AwayGoals) AS 'Most Goals In One Match'
FROM Match


SELECT Position,COUNT(*) as' Number of players in this possition'
FROM Player
GROUP BY Position;


SELECT TOP 1 TeamName AS 'least rank'
FROM Team
ORDER BY FIFARanking desc


SELECT Position, COUNT(*) AS TotalPlayers
FROM Player
GROUP BY Position
HAVING COUNT(*) > 5;

SELECT TOP 2 with ties P.PlayerName AS 'World Cup Top Scorer', SUM(PMS.Goals) AS 'TotalGoals'
FROM Player P JOIN PlayerMatchStatistics PMS
ON P.PlayerID = PMS.PlayerID
GROUP BY P.PlayerName
ORDER BY TotalGoals DESC



SELECT TOP 1 P.PlayerName AS 'Most Assist', SUM(PMS.Assists) AS TotalAssists
FROM Player P
JOIN PlayerMatchStatistics PMS
ON P.PlayerID = PMS.PlayerID
GROUP BY P.PlayerName
ORDER BY TotalAssists DESC


SELECT
    R.RefereeName, COUNT(*) AS 'Matches Officiated'
FROM Referee R JOIN MatchReferee MR
ON R.RefereeID = MR.RefereeID
WHERE MR.Role = 'Main_Referee'
GROUP BY R.RefereeName
ORDER BY 'Matches Officiated' DESC


SELECT M.MatchDate, HT.TeamName AS HomeTeam, AT.TeamName AS AwayTeam, S.StadiumName
FROM Match M 
INNER JOIN Team HT
	ON M.HomeTeamID = HT.TeamID
INNER JOIN Team AT
    ON M.AwayTeamID = AT.TeamID
INNER JOIN Stadium S
    ON M.StadiumID = S.StadiumID


-- subqueries
SELECT PlayerName
FROM Player
WHERE TeamID =
(
    SELECT TeamID
    FROM Team
    WHERE FIFARanking = 1
)



SELECT * FROM
(
    SELECT P.PlayerName, SUM(PMS.Goals) AS TotalGoals, ROW_NUMBER() OVER(ORDER BY SUM(PMS.Goals) DESC) AS RN
    FROM Player P
    JOIN PlayerMatchStatistics PMS
        ON P.PlayerID = PMS.PlayerID
    GROUP BY P.PlayerName
) AS new_table
WHERE RN = 1



SELECT
    PlayerID,
    MatchID,
    Goals,
    ROW_NUMBER() OVER(
        PARTITION BY MatchID
        ORDER BY Goals DESC
    ) AS RN
FROM PlayerMatchStatistics



SELECT TeamName,PlayerName,TotalGoals
FROM
(
    SELECT T.TeamName, P.PlayerName, SUM(PMS.Goals) AS TotalGoals, ROW_NUMBER() OVER
        (PARTITION BY T.TeamID
         ORDER BY SUM(PMS.Goals) DESC) AS RN
    FROM Player P
    JOIN Team T
        ON P.TeamID = T.TeamID
    JOIN PlayerMatchStatistics PMS
        ON P.PlayerID = PMS.PlayerID
    GROUP BY
        T.TeamID,
        T.TeamName,
        P.PlayerName
) AS new_table
WHERE RN = 1


SELECT TeamName
FROM Team T
WHERE EXISTS
(
    SELECT *
    FROM Player P
    WHERE P.TeamID=T.TeamID
)