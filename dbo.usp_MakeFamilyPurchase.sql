CREATE PROCEDURE dbo.usp_MakeFamilyPurchase(@FamilySurName varchar(255)) AS
BEGIN
	IF EXISTS(SELECT SurName FROM dbo.Family WHERE SurName = @FamilySurName)
		BEGIN
			DECLARE @familyID int, @basketSumValue DEC (18,2)
			SELECT @familyID = dbo.Family.ID FROM dbo.Family WHERE dbo.Family.SurName = @FamilySurName
			SELECT @basketSumValue = SUM(Value) FROM dbo.Basket, dbo.Family WHERE @familyID = dbo.Basket.ID_FAMILY
			UPDATE dbo.Family
			SET BudgetValue = dbo.Family.BudgetValue - @basketSumValue WHERE SurName = @FamilySurName
		END;
	ELSE
		PRINT 'Такой семьи не существует'
END;