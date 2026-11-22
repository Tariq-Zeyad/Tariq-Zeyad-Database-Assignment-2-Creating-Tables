
-- 3.8 Update Auction Status

ALTER TABLE Trading.Auction
DROP CONSTRAINT CK_Auction_Status;
GO

ALTER TABLE Trading.Auction
ADD CONSTRAINT CK_Auction_Status
CHECK
(
    Status IN
    (
        'Draft',
        'PendingReview',
        'Live',
        'Ended',
        'Cancelled'
    )
);
GO

ALTER TABLE Trading.Auction
DROP CONSTRAINT DF_Auction_Status;
GO

ALTER TABLE Trading.Auction
ADD CONSTRAINT DF_Auction_Status
DEFAULT 'PendingReview' FOR Status;
GO
