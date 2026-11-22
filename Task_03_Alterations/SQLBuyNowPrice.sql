
-- 3.9 Add BuyNowPrice

ALTER TABLE Trading.Auction
ADD BuyNowPrice DECIMAL(12,2) NULL;
GO

ALTER TABLE Trading.Auction
WITH CHECK
ADD CONSTRAINT CK_Auction_BuyNowPrice
CHECK
(
    BuyNowPrice IS NULL
    OR BuyNowPrice > StartingPrice
);
GO
