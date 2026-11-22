
-- Enforce: one employee manages at most one warehouse

CREATE UNIQUE INDEX UX_Warehouse_ManagerEmployeeId
ON Logistics.Warehouse(ManagerEmployeeId)
WHERE ManagerEmployeeId IS NOT NULL;
GO
