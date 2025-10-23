--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Model2.DM1
--
-- Date Created : Thursday, October 02, 2025 16:46:50
-- Target DBMS : Snowflake
--

-- 
-- TABLE: DimCategory 
--

CREATE TABLE DimCategory(
    Category_Key     INT             NOT NULL,
    Category_ID      INT,
    Category_Name    VARCHAR(100),
    CONSTRAINT PK11 PRIMARY KEY (Category_Key) 
)
;



-- 
-- TABLE: DimCustomer 
--

CREATE TABLE DimCustomer(
    Customer_Key    INT             NOT NULL,
    Customer_ID     INT,
    First_Name      VARCHAR(100),
    Last_Name       VARCHAR(100),
    Email           VARCHAR(255),
    Address         VARCHAR(255),
    City            VARCHAR(100),
    Join_Date       DATE,
    CONSTRAINT PK8 PRIMARY KEY (Customer_Key) 
)
;



-- 
-- TABLE: DimDate 
--

CREATE TABLE DimDate(
    Date_Key     INT     NOT NULL,
    Full_Date    DATE,
    Day          INT,
    Week         INT,
    Month        INT,
    Quarter      INT,
    Year         INT,
    CONSTRAINT PK4 PRIMARY KEY (Date_Key) 
)
;



-- 
-- TABLE: DimMovie 
--

CREATE TABLE DimMovie(
    Movie_Key       INT             NOT NULL,
    Movie_ID        INT,
    Title           VARCHAR(255),
    Release_Year    INT,
    Language        VARCHAR(50),
    Rating          VARCHAR(10),
    Length          INT,
    CONSTRAINT PK7 PRIMARY KEY (Movie_Key) 
)
;



-- 
-- TABLE: DimStaff 
--

CREATE TABLE DimStaff(
    Staff_Key     INT             NOT NULL,
    Staff_ID      INT,
    First_Name    VARCHAR(100),
    Last_Name     VARCHAR(100),
    Store_ID      INT,
    CONSTRAINT PK10 PRIMARY KEY (Staff_Key) 
)
;



-- 
-- TABLE: DimStore 
--

CREATE TABLE DimStore(
    Store_Key    INT             NOT NULL,
    Store_ID     INT,
    Address      VARCHAR(255),
    City         VARCHAR(100),
    Country      VARCHAR(100),
    CONSTRAINT PK9 PRIMARY KEY (Store_Key) 
)
;



-- 
-- TABLE: FactRental 
--

CREATE TABLE FactRental(
    Rental_Key      INT               NOT NULL,
    Movie_Key       INTEGER           NOT NULL,
    Date_Key        INTEGER           NOT NULL,
    Category_Key    INTEGER           NOT NULL,
    Store_Key       INTEGER           NOT NULL,
    Customer_Key    INTEGER           NOT NULL,
    Staff_Key       INTEGER           NOT NULL,
    Rental_Count    INT,
    Revenue         DECIMAL(10, 2),
    Days_Rented     INT,
    CONSTRAINT PK13 PRIMARY KEY (Movie_Key, Date_Key, Category_Key, Store_Key, Customer_Key, Staff_Key, Rental_Key) 
)
;



-- 
-- TABLE: FactRental 
--

ALTER TABLE FactRental ADD CONSTRAINT RefDimDate2 
    FOREIGN KEY (Date_Key)
    REFERENCES DimDate(Date_Key)
;

ALTER TABLE FactRental ADD CONSTRAINT RefDimCategory3 
    FOREIGN KEY (Category_Key)
    REFERENCES DimCategory(Category_Key)
;

ALTER TABLE FactRental ADD CONSTRAINT RefDimStore4 
    FOREIGN KEY (Store_Key)
    REFERENCES DimStore(Store_Key)
;

ALTER TABLE FactRental ADD CONSTRAINT RefDimCustomer5 
    FOREIGN KEY (Customer_Key)
    REFERENCES DimCustomer(Customer_Key)
;

ALTER TABLE FactRental ADD CONSTRAINT RefDimStaff6 
    FOREIGN KEY (Staff_Key)
    REFERENCES DimStaff(Staff_Key)
;

ALTER TABLE FactRental ADD CONSTRAINT RefDimMovie1 
    FOREIGN KEY (Movie_Key)
    REFERENCES DimMovie(Movie_Key)
;


