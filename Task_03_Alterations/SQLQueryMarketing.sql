
-- 3.12 Create Marketing schema

CREATE SCHEMA Marketing;
GO

-- Transfer AuctionFollow

ALTER SCHEMA Marketing
TRANSFER Trading.AuctionFollow;
GO
