CAR (
    car_id INTEGER PRIMARY KEY,
    chassis_no VARCHAR(50) NOT NULL,
    engine_no VARCHAR(50) NOT NULL,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INTEGER NOT NULL
);

OWNER (
    owner_id INTEGER PRIMARY KEY,
    car_id INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    FOREIGN KEY(car_id) REFERENCES CAR(car_id)
);

POLICY (
    policy_id VARCHAR(20) PRIMARY KEY,
    car_id INTEGER NOT NULL,
    owner_id INTEGER NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    FOREIGN KEY(car_id) REFERENCES CAR(car_id),
    FOREIGN KEY(owner_id) REFERENCES OWNER(owner_id)
);

DRIVER (
    driver_id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

WORKSHOP (
    workshop_id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

CLAIM (
    claim_id INTEGER PRIMARY KEY,
    policy_id VARCHAR(20) NOT NULL,
    car_id INTEGER NOT NULL,
    workshop_id INTEGER NOT NULL,
    driver_id INTEGER NOT NULL,
    date DATE NOT NULL,
    location VARCHAR(100) NOT NULL,
    severity varchar(20) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY(policy_id) REFERENCES POLICY(policy_id),
    FOREIGN KEY(car_id) REFERENCES CAR(car_id),
    FOREIGN KEY(workshop_id) REFERENCES WORKSHOP(workshop_id),
    FOREIGN KEY(driver_id) REFERENCES DRIVER(driver_id)
);
