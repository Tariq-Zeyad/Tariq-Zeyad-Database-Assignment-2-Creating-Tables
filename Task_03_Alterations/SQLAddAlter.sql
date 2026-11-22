
-- Add all Foreign Keys

-- Core relationships

ALTER TABLE Core.City
ADD CONSTRAINT FK_City_Country
FOREIGN KEY (CountryCode)
REFERENCES Core.Country(CountryCode);
GO

ALTER TABLE Core.Member
ADD CONSTRAINT FK_Member_City
FOREIGN KEY (CityId)
REFERENCES Core.City(CityId);
GO

ALTER TABLE Core.Member
ADD CONSTRAINT FK_Member_InvitedBy
FOREIGN KEY (InvitedByMemberId)
REFERENCES Core.Member(Id);
GO

ALTER TABLE Core.Wallet
ADD CONSTRAINT FK_Wallet_Member
FOREIGN KEY (MemberId)
REFERENCES Core.Member(Id);
GO


-- Logistics relationships

ALTER TABLE Logistics.Employee
ADD CONSTRAINT FK_Employee_Member
FOREIGN KEY (MemberId)
REFERENCES Core.Member(Id);
GO

ALTER TABLE Logistics.Employee
ADD CONSTRAINT FK_Employee_Warehouse
FOREIGN KEY (WarehouseId)
REFERENCES Logistics.Warehouse(WarehouseId);
GO

ALTER TABLE Logistics.Warehouse
ADD CONSTRAINT FK_Warehouse_City
FOREIGN KEY (CityId)
REFERENCES Core.City(CityId);
GO

ALTER TABLE Logistics.Warehouse
ADD CONSTRAINT FK_Warehouse_Manager
FOREIGN KEY (ManagerEmployeeId)
REFERENCES Logistics.Employee(MemberId);
GO


-- Catalog relationships

ALTER TABLE Catalog.Category
ADD CONSTRAINT FK_Category_ParentCategory
FOREIGN KEY (ParentCategoryCode)
REFERENCES Catalog.Category(CategoryCode);
GO

ALTER TABLE Catalog.Item
ADD CONSTRAINT FK_Item_Seller
FOREIGN KEY (SellerMemberId)
REFERENCES Core.Member(Id);
GO

ALTER TABLE Catalog.Item
ADD CONSTRAINT FK_Item_Inspector
FOREIGN KEY (InspectorMemberId)
REFERENCES Logistics.Employee(MemberId);
GO

ALTER TABLE Catalog.Item
ADD CONSTRAINT FK_Item_Category
FOREIGN KEY (CategoryCode)
REFERENCES Catalog.Category(CategoryCode);
GO

ALTER TABLE Catalog.Item
ADD CONSTRAINT FK_Item_Warehouse
FOREIGN KEY (WarehouseId)
REFERENCES Logistics.Warehouse(WarehouseId);
GO

ALTER TABLE Catalog.ItemPhoto
ADD CONSTRAINT FK_ItemPhoto_Item
FOREIGN KEY (ItemId)
REFERENCES Catalog.Item(ItemId)
ON DELETE CASCADE;
GO


-- Trading relationships

ALTER TABLE Trading.Auction
ADD CONSTRAINT FK_Auction_Item
FOREIGN KEY (ItemId)
REFERENCES Catalog.Item(ItemId);
GO

ALTER TABLE Trading.Bid
ADD CONSTRAINT FK_Bid_Auction
FOREIGN KEY (AuctionId)
REFERENCES Trading.Auction(AuctionId);
GO

ALTER TABLE Trading.Bid
ADD CONSTRAINT FK_Bid_Member
FOREIGN KEY (MemberId)
REFERENCES Core.Member(Id);
GO

ALTER TABLE Trading.AuctionFollow
ADD CONSTRAINT FK_AuctionFollow_Member
FOREIGN KEY (MemberId)
REFERENCES Core.Member(Id);
GO

ALTER TABLE Trading.AuctionFollow
ADD CONSTRAINT FK_AuctionFollow_Auction
FOREIGN KEY (AuctionId)
REFERENCES Trading.Auction(AuctionId);
GO
