CREATE PROC GetTeamPlayers @TeamId INT
AS
    SELECT * FROM Player
    WHERE TeamId =@TeamId
GO
--calling 
GetTeamPlayers 1
GO
---------------------------------------------
CREATE PROC Get_PlayerStats @PlayerID INT, @Goals INT OUTPUT, @Assists INT OUTPUT
AS
    SELECT @Goals = SUM(Goals), @Assists = SUM(Assists)
    FROM PlayerMatchStatistics
    WHERE PlayerID = @PlayerID

--calling 
DECLARE @G INT, @A INT 
EXECUTE Get_PlayerStats 1 ,@G OUTPUT, @A OUTPUT
SELECT @G AS'Total Goals', @A AS'Total Assists'
GO
-----------------------------------------------------------------------------
CREATE PROC AddPlayer 
@PlayerID INT, @PlayerName VARCHAR(100),
@BirthDate DATE, @Position VARCHAR(20), @TshirtNo TINYINT, @TeamID INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Player
        VALUES
        (@PlayerID, @PlayerName, @BirthDate, @Position, @TshirtNo, @TeamID)
        SELECT 'Player Added Successfully'
    END TRY

    BEGIN CATCH
        SELECT 'ERROR' AS ErrorMessage
    END CATCH
END
GO

-- Calling
EXECUTE AddPlayer 101, 'Ahmed Fatouh', '1998-03-22', 'LB', 13, 1
GO
---------------------------------------------------------------
CREATE PROC GetMatchDetails @MatchID INT
AS
BEGIN
    SELECT M.MatchDate, HT.TeamName AS HomeTeam, AT.TeamName AS AwayTeam,
        M.HomeGoals, M.AwayGoals, S.StadiumName
    FROM Match M
    JOIN Team HT
        ON M.HomeTeamID = HT.TeamID
    JOIN Team AT
        ON M.AwayTeamID = AT.TeamID
    JOIN Stadium S
        ON M.StadiumID = S.StadiumID
    WHERE M.MatchID = @MatchID
END
GO
-- Calling
EXECUTE GetMatchDetails 2
GO
