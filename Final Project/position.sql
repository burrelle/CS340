-- Adding the positions with the foriegn key from positionGroup
-- INSERT INTO `position` (`positionGroup`, `position`) VALUES (SELECT positionGroupID from positionGroup WHERE positionGroup = '(O/D/ST)')

INSERT INTO `position` (`positionGroup`, `position`) VALUES
((SELECT positionGroupID from positionGroup WHERE positionGroup = 'Offense'), 'QB'),
((SELECT positionGroupID from positionGroup WHERE positionGroup = 'Offense'), 'RB'),
((SELECT positionGroupID from positionGroup WHERE positionGroup = 'Offense'), 'WR'),
((SELECT positionGroupID from positionGroup WHERE positionGroup = 'Defense'), 'DB'),
((SELECT positionGroupID from positionGroup WHERE positionGroup = 'Defense'), 'DE'),
((SELECT positionGroupID from positionGroup WHERE positionGroup = 'Defense'), 'LB'),
((SELECT positionGroupID from positionGroup WHERE positionGroup = 'Special Teams'), 'K'),
((SELECT positionGroupID from positionGroup WHERE positionGroup = 'Special Teams'), 'P');
