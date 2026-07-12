FIFA decided to store data and information about its tournaments in a database according to the following description:
- Tournament has TournamentID, TournamentName, StartDate, EndDate, Season
- A tournament has many teams each team has TeamID, TeamName, CountryID
- Each team belongs to one country has CountryID, CountryName, Continent
- Each team has many players each player has PlayerID, PlayerName, age, position, TshirtNU, TeamID
- Each team has coach each coach has CoachID, CoachName, TeamID
- Each team may participate in many Tournaments so TournamentTeam has TournamentID, TeamID
- Each team plays matches each match has MatchID, HomeGoals, AwayGoals, MatchDate, HomeTeam_ID, AwayTeam_ID, StadiumID, TournamentID
- Each match has 4 referees each one has RefereeID, RefereeName , RefereeNationality
- Each match is played in one stadium each stadium has StadiumID, StadiumName, City, Capacity
- MatchReferee has Match_ID, Referee_ID, Role
- Each player has PlayerMatchStatistics each one has PlayerID, MatchID, Goals, Assists, Y_Cards, R_Cards


lihds
