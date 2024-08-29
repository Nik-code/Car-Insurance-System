-- Sample data for CAR table
INSERT INTO CAR (car_id, chassis_no, engine_no, make, model, year) VALUES
(1, 'CH001', 'EN001', 'Toyota', 'Corolla', 2020),
(2, 'CH002', 'EN002', 'Honda', 'Civic', 2019),
(3, 'CH003', 'EN003', 'Ford', 'Focus', 2021),
(4, 'CH004', 'EN004', 'Volkswagen', 'Golf', 2018),
(5, 'CH005', 'EN005', 'BMW', '3 Series', 2022);

-- Sample data for OWNER table
INSERT INTO OWNER (owner_id, car_id, name, address, phone) VALUES
(1, 1, 'John Doe', '123 Main St, Anytown, AN 12345', '555-1234'),
(2, 2, 'Jane Smith', '456 Oak Rd, Somewhere, SW 67890', '555-5678'),
(3, 3, 'Bob Johnson', '789 Pine Ave, Elsewhere, EW 13579', '555-9012'),
(4, 4, 'Alice Brown', '321 Elm Blvd, Nowhere, NW 24680', '555-3456'),
(5, 5, 'Charlie Davis', '654 Maple Ln, Anywhere, AW 97531', '555-7890');

-- Sample data for POLICY table
INSERT INTO POLICY (policy_id, car_id, owner_id, start_date, end_date) VALUES
('POL001', 1, 1, '2023-01-01', '2024-01-01'),
('POL002', 2, 2, '2023-02-15', '2024-02-15'),
('POL003', 3, 3, '2023-03-30', '2024-03-30'),
('POL004', 4, 4, '2023-04-10', '2024-04-10'),
('POL005', 5, 5, '2023-05-20', '2024-05-20');

-- Sample data for DRIVER table
INSERT INTO DRIVER (driver_id, name, address, phone) VALUES
(1, 'John Doe', '123 Main St, Anytown, AN 12345', '555-1234'),
(2, 'Jane Smith', '456 Oak Rd, Somewhere, SW 67890', '555-5678'),
(3, 'Bob Johnson', '789 Pine Ave, Elsewhere, EW 13579', '555-9012'),
(4, 'Alice Brown', '321 Elm Blvd, Nowhere, NW 24680', '555-3456'),
(5, 'Charlie Davis', '654 Maple Ln, Anywhere, AW 97531', '555-7890');

-- Sample data for WORKSHOP table
INSERT INTO WORKSHOP (workshop_id, name, address, phone) VALUES
(1, 'Quick Fix Auto', '111 Garage St, Fixtown, FT 11111', '555-1111'),
(2, 'Precision Motors', '222 Repair Rd, Mechanicville, MV 22222', '555-2222'),
(3, 'Elite Auto Care', '333 Service Ave, Tunetown, TT 33333', '555-3333');

-- Sample data for CLAIM table
INSERT INTO CLAIM (claim_id, policy_id, car_id, workshop_id, driver_id, date, location, severity, amount) VALUES
(1, 'POL001', 1, 1, 1, '2023-06-15', 'Main St & 1st Ave, Anytown', 'Minor', 1500.00),
(2, 'POL002', 2, 2, 2, '2023-07-20', 'Oak Rd & 2nd St, Somewhere', 'Moderate', 3000.00),
(3, 'POL003', 3, 3, 3, '2023-08-25', 'Pine Ave & 3rd Blvd, Elsewhere', 'Major', 5000.00);