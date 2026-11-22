
-- =========================================================
-- 4.2 Bid
-- =========================================================

CREATE TABLE Trading.Bid
(
    BidId BIGINT IDENTITY(1,1) NOT NULL,

    AuctionId INT NOT NULL,

    MemberId UNIQUEIDENTIFIER NOT NULL,

    Amount DECIMAL(12,2) NOT NULL,

    PlacedAt DATETIME2(3) NOT NULL
        CONSTRAINT DF_Bid_PlacedAt
        DEFAULT SYSUTCDATETIME(),

    IpAddress VARCHAR(45) NOT NULL,

    CONSTRAINT PK_Bid
        PRIMARY KEY (BidId),

    CONSTRAINT UQ_Bid_Auction_Amount
        UNIQUE (AuctionId, Amount),

    CONSTRAINT CK_Bid_Amount
        CHECK (Amount > 0)
);
GO
