
-- 3.2 Item

CREATE TABLE Catalog.Item
(
    ItemId INT IDENTITY(1,1) NOT NULL,

    SellerMemberId UNIQUEIDENTIFIER NOT NULL,

    InspectorMemberId UNIQUEIDENTIFIER NOT NULL,

    CategoryCode INT NOT NULL,

    WarehouseId BIGINT NULL,

    Title NVARCHAR(150) NOT NULL,

    Description NVARCHAR(MAX) NULL,

    ConditionScore TINYINT NOT NULL,

    Specifications NVARCHAR(MAX) NOT NULL,

    ListedAt DATETIME2(3) NOT NULL
        CONSTRAINT DF_Item_ListedAt
        DEFAULT SYSUTCDATETIME(),

    CONSTRAINT PK_Item
        PRIMARY KEY (ItemId),

    CONSTRAINT CK_Item_ConditionScore
        CHECK (ConditionScore BETWEEN 1 AND 10),

    CONSTRAINT CK_Item_Specifications
        CHECK (ISJSON(Specifications) = 1),

    CONSTRAINT CK_Item_SellerInspector
        CHECK (SellerMemberId <> InspectorMemberId)
);
GO
