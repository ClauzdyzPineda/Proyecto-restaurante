create database if not exists punto_venta;
use punto_venta;

create table if not exists tbTipoSucursal(
id_tipoSucursal int not null primary key auto_increment,
nombre varchar(30)
)engine InnoDB; /*LISTA*/

create table if not exists tbSucursal(
id_sucursal int not null primary key auto_increment,
id_tipoSucursal int,
nombre varchar(50) not null,
dir varchar(300),
tel varchar(15) not null,
fecha_creacion date,
capital_inicial decimal(18,2) not null,
constraint fk_tipoSucursal_sucursal foreign key(id_tipoSucursal) references tbTipoSucursal(id_tipoSucursal) on update cascade on delete set null
)engine InnoDB;/*LISTA*/

create table if not exists tbCargo(
id_cargo int not null primary key auto_increment,
cargo varchar(50)
)engine InnoDB;/*LISTA*/

create table if not exists tbPersona(
id_persona int not null primary key auto_increment,
nombres varchar(50) not null,
apellidos varchar(50) not null,
dui varchar(10),
nit varchar(16),
edad int(11),
tel varchar(15),
dir varchar(300),
email varchar(80),
genero enum('M', 'F', 'N/A'),
salario_asignado decimal(18,2),
id_cargo int,
id_sucursal int,
constraint fk_cargo_persona foreign key (id_cargo) references tbCargo(id_cargo) on update cascade on delete set null,
constraint fk_sucursal_persona foreign key (id_sucursal) references tbSucursal(id_sucursal) on update cascade on delete set null
)engine InnoDB;/*LISTA*/

select * from tbPersona;

create table if not exists tbRolesUsuario(
id_rolesUsuario int not null primary key auto_increment,
rol varchar(50)
)engine InnoDB;/*LISTA*/

select * from tbRolesUsuario;

create table if not exists tbUsuario(
id_usuario int not null primary key auto_increment,
nickName varchar(50),
pass varchar(50),
id_persona int,
id_rolesUsuario int,
estado tinyint(1) not null,
constraint fk_persona_usuario foreign key (id_persona) references tbPersona(id_persona) on update cascade on delete set null,
constraint fk_rolesUsuario_persona foreign key (id_rolesUsuario) references tbRolesUsuario(id_rolesUsuario) on update cascade on delete set null
)engine InnoDB;/*LISTA*/

select * from tbUsuario;

create table if not exists tbProveedor(
id_proveedor int not null primary key auto_increment,
nombre varchar(50) not null,
nit varchar(17),
tel varchar(15),
dir varchar(300),
email varchar(80)
)engine InnoDB;/*LISTA*/

create table if not exists tbTiempo(
id_tiempo int not null primary key auto_increment,
tipo varchar(30),
id_tipoSucursal int,
constraint fk_tipoSucursal_tiempo foreign key(id_tipoSucursal) references tbTipoSucursal(id_tipoSucursal) on update cascade on delete set null
)engine InnoDB;/*LISTA*/

create table if not exists tbscaPlatillo(
id_subCategoria int not null primary key auto_increment,
tipo varchar(30),
id_tiempo int,
constraint fk_tiempo_scaPlatillo foreign key (id_tiempo) references tbTiempo(id_tiempo) on update cascade on delete set null
)engine InnoDB;/*LISTA*/


/*Tabla nueva*/
create table if not exists tbProducto(
id_producto int not null primary key auto_increment,
nombre_producto varchar(60) not null,
descripcion varchar(100) default 'None',
unidad_medida varchar(5) default 'None',
stock_min int default 50,
existencias int not null,
stock_max int default 999,
costo_unitario decimal(18,2) not null,
estado varchar(50) default 'Stock',
tipo enum('A', 'B', 'C', 'D', 'E', 'F') not null default 'A'
)engine InnoDB;/*LISTA*/



/*Nueva tabla*/
create table if not exists tbDetalleProducto(
id_detalleProd int not null primary key auto_increment,
id_proveedor int,
id_producto int ,
unidades_recibidas int not null,
fecha_hora timestamp default current_timestamp,
comentarios varchar(100) default 'None',
valor_en_inv decimal(18,2) not null,
id_sucursal int ,
id_usuario int ,
constraint fk_proveedor_detalle_prod foreign key(id_proveedor) references tbProveedor(id_proveedor) on update cascade on delete set null,
constraint fk_producto_detalle_prod foreign key (id_producto) references tbProducto(id_producto) on update cascade on delete set null,
constraint fk_sucursal_detalle_prod foreign key (id_sucursal) references tbSucursal(id_sucursal) on update cascade on delete set null,
constraint fk_usuario_detalle_prod foreign key (id_usuario) references tbUsuario(id_usuario) on update cascade on delete set null
)engine InnoDB;/*LISTA*/


/*Nueva tabla*/
create table if not exists tbPedido(
id_pedido int not null primary key auto_increment,
id_proveedor int,
id_producto int,
cant_producto int,
valor_estimado decimal(18,2) not null,
fecha_hora timestamp default current_timestamp,
comentarios varchar(100) default 'None',
estado varchar(50) default 'En curso',
id_usuario int,
id_sucursal int,
constraint fk_proveedor_pedido foreign key(id_proveedor) references tbProveedor(id_proveedor) on update cascade on delete set null,
constraint fk_producto_pedido foreign key(id_producto) references tbProducto(id_producto) on update cascade on delete set null,
constraint fk_usuario_pedido foreign key(id_usuario) references tbUsuario(id_usuario) on update cascade on delete set null,
constraint fk_sucursal_pedido foreign key (id_sucursal) references tbsucursal(id_sucursal) on update cascade on delete set null
)engine InnoDB;/*LISTA*/

create table if not exists tbPlatillo(
id_platillo int not null primary key auto_increment,
nombre_platillo varchar(60),
precio_platillo decimal(18,2),
costo_platillo decimal(18,2),
id_subCategoria int not null,
constraint fk_subCat_platillo foreign key(id_subCategoria) references tbscaPlatillo(id_subCategoria) on update cascade on delete cascade
)engine InnoDB;/*LISTA*/

create table if not exists tbDetallePlatillo(
id_detallePlatillo int not null primary key auto_increment,
id_platillo int,
id_producto int,
cantidad_producto int,
constraint fk_platillo_detallepla foreign key(id_platillo) references tbPlatillo(id_platillo) on update cascade on delete cascade,
constraint fk_producto_detallepla foreign key(id_producto) references tbProducto(id_producto) on update cascade on delete cascade
)engine InnoDB;/*LISTA*/

create table if not exists tbTipoBebida(
id_tipoBebida int not null primary key auto_increment,
tipo varchar(30)
)engine InnoDB;/*LISTA*/

create table if not exists tbBebida(
id_bebida int not null primary key auto_increment,
nombre_bebida varchar(50) not null,
id_tipoBebida int default 1,
precio_bebida decimal(18,2) default 0.00,
id_referencia int not null,
constraint fk_tipoBebida_bebida foreign key(id_tipoBebida) references tbTipoBebida(id_tipoBebida) on update cascade on delete cascade
)engine InnoDB;/*LISTA*/

create table if not exists tbTipoComplemento(
id_tipoCom int not null primary key auto_increment,
nombre varchar(50)
)engine InnoDB;/*LISTA*/

create table if not exists tbComplemento(
id_complemento int not null primary key auto_increment,
nombre_complemento varchar(50) not null,
id_tipoCom int,
precio_complemento decimal(18,2) default 0.00,
id_referencia int not null,
constraint fk_tipoCom_com foreign key(id_tipoCom) references tbTipoComplemento(id_tipoCom)  on update cascade on delete set null
)engine InnoDB;/*LISTA*/

create table if not exists tbVenta(
id_venta int not null primary key auto_increment,
nombre_cliente varchar(80) not null,
dui_carnet varchar(20) default 'No Otorgado',
tel varchar(15) default 'No Otorgado',
tipo_pago enum('TC','TD','E', 'CH') not null,
fecha_hora timestamp default current_timestamp,
venta_total decimal(18,2) not null,
id_usuario int,
id_sucursal int,
constraint fk_usuario_venta foreign key(id_usuario) references tbUsuario(id_usuario) on update cascade on delete set null,
CONSTRAINT fk_sucursal_venta FOREIGN KEY (id_sucursal)  REFERENCES tbSucursal(id_sucursal) on update cascade on delete set null
)engine InnoDB;/*LISTA*/



create table if not exists tbDetalleVenta(
id_detalleVenta int not null primary key auto_increment,
id_platillo int,
id_bebida int,
id_complemento int,
precio_orden decimal(18,2) default 0.00,
id_venta int not null,
constraint fk_venta_dv foreign key (id_venta) references tbVenta(id_venta) on update cascade on delete cascade,
constraint fk_platillo_dv foreign key (id_platillo) references tbPlatillo(id_platillo) on update cascade on delete set null,
constraint fk_bebida_dv foreign key (id_bebida) references tbbebida(id_bebida) on update cascade on delete set null,
constraint fk_complemento_dv foreign key(id_complemento) references tbComplemento(id_complemento) on update cascade on delete set null
)engine InnoDB;/*LISTA*/

create table if not exists tbRegistrosInicio(
id_registro int not null primary key auto_increment,
inv_registrado int not null default 0,
valor_inv double not null default 0.00,
tipo tinyint(1) not null,/*0 es apertura 1 es cierre*/
fecha_registro timestamp not null default current_timestamp,
id_usuario int ,
id_sucursal int ,
constraint fk_usuario_registro foreign key(id_usuario) references tbUsuario(id_usuario) on update cascade on delete set null,
constraint fk_sucursal_registro foreign key (id_sucursal) references tbSucursal(id_sucursal) on update cascade on delete set null
)engine InnoDB;/*LISTA*/


create table if not exists tbMovimiento(
id_movimiento int not null primary key auto_increment,
monto decimal(18,2),
cantidad int not null,
tipo tinyint(1) not null,/*1 ES COMPRA, 0 ES VENTA*/
fecha timestamp not null default current_timestamp,
id_sucursal int ,
id_externo int not null,/*REFERENCIA AL ID DE LA TABLA DE COMPRAS/VENTAS DEPENDE EL TIPO*/
CONSTRAINT fk_sucursal_movs FOREIGN KEY (id_sucursal)  REFERENCES tbSucursal(id_sucursal) ON UPDATE CASCADE ON DELETE SET NULL
)engine InnoDB;/*LISTA*/

/*ALTER TABLE tbMovimiento
   ADD CONSTRAINT fk_sucursal_movs
   FOREIGN KEY (id_sucursal) 
   REFERENCES tbSucursal(id_sucursal);*/


create table if not exists tbEstados(
	id_estado int not null primary key auto_increment,
	ventas decimal(18,2) NOT NULL default 0.00,
    inv_inicial decimal(18,2) NOT NULL default 0.00,
    compras decimal(18,2) NOT NULL default 0.00,
    gst_compras decimal(18,2) NOT NULL default 0.00,
    dev_compras decimal(18,2) NOT NULL default 0.00,
    inv_final decimal(18,2) NOT NULL default 0.00,
    g_ventas decimal(18,2) NOT NULL default 0.00,
    g_adm decimal(18,2) NOT NULL default 0.00,
    g_financ decimal(18,2) NOT NULL default 0.00,
    isr decimal(18,2) NOT NULL default 0.00,
    reserva decimal(18,2) NOT NULL default 0.00,
    utilidad decimal(18,2) NOT NULL default 0.00,
    inicio timestamp,
    cierre timestamp,
    comentario varchar(200) NOT NULL,
    id_sucursal int,
    id_usuario int,
	CONSTRAINT fk_sucursal_estados FOREIGN KEY (id_sucursal) REFERENCES tbSucursal(id_sucursal) ON UPDATE CASCADE ON DELETE SET NULL,
    constraint fk_usuario_estados foreign key (id_usuario) REFERENCES tbusuario(id_usuario)ON UPDATE CASCADE ON DELETE SET NULL
)ENGINE INNODB;/*LISTA*/

/*TABLA DE PEDIDOS, MODIFICAR CON CAMPO NUEVO*/
/*SECCION DE TRIGGERS*/

/*1. Trigger para enviar compras recibidas a la tabla movimientos
y para actualizar en tabla de pedidos*//**FUNCIONAL :DD*/
/*drop trigger multi_typ1_state;*/
DELIMITER $$
create trigger multi_typ1_state after insert on tbdetalleproducto
FOR EACH ROW
BEGIN

	IF (new.id_proveedor > 1) THEN
		insert into tbmovimiento (monto,cantidad,tipo,fecha,id_sucursal, id_externo)
		values (new.unidades_recibidas, new.valor_en_inv,1, new.fecha_hora, new.id_sucursal, new.id_detalleProd);
		
		set @lastID :=  (select max(id_pedido) as id  from tbpedido where id_producto = new.id_producto
		order by max(id_pedido) desc  limit 1);
		
		UPDATE tbpedido set estado = 'Recibido' where id_producto = new.id_producto 
		and id_pedido = @lastID;
			
		UPDATE tbproducto set existencias = (existencias + new.unidades_recibidas), estado = 'Stock'  where id_producto = new.id_producto;
    END IF;
END$$
DELIMITER ;

    
/*2. TRIGGER PARA ENVIAR VENTAS A LA TABLA DE MOVIMIENTOS*//*Listo*/
/*drop trigger InsMovsType0;*/
create trigger InsMovsType0 after insert on tbventa
for each row
	insert into tbmovimiento (monto,cantidad,tipo,fecha,id_sucursal, id_externo)
    values (new.venta_total, 1, 0, new.fecha_hora, new.id_sucursal, new.id_venta);
    
/*3. TRIGGER PARA ACTUALIZAR TABLA DE PRODUCTOS *//*Listo*/
/*drop trigger status_producto;*/
DELIMITER $$
create trigger status_producto after insert on tbpedido
for each row
BEGIN
		UPDATE tbproducto set estado = 'Pdt.Ingreso' where id_producto = new.id_producto;
END$$
DELIMITER ;
    
/*4. TRIGGER PARA ACTUALIZAR LAS VENTAS EN LA TABLA MOVIMIENTOS*//*Listo*/
/*drop trigger updaVentMovs;*/
DELIMITER $$
create trigger updaVentMovs after update on tbventa
for each row
BEGIN
	set @id := (select id_movimiento from tbmovimiento where id_externo = new.id_venta and tipo = 0);
	update tbmovimiento set monto = new.venta_total, id_sucursal = new.id_sucursal  where id_movimiento = @id;
END$$
DELIMITER ;

/*5. TRIGGER PARA ELIMINAR LA VENTA EN LA TABLA DE MOVIMIENTOS*//*Listo*/
/*drop trigger delVentMov;*/
DELIMITER $$
create trigger delVentMov after delete on tbVenta
for each row
BEGIN
	set @id := (select id_movimiento from tbmovimiento where id_externo = old.id_venta and tipo = 0);
    delete from tbmovimiento where id_movimiento = @id;
END $$
DELIMITER ;

/*6. TRIGGER PARA ACTUALIZAR UNA COMPRA RECIBIDA EN LA TABLA DE MOVIMIENTOS*//*Listo*/
/*drop trigger updaDetPro;*/
DELIMITER $$
create trigger updaDetPro after update on tbdetalleproducto
for each row
BEGIN 
	set @id := (select id_movimiento from tbmovimiento where id_externo = new.id_detalleProd and tipo = 1);
    update tbmovimiento set monto = new.valor_en_inv, cantidad = new.unidades_recibidas where id_movimiento = @id;    
END $$
DELIMITER ;

/*7. TRIGGER PARAR ELIMINAR COMPRA RECIBIDA EN LA TABLA DE MOVIMIENTOS*//*Listo*/
/*drop trigger delDetPro;*/
DELIMITER $$
create trigger delDetPro after delete on tbdetalleproducto
for each row
BEGIN
	set @id := (select id_movimiento from tbmovimiento where id_externo = old.id_detalleProd and tipo = 1);
	delete from tbmovimiento where id_movimiento = @id;
    
    update tbproducto set existencias = (existencias - old.unidades_recibidas) where id_producto = old.id_producto;
END $$
DELIMITER ;


/*8. TRIGGER QUE NOS MANDA A BEBIDAS O COMPLEMENTOS DEPENDIENDO EL TIPO*//*Listo*/
/*drop trigger insBebCom;*/
DELIMITER $$
CREATE TRIGGER insBebCom after insert on tbproducto
for each row
BEGIN
	IF (new.tipo = 'B') THEN
		insert into tbbebida (nombre_bebida, id_tipoBebida, precio_bebida, id_referencia)
        values (new.nombre_producto, 1, new.costo_unitario, new.id_producto);
		END if;	
        
	IF (new.tipo = 'C') then
		insert into tbcomplemento (nombre_complemento, id_tipoCom, precio_complemento, id_referencia)
        values (new.nombre_producto, 1, new.costo_unitario, new.id_producto);
		END IF;        
END $$ 
DELIMITER ;

/*9. TRIGGER QUE NOS ACTUALIZA  BEBIDAS O COMPLEMENTOS DEPENDIENDO EL TIPO*//*Listo*/
/*drop trigger updBebCom;*/
DELIMITER $$
CREATE TRIGGER updBebCom after update on tbproducto
for each row
BEGIN
	IF (new.tipo = 'B') THEN
		set @idref := (select id_bebida from tbbebida where id_referencia = new.id_producto);
		update tbbebida set nombre_bebida = new.nombre_producto, precio_bebida = new.costo_unitario 
        where id_bebida = @idref;   
		END if;	
        
	IF (new.tipo = 'C') then
		set @idref := (select id_complemento from tbcomplemento where id_referencia = new.id_producto);
		update tbcomplemento set nombre_complemento = new.nombre_producto, precio_complemento = new.costo_unitario 
        where id_complemento = @idref;
		END IF;        
END $$ 
DELIMITER ;

/*10. TRIGGER QUE RESTA BEBIDAS O COMPLEMENTOS AL INVENTARIO*//*Listo*/
/*DROP trigger updtInventory;*/
DELIMITER $$
CREATE TRIGGER updtInventory AFTER INSERT ON tbdetalleventa
FOR EACH ROW
BEGIN	    
    IF new.id_complemento > 1 THEN
		set @id := (select id_referencia from tbcomplemento where id_complemento = new.id_complemento);
		update tbproducto  set existencias = (existencias - 1) where id_producto = @id;
        END IF;
	
    IF NEW.id_bebida > 1 THEN
		set @id := (select id_referencia from tbbebida where id_bebida = new.id_bebida);
		update tbproducto  set existencias = (existencias - 1) where id_producto = @id;
        END IF;
END $$
DELIMITER ;


/*PARA PONER SIGNO DE DOLAR AL TEXTO SIN TENER PROBLEMAS CON LOS NÚMEROS
<h:outputText value="#{bb.precio_bebida}">
                                        <f:convertNumber type="currency" currencySymbol="$"/>
                                    </h:outputText>

*/




