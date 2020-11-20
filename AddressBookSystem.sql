create schema addressBook;
use addressBook;

CREATE TABLE addressBook (
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    City VARCHAR(20) NOT NULL,
    State VARCHAR(20) NOT NULL,
    ZipCode BIGINT NOT NULL,
    PhoneNumber BIGINT NOT NULL,
    Email VARCHAR(50)
);

describe addressBook;

INSERT INTO addressBook(FirstName,LastName,Address,City,State,Zipcode,PhoneNumber,Email) 
				VALUES 
									("Fnameone", "Lnameone", "Stationroadone", "Thane", "Maharashtra", 400601, "9900110001", "firstnameone@gmail.com"),
                       				("Fnametwo", "Lnametwo", "Stationroadtwo", "Mumbai", "Maharashtra", 400601, "9900110002", "firstnametwo@gmail.com"),
						("Fnamethree", "Lnamethree", "Stationroadthree", "Thane", "Maharashtra", 400601, "9900110003", "firstnamethree@mail.com");

SELECT * FROM addressBook;

UPDATE addressBook SET State = 'Thaneone' WHERE FirstName = 'Fnameone';
UPDATE addressBook SET ZipCode = 400602 WHERE FirstName = 'Fnametwo'; 
UPDATE addressBook SET Email = 'firstnamethree@yahoo.com' WHERE LastName = 'Lnamethree'; 

DELETE FROM addressBook WHERE FirstName = 'Fnametwo';

SELECT * FROM addressBook WHERE City = 'Mumbai';
SELECT * FROM addressBook WHERE State = 'Maharashtra';

SELECT City,count(FirstName) FROM addressbook GROUP BY City;
SELECT State,count(FirstName) FROM addressbook GROUP BY State;

SELECT FirstName,City FROM addressbook GROUP BY City ORDER BY FirstName ASC;

ALTER TABLE addressBook ADD Type varchar(20) after LastName;
UPDATE addressBook SET Type = 'Family' WHERE FirstName = 'Fnameone';
UPDATE addressBook SET Type = 'Friends' WHERE FirstName = 'Fnamethree';


SELECT Type,count(FirstName) FROM addressbook GROUP BY Type;

INSERT INTO addressBook(FirstName,LastName,Address,City,State,Zipcode,PhoneNumber,Email) 
				VALUES ("Fnamefour", "Lnamefour", "Stationroadfour", "Thane", "Maharashtra", 400601, "9900110003", "firstnamefour@mail.com");
                
ALTER TABLE addressBook ADD ID int NOT NULL AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE addressBook DROP COLUMN Type;
CREATE TABLE RELATION(ID int NOT NULL AUTO_INCREMENT, Type varchar(20) NOT NULL,PRIMARY KEY(ID));
INSERT INTO RELATION(Type) VALUES('Family'),('Friends');
SELECT * FROM RELATION;

CREATE TABLE addressBookRelation (
    addressbookID int NOT NULL,
    relationID int NOT NULL,
    FOREIGN KEY (addressBookID) REFERENCES addressBook(ID),
    FOREIGN KEY (relationID) REFERENCES RELATION(ID)
);

INSERT INTO addressBookRelation VALUES (1,1),(2,1),(3,1),(3,2);


SELECT * FROM addressBook;
SELECT * FROM RELATION;
SELECT * FROM addressBookRelation;
