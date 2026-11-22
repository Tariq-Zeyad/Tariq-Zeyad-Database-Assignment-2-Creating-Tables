-- 3.6 Change MaxItems to SMALLINT

-- 1. Drop the existing CHECK constraint
ALTER TABLE Logistics.Warehouse
DROP CONSTRAINT CK_Warehouse_MaxItems;
GO

-- 2. Change the column data type
ALTER TABLE Logistics.Warehouse
ALTER COLUMN MaxItems SMALLINT NOT NULL;
GO

-- 3. Recreate the CHECK constraint with the new range
ALTER TABLE Logistics.Warehouse
ADD CONSTRAINT CK_Warehouse_MaxItems
CHECK (MaxItems BETWEEN 1 AND 30000);
GO