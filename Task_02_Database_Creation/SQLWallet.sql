
-- 1.4 Wallet

CREATE TABLE Core.Wallet
(
    WalletId INT IDENTITY(1,1) NOT NULL,

    MemberId UNIQUEIDENTIFIER NOT NULL,

    Balance DECIMAL(12,2) NOT NULL
        CONSTRAINT DF_Wallet_Balance DEFAULT 0,

    HeldAmount DECIMAL(12,2) NOT NULL
        CONSTRAINT DF_Wallet_HeldAmount DEFAULT 0,

    Currency CHAR(3) NOT NULL
        CONSTRAINT DF_Wallet_Currency DEFAULT 'EGP',

    UpdatedAt DATETIME2(3) NOT NULL
        CONSTRAINT DF_Wallet_UpdatedAt
        DEFAULT SYSUTCDATETIME(),

    CONSTRAINT PK_Wallet
        PRIMARY KEY (WalletId),

    CONSTRAINT UQ_Wallet_MemberId
        UNIQUE (MemberId),

    CONSTRAINT CK_Wallet_Balance
        CHECK (Balance >= 0),

    CONSTRAINT CK_Wallet_HeldAmount
        CHECK
        (
            HeldAmount >= 0
            AND HeldAmount <= Balance
        )
);
GO
