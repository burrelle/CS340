-- Insert Players into the player table.
-- INSERT INTO `player`(`pNumber`, `firstName`, `lastName`, `age`, `team`, `positionGroup`, `positon`)

INSERT INTO `player`(`pNumber`, `firstName`, `lastName`, `age`, `team`, `positionGroup`, `positon`) VALUES
('5', 'Tyrod', 'Taylor', '27', (SELECT teamID FROM teams WHERE mascot = 'Bills'), (SELECT positionGroupID FROM positionGroup WHERE positionGroup = 'Offense'), (SELECT positionID FROM positions WHERE position = 'QB'));
