/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     05/11/2019 12.59.11                          */
/*==============================================================*/


drop table if exists ALL_CLASS;

drop table if exists MATERI;

drop table if exists STUDENT;

drop table if exists STUDENT_CLASS;

drop table if exists TEACHER;

/*==============================================================*/
/* Table: ALL_CLASS                                             */
/*==============================================================*/
create table ALL_CLASS
(
   ID_CLASS             char(3) not null,
   NIP                  char(12),
   NAMA_CLASS           varchar(20),
   DETAIL_CLASS         varchar(1024),
   primary key (ID_CLASS)
);

/*==============================================================*/
/* Table: MATERI                                                */
/*==============================================================*/
create table MATERI
(
   ID_MATERI            char(3) not null,
   NIP                  char(12),
   NAMA_MATERI          text,
   DETAIL_MATERI        text,
   primary key (ID_MATERI)
);

/*==============================================================*/
/* Table: STUDENT                                               */
/*==============================================================*/
create table STUDENT
(
   NIM                  char(12) not null,
   PASSWORD_STUDENT     varchar(64),
   NAMA_STUDENT         varchar(30),
   JENIS_KELAMIN        varchar(20),
   ALAMAT_RUMAH         varchar(40),
   ALAMAT_EMAIL         varchar(30),
   NOMER_HP             char(12),
   primary key (NIM)
);

/*==============================================================*/
/* Table: STUDENT_CLASS                                         */
/*==============================================================*/
create table STUDENT_CLASS
(
   ID_CLASS             char(3) not null,
   NIM                  char(12) not null,
   NIP                  char(12) not null,
   primary key (ID_CLASS, NIM, NIP)
);

/*==============================================================*/
/* Table: TEACHER                                               */
/*==============================================================*/
create table TEACHER
(
   NIP                  char(12) not null,
   NAMA_TEACHER         varchar(40),
   PASSWORD_TEACHER     varchar(64),
   primary key (NIP)
);

alter table ALL_CLASS add constraint FK_MEMILIKI foreign key (NIP)
      references TEACHER (NIP) on delete restrict on update restrict;

alter table MATERI add constraint FK_MENGUPLOUD foreign key (NIP)
      references TEACHER (NIP) on delete restrict on update restrict;

alter table STUDENT_CLASS add constraint FK_STUDENT_CLASS foreign key (ID_CLASS)
      references ALL_CLASS (ID_CLASS) on delete restrict on update restrict;

alter table STUDENT_CLASS add constraint FK_STUDENT_CLASS2 foreign key (NIM)
      references STUDENT (NIM) on delete restrict on update restrict;

alter table STUDENT_CLASS add constraint FK_STUDENT_CLASS3 foreign key (NIP)
      references TEACHER (NIP) on delete restrict on update restrict;

