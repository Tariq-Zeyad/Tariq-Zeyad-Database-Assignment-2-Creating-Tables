
-- 3.3 Add IsFeatured

ALTER TABLE Catalog.Item
ADD IsFeatured BIT NOT NULL
    CONSTRAINT DF_Item_IsFeatured DEFAULT 0
    WITH VALUES;
GO
