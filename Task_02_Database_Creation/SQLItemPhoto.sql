
-- 3.3 ItemPhoto

CREATE TABLE Catalog.ItemPhoto
(
    ItemId INT NOT NULL,

    Position TINYINT NOT NULL,

    PhotoUrl VARCHAR(500) NOT NULL,

    IsMain BIT NOT NULL
        CONSTRAINT DF_ItemPhoto_IsMain DEFAULT 0,

    CONSTRAINT PK_ItemPhoto
        PRIMARY KEY (ItemId, Position),

    CONSTRAINT CK_ItemPhoto_Position
        CHECK (Position BETWEEN 1 AND 20)
);
GO
