
-- 4.1 Auction

CREATE TABLE Trading.Auction
(
    AuctionId INT IDENTITY(1,1) NOT NULL,

    ItemId INT NOT NULL,

    StartingPrice DECIMAL(12,2) NOT NULL,

    ReservePrice DECIMAL(12,2) NULL,

    BidIncrement DECIMAL(12,2) NOT NULL
        CONSTRAINT DF_Auction_BidIncrement DEFAULT 50.00,

    StartAt DATETIMEOFFSET NOT NULL,

    EndAt DATETIMEOFFSET NOT NULL,

    Status VARCHAR(20) NOT NULL
        CONSTRAINT DF_Auction_Status DEFAULT 'Draft',

    CONSTRAINT PK_Auction
        PRIMARY KEY (AuctionId),

    CONSTRAINT CK_Auction_StartingPrice
        CHECK (StartingPrice > 0),

    CONSTRAINT CK_Auction_ReservePrice
        CHECK
        (
            ReservePrice IS NULL
            OR ReservePrice >= StartingPrice
        ),

    CONSTRAINT CK_Auction_BidIncrement
        CHECK (BidIncrement > 0),

    CONSTRAINT CK_Auction_Dates
        CHECK (EndAt > StartAt),

    CONSTRAINT CK_Auction_Status
        CHECK
        (
            Status IN
            (
                'Draft',
                'Live',
                'Ended',
                'Cancelled'
            )
        )
);
GO
