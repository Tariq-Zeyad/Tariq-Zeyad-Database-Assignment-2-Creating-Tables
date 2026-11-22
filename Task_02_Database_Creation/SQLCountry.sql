
-- 1.1 Country

CREATE TABLE Core.Country
(
    CountryCode CHAR(2) NOT NULL,
    NameEn NVARCHAR(60) NOT NULL,
    NameAr NVARCHAR(60) NOT NULL,
    PhoneCode VARCHAR(5) NOT NULL,

    CONSTRAINT PK_Country
        PRIMARY KEY (CountryCode),

    CONSTRAINT CK_Country_CountryCode
        CHECK (CountryCode IN ('EG', 'SA', 'AE')),

    CONSTRAINT UQ_Country_NameEn
        UNIQUE (NameEn)
);
