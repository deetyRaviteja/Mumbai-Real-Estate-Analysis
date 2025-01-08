/*********** DML WORK ***********/


/***** TRANSFORMING THE DATA OF PREFERENCES COLUMN *****/

-- Transform the data of preference column and update with full form.

UPDATE MUMBAI_REAL_ESTATE_FD
SET PREFERENCE = CASE 
                      WHEN PREFERENCE = 'R' THEN 'Rent'
                      WHEN PREFERENCE = 'S' THEN 'Sale'
					  END;
					  
UPDATE MUMBAI_REAL_ESTATE_FD
SET PREFERENCE = 'Rent'
WHERE PREFERENCE IS NULL;


/***** TRANSFORMING THE DATA OF PROPERTY TYPE ID COLUMN *****/ 

-- Transform the data of Property_type_id column and update with reference number.

UPDATE MUMBAI_REAL_ESTATE_FD
SET PROPERTY_TYPE_ID = CASE
                            WHEN PROPERTY_TYPE_ID = 1 THEN 'PT1'
							WHEN PROPERTY_TYPE_ID = 2 THEN 'PT2'
							WHEN PROPERTY_TYPE_ID = 3 THEN 'PT3'
							WHEN PROPERTY_TYPE_ID = 4 THEN 'PT4'
							WHEN PROPERTY_TYPE_ID = 5 THEN 'PT5'
							WHEN PROPERTY_TYPE_ID = 6 THEN 'PT6'
							WHEN PROPERTY_TYPE_ID = 7 THEN 'PT7'
							END;


/***** TRANSFORMING DATA OF FURNISH ID COLUMN *****/ 

-- Transform the data of furnish_id column and update with reference number.

UPDATE MUMBAI_REAL_ESTATE_FD
SET FURNISH_ID = CASE
					WHEN FURNISH_ID = 1 THEN 'F1'
					WHEN FURNISH_ID = 2 THEN 'F2'
					WHEN FURNISH_ID = 3 THEN 'F3'
					END;


/****** TRANSFORMING THE DATA OF NUMBERS OF BEDROOMS COLUMN ******/

/* 1) Transforming the data of Numbers of Bedroom column and replacing with only BHK'S, Studio Apartments etc. 

   2) Removing the addtional data in this column [EX:- Flat,Area name etc].

   3) Updateing the data of (EX:- "Studio Apartments / 1 RK Flats in mantralaya") to "Studio Apartments"  
*/

UPDATE MUMBAI_REAL_ESTATE_FD
SET NUMBERS_OF_BEDROOM = SUBSTR(NUMBERS_OF_BEDROOM,1,17)
WHERE NUMBERS_OF_BEDROOM like '%Studio Apartments%';

-- Updateing the data of "2 BHK Flat in santrcruz west" to "number BHK".

UPDATE MUMBAI_REAL_ESTATE_FD
SET NUMBERS_OF_BEDROOM = SUBSTR(NUMBERS_OF_BEDROOM,1,5)
WHERE NUMBERS_OF_BEDROOM like '%BHK%';

-- Updateing the data of "50 BH" to "BHK"

UPDATE MUMBAI_REAL_ESTATE_FD
SET NUMBERS_OF_BEDROOM = REPLACE(NUMBERS_OF_BEDROOM,'BH','BHK')
WHERE NUMBERS_OF_BEDROOM like '%BH%';

UPDATE MUMBAI_REAL_ESTATE_FD
SET NUMBERS_OF_BEDROOM = SUBSTR(NUMBERS_OF_BEDROOM,1,5)
WHERE NUMBERS_OF_BEDROOM like '%BHKK%';

-- Updateing the data of "(EX: 1 Bedroom House in Motilal Nagar 1)" to "1BHK".

UPDATE MUMBAI_REAL_ESTATE_FD
SET NUMBERS_OF_BEDROOM = SUBSTR(NUMBERS_OF_BEDROOM,1,10)
WHERE NUMBERS_OF_BEDROOM like '%Bedroom%';

UPDATE MUMBAI_REAL_ESTATE_FD
SET NUMBERS_OF_BEDROOM = REPLACE(NUMBERS_OF_BEDROOM,'Bedroom','BHK')
WHERE NUMBERS_OF_BEDROOM like '%Bedroom%';

-- Updateing the data of "Residential land / Plot in Uran" to "Not Constructed".

UPDATE MUMBAI_REAL_ESTATE_FD
SET NUMBERS_OF_BEDROOM = REPLACE(NUMBERS_OF_BEDROOM,'Residential land','Not Constructed')
WHERE NUMBERS_OF_BEDROOM like '%Residential land%';

UPDATE MUMBAI_REAL_ESTATE_FD
SET NUMBERS_OF_BEDROOM = SUBSTR(NUMBERS_OF_BEDROOM,1,15)
WHERE NUMBERS_OF_BEDROOM like '%Not Constructed%'; 

-- Updateing the data of "Flat in Wagle Estate" to "2 BHK".

UPDATE MUMBAI_REAL_ESTATE_FD
SET NUMBERS_OF_BEDROOM = REPLACE(NUMBERS_OF_BEDROOM,'Flat in Wagle Estate','2 BHK')
WHERE NUMBERS_OF_BEDROOM like '%Flat%';

-- Updateing the data of "Studio Apartments" to "1 BHK".

UPDATE MUMBAI_REAL_ESTATE_FD
SET NUMBERS_OF_BEDROOM = REPLACE(NUMBERS_OF_BEDROOM,'Studio Apartments','1 BHK')
WHERE NUMBERS_OF_BEDROOM = 'Studio Apartments';


/***** TRANSFORMING THE DATA OF CITY COLUMN ******/

-- CONSIDERING THE CITY NAME ONLY. & REMOVING THE OTHER INFORMATION OF CITY.

-- 1) CONSIDERING THANE CITY ONLY.

UPDATE MUMBAI_REAL_ESTATE_FD
SET CITY = SUBSTR(CITY,31,5)
WHERE CITY like '%Thane%';

-- 2) CONSIDERING Mumbai Harbour CITY ONLY.

UPDATE MUMBAI_REAL_ESTATE_FD
SET CITY = SUBSTR(CITY,30,14)
WHERE CITY like '%Mumbai Harbour%';

-- 3) CONSIDERING NAVI MUMBAI CITY ONLY.

UPDATE MUMBAI_REAL_ESTATE_FD
SET CITY = SUBSTR(CITY,30,11)
WHERE CITY like '%Navi Mumbai%';

-- 4) CONSIDERING CENTRAL MUMBAI SUBURBS CITY ONLY.

UPDATE MUMBAI_REAL_ESTATE_FD
SET CITY = SUBSTR(CITY,30,22)
WHERE CITY like '%Central Mumbai suburbs%';

-- 5) CONSIDERING MUMBAI SOUTH WEST CITY ONLY.

UPDATE MUMBAI_REAL_ESTATE_FD
SET CITY = SUBSTR(CITY,30,17)
WHERE CITY like '%Mumbai South West%';

-- 6)  CONSIDERING SOUTH MUMBAI CITY ONLY.

UPDATE MUMBAI_REAL_ESTATE_FD
SET CITY = SUBSTR(CITY,30,12)
WHERE CITY like '%South Mumbai%';

-- 7)  CONSIDERING MIRA ROAD CITY ONLY.
 
UPDATE MUMBAI_REAL_ESTATE_FD
SET CITY = SUBSTR(CITY,31,9)
WHERE CITY like '%Mira Road%';

-- 8) REPLACEING MUMBAI TO Mumbai ANDHERI DAHISAR CITY.

UPDATE MUMBAI_REAL_ESTATE_FD
SET CITY = REPLACE(CITY,'Mumba','Mumbai Andheri Dahisar')
WHERE CITY = 'Mumba';

-- 9) UPDATEING BLANK CELL TO MUMBAI BEYOND THANE.

UPDATE MUMBAI_REAL_ESTATE_FD
SET CITY = 'Mumbai Beyond Thane'
WHERE CITY = '';


********************************** DIMENSION TABLE DATA TRANSFORMATION **********************************************

/* DIM TABLE ARE 

1. dim property type
2. dim furnish  */


/* TRANFORMING THE DATA OF DIM PROPERTY TYPE TABLE. */

-- updateing the id column with reference number.

UPDATE DIM_PROPERTY_TYPE
SET IDS = CASE
				WHEN ID = 1 THEN 'PT1'
				WHEN ID = 2 THEN 'PT2'
				WHEN ID = 3 THEN 'PT3'
				WHEN ID = 4 THEN 'PT4'
				WHEN ID = 5 THEN 'PT5'
				WHEN ID = 6 THEN 'PT6'
				WHEN ID = 7 THEN 'PT7'
				END;


/*** TRANFORMING THE DATA OF FURNISH TABLE.  *****/

-- updateing the id column with reference number.

UPDATE DIM_FURNISH SET IDS = CASE
                                  WHEN ID = 1 THEN 'F1'
			                      WHEN ID = 2 THEN 'F2'
			                      WHEN ID = 3 THEN 'F3'
			                      END;