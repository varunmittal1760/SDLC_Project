-- SQL Schema for "GreenFingers SG" Community Gardening App

-- Use UUIDs for primary keys for better scalability and to avoid collisions.
-- If your database doesn't have a native UUID type, you can use VARCHAR(36).
-- We'll use SERIAL for simplicity here, but UUID is recommended for production.

-- Table to store all the community gardens
CREATE TABLE Gardens (
    garden_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location_address TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Table for user profiles
-- Each user is linked to one primary garden.
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    garden_id INT, -- The garden this user is a member of
    email VARCHAR(255) UNIQUE NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL, -- Never store plain text passwords
    role VARCHAR(50) NOT NULL DEFAULT 'Member', -- e.g., 'Member', 'Garden Manager'
    created_at TIMESTAMPTZ DEFAULT NOW(),

    -- Foreign key to link a user to their garden
    FOREIGN KEY (garden_id) REFERENCES Gardens(garden_id) ON DELETE SET NULL
);

-- Table for the individual plots within a garden
-- A plot is linked to a garden and can be assigned to a user.
CREATE TABLE Plots (
    plot_id SERIAL PRIMARY KEY,
    garden_id INT NOT NULL,
    assigned_user_id INT UNIQUE, -- A plot can only be assigned to one user at a time
    plot_number VARCHAR(50) NOT NULL, -- e.g., "A1", "B-12"
    status VARCHAR(50) NOT NULL DEFAULT 'Available', -- e.g., 'Available', 'Occupied', 'Waitlist'

    -- Foreign key to link a plot to its garden
    FOREIGN KEY (garden_id) REFERENCES Gardens(garden_id) ON DELETE CASCADE,
    -- Foreign key to link a plot to its assigned user
    FOREIGN KEY (assigned_user_id) REFERENCES Users(user_id) ON DELETE SET NULL
);


-- Table for events scheduled within a garden
CREATE TABLE Events (
    event_id SERIAL PRIMARY KEY,
    garden_id INT NOT NULL,
    created_by_user_id INT NOT NULL, -- Who created the event
    title VARCHAR(255) NOT NULL,
    description TEXT,
    event_date TIMESTAMPTZ NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),

    -- Foreign key to link the event to its garden
    FOREIGN KEY (garden_id) REFERENCES Gardens(garden_id) ON DELETE CASCADE,
    -- Foreign key to link the event to its creator
    FOREIGN KEY (created_by_user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Junction Table for Event RSVPs (Many-to-Many relationship)
-- This table tracks which users have RSVP'd to which events.
CREATE TABLE Event_RSVPs (
    event_id INT NOT NULL,
    user_id INT NOT NULL,
    rsvp_status VARCHAR(50) NOT NULL DEFAULT 'Going', -- e.g., 'Going', 'Not Going'
    created_at TIMESTAMPTZ DEFAULT NOW(),

    -- Composite primary key to ensure a user can only RSVP once per event
    PRIMARY KEY (event_id, user_id),

    -- Foreign keys to link to the Events and Users tables
    FOREIGN KEY (event_id) REFERENCES Events(event_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);