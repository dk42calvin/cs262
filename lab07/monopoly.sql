﻿
--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerStatus;
DROP TABLE IF EXISTS Property;
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;


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
	score integer
	);

CREATE TABLE PlayerStatus(
	gameID integer REFERENCES Game(ID),
	playerID integer REFERENCES Player(ID),
	playerLocation integer,
	playerWealth integer

);

CREATE TABLE Property(
	gameID integer REFERENCES Game(ID),
	playerID integer REFERENCES Player(ID),
	propertyName varchar(20),
	numHouses integer,
	numHotels integer
);



-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON PlayerStatus TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:33:00');
INSERT INTO Game VALUES (4, '2006-06-30 15:41:00');
INSERT INTO Game VALUES (5, '2006-07-03 18:45:00');
INSERT INTO Game VALUES (6, '2006-07-06 17:53:00');
INSERT INTO Game VALUES (7, '2006-07-07 22:26:00');
INSERT INTO Game VALUES (8, '2006-07-09 19:41:00');
INSERT INTO Game VALUES (9, '2006-07-16 18:15:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');
INSERT INTO Player VALUES (4, 'cat@gmail.edu', 'Cat');
INSERT INTO Player VALUES (5, 'duck@hotmail.com', 'Duck');


INSERT INTO PlayerGame VALUES (1, 1, 0.00);
INSERT INTO PlayerGame VALUES (1, 2, 0.00);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00);
INSERT INTO PlayerGame VALUES (2, 1, 1000.00);
INSERT INTO PlayerGame VALUES (2, 2, 0.00);
INSERT INTO PlayerGame VALUES (2, 3, 500.00);
INSERT INTO PlayerGame VALUES (3, 2, 0.00);
INSERT INTO PlayerGame VALUES (3, 3, 5500.00);
INSERT INTO PlayerStatus VALUES (3, 3, 42, 500);
INSERT INTO Property VALUES (3, 3, 'Boardwalk', 0, 1);
INSERT INTO Property VALUES (3, 2, 'Waterworks', 0, 1);





