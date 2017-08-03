-- Add offensive stats for the players that are on offense.
-- INSERT INTO `offsensiveStats`( `passingAttempts`, `passesCompleted`, `passingYards`, `rushingYards`, `rushingAttempts`, `receptions`, `targets`, `receivingYards`) VALUES
INSERT INTO `offsensiveStats`(`playerNumber`, `passingAttempts`, `passesCompleted`, `passingYards`, `rushingYards`, `rushingAttempts`, `receptions`, `targets`, `receivingYards`) VALUES
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
