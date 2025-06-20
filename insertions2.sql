INSERT INTO Location (label, location_x_coord, location_y_coord, space) VALUES
('southside', 0, 0, 0),
('buckhead', 0, 0, 0),
('airport', 0, 0, 0),
('plaza', 0, 0, 0),
('avalon', 0, 0, 0),
('highpoint', 0, 0, 0);


INSERT INTO Service (id, name, location) VALUES
('mbm', 'Metro Business Movers', 'southside'),
('lcc', 'Local Commerce Couriers', 'plaza'),
('pbl', 'Pro Business Logistics', 'avalon');

INSERT INTO Van (tag, service_id, capacity, sales, fuel, location) VALUES
('1', 'mbm', 6, 0, 100, 'southside'),
('5', 'mbm', 7, 100, 27, 'buckhead'),
('8', 'mbm', 8, 0, 100, 'southside'),
('11', 'mbm', 10, 0, 25, 'buckhead'),
('16', 'mbm', 5, 40, 17, 'buckhead'),
('1', 'lcc', 9, 0, 100, 'airport'),
('2', 'lcc', 7, 0, 75, 'airport'),
('3', 'pbl', 5, 50, 100, 'avalon'),
('7', 'pbl', 5, 100, 53, 'avalon'),
('8', 'pbl', 6, 0, 100, 'highpoint'),
('11', 'pbl', 6, 0, 90, 'highpoint');

