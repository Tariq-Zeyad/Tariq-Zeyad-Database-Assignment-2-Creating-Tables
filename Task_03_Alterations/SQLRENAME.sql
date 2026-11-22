-- 1. Drop the CHECK constraint temporarily
ALTER TABLE Logistics.Warehouse
DROP CONSTRAINT CK_Warehouse_Capacity;
GO

-- 2. Rename the column
EXEC sys.sp_rename
    'Logistics.Warehouse.Capacity',
    'MaxItems',
    'COLUMN';
GO

-- 3. Recreate the CHECK constraint using the new column name
ALTER TABLE Logistics.Warehouse
ADD CONSTRAINT CK_Warehouse_MaxItems
CHECK (MaxItems > 0);
GO