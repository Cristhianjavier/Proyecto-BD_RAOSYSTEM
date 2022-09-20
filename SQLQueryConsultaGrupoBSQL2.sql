--select * from Comprobante_Pago
--select * from Producto where id_producto = 10001
--select * from Cliente
--select * from Tipo_Documento
--select * from Categoria_Producto
--select * from Tipo_Comprobante

--SELECT nombre_producto, precio, cantidad, id_categoria 
--FROM Producto P INNER JOIN Almacen A
--ON (P.id_producto=A.id_producto)
--WHERE precio = (SELECT MIN(precio) FROM Producto WHERE id_categoria = 111)


--select  id_comprobante as [Numero Venta], nombre_cliente as Ganador, precio, nombre_producto as Premio
--from Comprobante_Pago cp inner join Cliente c
--on (cp.id_cliente=c.id_cliente)
--inner join Producto p
--on (cp.id_producto=p.id_producto)
--where id_comprobante = 10 and precio = (SELECT max(precio) FROM Producto WHERE id_categoria = 105)


--SELECT nombre_cliente AS Ganador, count(id_cliente) as [numero compras]
--FROM cliente c
--JOIN Comprobante_Pago cp
--ON (c.id_cliente=cp.id_cliente)
--JOIN Producto p
--ON (cp.id_producto=p.id_producto)
--where precio = (SELECT nombre_producto FROM Producto WHERE id_categoria = 105 and max(precio))





SELECT numero_comprobante as [Numero Comprobante], nombre_cliente as Cliente, descripcion_producto as Producto, cantidad as [Cantidad de Compra],
[P/Unit Oferta] = (precio - precio*0.3)

FROM Producto P INNER JOIN Comprobante_Pago CP
ON (P.id_producto=CP.id_producto)
INNER JOIN Cliente C
ON (C.id_cliente=CP.id_cliente)
WHERE cantidad>=5 and descripcion_producto = (SELECT descripcion_producto FROM Producto WHERE id_producto = 10003)


















INSERT INTO Comprobante_Pago(id_tipo_comprobante, id_cliente, fecha_comprobante, id_empleado, id_producto, cantidad, detalle)
VALUES ('01', 50002, '2022-09-10', '47550098', 10003, 10, 'SISTEMA OPERATIVO MICROSOFT WINDOWS 10 PRO 64 BITS-ESPAÑOL')

cantidad>=5 precio=(precio-precio*0.3)

select 




