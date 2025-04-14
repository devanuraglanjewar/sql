CREATE TABLE state_of_c (
sateid INT PRIMARY KEY NOT NULL,
statename VARCHAR(100),
cid int,
CONSTRAINT fk_cid FOREIGN KEY (cid) REFERENCES country(cid)
);

DROP TABLE country;

CREATE TABLE country(
cid int PRIMARY KEY NOT NULL,
Country_of_origin VARCHAR(100) Constraint u_name UNIQUE
);

SELECT * FROM CITY;
ALTER TABLE county;

INSERT INTO  country Values(1, 'india');
INSERT INTO  state_of_c Values(1, 'MH', 1);
INSERT INTO  CITY Values(1, 'PUNE', 1);

INSERT INTO  country Values(2, 'Bharat');
INSERT INTO  state_of_c Values(2, 'MAHA', 2);
INSERT INTO  CITY Values(2, 'AMT', 2);


CREATE TABLE CITY (
cityID int primary key not null,
cityNAME VARCHAR(100) CONSTRAINT u_name1 UNIQUE,
sateid int,
CONSTRAINT fk_sateid FOREIGN KEY (sateid) REFERENCES state_of_c (sateid)
);

DELETE  FROM CITY where cityID = 1;
DROP TABLE CITY;

SELECT * FROM country 	INNER JOIN state_of_c ON country.cid = state_of_c.cid  INNER JOIN CITY ON CITY.sateid = state_of_c.cid;  
SELECT * FROM country 	INNER JOIN state_of_c ON country.cid = state_of_c.cid FULL JOIN CITY ON CITY.sateid = state_of_c.cid;  

