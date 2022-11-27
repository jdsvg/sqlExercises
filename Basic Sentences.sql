-- *********************************************************************** TALLER 4
-- @block MAX_Y_MIN
SELECT nombre_comida, cantidad_comida, valor_comida from comida
WHERE valor_comida = (SELECT MIN(valor_comida) from comida)

-- @block SUM
SELECT nombre_comida, cantidad_comida, valor_comida from comida
SELECT SUM(valor_comida) as Total from comida

-- @block AVG
SELECT nombre_comida, cantidad_comida, valor_comida from comida
SELECT AVG(valor_comida) as promedio from comida


-- @block COUNT
SELECT nombre_comida, cantidad_comida, valor_comida from comida
SELECT COUNT(valor_comida) as conteo from comida

-- @block HAVING
SELECT empleado_id from recibo 
GROUP BY empleado_id
HAVING SUM(ticket_id) = 4

-- *********************************************************************** TALLER 5
-- @block AND
SELECT * from recibo
where carrito_id = 8
AND cartelera_escenario_id = 3

-- @block OR
SELECT * from recibo
where carrito_id = 8
OR cartelera_escenario_id = 3


-- @block IN
SELECT * from recibo
where recibo_id in (5,3,7)

-- @block LIKE
SELECT * from pelicula
where moviename like '%i%'

-- @block NOT
SELECT * from pelicula
where moviename not like '%i%'


-- @block BETWEEN
select * from fecha
where fecha
between '2022-10-04' AND '2022-10-07'

-- *********************************************************************** TALLER 6
-- @block IF ELSE
DECLARE @sales integer
    IF @sales > 10000000
    BEGIN
        PRINT 'Great! The sales amount in 2018 is greater than 10,000,000';
    END
    ELSE
    BEGIN
        PRINT 'Sales amount in 2017 did not reach 10,000,000';
    END





