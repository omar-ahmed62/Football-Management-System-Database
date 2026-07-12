USE FootballManagementDB;
GO

CREATE TABLE Country
(
    CountryID INT PRIMARY KEY,
    CountryName VARCHAR(50) NOT NULL,
    Continent VARCHAR(50) NOT NULL
)


CREATE TABLE Tournament 
(
    TournamentID INT PRIMARY KEY,
    TournamentName VARCHAR(100) NOT NULL, 
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Season VARCHAR(100) NOT NULL,
    CHECK (EndDate >= StartDate)
)


CREATE TABLE Stadium
(
    StadiumID INT PRIMARY KEY,
    StadiumName VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    Capacity INT NOT NULL,
    CHECK (Capacity >= 0)
)

CREATE TABLE Referee
(
    RefereeID INT PRIMARY KEY,
    RefereeName VARCHAR(50) NOT NULL,
    RefereeNationality VARCHAR(50) NOT NULL
)

CREATE TABLE Team
(
    TeamID INT PRIMARY KEY,
    TeamName VARCHAR(100) NOT NULL, 
    CountryID INT NOT NULL,
    FOREIGN KEY (CountryID)
    REFERENCES Country(CountryID) 
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
    Age INT NOT NULL,
    Position VARCHAR(50) NOT NULL,
    TshirtNo TINYINT NOT NULL,
    TeamID INT NOT NULL,
    FOREIGN KEY(TeamID)
    REFERENCES Team(TeamID),
    CHECK (AGE BETWEEN 15 AND 50),
    UNIQUE (TeamID, TshirtNo)

)


CREATE TABLE Match
(
    MatchID INT PRIMARY KEY,
    HomeGoals TINYINT NOT NULL,
    AwayGoals TINYINT NOT NULL,
    MatchDate DATE NOT NULL,
    HomeTeamID INT NOT NULL,
    AwayTeamID INT NOT NULL,
    StadiumID INT NOT NULL,
    TournamentID INT NOT NULL,

    FOREIGN KEY (HomeTeamID)
    REFERENCES Team(TeamID),

    FOREIGN KEY (AwayTeamID)
    REFERENCES Team(TeamID),

    FOREIGN KEY(StadiumID)
    REFERENCES Stadium(StadiumID),
    
    FOREIGN KEY(TournamentID)
    REFERENCES Tournament(TournamentID),

    CHECK (HomeGoals >= 0),
    CHECK (AwayGoals >= 0),
    CHECK (HomeTeamID <> AwayTeamID) -- NOT EQUAL 
);

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
    CHECK (Role IN ('Main_Referee', 'Assistant_1', 'Assistant_2', 'Fourth line_man'))
)

CREATE TABLE PlayerMatchStatistics
(
    PlayerID INT,
    MatchID INT,
    Goals TINYINT NOT NULL,
    Assists TINYINT NOT NULL,
    Y_Cards TINYINT NOT NULL,
    R_Cards TINYINT NOT NULL,

    PRIMARY KEY (PlayerID, MatchID),

    FOREIGN KEY (PlayerID)
    REFERENCES Player(PlayerID),

    FOREIGN KEY (MatchID)
    REFERENCES Match(MatchID),

    CHECK (Goals >= 0),
    CHECK (Assists >= 0),
    CHECK (Y_Cards BETWEEN 0 AND 2),
    CHECK (R_Cards BETWEEN 0 AND 1)
)

KK