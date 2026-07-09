create table medio_pago (
    id int not null auto_increment,
    nombre varchar(50) not null,
    primary key(id)
);

create table cliente (
    id int not null auto_increment,
    nombre varchar(50) not null unique,
    correo varchar(50) not null unique,
    telefono int not null unique,
    primary key(id)
);

create table pago (
    id int not null auto_increment,
    monto double not null,
    medio_pago_fk int not null,
    primary key(id),
    foreign key(medio_pago_fk) references medio_pago(id)
);

create table sala (
    id int not null auto_increment,
    nombre varchar(50) not null,
    capacidad int not null,
    primary key(id)
);

create table clasificacion (
    id int not null auto_increment,
    nombre varchar(50) not null,
    primary key(id)
);

create table genero (
    id int not null auto_increment,
    nombre varchar(50) not null,
    primary key(id)
);

create table pelicula (
    id int not null auto_increment,
    titulo varchar(50) not null,
    duracion int not null,
    genero_fk int not null,
    clasificacion_fk int not null,
    primary key(id),
    foreign key(genero_fk) references genero(id),
    foreign key(clasificacion_fk) references clasificacion(id)
);

create table funcion (
    id int not null auto_increment,
    fecha date not null,
    hora time not null,
    pelicula_fk int not null,
    pago_fk int not null,
    sala_fk int not null,
    cliente_fk int not null,
    primary key(id),
    foreign key(pelicula_fk) references pelicula(id),
    foreign key(pago_fk) references pago(id),
    foreign key(sala_fk) references sala(id),
    foreign key(cliente_fk) references cliente(id)
);

show tables;

insert into medio_pago(nombre) values ("tarjeta"),("nequi"),("efectivo");
select * from medio_pago;

insert into cliente(nombre,correo,telefono) values ("Ana Lopez","analopez@email.com",32114141), ("Carlos Martinez","crlostinez@gmail.com", 310282822), ("Pedro Gomez","pedrogomes@gmail.com",313141411);

select * from cliente;
insert into pago (monto,medio_pago_fk) values (22,1), (15,2),(22,3);
select * from pago;

insert into sala (nombre,capacidad) values ("sala 1",100), ("sala 2",80);
select * from sala;

insert into clasificacion(nombre) values ("PG-13"),("G");
select * from clasificacion;

insert into genero (nombre) values ("Sci-Fi"),("Animacion");
select * from genero;

insert into pelicula (titulo,duracion,genero_fk,clasificacion_fk) values ("Incepcion",148,1,1), ("The lion King",88,2,2);
select * from pelicula;

insert into funcion (fecha,hora,pelicula_fk,pago_fk,sala_fk,cliente_fk) values ("2025-07-20","18:00",1,1,1,1), ("2025-07-20","16:00",2,2,2,2), ("2025-07-20","18:00",1,3,1,3);
select * from funcion;