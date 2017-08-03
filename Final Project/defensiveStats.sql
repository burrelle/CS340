-- Table for the stats for players that play defense
-- INSERT INTO `defensiveStats`(`playerNumber`, `sacks`, `tackles`, `forcedFumbles`,`interceptions`)
INSERT INTO `defensiveStats`(`playerNumber`, `sacks`, `tackles`, `forcedFumbles`,`interceptions`) VALUES
((SELECT playerID FROM player WHERE firstName = 'Landon' AND lastName = 'Collins'), '4','100','1','5'),
((SELECT playerID FROM player WHERE firstName = 'Reshad' AND lastName = 'Jones'), '1','31','0','1'),
((SELECT playerID FROM player WHERE firstName = 'Harrison' AND lastName = 'Smith'), '2','69','0','0'),
((SELECT playerID FROM player WHERE firstName = 'Keanu' AND lastName = 'Neal'), '0','5','72','0'),
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
