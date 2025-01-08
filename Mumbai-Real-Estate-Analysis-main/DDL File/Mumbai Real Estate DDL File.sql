******** DDL Work **********


-- CREATING TABLE FOR MUMBAI REAL ESTATE FINAL DATA (FD).

-- Final Table For Analysis.

CREATE TABLE MUMBAI_REAL_ESTATE_FD
                                  (       
                                   ROW_NUMBER int,
                                   PREFERENCE varchar,
	                               PROPERTY_TYPE__U varchar,
	                               FURNISH varchar,
	                               MIN_PRICE int,
	                               MAX_PRICE int,
	                               PRICE varchar,
	                               PROP_HEADING varchar,
	                               LOCATION varchar,
								   TOTAL_PRICE INT,
								   BEDROOMS INT
								  );
 
 
*** NOTE ***

-- After creating a mumbai_real_Estate_fd table then run the below code complusory.

-- ALTERING THE COLUMN NAME.

-- Rename the Property_type__u to Property_type_id.

ALTER TABLE MUMBAI_REAL_ESTATE_FD RENAME COLUMN PROPERTY_TYPE__U TO PROPERTY_TYPE_ID;

-- Rename the Prop_heading to property_heading.

ALTER TABLE MUMBAI_REAL_ESTATE_FD RENAME COLUMN PROP_HEADING TO NUMBERS_OF_BEDROOM;

-- Rename the location to city.

ALTER TABLE MUMBAI_REAL_ESTATE_FD RENAME COLUMN LOCATION TO CITY;


******* CREATEING DIMENSION TABLES. *******


-- CREATING DIM FURNISH TABLE. (DIMENSION FURNISH TABLE)

CREATE OR REPLACE TABLE DIM_FURNISH (
	                                  LABEL VARCHAR, 
	                                  ID VARCHAR 
                                    );
									
									
-- CREATING DIM PROPERTY TYPE TABLE. (DIMENSION PROPERTY TYPE TABLE)

CREATE OR REPLACE TABLE DIM_PROPERTY_TYPE (
	                                        LABEL VARCHAR,
	                                        ID VARCHAR
                                          );


*** NOTE ***

-- After creating a dim_furnish & dimension_property_type table then run the below code complusory.

-- ALTERING THE COLUMN NAME.

-- Rename the Furnish to Furnish_id.

ALTER TABLE MUMBAI_REAL_ESTATE_FD RENAME COLUMN FURNISH TO FURNISH_ID;