--obtener el nombre del cliente que mas ha facturado y el total de su facturacion


SET STATISTICS IO, TIME ON 

select top 1 nombre_cliente, sum(cp.precio_unitario*cp.cantidad) as Total
from Cliente C INNER JOIN Comprobante_Pago CP
on C.id_cliente=CP.id_cliente
group by C.nombre_cliente
order by sum(CP.precio_unitario*CP.cantidad) DESC

select * from Comprobante_Pago
select * from Cliente
select * from Cliente where id_cliente = 50001
select * from Comprobante_Pago where id_cliente = 50001