-- Table for the stats for the specialTeams players
-- INSERT INTO `specialTeamsStats`(`playerNumber`, `fieldGoalAttempts`, `fieldGoalMade`, `punts`, `avergePuntYards`)
INSERT INTO `specialTeamsStats`(`playerNumber`, `fieldGoalAttempts`, `fieldGoalMade`, `punts`, `avergePuntYards`) VALUES
((SELECT playerID FROM player WHERE firstName = 'Matt' AND lastName = 'Bryant'), '37','34','0','0'),
((SELECT playerID FROM player WHERE firstName = 'Stephen' AND lastName = 'Gostkowski'), '32','27','0','0'),
((SELECT playerID FROM player WHERE firstName = 'Will' AND lastName = 'Lutz'), '34','28','0','0'),
((SELECT playerID FROM player WHERE firstName = 'Justin' AND lastName = 'Tucker'), '39','38','0','0'),
((SELECT playerID FROM player WHERE firstName = 'Blair' AND lastName = 'Walsh'), '0','0','0','0'),
((SELECT playerID FROM player WHERE firstName = 'Caleb' AND lastName = 'Sturgis'), '41','35','0','0'),
((SELECT playerID FROM player WHERE firstName = 'Dan' AND lastName = 'Bailey'), '32','27','0','0'),
((SELECT playerID FROM player WHERE firstName = 'Johnny' AND lastName = 'Hekker'), '0','0','98','48'),
((SELECT playerID FROM player WHERE firstName = 'Bradley' AND lastName = 'Pinion'), '0','0','100','44'),
((SELECT playerID FROM player WHERE firstName = 'Brad' AND lastName = 'Wing'), '0','0','93','46');
