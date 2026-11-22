USE BidNile;
GO

SET NOCOUNT ON;
SET XACT_ABORT ON;

BEGIN TRY
    BEGIN TRANSACTION;

    --------------------------------------------------
    -- 1. COUNTRIES
    --------------------------------------------------
    INSERT INTO Core.Country
        (CountryCode, NameEn, NameAr, PhoneCode)
    VALUES
        ('EG', N'Egypt', N'ãÕÑ', '+20'),
        ('SA', N'Saudi Arabia', N'ÇáÓÚæÏíÉ', '+966'),
        ('AE', N'United Arab Emirates', N'ÇáÅãÇÑÇÊ', '+971');

    --------------------------------------------------
    -- 2. CITIES
    --------------------------------------------------
    INSERT INTO Core.City (Name, CountryCode)
    VALUES
        (N'Cairo', 'EG'),
        (N'Riyadh', 'SA'),
        (N'Dubai', 'AE');

    --------------------------------------------------
    -- 3. MEMBERS
    --------------------------------------------------
    DECLARE @Member1 UNIQUEIDENTIFIER = '11111111-1111-1111-1111-111111111111';
    DECLARE @Member2 UNIQUEIDENTIFIER = '22222222-2222-2222-2222-222222222222';
    DECLARE @Member3 UNIQUEIDENTIFIER = '33333333-3333-3333-3333-333333333333';
    DECLARE @Member4 UNIQUEIDENTIFIER = '44444444-4444-4444-4444-444444444444';

    INSERT INTO Core.Member
    (
        Id, FullName, Email, Mobile, NationalId,
        BirthDate, IsVerified, RegisteredAt,
        CityId, InvitedByMemberId, AppLanguage
    )
    VALUES
    (
        @Member1, N'Ahmed Hassan', 'ahmed@example.com',
        '+201001112233', 'EG123456789',
        '1995-04-12', 1, SYSUTCDATETIME(),
        1, NULL, 'ar'
    ),
    (
        @Member2, N'Omar Ali', 'omar@example.com',
        '+966501112233', 'SA123456789',
        '1990-08-20', 1, SYSUTCDATETIME(),
        2, @Member1, 'ar'
    ),
    (
        @Member3, N'Sara Mohamed', 'sara@example.com',
        '+971501112233', 'AE123456789',
        '1993-02-15', 0, SYSUTCDATETIME(),
        3, @Member1, 'en'
    ),
    (
        @Member4, N'Yousef Khaled', 'yousef@example.com',
        '+201101112233', 'EG987654321',
        '1998-11-05', 0, SYSUTCDATETIME(),
        1, @Member2, 'ar'
    );

    --------------------------------------------------
    -- 4. WALLETS
    --------------------------------------------------
    INSERT INTO Core.Wallet
        (MemberId, Balance, HeldAmount, Currency, UpdatedAt)
    VALUES
        (@Member1, 5000.00, 500.00, 'EGP', SYSUTCDATETIME()),
        (@Member2, 8000.00, 1000.00, 'SAR', SYSUTCDATETIME()),
        (@Member3, 3000.00, 0.00, 'AED', SYSUTCDATETIME()),
        (@Member4, 2500.00, 250.00, 'EGP', SYSUTCDATETIME());

    --------------------------------------------------
    -- 5. WAREHOUSES
    -- Manager is assigned after Employees are created
    --------------------------------------------------
    INSERT INTO Logistics.Warehouse
    (
        WarehouseName, MaxItems, CityId,
        Latitude, Longitude,
        ManagerEmployeeId, ManagerStartedAt
    )
    VALUES
    (
        N'Cairo Main Warehouse', 5000, 1,
        30.0444, 31.2357, NULL, NULL
    ),
    (
        N'Riyadh Central Warehouse', 3000, 2,
        24.7136, 46.6753, NULL, NULL
    );

    --------------------------------------------------
    -- 6. EMPLOYEES
    --------------------------------------------------
    INSERT INTO Logistics.Employee (MemberId, WarehouseId)
    VALUES
        (@Member2, 1),
        (@Member3, 2);

    --------------------------------------------------
    -- 7. ASSIGN WAREHOUSE MANAGERS
    --------------------------------------------------
    UPDATE Logistics.Warehouse
    SET
        ManagerEmployeeId = @Member2,
        ManagerStartedAt = '2025-01-01'
    WHERE WarehouseId = 1;

    UPDATE Logistics.Warehouse
    SET
        ManagerEmployeeId = @Member3,
        ManagerStartedAt = '2025-02-01'
    WHERE WarehouseId = 2;

    --------------------------------------------------
    -- 8. CATEGORIES
    --------------------------------------------------
    INSERT INTO Catalog.Category
        (CategoryCode, ParentCategoryCode, NameEn, NameAr, Commission)
    VALUES
        (100, NULL, N'Electronics', N'ÅáßÊÑæäíÇÊ', 10.00),
        (110, 100, N'Mobile Phones', N'åæÇÊÝ ãÍãæáÉ', 12.50),
        (200, NULL, N'Furniture', N'ÃËÇË', 8.00);

    --------------------------------------------------
    -- 9. ITEMS
    --------------------------------------------------
    INSERT INTO Catalog.Item
    (
        SellerMemberId, InspectorMemberId, CategoryCode,
        WarehouseId, Title, Description,
        ConditionScore, Specifications, ListedAt, IsFeatured
    )
    VALUES
    (
        @Member1, @Member2, 110,
        1, N'Samsung Galaxy Phone',
        N'Used smartphone in excellent condition',
        9, N'{"brand":"Samsung","storage":"256GB","color":"Black"}',
        SYSUTCDATETIME(), 1
    ),
    (
        @Member4, @Member3, 200,
        2, N'Wooden Office Desk',
        N'High quality wooden office desk',
        8, N'{"material":"Wood","color":"Brown","width":120}',
        SYSUTCDATETIME(), 0
    ),
    (
        @Member1, @Member2, 100,
        1, N'Wireless Headphones',
        N'Wireless headphones with noise cancellation',
        10, N'{"brand":"Sony","type":"Wireless","noiseCancellation":true}',
        SYSUTCDATETIME(), 1
    );

    --------------------------------------------------
    -- 10. ITEM PHOTOS
    --------------------------------------------------
    INSERT INTO Catalog.ItemPhoto
        (ItemId, Position, PhotoUrl, IsMain)
    VALUES
        (1, 1, 'https://example.com/images/phone-main.jpg', 1),
        (1, 2, 'https://example.com/images/phone-side.jpg', 0),
        (2, 1, 'https://example.com/images/desk-main.jpg', 1),
        (3, 1, 'https://example.com/images/headphones-main.jpg', 1);

    --------------------------------------------------
    -- 11. AUCTIONS
    --------------------------------------------------
    INSERT INTO Trading.Auction
    (
        ItemId, StartingPrice, ReservePrice, BidIncrement,
        StartAt, EndAt, Status, BuyNowPrice
    )
    VALUES
    (
        1, 1000.00, 1500.00, 50.00,
        '2026-11-20T10:00:00+02:00',
        '2026-12-01T10:00:00+02:00',
        'Live', 2500.00
    ),
    (
        2, 500.00, 700.00, 25.00,
        '2026-11-20T12:00:00+02:00',
        '2026-12-05T12:00:00+02:00',
        'Live', 1200.00
    ),
    (
        3, 300.00, NULL, 20.00,
        '2026-11-21T09:00:00+02:00',
        '2026-12-03T09:00:00+02:00',
        'PendingReview', 800.00
    );

    --------------------------------------------------
    -- 12. BIDS
    --------------------------------------------------
    INSERT INTO Trading.Bid
    (
        AuctionId, MemberId, Amount, PlacedAt, DeviceIp
    )
    VALUES
    (1, @Member4, 1100.00, '2026-11-21T10:00:00', '192.168.1.10'),
    (1, @Member3, 1200.00, '2026-11-21T11:00:00', '192.168.1.11'),
    (2, @Member1, 550.00, '2026-11-21T13:00:00', '192.168.1.12'),
    (3, @Member4, 350.00, '2026-11-22T09:30:00', '2001:db8::1');

    --------------------------------------------------
    -- 13. AUCTION FOLLOW
    --------------------------------------------------
    INSERT INTO Marketing.AuctionFollow
        (MemberId, AuctionId, FollowedAt)
    VALUES
    (@Member1, 1, SYSUTCDATETIME()),
    (@Member3, 1, SYSUTCDATETIME()),
    (@Member2, 2, SYSUTCDATETIME()),
    (@Member4, 3, SYSUTCDATETIME());

    COMMIT TRANSACTION;

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    THROW;
END CATCH;
GO
