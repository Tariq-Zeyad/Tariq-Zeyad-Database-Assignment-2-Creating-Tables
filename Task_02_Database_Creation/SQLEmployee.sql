
-- 2.2 Employee

CREATE TABLE Logistics.Employee
(
    MemberId UNIQUEIDENTIFIER NOT NULL,

    WarehouseId BIGINT NOT NULL,

    CONSTRAINT PK_Employee
        PRIMARY KEY (MemberId)
);

