
-- 3.7 Change maximum commission to 25%

ALTER TABLE Catalog.Category
DROP CONSTRAINT CK_Category_Commission;
GO

ALTER TABLE Catalog.Category
ADD CONSTRAINT CK_Category_Commission
CHECK (Commission BETWEEN 0 AND 25);
GO
 