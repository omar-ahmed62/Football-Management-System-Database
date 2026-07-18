CREATE TRIGGER UpdateMatch
ON Match
AFTER UPDATE
AS
BEGIN
    SELECT d.HomeGoals AS OldGoals, i.HomeGoals AS NewGoals FROM inserted i
    JOIN deleted d
        ON i.MatchID = d.MatchID
END
GO
------------------------------------------------------------
create TRIGGER Transfer_History
ON Player
AFTER UPDATE
AS
BEGIN
    IF UPDATE(TeamID)
        INSERT INTO TransferHistory  --INSERT BASED ON SELECT 
        (ChangeDate, PlayerID, OldTeamID, NewTeamID)
        SELECT GETDATE(), d.PlayerID, d.TeamID, i.TeamID
        FROM deleted d
        INNER JOIN inserted i
            ON d.PlayerID = i.PlayerID
        WHERE d.TeamID <> i.TeamID
END
GO


-- Haitham Hassan changed his nationality from france (TeamId = 6) to egypt (TeamId = 1)
-- Test
/*
INSERT INTO Player
(PlayerID, PlayerName, BirthDate, Position, TshirtNo, TeamID)
VALUES
(101,'Haitham Hassan', '2002-02-08', 'RW',12,6)

UPDATE Player SET TeamID = 1
WHERE PlayerID = 101

SELECT * FROM TransferHistory
*/
---------------------------------------------------------------------
CREATE TRIGGER PreventDeleteTeam
ON Team
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS
    (SELECT * FROM Player P
        JOIN deleted D
            ON P.TeamID = D.TeamID
    )
    BEGIN
        PRINT 'Cannot delete a team that has players'
        RETURN
    END

    DELETE FROM Team
    WHERE TeamID IN (SELECT TeamID FROM deleted)
END
GO