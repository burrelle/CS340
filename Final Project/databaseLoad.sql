-- Starting to add tables for the final project.

DROP TABLE IF EXISTS `player`;
DROP TABLE IF EXISTS `teams`;
DROP TABLE IF EXISTS `positionGroup`;
DROP TABLE IF EXISTS `positions`;
DROP TABLE IF EXISTS `offensiveStats`;
DROP TABLE IF EXISTS `defensiveStats`;
DROP TABLE IF EXISTS `specialTeamsStats`;


-- Creating a table player that has a number that is the primary key.
CREATE TABLE player(
  playerID int(11) PRIMARY KEY AUTO_INCREMENT,
  pNumber int(11) NOT NULL,
  firstName varchar(255) NOT NULL,
  lastName varchar(255) NOT NULL,
  age int(11) NOT NULL,
  team int(11) references teams(teamID),
  positionGroup int(11) references positionGroup(positionGroupID),
  position int(11) references positions(positionID)
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
  positionGroup varchar(255) NOT NULL
);

-- Creating a table for the different positions
CREATE TABLE positions (
  positionID int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  positionGroup int(11) references positionGroup(positionGroupID),
  position varchar(255) NOT NULL
);

-- Create a table for the different offensive stats.
CREATE TABLE offensiveStats (
  offensiveStatsID int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  playerNumber int(11) references player(playerID),
  passingAttempts int(11),
  passesCompleted int(11),
  passingYards int(11),
  rushingYards int(11),
  rushingAttempts int(11),
  receptions int(11),
  targets int(11),
  receivingYards int(11)
);

-- Create a table for the different defensive stats.
CREATE TABLE defensiveStats (
  defensiveStatsID int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  playerNumber int(11) references player(playerID),
  sacks int(11),
  tackles int(11),
  forcedFumbles int(11),
  interceptions int(11)
);

-- Create a table for the different special teams stats
CREATE TABLE specialTeamsStats (
  specialTeamsStatsID int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  playerNumber int(11) references player(playerID),
  fieldGoalAttempts int(11),
  fieldGoalMade int(11),
  punts int(11),
  averagePuntYards int(11)
);

-- File that adds the teams using the correct SQL Syntax
-- INSERT INTO `teams`(`city`, `mascot`, `stadium`) VALUES ([value-1],[value-2],[value-3])
INSERT INTO `teams`(`city`, `mascot`, `stadium`) VALUES
('Arizona','Cardinals','University of Phoenix Stadium'),
('Chicago','Bears','Soldier Field'),
('Green Bay', 'Packers', 'Lambeau Field'),
('New York', 'Giants', 'MetLife Stadium'),
('Detroit', 'Lions', 'Ford Field'),
('Washington', 'Redskins', 'FedEx Field'),
('Philadephia', 'Eagles', 'Lincoln Financial Field'),
('Pittsburgh', 'Steelers', 'Heinz Field'),
('Los Angeles', 'Rams', 'Los Angeles Memorial Coliseum'),
('San Fransisco', '49ers', 'Levi\'s Stadium'),
('Cleveland', 'Browns', 'FirstEnergy Stadium'),
('Indianapolis', 'Colts', 'Lucas Oil Stadium'),
('Dallas', 'Cowboys', 'AT&T Stadium'),
('Kansas City', 'Cheifs', 'Arrowhead Stadium'),
('Los Angeles', 'Chargers', 'StubHub Center'),
('Denver', 'Broncos', 'Sports Authority Field at Mile High'),
('New York', 'Jets', 'MetLife Stadium'),
('New England', 'Patriots', 'Gillette Stadium'),
('Oakland', 'Raiders', 'Oakland–Alameda County Coliseum'),
('Tennessee', 'Titans', 'Nissan Stadium'),
('Buffalo', 'Bills', 'New Era Field'),
('Minnesota', 'Vikings', 'US Bank Stadium'),
('Atlanta', 'Falcons', 'Mercedes-Benz Stadium'),
('Miami', 'Dolphins', 'Hard Rock Stadium'),
('New Orleans', 'Saints', 'Mercedes-Benz Superdome'),
('Cincinnati', 'Bengals', 'Paul Brown Stadium'),
('Seattle', 'Seahawks', 'Century Link Field'),
('Tampa Bay', 'Buccaneers', 'Raymond James Stadium'),
('Carolina', 'Panthers', 'Bank of America Stadium'),
('Jacksonville', 'Jaguars', 'EverBank Field'),
('Baltimore', 'Ravens', 'M&T Bank Stadium'),
('Houston', 'Texans', 'NRG Stadium');

-- Create the postion group tables
-- INSERT INTO `positionGroup`(`positionGroup`) VALUES ([value-1])
INSERT INTO `positionGroup`(`positionGroup`) VALUES
('Offense'),('Defense'),('Special Teams');

-- Adding the positions with the foriegn key from positionGroup
-- INSERT INTO `position` (`positionGroup`, `position`) VALUES (SELECT positionGroupID from positionGroup WHERE positionGroup = '(O/D/ST)')

INSERT INTO `positions` (`positionGroup`, `position`) VALUES
((SELECT positionGroupID from positionGroup WHERE positionGroup = 'Offense'), 'QB'),
((SELECT positionGroupID from positionGroup WHERE positionGroup = 'Offense'), 'RB'),
((SELECT positionGroupID from positionGroup WHERE positionGroup = 'Offense'), 'WR'),
((SELECT positionGroupID from positionGroup WHERE positionGroup = 'Defense'), 'DB'),
((SELECT positionGroupID from positionGroup WHERE positionGroup = 'Defense'), 'DE'),
((SELECT positionGroupID from positionGroup WHERE positionGroup = 'Defense'), 'LB'),
((SELECT positionGroupID from positionGroup WHERE positionGroup = 'Special Teams'), 'K'),
((SELECT positionGroupID from positionGroup WHERE positionGroup = 'Special Teams'), 'P');

-- Insert Players into the player table.
-- INSERT INTO `player`(`pNumber`, `firstName`, `lastName`, `age`, `team`, `positionGroup`, `position`)

INSERT INTO `player`(`pNumber`, `firstName`, `lastName`, `age`, `team`, `positionGroup`, `position`) VALUES
('5', 'Tyrod', 'Taylor', '27', (SELECT teamID FROM teams WHERE mascot = 'Bills'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'QB')),
('12', 'Aaron', 'Rodgers', '33', (SELECT teamID FROM teams WHERE mascot = 'Packers'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'QB')),
('3', 'Jameis', 'Winston', '21', (SELECT teamID FROM teams WHERE mascot = 'Buccaneers'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'QB')),
('8', 'Marcus', 'Mariota', '21', (SELECT teamID FROM teams WHERE mascot = 'Titans'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'QB')),
('5', 'Blake', 'Bortles', '23', (SELECT teamID FROM teams WHERE mascot = 'Jaguars'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'QB')),
('4', 'Derek', 'Carr', '24', (SELECT teamID FROM teams WHERE mascot = 'Raiders'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'QB')),
('12', 'Andrew', 'Luck', '25', (SELECT teamID FROM teams WHERE mascot = 'Colts'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'QB')),
('31', 'David', 'Johnson', '25', (SELECT teamID FROM teams WHERE mascot = 'Cardinals'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'RB')),
('26', 'Le\'Veon', 'Bell', '25', (SELECT teamID FROM teams WHERE mascot = 'Steelers'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'RB')),
('21', 'Ezekiel', 'Elliott', '22', (SELECT teamID FROM teams WHERE mascot = 'Cowboys'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'RB')),
('25', 'LeSean', 'McCoy', '29', (SELECT teamID FROM teams WHERE mascot = 'Bills'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'RB')),
('24', 'Jordan', 'Howard', '22', (SELECT teamID FROM teams WHERE mascot = 'Bears'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'RB')),
('24', 'Devonta', 'Freeman', '25', (SELECT teamID FROM teams WHERE mascot = 'Falcons'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'RB')),
('28', 'Melvin', 'Gordon', '24', (SELECT teamID FROM teams WHERE mascot = 'Chargers'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'RB')),
('84', 'Antonio', 'Brown', '29', (SELECT teamID FROM teams WHERE mascot = 'Steelers'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'WR')),
('13', 'Odell', 'Beckham Jr', '24', (SELECT teamID FROM teams WHERE mascot = 'Giants'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'WR')),
('11', 'Julio', 'Jones', '28', (SELECT teamID FROM teams WHERE mascot = 'Falcons'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'WR')),
('87', 'Jordy', 'Nelson', '32', (SELECT teamID FROM teams WHERE mascot = 'Packers'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'WR')),
('13', 'Mike', 'Evans', '23', (SELECT teamID FROM teams WHERE mascot = 'Buccaneers'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'WR')),
('13', 'Michael', 'Thomas', '23', (SELECT teamID FROM teams WHERE mascot = 'Saints'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'WR')),
('18', 'AJ', 'Green', '29', (SELECT teamID FROM teams WHERE mascot = 'Bengals'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'WR')),

-- Defense
('21', 'Landon', 'Collins', '24', (SELECT teamID FROM teams WHERE mascot = 'Giants'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Defense'), (SELECT positionID FROM positions WHERE position = 'DB')),
('20', 'Reshad', 'Jones', '29', (SELECT teamID FROM teams WHERE mascot = 'Dolphins'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Defense'), (SELECT positionID FROM positions WHERE position = 'DB')),
('22', 'Harrison', 'Smith', '28', (SELECT teamID FROM teams WHERE mascot = 'Vikings'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Defense'), (SELECT positionID FROM positions WHERE position = 'DB')),
('22', 'Keanu', 'Neal', '22', (SELECT teamID FROM teams WHERE mascot = 'Falcons'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Defense'), (SELECT positionID FROM positions WHERE position = 'DB')),
('33', 'Jamal', 'Adams', '21', (SELECT teamID FROM teams WHERE mascot = 'Jets'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Defense'), (SELECT positionID FROM positions WHERE position = 'DB')),
('37', 'John', 'Cyprien', '27', (SELECT teamID FROM teams WHERE mascot = 'Titans'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Defense'), (SELECT positionID FROM positions WHERE position = 'DB')),
('20', 'Kurt', 'Coleman', '29', (SELECT teamID FROM teams WHERE mascot = 'Panthers'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Defense'), (SELECT positionID FROM positions WHERE position = 'DB')),
('50', 'Telvin', 'Smith', '26', (SELECT teamID FROM teams WHERE mascot = 'Jaguars'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Defense'), (SELECT positionID FROM positions WHERE position = 'LB')),
('59', 'Luke', 'Kuechly', '26', (SELECT teamID FROM teams WHERE mascot = 'Panthers'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Defense'), (SELECT positionID FROM positions WHERE position = 'LB')),
('52', 'Alec', 'Ogletree', '26', (SELECT teamID FROM teams WHERE mascot = 'Rams'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Defense'), (SELECT positionID FROM positions WHERE position = 'LB')),
('58', 'Kwon', 'Alexander', '22', (SELECT teamID FROM teams WHERE mascot = 'Buccaneers'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Defense'), (SELECT positionID FROM positions WHERE position = 'LB')),
('54', 'Bobby', 'Wagner', '27', (SELECT teamID FROM teams WHERE mascot = 'Seahawks'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Defense'), (SELECT positionID FROM positions WHERE position = 'LB')),
('45', 'Deion', 'Jones', '22', (SELECT teamID FROM teams WHERE mascot = 'Falcons'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Defense'), (SELECT positionID FROM positions WHERE position = 'LB')),
('57', 'CJ', 'Mosley', '25', (SELECT teamID FROM teams WHERE mascot = 'Ravens'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Defense'), (SELECT positionID FROM positions WHERE position = 'LB')),
('99', 'JJ', 'Watt', '28', (SELECT teamID FROM teams WHERE mascot = 'Texans'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Defense'), (SELECT positionID FROM positions WHERE position = 'DE')),
('99', 'Joey', 'Bosa', '22', (SELECT teamID FROM teams WHERE mascot = 'Chargers'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Defense'), (SELECT positionID FROM positions WHERE position = 'DE')),
('94', 'Danielle', 'Hunter', '22', (SELECT teamID FROM teams WHERE mascot = 'Vikings'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Defense'), (SELECT positionID FROM positions WHERE position = 'DE')),
('54', 'Olivier', 'Vernon', '26', (SELECT teamID FROM teams WHERE mascot = 'Giants'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Defense'), (SELECT positionID FROM positions WHERE position = 'DE')),
('54', 'Melvin', 'Ingram', '28', (SELECT teamID FROM teams WHERE mascot = 'Chargers'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Defense'), (SELECT positionID FROM positions WHERE position = 'DE')),
('96', 'Muhammad', 'Wilkerson', '27', (SELECT teamID FROM teams WHERE mascot = 'Jets'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Defense'), (SELECT positionID FROM positions WHERE position = 'DE')),
('93', 'Calais', 'Campbell', '30', (SELECT teamID FROM teams WHERE mascot = 'Jaguars'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Defense'), (SELECT positionID FROM positions WHERE position = 'DE')),

-- Special Teams
('2', 'Matt', 'Bryant', '42', (SELECT teamID FROM teams WHERE mascot = 'Falcons'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Special Teams'), (SELECT positionID FROM positions WHERE position = 'K')),
('3', 'Stephen', 'Gostkowski', '33', (SELECT teamID FROM teams WHERE mascot = 'Patriots'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Special Teams'), (SELECT positionID FROM positions WHERE position = 'K')),
('3', 'Will', 'Lutz', '23', (SELECT teamID FROM teams WHERE mascot = 'Saints'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Special Teams'), (SELECT positionID FROM positions WHERE position = 'K')),
('9', 'Justin', 'Tucker', '27', (SELECT teamID FROM teams WHERE mascot = 'Ravens'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Special Teams'), (SELECT positionID FROM positions WHERE position = 'K')),
('3', 'Blair', 'Walsh', '27', (SELECT teamID FROM teams WHERE mascot = 'Seahawks'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Special Teams'), (SELECT positionID FROM positions WHERE position = 'K')),
('6', 'Caleb', 'Sturgis', '27', (SELECT teamID FROM teams WHERE mascot = 'Eagles'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Special Teams'), (SELECT positionID FROM positions WHERE position = 'K')),
('5', 'Dan', 'Bailey', '29', (SELECT teamID FROM teams WHERE mascot = 'Cowboys'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Special Teams'), (SELECT positionID FROM positions WHERE position = 'K')),
('6', 'Johnny', 'Hekker', '27', (SELECT teamID FROM teams WHERE mascot = 'Rams'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Special Teams'), (SELECT positionID FROM positions WHERE position = 'P')),
('5', 'Bradley', 'Pinion', '23', (SELECT teamID FROM teams WHERE mascot = '49ers'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Special Teams'), (SELECT positionID FROM positions WHERE position = 'P')),
('9', 'Brad', 'Wing', '26', (SELECT teamID FROM teams WHERE mascot = 'Falcons'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Special Teams'), (SELECT positionID FROM positions WHERE position = 'P'));

-- Table for the stats for players that play defense
-- INSERT INTO `defensiveStats`(`playerNumber`, `sacks`, `tackles`, `forcedFumbles`,`interceptions`)
INSERT INTO `defensiveStats`(`playerNumber`, `sacks`, `tackles`, `forcedFumbles`,`interceptions`) VALUES
((SELECT playerID FROM player WHERE firstName = 'Landon' AND lastName = 'Collins'), '4','100','1','5'),
((SELECT playerID FROM player WHERE firstName = 'Reshad' AND lastName = 'Jones'), '1','31','0','1'),
((SELECT playerID FROM player WHERE firstName = 'Harrison' AND lastName = 'Smith'), '2','69','0','0'),
((SELECT playerID FROM player WHERE firstName = 'Keanu' AND lastName = 'Neal'), '0','72','1','0'),
((SELECT playerID FROM player WHERE firstName = 'Jamal' AND lastName = 'Adams'), '0','0','0','0'),
((SELECT playerID FROM player WHERE firstName = 'John' AND lastName = 'Cyprien'), '1','96','1','0'),
((SELECT playerID FROM player WHERE firstName = 'Kurt' AND lastName = 'Coleman'), '1','65','1','4'),
((SELECT playerID FROM player WHERE firstName = 'Telvin' AND lastName = 'Smith'), '1','98','0','2'),
((SELECT playerID FROM player WHERE firstName = 'Luke' AND lastName = 'Kuechly'), '2','71','1','1'),
((SELECT playerID FROM player WHERE firstName = 'Alec' AND lastName = 'Ogletree'), '0','98','1','2'),
((SELECT playerID FROM player WHERE firstName = 'Kwon' AND lastName = 'Alexander'), '3','108','1','1'),
((SELECT playerID FROM player WHERE firstName = 'Bobby' AND lastName = 'Wagner'), '4','86','0','1'),
((SELECT playerID FROM player WHERE firstName = 'Deion' AND lastName = 'Jones'), '0','75','1','3'),
((SELECT playerID FROM player WHERE firstName = 'CJ' AND lastName = 'Mosley'), '0','65','1','4'),
((SELECT playerID FROM player WHERE firstName = 'JJ' AND lastName = 'Watt'), '1','1','0','0'),
((SELECT playerID FROM player WHERE firstName = 'Joey' AND lastName = 'Bosa'), '10','29','0','0'),
((SELECT playerID FROM player WHERE firstName = 'Danielle' AND lastName = 'Hunter'), '12','32','1','0'),
((SELECT playerID FROM player WHERE firstName = 'Olivier' AND lastName = 'Vernon'), '8','46','1','0'),
((SELECT playerID FROM player WHERE firstName = 'Melvin' AND lastName = 'Ingram'), '8','46','5','0'),
((SELECT playerID FROM player WHERE firstName = 'Muhammad' AND lastName = 'Wilkerson'), '4','33','1','0'),
((SELECT playerID FROM player WHERE firstName = 'Calais' AND lastName = 'Campbell'), '8','34','2','1');

-- Add offensive stats for the players that are on offense.
-- INSERT INTO `offensiveStats`( `passingAttempts`, `passesCompleted`, `passingYards`, `rushingYards`, `rushingAttempts`, `receptions`, `targets`, `receivingYards`) VALUES
INSERT INTO `offensiveStats`(`playerNumber`, `passingAttempts`, `passesCompleted`, `passingYards`, `rushingYards`, `rushingAttempts`, `receptions`, `targets`, `receivingYards`) VALUES
((SELECT playerID FROM player WHERE firstName = 'Tyrod' AND lastName = 'Taylor'), '436', '269', '3023', '580', '95', '0', '0', '0'),
((SELECT playerID FROM player WHERE firstName = 'Aaron' AND lastName = 'Rodgers'), '610', '401', '4428', '369', '67', '0', '0', '0'),
((SELECT playerID FROM player WHERE firstName = 'Jameis' AND lastName = 'Winston'), '567', '345', '4090', '165', '53', '0', '0', '0'),
((SELECT playerID FROM player WHERE firstName = 'Marcus' AND lastName = 'Mariota'), '451', '276', '3426', '349', '60', '0', '0', '0'),
((SELECT playerID FROM player WHERE firstName = 'Blake' AND lastName = 'Bortles'), '625', '368', '3905', '359', '58', '0', '0', '0'),
((SELECT playerID FROM player WHERE firstName = 'Derek' AND lastName = 'Carr'), '560', '357', '3937', '70', '39', '0', '0', '0'),
((SELECT playerID FROM player WHERE firstName = 'Andrew' AND lastName = 'Luck'), '545', '346', '4240', '341', '64', '0', '0', '0'),
((SELECT playerID FROM player WHERE firstName = 'David' AND lastName = 'Johnson'), '0', '0', '0', '1239', '293', '80', '120', '879'),
((SELECT playerID FROM player WHERE firstName = 'Le\'Veon' AND lastName = 'Bell'), '0', '0', '0', '1268', '261', '75', '94', '616'),
((SELECT playerID FROM player WHERE firstName = 'Ezekiel' AND lastName = 'Elliott'), '0', '0', '0', '1631', '322', '32', '39', '363'),
((SELECT playerID FROM player WHERE firstName = 'LeSean' AND lastName = 'McCoy'), '0', '0', '0', '1267', '234', '50', '57', '356'),
((SELECT playerID FROM player WHERE firstName = 'Jordan' AND lastName = 'Howard'), '0', '0', '0', '1313', '252', '29', '50', '298'),
((SELECT playerID FROM player WHERE firstName = 'Devonta' AND lastName = 'Freeman'), '0', '0', '0', '1079', '227', '54', '65', '462'),
((SELECT playerID FROM player WHERE firstName = 'Melvin' AND lastName = 'Gordon'), '0', '0', '0', '997', '254', '41', '57', '419'),
((SELECT playerID FROM player WHERE firstName = 'Antonio' AND lastName = 'Brown'), '0', '0', '0', '0', '0', '106', '154', '1284'),
((SELECT playerID FROM player WHERE firstName = 'Odell' AND lastName = 'Beckham Jr'), '0', '0', '0', '0', '0', '101', '169', '1367'),
((SELECT playerID FROM player WHERE firstName = 'Julio' AND lastName = 'Jones'), '0', '0', '0', '0', '0', '83', '129', '1409'),
((SELECT playerID FROM player WHERE firstName = 'Jordy' AND lastName = 'Nelson'), '0', '0', '0', '0', '0', '97', '152', '1257'),
((SELECT playerID FROM player WHERE firstName = 'Mike' AND lastName = 'Evans'), '0', '0', '0', '0', '0', '96', '173', '1321'),
((SELECT playerID FROM player WHERE firstName = 'Michael' AND lastName = 'Thomas'), '0', '0', '0', '0', '0', '92', '121', '1137'),
((SELECT playerID FROM player WHERE firstName = 'AJ' AND lastName = 'Green'), '0', '0', '0', '0', '0', '66', '100', '964');

-- Table for the stats for the specialTeams players
-- INSERT INTO `specialTeamsStats`(`playerNumber`, `fieldGoalAttempts`, `fieldGoalMade`, `punts`, `averagePuntYards`)
INSERT INTO `specialTeamsStats`(`playerNumber`, `fieldGoalAttempts`, `fieldGoalMade`, `punts`, `averagePuntYards`) VALUES
((SELECT playerID FROM player WHERE firstName = 'Matt' OR lastName = 'Bryant'), '37','34','0','0'),
((SELECT playerID FROM player WHERE firstName = 'Stephen' OR lastName = 'Gostkowski'), '32','27','0','0'),
((SELECT playerID FROM player WHERE firstName = 'Will' OR lastName = 'Lutz'), '34','28','0','0'),
((SELECT playerID FROM player WHERE firstName = 'Justin' OR lastName = 'Tucker'), '39','38','0','0'),
((SELECT playerID FROM player WHERE firstName = 'Blair' OR lastName = 'Walsh'), '0','0','0','0'),
((SELECT playerID FROM player WHERE firstName = 'Caleb' OR lastName = 'Sturgis'), '41','35','0','0'),
((SELECT playerID FROM player WHERE firstName = 'Dan' OR lastName = 'Bailey'), '32','27','0','0'),
((SELECT playerID FROM player WHERE firstName = 'Johnny' OR lastName = 'Hekker'), '0','0','98','48'),
((SELECT playerID FROM player WHERE firstName = 'Bradley' OR lastName = 'Pinion'), '0','0','100','44'),
((SELECT playerID FROM player WHERE firstName = 'Brad' OR lastName = 'Wing'), '0','0','93','46');
