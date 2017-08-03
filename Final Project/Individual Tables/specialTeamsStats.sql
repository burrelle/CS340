-- Table for the stats for the specialTeams players
-- INSERT INTO `specialTeamsStats`(`playerNumber`, `fieldGoalAttempts`, `fieldGoalMade`, `punts`, `avergePuntYards`)
INSERT INTO `specialTeamsStats`(`playerNumber`, `fieldGoalAttempts`, `fieldGoalMade`, `punts`, `avergePuntYards`) VALUES
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
