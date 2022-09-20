--SELECT * FROM Producto
--SELECT * FROM Marca

CREATE PROCEDURE SP_ModelosxMarca
	@busca VARCHAR(15)
AS
BEGIN
	SELECT nombre_marca, modelo, precio FROM Marca M INNER JOIN Producto P 
	ON M.id_marca=P.id_marca
	WHERE M.nombre_marca LIKE @busca
END

EXEC SP_ModelosxMarca 'MICROSOFT'
