UPDATE Employee SET role = 'driver role' WHERE username IN 
('agarcia7', 'awilson5', 'bsummers4', 'csoares8', 'fprefontaine6', 'lrodriguez5', 'mrobot1', 'rlopez6');

UPDATE Employee SET role = 'worker role' WHERE username IN 
('ckann5', 'echarles19', 'eross10', 'hstark16', 'mrobot2', 'tmccall5');

UPDATE Employee SET role = 'owner role' WHERE username IN 
('cjordan5', 'jstone5', 'sprince6');

INSERT INTO Driver (username, licenseID, license_type, successful_trips) VALUES
('agarcia7', '610623', 'CDL', 38),
('awilson5', '314159', 'commercial', 41),
('bsummers4', '411911', 'private', 35),
('csoares8', '343563', 'commercial', 7),
('fprefontaine6', '657483', 'private', 2),
('lrodriguez5', '287182', 'CDL', 67),
('mrobot1', '101010', 'CDL', 18),
('rlopez6', '235711', 'private', 58);

INSERT INTO Worker (username) VALUES
('ckann5'),
('echarles19'),
('eross10'),
('hstark16'),
('mrobot2'),
('tmccall5');

INSERT INTO Owner (username) VALUES
('cjordan5'),
('jstone5'),
('sprince6');

