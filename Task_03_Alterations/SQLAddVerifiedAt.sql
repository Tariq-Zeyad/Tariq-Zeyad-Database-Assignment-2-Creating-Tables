
-- 3.11 Add VerifiedAt and remove IsVerified

ALTER TABLE Core.Member
ADD VerifiedAt DATETIME2(3) NULL;
GO

ALTER TABLE Core.Member
DROP CONSTRAINT DF_Member_IsVerified;
GO

ALTER TABLE Core.Member
DROP COLUMN IsVerified;
GO
