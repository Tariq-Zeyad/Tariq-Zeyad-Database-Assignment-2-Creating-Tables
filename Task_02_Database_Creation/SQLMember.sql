
-- 1.3 Member

CREATE TABLE Core.Member
(
    Id UNIQUEIDENTIFIER NOT NULL
        CONSTRAINT DF_Member_Id DEFAULT NEWID(),

    FullName NVARCHAR(100) NOT NULL,

    Email VARCHAR(254) NOT NULL,

    Mobile VARCHAR(16) NOT NULL,

    NationalId VARCHAR(20) NOT NULL,

    BirthDate DATE NOT NULL,

    IsVerified BIT NOT NULL
        CONSTRAINT DF_Member_IsVerified DEFAULT 0,

    RegisteredAt DATETIME2(3) NOT NULL
        CONSTRAINT DF_Member_RegisteredAt
        DEFAULT SYSUTCDATETIME(),

    CityId INT NOT NULL,

    InvitedByMemberId UNIQUEIDENTIFIER NULL,

    CONSTRAINT PK_Member
        PRIMARY KEY (Id),

    CONSTRAINT UQ_Member_Email
        UNIQUE (Email),

    CONSTRAINT UQ_Member_NationalId
        UNIQUE (NationalId),

    CONSTRAINT CK_Member_Mobile
        CHECK
        (
            LEN(Mobile) BETWEEN 2 AND 16
            AND LEFT(Mobile, 1) = '+'
            AND SUBSTRING(Mobile, 2, 15)
                NOT LIKE '%[^0-9]%'
        ),

    CONSTRAINT CK_Member_NationalId
        CHECK
        (
            LEN(NationalId) BETWEEN 1 AND 20
            AND NationalId NOT LIKE '%[^A-Za-z0-9]%'
        ),

    CONSTRAINT CK_Member_NoSelfInvitation
        CHECK
        (
            InvitedByMemberId IS NULL
            OR InvitedByMemberId <> Id
        )
);

