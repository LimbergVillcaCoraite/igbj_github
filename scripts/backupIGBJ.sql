/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     27/09/2022 10:08:41 p.m.                     */
/*==============================================================*/


drop table if exists ACTIVIDADES;

drop table if exists ASIGEQUIPOS;

drop table if exists ASIGNACIONRESPUESTO;

drop table if exists ASIGNACION_DEP_PER;

drop table if exists CARGO;

drop table if exists CATALOGO;

drop table if exists CENTROMANTENIMIENTO;

drop table if exists CLASEEQUIPO;

drop table if exists CLASEMANTENIMIENTO;

drop table if exists CRONOGRAMAPREVENTIVO;

drop table if exists DEPARTAMENTOS;

drop table if exists DETALLECRONOGRAMA;

drop table if exists DETALLEMANTENIMIENTO;

drop table if exists EQUIPOS;

drop table if exists ITEMPERSONAL;

drop table if exists MANTENIMIENTO;

drop table if exists PERSONA;

drop table if exists PERSONAL;

drop table if exists PROVEEDOR;

drop table if exists REPUESTOS;

drop table if exists SESION;

drop table if exists TAREAS;

drop table if exists TECNICOS;

drop table if exists TIPOMANTENIMIENTO;

drop table if exists TIPORESPUESTO;

drop table if exists USUARIO;

/*==============================================================*/
/* Table: ACTIVIDADES                                           */
/*==============================================================*/
create table ACTIVIDADES
(
   CODTAREA             int not null,
   CODESPE              varchar(30),
   NOMTAREA             varchar(200) not null,
   ESTADO               bool not null,
   primary key (CODTAREA)
);

/*==============================================================*/
/* Table: ASIGEQUIPOS                                           */
/*==============================================================*/
create table ASIGEQUIPOS
(
   FECHAASIGNACION      date not null,
   FECHADESASIGNACION   date not null,
   OBSERVACIONASIGNACION varchar(500),
   CODASIGEQUIPOS       int not null,
   CODEQUIPO            varchar(50),
   CODASIG              varchar(30),
   primary key (CODASIGEQUIPOS)
);

/*==============================================================*/
/* Table: ASIGNACIONRESPUESTO                                   */
/*==============================================================*/
create table ASIGNACIONRESPUESTO
(
   CODASIGNACION        varchar(20) not null,
   CODREPUESTO          varchar(30),
   primary key (CODASIGNACION)
);

/*==============================================================*/
/* Table: ASIGNACION_DEP_PER                                    */
/*==============================================================*/
create table ASIGNACION_DEP_PER
(
   FECHAASIGNACION      date not null,
   FECHACONCLUCION      date not null,
   ESTADO               bool,
   CODASIG              varchar(30) not null,
   CODDEPARTAMENTO      varchar(50),
   CODPERSONAL          varchar(30),
   CODCARGO             varchar(50),
   primary key (CODASIG)
);

/*==============================================================*/
/* Table: CARGO                                                 */
/*==============================================================*/
create table CARGO
(
   CODCARGO             varchar(50) not null,
   CARGO                varchar(50) not null,
   primary key (CODCARGO)
);

/*==============================================================*/
/* Table: CATALOGO                                              */
/*==============================================================*/
create table CATALOGO
(
   CODGENERAL           varchar(30) not null,
   CODMANT              varchar(25),
   NOMGENERAL           varchar(30) not null,
   ESTADO               bool not null,
   primary key (CODGENERAL)
);

/*==============================================================*/
/* Table: CENTROMANTENIMIENTO                                   */
/*==============================================================*/
create table CENTROMANTENIMIENTO
(
   IDCMANTENIMIENTO     int not null,
   CLASIFICACIONMANTENIMINETO varchar(200) not null,
   primary key (IDCMANTENIMIENTO)
);

/*==============================================================*/
/* Table: CLASEEQUIPO                                           */
/*==============================================================*/
create table CLASEEQUIPO
(
   CODCLASE             varchar(20) not null,
   CODEQUIPO            varchar(50) not null,
   CLASEEQUIPO          varchar(50) not null,
   DESCRIPCIONCLASE     varchar(200) not null,
   primary key (CODCLASE)
);

/*==============================================================*/
/* Table: CLASEMANTENIMIENTO                                    */
/*==============================================================*/
create table CLASEMANTENIMIENTO
(
   CODMANT              varchar(25) not null,
   NOMBMANT             varchar(20) not null,
   ESTADO               bool,
   primary key (CODMANT)
);

/*==============================================================*/
/* Table: CRONOGRAMAPREVENTIVO                                  */
/*==============================================================*/
create table CRONOGRAMAPREVENTIVO
(
   FECHAPROGRAMADA      date,
   FECHASALIDA          date,
   CODCRONO             int not null,
   CODEQUIPO            varchar(50),
   primary key (CODCRONO)
);

/*==============================================================*/
/* Table: DEPARTAMENTOS                                         */
/*==============================================================*/
create table DEPARTAMENTOS
(
   CODDEPARTAMENTO      varchar(50) not null,
   NOMBDEPARTAMENTO     varchar(50) not null,
   DESCRIPDESCRIPCION   varchar(200),
   primary key (CODDEPARTAMENTO)
);

/*==============================================================*/
/* Table: DETALLECRONOGRAMA                                     */
/*==============================================================*/
create table DETALLECRONOGRAMA
(
   CODESPE              varchar(30),
   CODCRONO             int,
   CANTIDAD             char(2)
);

/*==============================================================*/
/* Table: DETALLEMANTENIMIENTO                                  */
/*==============================================================*/
create table DETALLEMANTENIMIENTO
(
   CODASIGNACION        varchar(20),
   CODMANTENIMIENTO     varchar(30),
   CODESPE              varchar(30),
   CANTIDAD             char(2)
);

/*==============================================================*/
/* Table: EQUIPOS                                               */
/*==============================================================*/
create table EQUIPOS
(
   CODEQUIPO            varchar(50) not null,
   NIT                  varchar(30),
   MARCAEQUIPO          varchar(20) not null,
   MODELOEQUIPO         varchar(30) not null,
   SERIEEQUIPO          varchar(30) not null,
   ANIOFABREQUIIPO      date not null,
   PROCEDENCIAEQUIPO    varchar(30) not null,
   FECHEINGRESO         date not null,
   FOTOGRAFIA           longblob not null,
   FECHAREGISTRO        date not null,
   FECHAMODIFICACION    date not null,
   USUARIOREGISTRO      date,
   CODACTIVOFIJO        varchar(15) not null,
   DESCRIPCION          varchar(200),
   primary key (CODEQUIPO)
);

/*==============================================================*/
/* Table: ITEMPERSONAL                                          */
/*==============================================================*/
create table ITEMPERSONAL
(
   CODITEM              varchar(20) not null,
   ESTADO               bool not null,
   primary key (CODITEM)
);

/*==============================================================*/
/* Table: MANTENIMIENTO                                         */
/*==============================================================*/
create table MANTENIMIENTO
(
   CODMANTENIMIENTO     varchar(30) not null,
   CODTECNICO           int,
   CODASIGEQUIPOS       int,
   CODTIPO              varchar(30),
   FECHAINGRESO         date not null,
   FECHASALIDA          date not null,
   ESTADOACTUAL         text not null,
   FOTOINGRESO          longblob,
   FOTOSALIDA           longblob,
   primary key (CODMANTENIMIENTO)
);

/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
create table PERSONA
(
   CI                   varchar(15) not null,
   NOMREUSUARIO         varchar(12),
   NOMBRES              varchar(30) not null,
   APPATERNO            varchar(50) not null,
   APMATERNO            varchar(30) not null,
   FECHANAMIENTO        date,
   DIRECCION            varchar(50),
   TELEFONO             varchar(8),
   CORREO               varchar(30),
   CELULARPERSONA       varchar(8),
   SEXO                 char(1),
   COMPLEMETOCI         varchar(5),
   EXPEDIDOCI           varchar(5),
   PROFESION            varchar(50),
   primary key (CI)
);

/*==============================================================*/
/* Table: PERSONAL                                              */
/*==============================================================*/
create table PERSONAL
(
   CODPERSONAL          varchar(30) not null,
   CODITEM              varchar(20),
   CI                   varchar(15),
   FECHAASIGNACION      date not null,
   FECHADESASIGNACION   date not null,
   ESTADO               bool not null,
   primary key (CODPERSONAL)
);

/*==============================================================*/
/* Table: PROVEEDOR                                             */
/*==============================================================*/
create table PROVEEDOR
(
   NIT                  varchar(30) not null,
   NOMPROVEEDOR         varchar(30) not null,
   DIRECCION            varchar(50) not null,
   TELEFONOPROVEEDOR    varchar(8) not null,
   CORREOCONTACTO       varchar(30) not null,
   CELULARCONTACTO      varchar(8) not null,
   CONTACTO             varchar(10) not null,
   primary key (NIT)
);

/*==============================================================*/
/* Table: REPUESTOS                                             */
/*==============================================================*/
create table REPUESTOS
(
   CODREPUESTO          varchar(30) not null,
   CODRESP              varchar(30),
   NOMBRERESPUESTO      varchar(30) not null,
   DETALLEREPUESTO      varchar(200),
   primary key (CODREPUESTO)
);

/*==============================================================*/
/* Table: SESION                                                */
/*==============================================================*/
create table SESION
(
   NOMREUSUARIO         varchar(12),
   NOMBREUSUARIO        varchar(200),
   APELLIDOUSUARIO      varchar(200)
);

/*==============================================================*/
/* Table: TAREAS                                                */
/*==============================================================*/
create table TAREAS
(
   CODESPE              varchar(30) not null,
   CODGENERAL           varchar(30),
   NOMESPE              varchar(50) not null,
   ESTADO               bool,
   primary key (CODESPE)
);

/*==============================================================*/
/* Table: TECNICOS                                              */
/*==============================================================*/
create table TECNICOS
(
   FECHAASIGNACION      date,
   CODTECNICO           int not null,
   CODASIG              varchar(30),
   IDCMANTENIMIENTO     int,
   primary key (CODTECNICO)
);

/*==============================================================*/
/* Table: TIPOMANTENIMIENTO                                     */
/*==============================================================*/
create table TIPOMANTENIMIENTO
(
   CODTIPO              varchar(30) not null,
   NOMTIPO              varchar(20),
   ESTADO               bool,
   primary key (CODTIPO)
);

/*==============================================================*/
/* Table: TIPORESPUESTO                                         */
/*==============================================================*/
create table TIPORESPUESTO
(
   CODRESP              varchar(30) not null,
   NOMBRERESPUESTO      varchar(30),
   primary key (CODRESP)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO
(
   NOMREUSUARIO         varchar(12) not null,
   CODASIG              varchar(30),
   CI                   varchar(15),
   CONTRASENA           varchar(15) not null,
   ESTADO               bool,
   primary key (NOMREUSUARIO)
);

alter table ACTIVIDADES add constraint FK_RELATIONSHIP_38 foreign key (CODESPE)
      references TAREAS (CODESPE) on delete restrict on update restrict;

alter table ASIGEQUIPOS add constraint FK_RELATIONSHIP_23 foreign key (CODEQUIPO)
      references EQUIPOS (CODEQUIPO) on delete restrict on update restrict;

alter table ASIGEQUIPOS add constraint FK_RELATIONSHIP_30 foreign key (CODASIG)
      references ASIGNACION_DEP_PER (CODASIG) on delete restrict on update restrict;

alter table ASIGNACIONRESPUESTO add constraint FK_RELATIONSHIP_13 foreign key (CODREPUESTO)
      references REPUESTOS (CODREPUESTO) on delete restrict on update restrict;

alter table ASIGNACION_DEP_PER add constraint FK_RELATIONSHIP_29 foreign key (CODPERSONAL)
      references PERSONAL (CODPERSONAL) on delete restrict on update restrict;

alter table ASIGNACION_DEP_PER add constraint FK_RELATIONSHIP_31 foreign key (CODDEPARTAMENTO)
      references DEPARTAMENTOS (CODDEPARTAMENTO) on delete restrict on update restrict;

alter table ASIGNACION_DEP_PER add constraint FK_RELATIONSHIP_44 foreign key (CODCARGO)
      references CARGO (CODCARGO) on delete restrict on update restrict;

alter table CATALOGO add constraint FK_RELATIONSHIP_24 foreign key (CODMANT)
      references CLASEMANTENIMIENTO (CODMANT) on delete restrict on update restrict;

alter table CLASEEQUIPO add constraint FK_RELATIONSHIP_1 foreign key (CODEQUIPO)
      references EQUIPOS (CODEQUIPO) on delete restrict on update restrict;

alter table CRONOGRAMAPREVENTIVO add constraint FK_RELATIONSHIP_41 foreign key (CODEQUIPO)
      references EQUIPOS (CODEQUIPO) on delete restrict on update restrict;

alter table DETALLECRONOGRAMA add constraint FK_RELATIONSHIP_42 foreign key (CODCRONO)
      references CRONOGRAMAPREVENTIVO (CODCRONO) on delete restrict on update restrict;

alter table DETALLECRONOGRAMA add constraint FK_RELATIONSHIP_43 foreign key (CODESPE)
      references TAREAS (CODESPE) on delete restrict on update restrict;

alter table DETALLEMANTENIMIENTO add constraint FK_RELATIONSHIP_12 foreign key (CODASIGNACION)
      references ASIGNACIONRESPUESTO (CODASIGNACION) on delete restrict on update restrict;

alter table DETALLEMANTENIMIENTO add constraint FK_RELATIONSHIP_19 foreign key (CODMANTENIMIENTO)
      references MANTENIMIENTO (CODMANTENIMIENTO) on delete restrict on update restrict;

alter table DETALLEMANTENIMIENTO add constraint FK_RELATIONSHIP_25 foreign key (CODESPE)
      references TAREAS (CODESPE) on delete restrict on update restrict;

alter table EQUIPOS add constraint FK_RELATIONSHIP_26 foreign key (NIT)
      references PROVEEDOR (NIT) on delete restrict on update restrict;

alter table MANTENIMIENTO add constraint FK_RELATIONSHIP_35 foreign key (CODTECNICO)
      references TECNICOS (CODTECNICO) on delete restrict on update restrict;

alter table MANTENIMIENTO add constraint FK_RELATIONSHIP_36 foreign key (CODASIGEQUIPOS)
      references ASIGEQUIPOS (CODASIGEQUIPOS) on delete restrict on update restrict;

alter table MANTENIMIENTO add constraint FK_RELATIONSHIP_39 foreign key (CODTIPO)
      references TIPOMANTENIMIENTO (CODTIPO) on delete restrict on update restrict;

alter table PERSONA add constraint FK_RELATIONSHIP_17 foreign key (NOMREUSUARIO)
      references USUARIO (NOMREUSUARIO) on delete restrict on update restrict;

alter table PERSONAL add constraint FK_RELATIONSHIP_21 foreign key (CI)
      references PERSONA (CI) on delete restrict on update restrict;

alter table PERSONAL add constraint FK_RELATIONSHIP_40 foreign key (CODITEM)
      references ITEMPERSONAL (CODITEM) on delete restrict on update restrict;

alter table REPUESTOS add constraint FK_RELATIONSHIP_22 foreign key (CODRESP)
      references TIPORESPUESTO (CODRESP) on delete restrict on update restrict;

alter table SESION add constraint FK_RELATIONSHIP_14 foreign key (NOMREUSUARIO)
      references USUARIO (NOMREUSUARIO) on delete restrict on update restrict;

alter table TAREAS add constraint FK_RELATIONSHIP_37 foreign key (CODGENERAL)
      references CATALOGO (CODGENERAL) on delete restrict on update restrict;

alter table TECNICOS add constraint FK_RELATIONSHIP_33 foreign key (IDCMANTENIMIENTO)
      references CENTROMANTENIMIENTO (IDCMANTENIMIENTO) on delete restrict on update restrict;

alter table TECNICOS add constraint FK_RELATIONSHIP_34 foreign key (CODASIG)
      references ASIGNACION_DEP_PER (CODASIG) on delete restrict on update restrict;

alter table USUARIO add constraint FK_RELATIONSHIP_18 foreign key (CI)
      references PERSONA (CI) on delete restrict on update restrict;

alter table USUARIO add constraint FK_RELATIONSHIP_28 foreign key (CODASIG)
      references ASIGNACION_DEP_PER (CODASIG) on delete restrict on update restrict;

