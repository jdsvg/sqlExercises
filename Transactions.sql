-- saldo a transferir
DECLARE @salto_Transferir AS int= 1000;
-- Clientes
DECLARE @cliente_origen_id AS int= 1;
DECLARE @cliente_destino_id AS int= 2;
DECLARE @cliente__origen_existe AS int;
DECLARE @cliente__destino_existe AS int; 
SET @cliente__origen_existe = (select count(cuenta_id) from cuenta where
cuenta_id=@cliente_origen_id);
SET @cliente__destino_existe = (select count(cuenta_id) from cuenta where
cuenta_id=@cliente_destino_id);
-- Plata
DECLARE @plata_cliente_origen AS int;
DECLARE @plata_cliente_destino AS int;
SET @plata_cliente_origen = (SELECT saldo from cuenta where cuenta_id =
1)
SET @plata_cliente_destino = (SELECT saldo from cuenta where cuenta_id =
2)
-- //////////////////////////////////////////////////////////////////////
IF @cliente__origen_existe = 1 and @cliente__destino_existe = 1
BEGIN
IF @salto_Transferir>0 --1er IF
BEGIN
IF @salto_Transferir<= @plata_cliente_origen --2do IF
BEGIN
BEGIN TRY
BEGIN TRANSACTION; 
update cuenta set saldo = @plata_cliente_origen-@salto_Transferir 
where cuenta_id = @cliente_origen_id
update cuenta set saldo = @plata_cliente_destino+@salto_Transferir 
where cuenta_id = @cliente_destino_id
COMMIT; 
END TRY
BEGIN CATCH
-- BEGIN TRANSACTION; 
-- update cuenta set saldo = @plata_cliente_origen-@salto_Transferir 
where cuenta_id = @cliente_origen_id
-- update cuenta set saldo = @plata_cliente_origen+@salto_Transferir 
where cuenta_id = @cliente_destino_id
-- ROLLBACK; 
PRINT ('Transferencia no realizada por un problema tecnico')
END CATCH;
------------------------------------------------------------------------
END
ELSE
BEGIN
SELECT 'El saldo a transferir excede el saldo existente' as result
END --2d0 IF
------------------------------------------------------------------------
END
ELSE
BEGIN
SELECT 'El valor debe ser mayor a cero (0)' as result
END
------------------------------------------------------------------------
END
ELSE
BEGIN
SELECT 'ERROR: Revise los clientes' as result
END



-- ANOTHER CASE

-- saldo a transferir
DECLARE @salto_Transferir AS int= 1000;
-- Clientes
DECLARE @cliente_origen_id AS int= 1;
DECLARE @cliente_destino_id AS int= 2;
DECLARE @cliente__origen_existe AS int;
DECLARE @cliente__destino_existe AS int; 
SET @cliente__origen_existe = (select count(cuenta_id) from cuenta where
cuenta_id=@cliente_origen_id);
SET @cliente__destino_existe = (select count(cuenta_id) from cuenta where
cuenta_id=@cliente_destino_id);
-- Plata
DECLARE @plata_cliente_origen AS int;
DECLARE @plata_cliente_destino AS int;
SET @plata_cliente_origen = (SELECT saldo from cuenta where cuenta_id =
1)
SET @plata_cliente_destino = (SELECT saldo from cuenta where cuenta_id =
2)
-- //////////////////////////////////////////////////////////////////////
IF @cliente__origen_existe = 1 and @cliente__destino_existe = 1
BEGIN
IF @salto_Transferir>0 --1er IF
BEGIN
IF @salto_Transferir<= @plata_cliente_origen --2do IF
BEGIN
BEGIN TRY
BEGIN TRANSACTION; 
update cuenta set saldo = @plata_cliente_origen-@salto_Transferir 
where cuenta_id = 32
update cuenta set saldo = @plata_cliente_destino+@salto_Transferir 
where cuenta_id = @cliente_destino_id
COMMIT; 
END TRY
BEGIN CATCH
-- BEGIN TRANSACTION; 
-- update cuenta set saldo = @plata_cliente_origen-@salto_Transferir 
where cuenta_id = 32
-- update cuenta set saldo = @plata_cliente_origen+@salto_Transferir 
where cuenta_id = @cliente_destino_id
-- ROLLBACK; 
PRINT ('Transferencia no realizada por un problema tecnico')
END CATCH;
------------------------------------------------------------------------
END
ELSE
BEGIN
SELECT 'El saldo a transferir excede el saldo existente' as result
END --2d0 IF
------------------------------------------------------------------------
END
ELSE
BEGIN
SELECT 'El valor debe ser mayor a cero (0)' as result
END
------------------------------------------------------------------------
END
ELSE
BEGIN
SELECT 'ERROR: Revise los clientes' as result
END
