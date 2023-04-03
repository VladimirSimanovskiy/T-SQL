CREATE TABLE dbo.SKU
(
  ID int PRIMARY KEY IDENTITY,
  Code AS 's' + CONVERT(nvarchar(20), ID) UNIQUE,
  Name nvarchar(20)
);


CREATE TABLE dbo.Family
(
  ID int PRIMARY KEY IDENTITY,
  SurName nvarchar(20),
  BudgetValue int
);

CREATE TABLE dbo.Basket
(
  ID int PRIMARY KEY IDENTITY,
  ID_SKU int REFERENCES dbo.SKU (ID),
  ID_FAMILY int REFERENCES dbo.Family (ID),
  Quantity int CHECK(Quantity > 0),
  Value int CHECK(Value > 0),
  PurchaseDate date DEFAULT GETDATE(), 
  DiscountValue int,
);
