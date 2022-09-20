SELECT * FROM Cliente 
SELECT * FROM Almacen
SELECT * FROM Tipo_Documento

-- CASO 1: Se agregara una columna llamada correo a la tabla cliente para enviar sus comprobantes de pago
-- de forma digital y de manera automatica para esto el cliente debe estar registrado en nuestra base de datos

ALTER TABLE Cliente ADD [correo_electronico] varchar(50);

-- CASO 2: Se realiza el cambio de tamaño en el tipo de caracter de varchar(50) a varchar(20)

ALTER TABLE Cliente ALTER COLUMN documento_indentidad varchar(20);
