
-- 3.2 Add AppLanguage

ALTER TABLE Core.Member
ADD AppLanguage CHAR(2) NOT NULL
    CONSTRAINT DF_Member_AppLanguage DEFAULT ('ar')
    CONSTRAINT CK_Member_AppLanguage
    CHECK (AppLanguage IN ('ar', 'en'));
GO
