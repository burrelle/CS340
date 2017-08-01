-- Starting to add tables for the final project.

DROP TABLE IF EXISTS `player`;
DROP TABLE IF EXISTS `teams`;
DROP TABLE IF EXISTS `positionGroup`;
DROP TABLE IF EXISTS `position`;
DROP TABLE IF EXISTS `offsensiveStats`;
DROP TABLE IF EXISTS `defensiveStats`;
DROP TABLE IF EXISTS `specialTeamsStats`;


-- Creating a table player that has a number that is the primary key.
CREATE TABLE player(
  pNumber int(11) PRIMARY KEY,
  firstName varchar(255) NOT NULL,
  lastName varchar(255) NOT NULL,
  age int(11) NOT NULL,
  team int(11) references teams(teamID),
  positionGroup int(11) references positionGroup(positionGroupID)
);

-- Creating a table teams that is able to be referenced by the players table.
CREATE TABLE teams (
  teamID int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  city varchar(255) NOT NULL,
  mascot varchar(255) NOT NULL,
  stadium varchar(255) NOT NULL
);

-- Creating a table for the different position groups (Offense, Defense, and Special Teams)
CREATE TABLE positionGroup (
  positionGroupID int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  postionGroup varchar(255) NOT NULL
);

-- Creating a table for the different positions
CREATE TABLE position (
  positionID int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  positionGroup int(11) references positionGroup(positionGroupID),
  position varchar(255) NOT NULL
);

-- Create a table for the different offensive stats.
CREATE TABLE offsensiveStats (
  offsensiveStatsID int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  playerNumber int(11) references player(pNumber),
  passingAttempts int(11),
  passesCompleted int(11),
  passingYards int(11),
  rushingYards int(11),
  rushingAttempts int(11),
  receptions int(11),
  targets int(11),
  receivingYards(11)
);

-- Create a table for the different defensive stats.
CREATE TABLE defensiveStats (
  defensiveStatsID int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  playerNumber int(11) references player(pNumber),
  sacks int(11),
  tackles int(11),
  forcedFumbles int(11),
  interceptions int(11)
);

-- Create a table for the different special teams stats
CREATE TABLE specialTeamsStats (
  specialTeamsStatsID int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  playerNumber int(11) references player(pNumber),
  fieldGoalAttempts int(11),
  fieldGoalMade int(11),
  punts int(11),
  avergePuntYards int(11)
);
