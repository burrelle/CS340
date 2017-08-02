-- Insert Players into the player table.
-- INSERT INTO `player`(`pNumber`, `firstName`, `lastName`, `age`, `team`, `positionGroup`, `positon`)

INSERT INTO `player`(`pNumber`, `firstName`, `lastName`, `age`, `team`, `positionGroup`, `positon`) VALUES
('5', 'Tyrod', 'Taylor', '27', (SELECT teamID FROM teams WHERE mascot = 'Bills'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'QB')),
('12', 'Aaron', 'Rodgers', '33', (SELECT teamID FROM teams WHERE mascot = 'Packers'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'QB')),
('3', 'Jameis', 'Winston', '21', (SELECT teamID FROM teams WHERE mascot = 'Buccaneers'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'QB')),
('8', 'Marcus', 'Mariota', '21', (SELECT teamID FROM teams WHERE mascot = 'Titans'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'QB')),
('5', 'Blake', 'Bortles', '23', (SELECT teamID FROM teams WHERE mascot = 'Jaguars'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'QB')),
('4', 'Derek', 'Carr', '24', (SELECT teamID FROM teams WHERE mascot = 'Raiders'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'QB')),
('12', 'Andrew', 'Luck', '25', (SELECT teamID FROM teams WHERE mascot = 'Bills'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'QB')),
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



-- TODO Add WR, D, ST
