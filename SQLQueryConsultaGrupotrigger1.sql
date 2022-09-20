--select * from Comprobante_Pago
--select * from Tipo_Comprobante
--select * from Producto
--select * from Cliente
--select * from Empleado
--select * from Producto

create trigger tr_actualizaPrecio on Comprobante_Pago after insert
as
begin
	update cp set cp.[precio_unitario] = p.precio
	from Comprobante_Pago cp
	inner join Producto p on cp.[id_producto] = p.[id_producto]
	inner join inserted i on i.[id_comprobante]=cp.[id_comprobante] and i.[id_producto]=cp.[id_producto]  
end

insert into Comprobante_Pago (id_tipo_comprobante, id_cliente, fecha_comprobante, id_empleado, id_producto, cantidad, detalle)
values ('03', 50003, '2022-07-25', '09623423', 10016, 1, 'PROCESADOR AMD RYZEN 5 3600')

select * from Comprobante_Pago
