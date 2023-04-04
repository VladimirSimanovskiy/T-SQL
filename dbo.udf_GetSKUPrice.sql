CREATE FUNCTION dbo.udf_GetSKUPrice(@ID_SKU int)
RETURNS decimal(18,2)
BEGIN
	DECLARE @sumValue DEC (18,2), @sumQuantity DEC (18,2), @res DEC (18,2)
	SELECT @sumValue = SUM(Value) FROM dbo.Basket WHERE ID_SKU = @ID_SKU
	SELECT @sumQuantity = SUM(Quantity) FROM dbo.Basket WHERE ID_SKU = @ID_SKU
	SELECT @res = @sumValue / @sumQuantity
	RETURN @res;
END;