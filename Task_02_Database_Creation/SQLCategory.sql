
-- 3.1 Category

CREATE TABLE Catalog.Category
(
    CategoryCode INT NOT NULL,

    ParentCategoryCode INT NULL,

    NameEn NVARCHAR(50) NOT NULL,

    NameAr NVARCHAR(50) NULL,

    Commission DECIMAL(5,2) NOT NULL,

    CONSTRAINT PK_Category
        PRIMARY KEY (CategoryCode),

    CONSTRAINT UQ_Category_NameEn
        UNIQUE (NameEn),

    CONSTRAINT CK_Category_Commission
        CHECK (Commission BETWEEN 0 AND 30)
);
GO
