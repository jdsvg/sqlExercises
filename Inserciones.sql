use cine;

-- @block TIPO_SALA
insert into tipo_sala (tipo_sala_id, tipo_sala) values (1, '2D');
insert into tipo_sala (tipo_sala_id, tipo_sala) values (2, '3D');
insert into tipo_sala (tipo_sala_id, tipo_sala) values (3, '4D');
SELECT * FROM tipo_sala

-- @block SALA
insert into sala (sala_id, tipo_sala_id) values (1, 1);
insert into sala (sala_id, tipo_sala_id) values (2, 1);
insert into sala (sala_id, tipo_sala_id) values (3, 2);
insert into sala (sala_id, tipo_sala_id) values (4, 2);
insert into sala (sala_id, tipo_sala_id) values (5, 3);
insert into sala (sala_id, tipo_sala_id) values (6, 3);
SELECT * FROM sala

-- @block GENERO
insert into genero (genero_id, genero) values (1, 'Drama|Romance');
insert into genero (genero_id, genero) values (2, 'Comedy|Drama');
insert into genero (genero_id, genero) values (3, 'Drama|Musical');
insert into genero (genero_id, genero) values (4, 'Adventure|Children|');
insert into genero (genero_id, genero) values (5, 'Crime|Drama|Mystery');
SELECT * FROM genero


-- @block PELICULA
insert into pelicula (pelicula_id, moviename, duracion, genero_id) values (1, 'Love', 179, 2);
insert into pelicula (pelicula_id, moviename, duracion, genero_id) values (2, 'Redbelt', 87, 4);
insert into pelicula (pelicula_id, moviename, duracion, genero_id) values (3, 'Our Town', 142, 4);
insert into pelicula (pelicula_id, moviename, duracion, genero_id) values (4, 'Showdown in Little Tokyo', 159, 5);
insert into pelicula (pelicula_id, moviename, duracion, genero_id) values (5, 'Backwood Philosopher', 167, 2);
SELECT * FROM pelicula

-- @block CARTELERA
insert into cartelera (cartelera_id, pelicula_id, sala_id, fecha_estreno) values (1, 5, 3, '2022-06-04');
insert into cartelera (cartelera_id, pelicula_id, sala_id, fecha_estreno) values (2, 1, 4, '2022-06-05');
insert into cartelera (cartelera_id, pelicula_id, sala_id, fecha_estreno) values (3, 4, 2, '2022-06-06');
insert into cartelera (cartelera_id, pelicula_id, sala_id, fecha_estreno) values (4, 2, 1, '2022-06-19');
insert into cartelera (cartelera_id, pelicula_id, sala_id, fecha_estreno) values (5, 3, 5, '2022-05-18');
SELECT * FROM cartelera


-- @block FECHA
insert into fecha (fecha_id, fecha) values (1, '2022-10-01');
insert into fecha (fecha_id, fecha) values (2, '2022-10-02');
insert into fecha (fecha_id, fecha) values (3, '2022-10-03');
insert into fecha (fecha_id, fecha) values (4, '2022-10-04');
insert into fecha (fecha_id, fecha) values (5, '2022-10-05');
insert into fecha (fecha_id, fecha) values (6, '2022-10-06');
insert into fecha (fecha_id, fecha) values (7, '2022-10-07');
insert into fecha (fecha_id, fecha) values (8, '2022-10-08');
insert into fecha (fecha_id, fecha) values (9, '2022-10-09');
insert into fecha (fecha_id, fecha) values (10, '2022-10-10');
SELECT * FROM fecha


-- @block HORARIO
insert into horario (horario_id, hora_ini, hora_fin) values (1, '11:00', '13:00');
insert into horario (horario_id, hora_ini, hora_fin) values (2, '13:00', '15:00');
insert into horario (horario_id, hora_ini, hora_fin) values (3, '15:00', '17:00');
insert into horario (horario_id, hora_ini, hora_fin) values (4, '17:00', '19:00');
insert into horario (horario_id, hora_ini, hora_fin) values (5, '19:00', '21:00');
insert into horario (horario_id, hora_ini, hora_fin) values (6, '21:00', '23:00');
insert into horario (horario_id, hora_ini, hora_fin) values (7, '11:00', '14:00');
insert into horario (horario_id, hora_ini, hora_fin) values (8, '14:00', '17:00');
insert into horario (horario_id, hora_ini, hora_fin) values (9, '17:00', '20:00');
insert into horario (horario_id, hora_ini, hora_fin) values (10, '20:00', '23:00');
SELECT * FROM horario

-- @block CALENDARIO
insert into calendario (calendario_id, fecha_id, horario_id) values (1, 1, 8);
insert into calendario (calendario_id, fecha_id, horario_id) values (2, 2, 7);
insert into calendario (calendario_id, fecha_id, horario_id) values (3, 3, 1);
insert into calendario (calendario_id, fecha_id, horario_id) values (4, 4, 2);
insert into calendario (calendario_id, fecha_id, horario_id) values (5, 5, 3);
insert into calendario (calendario_id, fecha_id, horario_id) values (6, 6, 4);
insert into calendario (calendario_id, fecha_id, horario_id) values (7, 7, 5);
insert into calendario (calendario_id, fecha_id, horario_id) values (8, 8, 6);
insert into calendario (calendario_id, fecha_id, horario_id) values (9, 9, 7);
insert into calendario (calendario_id, fecha_id, horario_id) values (10, 10, 9);
SELECT * FROM calendario

-- @block ESCENARIO
insert into escenario (escenario_id, nombre_escenario, direccion, calendario_id) values (1, 'Haoxue', '797 Rieder Alley', 9);
insert into escenario (escenario_id, nombre_escenario, direccion, calendario_id) values (2, 'Mina Clavero', '44723 Bartillon Center', 6);
insert into escenario (escenario_id, nombre_escenario, direccion, calendario_id) values (3, 'Laranjeiras', '403 Hanover Avenue', 4);
insert into escenario (escenario_id, nombre_escenario, direccion, calendario_id) values (4, 'Rouen', '8 Algoma Way', 1);
insert into escenario (escenario_id, nombre_escenario, direccion, calendario_id) values (5, 'Bayambang', '73578 Weeping Birch Street', 5);
insert into escenario (escenario_id, nombre_escenario, direccion, calendario_id) values (6, 'Whistler', '669 Brickson Park Street', 3);
insert into escenario (escenario_id, nombre_escenario, direccion, calendario_id) values (7, 'Joyabaj', '02 Forest Circle', 10);
insert into escenario (escenario_id, nombre_escenario, direccion, calendario_id) values (8, 'Hengdian', '50 Old Shore Drive', 7);
insert into escenario (escenario_id, nombre_escenario, direccion, calendario_id) values (9, 'Angochi', '022 Fairview Way', 2);
insert into escenario (escenario_id, nombre_escenario, direccion, calendario_id) values (10, 'Hot', '01412 Reindahl Lane', 8);
SELECT * FROM escenario


-- @block CARTELERA_ESCENARIO
insert into cartelera_escenario (cartelera_escenario_id, cartelera_id, escenario_id) values (1, 1, 10);
insert into cartelera_escenario (cartelera_escenario_id, cartelera_id, escenario_id) values (2, 2, 8);
insert into cartelera_escenario (cartelera_escenario_id, cartelera_id, escenario_id) values (3, 3, 7);
insert into cartelera_escenario (cartelera_escenario_id, cartelera_id, escenario_id) values (4, 4, 1);
insert into cartelera_escenario (cartelera_escenario_id, cartelera_id, escenario_id) values (5, 5, 9);
insert into cartelera_escenario (cartelera_escenario_id, cartelera_id, escenario_id) values (6, 3, 2);
insert into cartelera_escenario (cartelera_escenario_id, cartelera_id, escenario_id) values (7, 4, 4);
insert into cartelera_escenario (cartelera_escenario_id, cartelera_id, escenario_id) values (8, 1, 3);
insert into cartelera_escenario (cartelera_escenario_id, cartelera_id, escenario_id) values (9, 5, 6);
insert into cartelera_escenario (cartelera_escenario_id, cartelera_id, escenario_id) values (10, 2, 5);
SELECT * FROM cartelera_escenario

-- @block COMIDA
insert into comida (comida_id, nombre_comida, valor_comida, cantidad_comida) values (1, 'Palomitas', 10000, 1);
insert into comida (comida_id, nombre_comida, valor_comida, cantidad_comida) values (2, 'Perro_caliente', 15000, 1);
insert into comida (comida_id, nombre_comida, valor_comida, cantidad_comida) values (3, 'Chocolatina', 2000, 1);
insert into comida (comida_id, nombre_comida, valor_comida, cantidad_comida) values (4, 'Nachos', 5000, 1);
insert into comida (comida_id, nombre_comida, valor_comida, cantidad_comida) values (5, 'Papas_fritas', 8000, 1);
select * from comida

-- @block BEBIDA
insert into bebida (bebida_id, nombre_bebida, valor_bebida, cantidad_bebida) values (1, 'Gaseosa', 3000, 1);
insert into bebida (bebida_id, nombre_bebida, valor_bebida, cantidad_bebida) values (2, 'Tea', 2500, 1);
insert into bebida (bebida_id, nombre_bebida, valor_bebida, cantidad_bebida) values (3, 'Cafe', 1500, 1);
insert into bebida (bebida_id, nombre_bebida, valor_bebida, cantidad_bebida) values (4, 'Agua', 1500, 1);
insert into bebida (bebida_id, nombre_bebida, valor_bebida, cantidad_bebida) values (5, 'Bebida_Energizante', 5000, 1);
insert into bebida (bebida_id, nombre_bebida, valor_bebida, cantidad_bebida) values (6, 'Agua_saborizada', 2000, 1);
insert into bebida (bebida_id, nombre_bebida, valor_bebida, cantidad_bebida) values (7, 'Agua con Gas', 2500, 1);
insert into bebida (bebida_id, nombre_bebida, valor_bebida, cantidad_bebida) values (8, 'Jugo', 2500, 1);
insert into bebida (bebida_id, nombre_bebida, valor_bebida, cantidad_bebida) values (9, 'Chocolisto', 2000, 2);
insert into bebida (bebida_id, nombre_bebida, valor_bebida, cantidad_bebida) values (10, 'MILO', 2000, 2);
select * from bebida

-- @block CARRITO
insert into carrito (carrito_id, comida_id, bebida_id) values (1, 4, 7);
insert into carrito (carrito_id, comida_id, bebida_id) values (2, 5, 9);
insert into carrito (carrito_id, comida_id, bebida_id) values (3, 1, 8);
insert into carrito (carrito_id, comida_id, bebida_id) values (4, 2, 1);
insert into carrito (carrito_id, comida_id, bebida_id) values (5, 3, 10);
insert into carrito (carrito_id, comida_id, bebida_id) values (6, 4, 2);
insert into carrito (carrito_id, comida_id, bebida_id) values (7, 3, 6);
insert into carrito (carrito_id, comida_id, bebida_id) values (8, 1, 5);
insert into carrito (carrito_id, comida_id, bebida_id) values (9, 2, 4);
insert into carrito (carrito_id, comida_id, bebida_id) values (10, 5, 3);
select * from carrito

-- @block GENERO
insert into ticket ( ticket_id, serial, silla) values (1, '993094972-0', 1);
insert into ticket ( ticket_id, serial, silla) values (2, '032536311-0', 2);
insert into ticket ( ticket_id, serial, silla) values (3, '553803325-2', 3);
insert into ticket ( ticket_id, serial, silla) values (4, '435853335-3', 4);
insert into ticket ( ticket_id, serial, silla) values (5, '579363845-8', 5);
select * from ticket

-- @block empleado
insert into empleado (empleado_id, nombre_empleado, apellido_empleado) values (1, 'Mervin', 'Rodriguez');
insert into empleado (empleado_id, nombre_empleado, apellido_empleado) values (2, 'Cinthia', 'Pelaez');
insert into empleado (empleado_id, nombre_empleado, apellido_empleado) values (3, 'Alonzo', 'Gonzalez');
insert into empleado (empleado_id, nombre_empleado, apellido_empleado) values (4, 'Brayan', 'Castro');
insert into empleado (empleado_id, nombre_empleado, apellido_empleado) values (5, 'Anabella', 'Perez');
insert into empleado (empleado_id, nombre_empleado, apellido_empleado) values (6, 'Emma', 'Pombo');
insert into empleado (empleado_id, nombre_empleado, apellido_empleado) values (7, 'Amanda', 'Mendez');
insert into empleado (empleado_id, nombre_empleado, apellido_empleado) values (8, 'Harold', 'Arevalo');
insert into empleado (empleado_id, nombre_empleado, apellido_empleado) values (9, 'Hugo', 'Miranda');
insert into empleado (empleado_id, nombre_empleado, apellido_empleado) values (10, 'Ricardo', 'Fajardo');
select * from empleado

-- @block recibo
insert into recibo (recibo_id, cartelera_escenario_id, carrito_id, empleado_id, ticket_id ) values (1, 3, 2, 7, 1);
insert into recibo (recibo_id, cartelera_escenario_id, carrito_id, empleado_id, ticket_id ) values (2, 1, 2, 7, 1);
insert into recibo (recibo_id, cartelera_escenario_id, carrito_id, empleado_id, ticket_id ) values (3, 2, 5, 5, 1);
insert into recibo (recibo_id, cartelera_escenario_id, carrito_id, empleado_id, ticket_id ) values (4, 2, 6, 5, 3);
insert into recibo (recibo_id, cartelera_escenario_id, carrito_id, empleado_id, ticket_id ) values (5, 1, 6, 5, 2);
insert into recibo (recibo_id, cartelera_escenario_id, carrito_id, empleado_id, ticket_id ) values (6, 4, 8, 6, 2);
insert into recibo (recibo_id, cartelera_escenario_id, carrito_id, empleado_id, ticket_id ) values (7, 3, 8, 6, 2);
insert into recibo (recibo_id, cartelera_escenario_id, carrito_id, empleado_id, ticket_id ) values (8, 2, 1, 5, 3);
select * from recibo

-- @block CLIENTE

insert into cliente ( nombre_cliente, apellido_cliente, edad, recibo_id) values ('Eddy', 'Hurtado', 16, 1);
insert into cliente ( nombre_cliente, apellido_cliente, edad, recibo_id) values ('Toby', 'Torres', 43, 8);
insert into cliente ( nombre_cliente, apellido_cliente, edad, recibo_id) values ('Gena', 'Sepulveda', 58, 7);
insert into cliente ( nombre_cliente, apellido_cliente, edad, recibo_id) values ('Kevin', 'Valle', 13, 8);
insert into cliente ( nombre_cliente, apellido_cliente, edad, recibo_id) values ('Wylie', 'Santos', 67, 4);
insert into cliente ( nombre_cliente, apellido_cliente, edad, recibo_id) values ('Cristina', 'Gomez', 69, 1);
insert into cliente ( nombre_cliente, apellido_cliente, edad, recibo_id) values ('Rodolfo', 'Severo', 60, 8);
insert into cliente ( nombre_cliente, apellido_cliente, edad, recibo_id) values ('Richard', 'Cristancho', 23, 6);
insert into cliente ( nombre_cliente, apellido_cliente, edad, recibo_id) values ('Meredith', 'Bisval', 54, 6);
insert into cliente ( nombre_cliente, apellido_cliente, edad, recibo_id) values ('Vanya', 'Lineros', 24, 8);
select * from cliente


-- @block CUENTA

insert into cuenta (cuenta_id, cliente_id, saldo) values (1, 1, 3279);
insert into cuenta (cuenta_id, cliente_id, saldo) values (2, 3, 3292);
insert into cuenta (cuenta_id, cliente_id, saldo) values (3, 9, 2428);
insert into cuenta (cuenta_id, cliente_id, saldo) values (4, 7, 2948);
insert into cuenta (cuenta_id, cliente_id, saldo) values (5, 10, 1507);
insert into cuenta (cuenta_id, cliente_id, saldo) values (6, 4, 3342);
insert into cuenta (cuenta_id, cliente_id, saldo) values (7, 9, 3273);
insert into cuenta (cuenta_id, cliente_id, saldo) values (8, 10, 4476);
insert into cuenta (cuenta_id, cliente_id, saldo) values (9, 2, 3007);
insert into cuenta (cuenta_id, cliente_id, saldo) values (10, 1, 4850);

SELECT * from cuenta