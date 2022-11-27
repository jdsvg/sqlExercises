-- Active: 1666329880365@@localhost@50745@cine
use cine;

DROP TRIGGER validar_comida;

-- VALIDA SI EL VALOR DE LA COMIDA A ACTUALIZAR ES MAYOR AL EXISTENE
CREATE TRIGGER validar_comida 
ON comida 
FOR UPDATE 
AS 
BEGIN 
    if (
        (Select valor_comida from inserted WHERE nombre_comida = (select nombre_comida from inserted)) 
        < 
        (Select valor_comida from deleted WHERE nombre_comida = (select nombre_comida from inserted))
        ) 
        update 
            comida set valor_comida = (Select valor_comida from deleted) 
        where 
            nombre_comida = (select nombre_comida from inserted) 
END;

SELECT * from comida;

-- La restriccion del trigger impedira que se genere el update
UPDATE comida
SET valor_comida = 10000
WHERE comida_id=1;

SELECT * from comida;


-- La restriccion del trigger permitir que se genere el update
UPDATE comida
SET valor_comida = 10004
WHERE comida_id=1;

SELECT * from comida;

-- ---------------------------------------------------------------------------------------------------

use cine;

DROP TRIGGER pelicula_nueva;

-- AL INSERTAR UNA NUEVA PELICULA, SE INSERTA AUTOMATICAMENTE UNA CARTELERA PARA DICHA PELICULA
CREATE TRIGGER pelicula_nueva 
ON pelicula 
AFTER INSERT 
AS 
BEGIN 
    DECLARE @MyCounter INT;
    -- Initialize the variable.
    SET @MyCounter = (select TOP 1 cartelera_id from cartelera ORDER BY cartelera_id DESC )+1;
    INSERT INTO 
        cartelera (cartelera_id, pelicula_id, sala_id, fecha_estreno) 
    VALUES 
        (@MyCounter, (select pelicula_id from inserted), '4', (select GETDATE()))
END;

select * from pelicula;
select * from cartelera;

INSERT INTO 
        pelicula (pelicula_id, moviename, duracion, genero_id) 
    VALUES 
        ('11', 'moviename_x5', 179, 2);


select * from pelicula;
select * from cartelera;

INSERT INTO 
        pelicula (pelicula_id, moviename, duracion, genero_id) 
    VALUES 
        ('12', 'moviename_x2', 179, 2);


select * from pelicula;
select * from cartelera;


-- ---------------------------------------------------------------------------------------------------

use cine;

-- NUEVA TABLA data_deleted
create table data_deleted(
cliente_id int not null primary key,
nombre_cliente VARCHAR(25),
apellido_cliente VARCHAR(25),
);

drop TRIGGER data_deleted_t;

-- AL ELIMINAR UN CLIENTE SUS DATOS BASICOS PASAN A OTRA TALBA DE CONTROL
CREATE TRIGGER data_deleted_t
ON cliente
FOR DELETE
AS
BEGIN
    DECLARE @Xcliente_id INT
    SET @Xcliente_id = (Select cliente_id from deleted);
    DECLARE @Xnombre VARCHAR(50);
    SET @Xnombre = (Select nombre_cliente from deleted);
    DECLARE @Xapellido VARCHAR(50);
    SET @Xapellido = (Select apellido_cliente from deleted);
	INSERT 	data_deleted( cliente_id, nombre_cliente, apellido_cliente) values (@Xcliente_id, @Xnombre, @Xapellido)
END;

-- Al eliminar un recibo, todos los registros de cliente y cuenta tambien deberan ser eliminados
DELETE FROM cliente WHERE cliente_id = 7;

SELECT * from data_deleted;

-- select * from recibo;
select * from cliente;


-- LAS SIGUIENTES SON SENTENCIAS NECESARIAS PARA VARIAS REALIZAR VARIAS PRUEBAS
-- DROP CONSTRAINTS
-- Cliente DROP CONSTRAINT
ALTER TABLE cliente drop CONSTRAINT fk_recibo
-- Cuenta DROP CONSTRAINT
ALTER TABLE cuenta drop CONSTRAINT fk_cliente;


-- TRUNCATE TABLES
TRUNCATE TABLE cliente
TRUNCATE TABLE data_deleted
TRUNCATE TABLE cuenta;


-- SHOW TABLES TRUNCATED
select * from cliente;
select * from cuenta;


-- ADD CONSTRAINTS
-- Cliente ADD CONSTRAINT
ALTER TABLE cliente ADD CONSTRAINT fk_recibo FOREIGN KEY (recibo_id) 
REFERENCES recibo(recibo_id) ON DELETE CASCADE  ON UPDATE NO ACTION
-- Cuenta ADD CONSTRAINT
ALTER TABLE cuenta ADD CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) 
REFERENCES cliente(cliente_id) ON DELETE CASCADE  ON UPDATE NO ACTION;


-- INSERT DATA
-- Cliente INSERT DATA
insert into cliente ( nombre_cliente, apellido_cliente, edad, recibo_id) values ('Eddy', 'Hurtado', 16, 1)
insert into cliente ( nombre_cliente, apellido_cliente, edad, recibo_id) values ('Toby', 'Torres', 43, 8)
insert into cliente ( nombre_cliente, apellido_cliente, edad, recibo_id) values ('Gena', 'Sepulveda', 58, 7)
insert into cliente ( nombre_cliente, apellido_cliente, edad, recibo_id) values ('Kevin', 'Valle', 13, 8)
insert into cliente ( nombre_cliente, apellido_cliente, edad, recibo_id) values ('Wylie', 'Santos', 67, 4)
insert into cliente ( nombre_cliente, apellido_cliente, edad, recibo_id) values ('Cristina', 'Gomez', 69, 1)
insert into cliente ( nombre_cliente, apellido_cliente, edad, recibo_id) values ('Rodolfo', 'Severo', 60, 8)
insert into cliente ( nombre_cliente, apellido_cliente, edad, recibo_id) values ('Richard', 'Cristancho', 23, 6)
insert into cliente ( nombre_cliente, apellido_cliente, edad, recibo_id) values ('Meredith', 'Bisval', 54, 6)
insert into cliente ( nombre_cliente, apellido_cliente, edad, recibo_id) values ('Vanya', 'Lineros', 24, 8);
select * from cliente;




-- ---------------------------------------------------------------------------------------------------

DROP TRIGGER val_data_empy;

-- AL INSERTAR UN EMPLEADO SI NO INDICA EL NOMBRE O EL APELLIDO ASINGA UNO VALORES TEMPORALES 
-- PARA POSTERIORMENTE HACERLES SEGUIMIENTO
CREATE TRIGGER val_data_empy
ON empleado
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @MyCounter INT;
    SET @MyCounter = (select TOP 1 empleado_id from empleado ORDER BY empleado_id DESC )+1

	DECLARE @Xempleado_id INT
    SET @Xempleado_id = (Select empleado_id from inserted)

    DECLARE @Xnombre_empleado VARCHAR(50);
    SET @Xnombre_empleado = (Select nombre_empleado from inserted)

    DECLARE @Xapellido_empleado VARCHAR(50);
    SET @Xapellido_empleado = (Select apellido_empleado from inserted)


	if(@Xnombre_empleado = '') SET @Xnombre_empleado = 'Pendiente Nom'
	if(@Xapellido_empleado = '') SET @Xapellido_empleado = 'Pendiente Ape'

	INSERT 	empleado( empleado_id, nombre_empleado, apellido_empleado) values (@MyCounter, @Xnombre_empleado, @Xapellido_empleado)

END;


SELECT * FROM empleado;

insert into 
empleado (empleado_id, nombre_empleado, apellido_empleado) 
values (0, 'prueba_1', 'prueba_1');
insert into 
empleado (empleado_id, nombre_empleado, apellido_empleado) 
values (0, 'prueba_2', '');
insert into 
empleado (empleado_id, nombre_empleado, apellido_empleado) 
values (0, '', 'prueba_2');

SELECT * FROM empleado;

-- LAS SIGUIENTES SON SENTENCIAS NECESARIAS PARA VARIAS REALIZAR VARIAS PRUEBAS
ALTER TABLE recibo drop CONSTRAINT fk_empleado;

truncate table empleado;

insert into empleado (empleado_id, nombre_empleado, apellido_empleado) values (1, 'Mervin', 'Rodriguez')
insert into empleado (empleado_id, nombre_empleado, apellido_empleado) values (2, 'Cinthia', 'Pelaez')
insert into empleado (empleado_id, nombre_empleado, apellido_empleado) values (3, 'Alonzo', 'Gonzalez')
insert into empleado (empleado_id, nombre_empleado, apellido_empleado) values (4, 'Brayan', 'Castro')
insert into empleado (empleado_id, nombre_empleado, apellido_empleado) values (5, 'Anabella', 'Perez')
insert into empleado (empleado_id, nombre_empleado, apellido_empleado) values (6, 'Emma', 'Pombo')
insert into empleado (empleado_id, nombre_empleado, apellido_empleado) values (7, 'Amanda', 'Mendez')
insert into empleado (empleado_id, nombre_empleado, apellido_empleado) values (8, 'Harold', 'Arevalo')
insert into empleado (empleado_id, nombre_empleado, apellido_empleado) values (9, 'Hugo', 'Miranda')
insert into empleado (empleado_id, nombre_empleado, apellido_empleado) values (10, 'Ricardo', 'Fajardo');
SELECT * FROM empleado;

ALTER TABLE recibo ADD CONSTRAINT fk_empleado FOREIGN KEY (empleado_id) 
REFERENCES empleado( empleado_id) ON DELETE CASCADE  ON UPDATE NO ACTION;



-- ---------------------------------------------------------------------------------------------------
-- GENERANDO NUEVA TABLA registro_delet 
CREATE TABLE registro_delet(
id_usuario int not null primary key,
usuario_sistema varchar(50),
);
--INSERTANDO UN DATO BASE
insert into registro_delet(id_usuario,usuario_sistema)values('1',SYSTEM_USER);

-- AL REALIZAR UNA ELIMINACION DE UN EMPLEADO, SE TOMA EL USUARIO QUE REALIZA ESA ELIMINACION
-- PARA LLEVAR UNA AUDITORIA A LOS CAMBIOS
CREATE trigger usuario_eliminador 
ON empleado 
AFTER DELETE 
AS 
BEGIN
DECLARE @conteo INT;
    -- Initialize the variable.
    SET @conteo = (select TOP 1 id_usuario from registro_delet ORDER BY id_usuario DESC )+1;

INSERT INTO registro_delet (id_usuario, usuario_sistema) 
VALUES (@conteo,SYSTEM_USER) 
END;

select * from empleado;
select * from registro_delet;


Delete from empleado where empleado_id = 9;
Delete from empleado where empleado_id = 10;

select * from empleado;
select * from registro_delet;