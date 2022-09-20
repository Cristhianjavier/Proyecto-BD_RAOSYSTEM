select nombre_producto, min(Producto.precio) as Regalo, cantidad from Producto inner join Almacen on (Producto.id_producto = Almacen.id_producto)
group by Producto.nombre_producto


select * from Comprobante_Pago
select * from Producto
select * from Almacen
select * from Categoria_Producto
select * from Marca
select * from Cliente where id_cliente = 50005
	

insert into Categoria_Producto(categoria_producto)
values ('HW-PERIFERICOS LAPTOPS')

insert into Producto(id_marca,id_categoria,nombre_producto,descripcion_producto,precio,modelo,numero_serie, part_number)
values (16,111,'MOUSE RETRACTIL','MOUSE LOGITECH MICRO TRAVELER V2 USB SILVER', 15,'TRAVELER V2', 'MLR000254','31010125102')

insert into Producto(id_marca,id_categoria,nombre_producto,descripcion_producto,precio,modelo,numero_serie, part_number)
values (9,110,'CABLE USB PARA IMPRESORA','CABLE USB PARA IMPRESORA DE 1.5 METROS', 3,'CUSB1568', 'GUSB25631','259874631')

insert into Producto(id_marca,id_categoria,nombre_producto,descripcion_producto,precio,modelo,numero_serie, part_number)
values (11,111,'MOCHILA','MOCHILA PRELUDE HP PARA LAPTOP DE 15.6" PLOMO', 65,'PRELUDE', 'MHP660223','BUS89107G')

insert into Almacen(id_almacen,nombre_almacen,id_producto,cantidad)
values ('LIM001','Principal', 10027,24)

insert into Almacen(id_almacen,nombre_almacen,id_producto,cantidad)
values ('LIM001','Principal', 10028,33)

insert into Almacen(id_almacen,nombre_almacen,id_producto,cantidad)
values ('LIM001','Principal', 10029,150)




--***** CODIGO DE BUSQUEDA DE REGALO *****--

--El cliente con codigo 50005 compra una laptop gaming y por su compra se le va a regalar un producto que su precio sea el minimo, cuente 
-- con stock en el almacen y su categoria de prodcuto sea un periferico para laptop 


SELECT nombre_producto, precio, cantidad, P.id_categoria, CP.categoria_producto 
FROM Producto P INNER JOIN Almacen A
ON (P.id_producto=A.id_producto)
INNER JOIN Categoria_Producto CP
ON(P.id_categoria=CP.id_categoria)
WHERE precio = (SELECT MIN(precio) FROM Producto WHERE id_categoria = 111)

--***************************************************************************************************************




