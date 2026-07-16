USE FootballManagementDB
GO

CREATE FUNCTION GetTotalGoals(@PlayerID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Goals INT
    SELECT @Goals = SUM(Goals) FROM PlayerMatchStatistics
    WHERE PlayerID = @PlayerID
    RETURN ISNULL(@Goals,0)
END
GO

-- To call it
SELECT PlayerName, dbo.GetTotalGoals(PlayerID) AS TotalGoals
FROM Player
GO
----------------------------------------------------------------------------------
CREATE FUNCTION GetTopScorersByTeam(@TeamID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT P.PlayerName, SUM(PMS.Goals) AS TotalGoals FROM Player P
    JOIN PlayerMatchStatistics PMS
        ON P.PlayerID = PMS.PlayerID
    WHERE P.TeamID = @TeamID
    GROUP BY P.PlayerName
)
GO


-- To call it
SELECT * FROM dbo.GetTopScorersByTeam(1)
ORDER BY TotalGoals DESC
GO
------------------------------------------------------------------------
CREATE FUNCTION GetSquad(@TeamID INT)
RETURNS @Squad TABLE
    (
    PlayerName VARCHAR(100),
    Position VARCHAR(20),
    Age INT
    )
AS
BEGIN
    INSERT INTO @Squad
    SELECT PlayerName, Position, DATEDIFF(YEAR, BirthDate, GETDATE())
    FROM Player
    WHERE TeamID = @TeamID
    RETURN
END
GO


-- To call it
SELECT * FROM dbo.GetSquad(1)
GO
-----------------------------------
CREATE FUNCTION GetPlayerStats(@PlayerID INT)
RETURNS @Stats TABLE
    (
    PlayerName VARCHAR(20),
    Goals INT,
    Assists INT,
    YellowCards INT,
    RedCards INT
    )
AS
BEGIN
    INSERT INTO @Stats
    SELECT P.PlayerName, SUM(Goals), SUM(Assists), SUM(Y_Cards), SUM(R_Cards)
    FROM PlayerMatchStatistics PMS 
        inner join player P
            on P.PlayerID = PMS.PlayerID
    WHERE PMS.PlayerID = @PlayerID
    GROUP BY P.PlayerName
    RETURN
END
GO


-- To call it
SELECT *
FROM dbo.GetPlayerStats(3)
GO
