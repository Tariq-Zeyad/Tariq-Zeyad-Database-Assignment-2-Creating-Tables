
-- 4.3 AuctionFollow

CREATE TABLE Trading.AuctionFollow
(
    MemberId UNIQUEIDENTIFIER NOT NULL,

    AuctionId INT NOT NULL,

    FollowedAt DATETIME2(3) NOT NULL
        CONSTRAINT DF_AuctionFollow_FollowedAt
        DEFAULT SYSUTCDATETIME(),

    CONSTRAINT PK_AuctionFollow
        PRIMARY KEY (MemberId, AuctionId)
);
GO
