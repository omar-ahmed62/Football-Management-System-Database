USE FootballManagementDB;
GO

CREATE TABLE Country
(
    CountryID INT PRIMARY KEY,
    CountryName VARCHAR(50) NOT NULL unique,
    Continent VARCHAR(50) NOT NULL
)


CREATE TABLE Tournament 
(
    TournamentID INT PRIMARY KEY,
    TournamentName VARCHAR(100) NOT NULL, 
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Season VARCHAR(100) NOT NULL,
    CHECK (EndDate >= StartDate),
    UNIQUE (TournamentName, Season)
)


CREATE TABLE Stadium
(
    StadiumID INT PRIMARY KEY,
    StadiumName VARCHAR(100) NOT NULL unique,
    City VARCHAR(100) NOT NULL,
    Capacity INT NOT NULL,
    CHECK (Capacity >= 0)
)

CREATE TABLE Referee
(
    RefereeID INT PRIMARY KEY,
    RefereeName VARCHAR(50) NOT NULL,
    CountryID INT NOT NULL,
    FOREIGN KEY (CountryID)
    REFERENCES Country(CountryID)
    ON UPDATE CASCADE

)

CREATE TABLE Team
(
    TeamID INT PRIMARY KEY,
    TeamName VARCHAR(100) NOT NULL unique, 
    CountryID INT NOT NULL,
    FIFARanking INT NOT NULL,
    FOREIGN KEY (CountryID)
    REFERENCES Country(CountryID)
    ON UPDATE CASCADE,
    CHECK (FIFARanking > 0)
)

CREATE TABLE Coach
(
    CoachID INT PRIMARY KEY,
    CoachName VARCHAR(100) NOT NULL,
    TeamID INT NOT NULL unique,
    FOREIGN KEY(TeamID)
    REFERENCES Team(TeamID)
)

CREATE TABLE Player
(
    PlayerID INT PRIMARY KEY,
    PlayerName VARCHAR(100) NOT NULL,
    BirthDate DATE NOT NULL,
    Position VARCHAR(50) NOT NULL,
    TshirtNo TINYINT NOT NULL,
    TeamID INT NOT NULL,
    FOREIGN KEY(TeamID)
    REFERENCES Team(TeamID),
    UNIQUE (TeamID, TshirtNo)
)


CREATE TABLE Match
(
    MatchID INT PRIMARY KEY,
    MatchStage VARCHAR(20) NOT NULL,
    HomeGoals TINYINT NOT NULL,
    AwayGoals TINYINT NOT NULL,
    MatchDate DATE NOT NULL,
    HomeTeamID INT NOT NULL,
    AwayTeamID INT NOT NULL,
    StadiumID INT NOT NULL,
    TournamentID INT NOT NULL,

    UNIQUE ( TournamentID,HomeTeamID,AwayTeamID,MatchDate),

    FOREIGN KEY (HomeTeamID)
    REFERENCES Team(TeamID),

    FOREIGN KEY (AwayTeamID)
    REFERENCES Team(TeamID),

    FOREIGN KEY(StadiumID)
    REFERENCES Stadium(StadiumID),
    
    FOREIGN KEY(TournamentID)
    REFERENCES Tournament(TournamentID),

    CHECK (MatchStage IN ( 'Group Stage','Round of 16',
    'Quarter Final','Semi Final','Third Place','Final')),

    CHECK (HomeGoals >= 0),
    CHECK (AwayGoals >= 0),
    CHECK (HomeTeamID <> AwayTeamID) -- NOT EQUAL 
)


CREATE TABLE TournamentTeam
(
    TournamentID INT,
    TeamID INT,
    PRIMARY KEY (TournamentID, TeamID),

    FOREIGN KEY (TournamentID)
    REFERENCES Tournament(TournamentID),

    FOREIGN KEY (TeamID)
    REFERENCES Team(TeamID)
)


CREATE TABLE MatchReferee
(
    MatchID INT ,
    RefereeID INT ,
    Role VARCHAR(30) NOT NULL,

    PRIMARY KEY (MatchID, RefereeID),

    FOREIGN KEY (MatchID)
    REFERENCES Match(MatchID),

    FOREIGN KEY (RefereeID)
    REFERENCES Referee(RefereeID),
    CHECK (Role IN ('Main_Referee', 'Assistant_1', 'Assistant_2', 'Fourth_Official')),
    UNIQUE (MatchID,Role)
)

CREATE TABLE PlayerMatchStatistics
(
    PlayerID INT,
    MatchID INT,
    MinutesPlayed TINYINT DEFAULT 0,
    Goals TINYINT DEFAULT 0,
    Assists TINYINT DEFAULT 0,
    Y_Cards TINYINT DEFAULT 0,
    R_Cards TINYINT DEFAULT 0,

    PRIMARY KEY (PlayerID, MatchID),

    FOREIGN KEY (PlayerID)
    REFERENCES Player(PlayerID),

    FOREIGN KEY (MatchID)
    REFERENCES Match(MatchID),

    CHECK (MinutesPlayed BETWEEN 0 AND 120),
    CHECK (Goals >= 0),
    CHECK (Assists >= 0),
    CHECK (Y_Cards BETWEEN 0 AND 2),
    CHECK (R_Cards BETWEEN 0 AND 1)
)



CREATE TABLE TransferHistory
(
    ChangeDate DATETIME,
    PlayerID INT,
    OldTeamID INT,
    NewTeamID INT
)
