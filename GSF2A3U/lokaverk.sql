	Use real instead of number 




		create table MEMBERSHIP
		(
			MEM_NUM INTEGER(3) PRIMARY KEY,
			MEM_FNAME VARCHAR(15),
			MEM_LNAME VARCHAR(15),
			MEM_STREET VARCHAR(40),
			MEM_CITY VARCHAR(15),
			MEM_STATE VARCHAR(2),
			MEM_ZIP INTEGER(5),
			MEM_BALANCE CHAR(2)
		);

		create table RENTAL
		(
			RENT_NUM INTEGER(4) PRIMARY KEY,
			RENT_DATE DATE,
			MEM_NUM INTEGER(3),
		    FOREIGN KEY(MEM_NUM) REFERENCES MEMBERSHIP(MEM_NUM)
		);

		create table PRICE 
		(
			PRICE_CODE CHAR(4)  PRIMARY KEY,
			PRICE_DESCRIPTION VARCHAR(15),
			PRICE_RENTFEE DECIMAL(2.2),
			PRICE_DAILYLATEFEE INTEGER
		);

		create table MOVIE
		(
			MOVIE_NUM INTEGER(4)  PRIMARY KEY,
			MOVIE_TITLE VARCHAR(40),
			MOVIE_YEAR CHAR(4),
			MOVIE_COST real(2.2),
			MOVIE_GENRE VARCHAR(15),
			PRICE_CODE CHAR(1),
			FOREIGN KEY(PRICE_CODE) REFERENCES PRICE(PRICE_CODE)
		);

		create table VIDEO
		(
			VID_NUM INTEGER(5) PRIMARY KEY,
			VID_INDATE DATE,
			MOVIE_NUM INTEGER(4),
			FOREIGN KEY(MOVIE_NUM) REFERENCES MOVIE(MOVIE_NUM)
		);

		create table DETAILRENTAL
		(
			RENT_NUM INTEGER(4),
			VID_NUM INTEGER(5),
			DETAIL_FEE DECIMAL(2.2),
			DETAIL_DUEDATE DATE,
			DETAIL_RETURNDATE DATE,
			DETAIL_DAILYLATEFEE CHAR(1),
			PRIMARY KEY (RENT_NUM,VID_NUM),
			FOREIGN KEY(RENT_NUM) REFERENCES RENTAL(RENT_NUM),
			FOREIGN KEY(VID_NUM) REFERENCES VIDEO(VID_NUM)
		);


	insert into MEMBERSHIP (MEM_NUM, MEM_FNAME, MEM_LNAME, MEM_STREET, MEM_CITY, MEM_STATE, MEM_ZIP, MEM_BALANCE)
	values
	(102,'Tami','Dawson','2632 Takli Circle','Norene','TN',37136,11),
	(103,'Curt','Knight','4025 Cornell Court','Flatgap','KY',41219,6),
	(104,'Jamal','Melendez','788 East 145th Avenue','Quebeck','TN',38579,0),
	(105,'Iva','Mcclain','6045 Musket Ball Circle','Summit','KY',42783,15),
	(106,'Miranda','Parks','4469 Maxwell Place','Germantown','TN',38183,0),
	(107,'Rosario','Elliott','7578 Danner Avenue','Columbia','TN',38402,5),
	(108,'Mattie','Guy','4390 Evergreen Street','Lily','KY',40740,0),
	(109,'Clint','Ochoa','1711 Elm Street','Greenville','TN',37745,10),
	(110,'Lewis','Rosales','4524 Southwind Circle','Counce','TN',38326,0),
	(111,'Stacy','Mann','2789 East Cook Avenue','Murfreesboro','TN',37132,8),
	(112,'Luis','Trujillo','7267 Melvin Avenue','Heiskell','TN',37754,3),
	(113,'Minnie','Gonzales','6430 Vasili Drive','Williston','TN',38076,0);


	insert into RENTAL (RENT_NUM, RENT_DATE, MEM_NUM)
	values
	(1001,'2009-03-01',103),
	(1002,'2009-03-01',105),
	(1003,'2009-03-02',102),
	(1004,'2009-03-02',110),
	(1005,'2009-03-02',111),
	(1006,'2009-03-02',107),
	(1007,'2009-03-02',104),
	(1008,'2009-03-03',105),
	(1009,'2009-03-03',111);



	insert into PRICE (PRICE_CODE, PRICE_DESCRIPTION, PRICE_RENTFEE, PRICE_DAILYLATEFEE)
	values
	(1,'Standard',2,1),
	(2,'New Release',3.5,3),
	(3,'Discount',1.5,1),
	(4,'Weekly Special',1,.5);




	insert into MOVIE (MOVIE_NUM, MOVIE_TITLE, MOVIE_YEAR, MOVIE_COST, MOVIE_GENRE, PRICE_CODE)
	values
	(1234,'The Cesar Family Christmas','2007',39.95,'FAMILY',2),
	(1235,'Smokey Mountain Wildlife','2004',59.95,'ACTION',1),
	(1236,'Richard Goodhope','2008',59.95,'DRAMA',2),
	(1237,'Beatnik Fever','2007',29.95,'COMEDY',2),
	(1238,'Constant Companion','2008',89.95,'DRAMA',2),
	(1239,'Where Hope Dies','1998',25.49,'DRAMA',3),
	(1245,'Time to Burn','2005',45.49,'ACTION',1),
	(1246,'What He Doesn´t Know','2006',58.29,'COMEDY',1);


	insert into VIDEO (VID_NUM, VID_INDATE, MOVIE_NUM)
	values
	(54321,'2008-06-18',1234),
	(54324,'2008-06-18',1234),
	(54325,'2008-06-18',1234),
	(34341,'2007-01-22',1235),
	(34342,'2007-01-22',1235),
	(34366,'2009-03-02',1236),
	(34367,'2009-03-02',1236),
	(34368,'2009-03-02',1236),
	(34369,'2009-03-02',1236),
	(44392,'2008-08-21',1237),
	(44397,'2008-08-21',1237),
	(59237,'2009-02-14',1237),
	(61388,'2007-01-25',1239),
	(61353,'2006-01-28',1245),
	(61354,'2006-01-28',1245),
	(61367,'2008-07-30',1246),
	(61369,'2008-07-30',1246);



	insert into DETAILRENTAL (RENT_NUM, VID_NUM, DETAIL_FEE, DETAIL_DUEDATE, DETAIL_RETURNDATE, DETAIL_DAILYLATEFEE)
	values
	(1001,34342,2,'2009-03-04','2009-03-02',1),
	(1001,61353,2,'2009-03-04','2009-03-03',1),
	(1002,59237,3.5,'2009-03-04','2009-03-04',3),
	(1003,54325,3.5,'2009-03-04','2009-03-09',3),
	(1003,61369,2,'2009-03-06','2009-03-09',1),
	(1003,61388,0,'2009-03-06','2009-03-09',1),
	(1004,44392,3.5,'2009-03-05','2009-03-07',3),
	(1004,34367,3.5,'2009-03-05','2009-03-07',3),
	(1004,34341,2,'2009-03-07','2009-03-07',1),
	(1005,34342,2,'2009-03-07','2009-03-05',1),
	(1005,44397,3.5,'2009-03-05','2009-03-05',3),
	(1006,34366,3.5,'2009-03-04','2009-03-04',3),
	(1006,61367,2,'2009-03-07',NULL,1),
	(1007,34368,3.5,'2009-03-05',NULL,3),
	(1008,34369,3.5,'2009-03-05','2009-03-05',3),
	(1009,54324,3.5,'2009-03-05',NULL,3),
	(1001,34366,3.5,'2009-03-04','2009-03-02',3);







3. 
SELECT MOVIE_TITLE, MOVIE_YEAR, MOVIE_COST FROM MOVIE WHERE MOVIE_TITLE LIKE '%hope%' ORDER BY MOVIE_TITLE ASC;

4. 
SELECT MOVIE_TITLE, MOVIE_YEAR, MOVIE_GENRE FROM MOVIE WHERE MOVIE_GENRE LIKE 'ACTION';

5.
SELECT MOVIE_NUM, MOVIE_TITLE, MOVIE_COST FROM MOVIE WHERE MOVIE_COST > 40;

6. 
SELECT MOVIE_NUM, MOVIE_TITLE, MOVIE_COST, MOVIE_GENRE FROM MOVIE WHERE 
(MOVIE_GENRE = 'ACTION' OR MOVIE_GENRE = 'COMEDY') AND MOVIE_COST < 50 ORDER BY MOVIE_GENRE; 

7.
SELECT MOVIE_NUM, CONCAT(MOVIE_TITLE,' (',MOVIE_YEAR,') ',MOVIE_GENRE) AS MOVIE_DESCRIPTION FROM MOVIE;


8.
SELECT MOVIE_GENRE, COUNT(MOVIE_GENRE) AS 'Number of Movies' FROM MOVIE GROUP BY MOVIE_GENRE;


9.
SELECT AVG(MOVIE_COST) FROM MOVIE;

10. 
SELECT MOVIE_GENRE,  AVG(MOVIE_COST) AS 'Average Cost' FROM MOVIE GROUP BY MOVIE_GENRE;

11. 
SELECT MOVIE.MOVIE_TITLE, MOVIE.MOVIE_GENRE, PRICE.PRICE_DESCRIPTION, PRICE.PRICE_RENTFEE, PRICE.PRICE_CODE FROM 
MOVIE, PRICE WHERE MOVIE.PRICE_CODE = PRICE.PRICE_CODE;

12. // NOT DONE
SELECT MOVIE_GENRE, AVG(PRICE_RENTFEE) AS "Average Rental Fee" FROM MOVIE, PRICE WHERE MOVIE.PRICE_CODE = PRICE.PRICE_CODE;

13.
SELECT MOVIE_TITLE, MOVIE_YEAR, MOVIE_COST / PRICE_RENTFEE AS "Breakeven Rental" FROM MOVIE, PRICE WHERE MOVIE.PRICE_CODE = PRICE.PRICE_CODE;

14.
SELECT MOVIE_TITLE, MOVIE_YEAR FROM MOVIE WHERE PRICE_CODE IS NOT NULL;

15.
SELECT MOVIE_TITLE, MOVIE_YEAR, MOVIE_COST FROM MOVIE WHERE MOVIE_COST BETWEEN 44.99 AND 49.99;

16.
SELECT MOVIE_TITLE, MOVIE_YEAR, PRICE_DESCRIPTION, PRICE_RENTFEE, MOVIE_GENRE 
FROM MOVIE, PRICE WHERE MOVIE.PRICE_CODE = PRICE.PRICE_CODE AND MOVIE_GENRE IN ('FAMILY', 'COMEDY', 'DRAMA');

17.
SELECT MIN(MEM_BALANCE) AS "Minimum Balance", MAX(MEM_BALANCE) AS "Maximum Balance", AVG(MEM_BALANCE) AS "Average Balance" FROM MEMBERSHIP WHERE MEM_NUM IN (SELECT MEM_NUM FROM RENTAL);

18. /broken
SELECT CONCAT(MEM_FNAME,' ',MEM_LNAME) AS MOVIE_DESCRIPTION, CONCAT(MEM_STREET,' ',MEM_CITY,' ',MEM_STATE,' ',MEM_ZIP) AS Membership Address FROM MOVIE;



21.
SELECT RENTAL.RENT_NUM, RENT_DATE, MOVIE_TITLE, DETAIL_FEE 
FROM RENTAL, DETAILRENTAL, VIDEO, MOVIE 
WHERE RENTAL.RENT_NUM = DETAILRENTAL.RENT_NUM 
AND DETAILRENTAL.VID_NUM = VIDEO.VID_NUM AND VIDEO.MOVIE_NUM = MOVIE.MOVIE_NUM 
AND DETAIL_RETURNDATE <= DETAIL_DUEDATE;

22.
SELECT MEMBERSHIP.MEM_NUM, MEM_LNAME, MEM_FNAME, SUM(DETAILRENTAL.DETAIL_FEE) 
AS "Rental Fee Revenue" FROM MEMBERSHIP, RENTAL, DETAILRENTAL 
WHERE MEMBERSHIP.MEM_NUM = RENTAL.MEM_NUM AND RENTAL.RENT_NUM = DETAILRENTAL.RENT_NUM 
GROUP BY MEMBERSHIP.MEM_NUM, MEM_LNAME, MEM_FNAME;


24. 
ALTER TABLE DETAILRENTAL ADD DETAIL_DAYSLATE DECIMAL(3,0);

25.
ALTER TABLE VIDEO ADD VID_STATUS VARCHAR(4) DEFAULT 'IN' NOT NULL CHECK (VID_STATUS IN ('IN', 'OUT', 'LOST'));

26.
UPDATE VIDEO SET VID_STATUS = 'OUT' WHERE VID_NUM IN (SELECT VID_NUM FROM DETAILRENTAL WHERE DETAIL_RETURNDATE IS NULL);

27. 
ALTER TABLE PRICE ADD PRICE_RENTDAYS DECIMAL(2,0) DEFAULT 3 NOT NULL;

28. 
UPDATE PRICE SET PRICE_RENTDAYS = 5 WHERE PRICE_CODE IN (1, 3); 
UPDATE PRICE SET PRICE_RENTDAYS = 7 WHERE PRICE_CODE = 4;






