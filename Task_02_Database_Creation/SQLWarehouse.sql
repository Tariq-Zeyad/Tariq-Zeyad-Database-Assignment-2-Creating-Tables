
-- 2.1 Warehouse

CREATE TABLE Logistics.Warehouse
(
    WarehouseId BIGINT IDENTITY(1,1) NOT NULL,

    WarehouseName NVARCHAR(80) NOT NULL,

    Capacity INT NOT NULL,

    CityId INT NOT NULL,

    Latitude FLOAT NOT NULL,

    Longitude FLOAT NOT NULL,

    ManagerEmployeeId UNIQUEIDENTIFIER NULL,

    ManagerStartedAt DATE NULL,

    CONSTRAINT PK_Warehouse
        PRIMARY KEY (WarehouseId),

    CONSTRAINT UQ_Warehouse_WarehouseName
        UNIQUE (WarehouseName),

    CONSTRAINT CK_Warehouse_Capacity
        CHECK (Capacity > 0),

    CONSTRAINT CK_Warehouse_Latitude
        CHECK (Latitude BETWEEN -90 AND 90),

    CONSTRAINT CK_Warehouse_Longitude
        CHECK (Longitude BETWEEN -180 AND 180),

    CONSTRAINT CK_Warehouse_ManagerDate
        CHECK
        (
            (ManagerEmployeeId IS NULL AND ManagerStartedAt IS NULL)
            OR
            (ManagerEmployeeId IS NOT NULL AND ManagerStartedAt IS NOT NULL)
        )
);
GO
