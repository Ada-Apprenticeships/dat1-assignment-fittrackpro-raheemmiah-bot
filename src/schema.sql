.open fittrackpro.db
.mode column
PRAGMA foreign_keys = ON;

CREATE TABLE locations (
    location_id INTEGER PRIMARY KEY,
    name TEXT,
    address TEXT,
    phone_number TEXT,
    email TEXT,
    opening_hours TEXT
);

CREATE TABLE members (
    member_id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    phone_number TEXT,
    date_of_birth TEXT,
    join_date TEXT,
    emergency_contact_name TEXT,
    emergency_contact_phone TEXT
);

CREATE TABLE staff (
    staff_id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    phone_number TEXT,
    position TEXT,
    hire_date TEXT,
    location_id INTEGER,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

CREATE TABLE classes (
    class_id INTEGER PRIMARY KEY,
    name TEXT,
    description TEXT,
    capacity INTEGER,
    duration INTEGER,
    location_id INTEGER,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

CREATE TABLE class_schedule (
    schedule_id INTEGER PRIMARY KEY,
    class_id INTEGER,
    staff_id INTEGER,
    start_time TEXT,
    end_time TEXT,
    FOREIGN KEY (class_id) REFERENCES classes(class_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE memberships (
    membership_id INTEGER PRIMARY KEY,
    member_id INTEGER,
    type TEXT,
    start_date TEXT,
    end_date TEXT,
    status TEXT,
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

CREATE TABLE equipment (
    equipment_id INTEGER PRIMARY KEY,
    name TEXT,
    type TEXT,
    purchase_date TEXT,
    last_maintenance_date TEXT,
    next_maintenance_date TEXT,
    location_id INTEGER,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);