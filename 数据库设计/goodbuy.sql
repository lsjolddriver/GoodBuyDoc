/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/7/4 11:32:37                            */
/*==============================================================*/


drop table if exists admin_user;

drop table if exists brand;

drop table if exists classification;

drop table if exists comments;

drop table if exists focus;

drop table if exists goods;

drop table if exists history_price;

drop table if exists hot;

drop table if exists subclassification;

drop table if exists subclassification_brand;

drop table if exists user;

/*==============================================================*/
/* Table: admin_user                                            */
/*==============================================================*/
create table admin_user
(
   id                   int not null auto_increment,
   username             varchar(16),
   password             varchar(512),
   primary key (id)
);

/*==============================================================*/
/* Table: brand                                                 */
/*==============================================================*/
create table brand
(
   id                   int not null auto_increment,
   name                 varchar(16),
   primary key (id)
);

/*==============================================================*/
/* Table: classification                                        */
/*==============================================================*/
create table classification
(
   id                   int not null auto_increment,
   name                 varchar(16),
   primary key (id)
);

/*==============================================================*/
/* Table: comments                                              */
/*==============================================================*/
create table comments
(
   id                   int not null auto_increment,
   content              varchar(1024),
   image                varchar(128),
   create_time          date,
   user_id              int,
   good_id              int,
   primary key (id)
);

/*==============================================================*/
/* Table: focus                                                 */
/*==============================================================*/
create table focus
(
   goods_id             int not null,
   user_id              int not null,
   primary key (goods_id, user_id)
);

/*==============================================================*/
/* Table: goods                                                 */
/*==============================================================*/
create table goods
(
   id                   int not null auto_increment,
   name                 varchar(64),
   c_price              float,
   image                varchar(128),
   describtion          varchar(128),
   comments             int,
   sales_number         int,
   source               varchar(64),
   subclassification_id int,
   brand_id             int,
   primary key (id)
);

/*==============================================================*/
/* Table: history_price                                         */
/*==============================================================*/
create table history_price
(
   id                   int not null auto_increment,
   price                float,
   date                 date,
   good_id              int,
   primary key (id)
);

/*==============================================================*/
/* Table: hot                                                   */
/*==============================================================*/
create table hot
(
   id                   int not null auto_increment,
   word                 varchar(64),
   count                int,
   primary key (id)
);

/*==============================================================*/
/* Table: subclassification                                     */
/*==============================================================*/
create table subclassification
(
   id                   int not null auto_increment,
   name                 varchar(16),
   classification_id    int,
   primary key (id)
);

/*==============================================================*/
/* Table: subclassification_brand                               */
/*==============================================================*/
create table subclassification_brand
(
   brand_id             int not null,
   subclassification_id int not null,
   primary key (brand_id, subclassification_id)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   id                   int not null auto_increment,
   username             varchar(16),
   passwoed             varchar(512),
   sex                  int,
   tel                  varchar(11),
   email                varchar(32),
   icon                 varchar(512),
   primary key (id)
);

alter table comments add constraint FK_Relationship_1 foreign key (user_id)
      references user (id) on delete restrict on update restrict;

alter table comments add constraint FK_Relationship_2 foreign key (good_id)
      references goods (id) on delete restrict on update restrict;

alter table focus add constraint FK_Relationship_4 foreign key (user_id)
      references user (id) on delete restrict on update restrict;

alter table focus add constraint FK_Relationship_5 foreign key (goods_id)
      references goods (id) on delete restrict on update restrict;

alter table goods add constraint FK_Relationship_10 foreign key (brand_id)
      references brand (id) on delete restrict on update restrict;

alter table goods add constraint FK_Relationship_12 foreign key (subclassification_id)
      references subclassification (id) on delete restrict on update restrict;

alter table history_price add constraint FK_Relationship_6 foreign key (good_id)
      references goods (id) on delete restrict on update restrict;

alter table subclassification add constraint FK_Relationship_11 foreign key (classification_id)
      references classification (id) on delete restrict on update restrict;

alter table subclassification_brand add constraint FK_Relationship_8 foreign key (subclassification_id)
      references subclassification (id) on delete restrict on update restrict;

alter table subclassification_brand add constraint FK_Relationship_9 foreign key (brand_id)
      references brand (id) on delete restrict on update restrict;

