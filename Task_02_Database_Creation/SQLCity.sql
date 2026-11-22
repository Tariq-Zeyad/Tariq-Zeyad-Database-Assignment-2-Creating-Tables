
-- 1.2 City

CREATE TABLE Core.City
(
    CityId INT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(60) NOT NULL,
    CountryCode CHAR(2) NOT NULL,

    CONSTRAINT PK_City
        PRIMARY KEY (CityId),

    CONSTRAINT UQ_City_Name_CountryCode
        UNIQUE (Name, CountryCode)
);

