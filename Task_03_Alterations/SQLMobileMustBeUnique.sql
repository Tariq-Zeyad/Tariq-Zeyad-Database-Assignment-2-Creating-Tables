
-- 3.10 Mobile must be unique

ALTER TABLE Core.Member
ADD CONSTRAINT UQ_Member_Mobile
UNIQUE (Mobile);
GO
