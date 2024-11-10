--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--
-- @edited pbl4
-- @updated Fall, 2024
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS House;
DROP TABLE IF EXISTS Property CASCADE;
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Game CASCADE;
DROP TABLE IF EXISTS Player CASCADE;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY,
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score integer,
    cash integer,
    piecePosition integer
	);

CREATE TABLE Property (
    ID integer PRIMARY KEY,
    gameID integer REFERENCES Game(ID), 
    playerID integer REFERENCES Player(ID),
    name varchar(50)
    );
    
CREATE TABLE House(
    propertyID integer REFERENCES Property(ID),
    level integer
    );

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;
GRANT SELECT ON House TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO PlayerGame VALUES (1, 1, 0.00, 100, 0);
INSERT INTO PlayerGame VALUES (1, 2, 0.00, 500, 20);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00, 5500, 22);
INSERT INTO PlayerGame VALUES (2, 1, 1000.00, 1000, 35);
INSERT INTO PlayerGame VALUES (2, 2, 0.00, 200, 26);
INSERT INTO PlayerGame VALUES (2, 3, 500.00, 250, 1);
INSERT INTO PlayerGame VALUES (3, 2, 0.00, 5000, 0);
INSERT INTO PlayerGame VALUES (3, 3, 5500.00, 5000, 0);

INSERT INTO Property VALUES (1, 1, 3, 'Park Place');
INSERT INTO Property VALUES (2, 1, 1, 'Marvin Gardens');
INSERT INTO Property VALUES (3, 2, 1, 'Park Place');
INSERT INTO Property VALUES (4, 2, 2, 'Redding Railroad');
INSERT INTO Property VALUES (5, 1, 2, 'Illinios Ave.');

INSERT INTO House VALUES (1, 5);
INSERT INTO House VALUES (3, 2);
INSERT INTO House VALUES (4, 1);