USE TestDB;
GO

CREATE TRIGGER dbo.TR_Basket_insert_update
	ON dbo.Basket
	AFTER INSERT
	AS
BEGIN
	DECLARE @idCounter TABLE
	(
	id int, 
	counterValue int
	);
	INSERT INTO @idCounter (id, counterValue)
		SELECT ID_SKU, COUNT(*) AS counterValue 
		FROM inserted
		GROUP BY ID_SKU
		HAVING COUNT(*) > 1;
	UPDATE dbo.Basket
		SET DiscountValue = (CONVERT(decimal(18,2), dbo.Basket.Value) * 5.00) / 100.00
		FROM dbo.Basket 
		WHERE EXISTS (SELECT id FROM @idCounter WHERE id = dbo.Basket.ID_SKU)
END;
GO