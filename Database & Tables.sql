create database cine;
use cine;

create table tipo_sala(
tipo_sala_id int not null primary key,
tipo_sala varchar(25),
);

create table sala(
sala_id int not null primary key,
tipo_sala_id int not null,

CONSTRAINT fk_tipo_sala FOREIGN KEY (tipo_sala_id ) 
REFERENCES tipo_sala(tipo_sala_id ),
)

create table genero(
genero_id int not null primary key,
genero varchar(25) not null
);

create table pelicula(
pelicula_id int not null primary key,
moviename varchar(25) not null,
duracion int not null,
genero_id int not null,
--
CONSTRAINT fk_genero FOREIGN KEY (genero_id ) 
REFERENCES genero( genero_id )
);

create table cartelera(
cartelera_id int not null primary key,
pelicula_id int not null,
sala_id int not null,
fecha_estreno date
--
CONSTRAINT fk_pelicula FOREIGN KEY (pelicula_id ) 
REFERENCES pelicula( pelicula_id ),
CONSTRAINT fk_sala FOREIGN KEY (sala_id ) 
REFERENCES sala( sala_id )
)


create table fecha(
fecha_id int not null primary key,
fecha date
);

create table horario(
horario_id int not null primary key,
hora_ini time,
hora_fin time
);

create table calendario(
calendario_id int not null primary key,
fecha_id int,
horario_id int,
--
CONSTRAINT fk_fecha FOREIGN KEY (fecha_id ) 
REFERENCES fecha( fecha_id  ),
CONSTRAINT fk_horario FOREIGN KEY (horario_id ) 
REFERENCES horario( horario_id  )
);

create table escenario(
escenario_id int not null primary key,
nombre_escenario varchar(25),
direccion varchar(100),
calendario_id int
--
CONSTRAINT fk_calendario FOREIGN KEY (calendario_id) 
REFERENCES calendario( calendario_id  )
);
create table cartelera_escenario(
cartelera_escenario_id int not null primary key,
cartelera_id int,
escenario_id int,
precio smallmoney
--
CONSTRAINT fk_cartelera FOREIGN KEY (cartelera_id ) 
REFERENCES cartelera( cartelera_id ),
CONSTRAINT fk_escenario FOREIGN KEY (escenario_id ) 
REFERENCES escenario( escenario_id )
);
------------------------------------ 
create table comida(
comida_id int not null primary key,
nombre_comida varchar(25),
valor_comida smallmoney,
cantidad_comida int
);

create table bebida(
bebida_id int not null primary key,
nombre_bebida varchar(25),
valor_bebida smallmoney,
cantidad_bebida int
);

create table carrito(
carrito_id int not null primary key,
comida_id int,
bebida_id int,
--
CONSTRAINT fk_comida FOREIGN KEY (comida_id ) 
REFERENCES comida( comida_id ),
CONSTRAINT fk_bebida FOREIGN KEY (bebida_id) 
REFERENCES bebida( bebida_id )
);


create table ticket(
ticket_id int not null primary key,
serial varchar(25),
silla varchar(25)
);

create table empleado(
empleado_id int not null primary key,
nombre_empleado varchar(25),
apellido_empleado varchar(25)
);

create table recibo(
recibo_id int not null primary key,
cartelera_escenario_id int,
carrito_id int,
empleado_id int,
ticket_id int,

CONSTRAINT fk_cartelera_escenario FOREIGN KEY (cartelera_escenario_id) 
REFERENCES cartelera_escenario( cartelera_escenario_id),
CONSTRAINT fk_carrito FOREIGN KEY (carrito_id) 
REFERENCES carrito( carrito_id),
CONSTRAINT fk_empleado FOREIGN KEY (empleado_id) 
REFERENCES empleado( empleado_id),
CONSTRAINT fk_ticket FOREIGN KEY (ticket_id) 
REFERENCES ticket( ticket_id)
);


create table cliente(
cliente_id int not null primary key  IDENTITY(1,1),
nombre_cliente varchar(25),
apellido_cliente varchar(25),
edad int,
recibo_id int,

CONSTRAINT fk_recibo FOREIGN KEY (recibo_id ) 
REFERENCES recibo( recibo_id )
);


create table cuenta(
cuenta_id int not null primary key,
cliente_id int,
saldo int

CONSTRAINT fk_cliente_cuenta FOREIGN KEY (cliente_id) 
REFERENCES cliente( cliente_id),
);



-- NOTE:
-- To add ON CASCADE
-- ALTER TABLE cliente
-- drop CONSTRAINT fk_recibo;
-- --
-- ALTER TABLE cliente
-- ADD CONSTRAINT fk_recibo
--     FOREIGN KEY (recibo_id)
--     REFERENCES recibo
--         (recibo_id)
--     ON DELETE CASCADE 
--     ON UPDATE NO ACTION;