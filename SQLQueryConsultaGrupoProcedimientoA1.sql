CREATE PROCEDURE SP_ReposicionStock
	@IDProdcuto AS VARCHAR(5),
	@Cantidad AS INT
AS
UPDATE Almacen SET cantidad = cantidad + @Cantidad
WHERE id_producto = @IDProdcuto
GO

EXEC SP_ReposicionStock '10003', 10
