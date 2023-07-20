/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  20/07/2023 10:04:50                      */
/*==============================================================*/


alter table Association_3 
   drop foreign key FK_ASSOCIAT_ASSOCIATI_CLIENTS;

alter table Association_3 
   drop foreign key FK_ASSOCIAT_ASSOCIATI_TAILLE_C;

alter table Association_5 
   drop foreign key FK_ASSOCIAT_ASSOCIATI_COMMANDE;

alter table Association_5 
   drop foreign key FK_ASSOCIAT_ASSOCIATI_MODEL;

alter table Association_9 
   drop foreign key FK_ASSOCIAT_ASSOCIATI_DEPENSES;

alter table Association_9 
   drop foreign key FK_ASSOCIAT_ASSOCIATI_PERSONNE;

alter table Commande_coudre_habits 
   drop foreign key FK_COMMANDE_ASSOCIATI_FACTURE;

alter table clients 
   drop foreign key FK_CLIENTS_ASSOCIATI_COMMANDE;

alter table clients 
   drop foreign key FK_CLIENTS_ASSOCIATI_RENDEZ_V;

alter table role_utilisateur 
   drop foreign key FK_ROLE_UTI_ASSOCIATI_UTILISAT;


alter table Association_3 
   drop foreign key FK_ASSOCIAT_ASSOCIATI_CLIENTS;

alter table Association_3 
   drop foreign key FK_ASSOCIAT_ASSOCIATI_TAILLE_C;

drop table if exists Association_3;


alter table Association_5 
   drop foreign key FK_ASSOCIAT_ASSOCIATI_COMMANDE;

alter table Association_5 
   drop foreign key FK_ASSOCIAT_ASSOCIATI_MODEL;

drop table if exists Association_5;


alter table Association_9 
   drop foreign key FK_ASSOCIAT_ASSOCIATI_DEPENSES;

alter table Association_9 
   drop foreign key FK_ASSOCIAT_ASSOCIATI_PERSONNE;

drop table if exists Association_9;


alter table Commande_coudre_habits 
   drop foreign key FK_COMMANDE_ASSOCIATI_FACTURE;

drop table if exists Commande_coudre_habits;


alter table clients 
   drop foreign key FK_CLIENTS_ASSOCIATI_RENDEZ_V;

alter table clients 
   drop foreign key FK_CLIENTS_ASSOCIATI_COMMANDE;

drop table if exists clients;

drop table if exists depenses;

drop table if exists facture;

drop table if exists model;

drop table if exists personnels;

drop table if exists rendez_vous;


alter table role_utilisateur 
   drop foreign key FK_ROLE_UTI_ASSOCIATI_UTILISAT;

drop table if exists role_utilisateur;

drop table if exists taille_client;

drop table if exists utilisateur;

/*==============================================================*/
/* Table : Association_3                                        */
/*==============================================================*/
create table Association_3
(
   id_client            int not null  comment '',
   id_taille            int not null  comment '',
   primary key (id_client, id_taille)
);

/*==============================================================*/
/* Table : Association_5                                        */
/*==============================================================*/
create table Association_5
(
   id_cammande          int not null  comment '',
   id_mdole             int not null  comment '',
   primary key (id_cammande, id_mdole)
);

/*==============================================================*/
/* Table : Association_9                                        */
/*==============================================================*/
create table Association_9
(
   id_depense           int not null  comment '',
   id_personnel         int not null  comment '',
   primary key (id_depense, id_personnel)
);

/*==============================================================*/
/* Table : Commande_coudre_habits                               */
/*==============================================================*/
create table Commande_coudre_habits
(
   id_cammande          int not null  comment '',
   id_facture           int not null  comment '',
   description          national char(1)  comment '',
   primary key (id_cammande)
);

/*==============================================================*/
/* Table : clients                                              */
/*==============================================================*/
create table clients
(
   id_client            int not null  comment '',
   id_cammande          int not null  comment '',
   id_rvd               int  comment '',
   nom_prenom           national char(1)  comment '',
   sexe                 national char(1)  comment '',
   telephone            int  comment '',
   adresse_             national char(1)  comment '',
   _adresse             datetime  comment '',
   primary key (id_client)
);

/*==============================================================*/
/* Table : depenses                                             */
/*==============================================================*/
create table depenses
(
   id_depense           int not null  comment '',
   description          national char(1)  comment '',
   date                 datetime  comment '',
   primary key (id_depense),
   key AK_Identifiant_1 (id_depense)
);

/*==============================================================*/
/* Table : facture                                              */
/*==============================================================*/
create table facture
(
   id_facture           int not null  comment '',
   montant_total        int  comment '',
   avance               int  comment '',
   reste                int  comment '',
   date                 datetime  comment '',
   primary key (id_facture)
);

/*==============================================================*/
/* Table : model                                                */
/*==============================================================*/
create table model
(
   id_mdole             int not null  comment '',
   nom_model            national char(1)  comment '',
   type_model           national char(1)  comment '',
   date                 datetime  comment '',
   primary key (id_mdole)
);

/*==============================================================*/
/* Table : personnels                                           */
/*==============================================================*/
create table personnels
(
   id_personnel         int not null  comment '',
   nom_prenom           national char(1)  comment '',
   fonction             national char(1)  comment '',
   salaire              numeric(8,0)  comment '',
   date                 datetime  comment '',
   primary key (id_personnel),
   key AK_Identifiant_1 (id_personnel)
);

/*==============================================================*/
/* Table : rendez_vous                                          */
/*==============================================================*/
create table rendez_vous
(
   id_rvd               int not null  comment '',
   date_rdv             datetime  comment '',
   primary key (id_rvd)
);

/*==============================================================*/
/* Table : role_utilisateur                                     */
/*==============================================================*/
create table role_utilisateur
(
   id_role              int not null  comment '',
   id_user              int not null  comment '',
   libele_role          national char(1)  comment '',
   date                 datetime  comment '',
   primary key (id_role)
);

/*==============================================================*/
/* Table : taille_client                                        */
/*==============================================================*/
create table taille_client
(
   id_taille            int not null  comment '',
   tour_epaaule         numeric(8,0)  comment '',
   tour_poitrine        numeric(8,0)  comment '',
   tour_taille          numeric(8,0)  comment '',
   tour_hanche          numeric(8,0)  comment '',
   tour_bassib          numeric(8,0)  comment '',
   long_final           numeric(8,0)  comment '',
   primary key (id_taille)
);

/*==============================================================*/
/* Table : utilisateur                                          */
/*==============================================================*/
create table utilisateur
(
   id_user              int not null  comment '',
   identifiant          national char(1)  comment '',
   password             national char(1)  comment '',
   date                 datetime  comment '',
   primary key (id_user)
);

alter table Association_3 add constraint FK_ASSOCIAT_ASSOCIATI_CLIENTS foreign key (id_client)
      references clients (id_client) on delete restrict on update restrict;

alter table Association_3 add constraint FK_ASSOCIAT_ASSOCIATI_TAILLE_C foreign key (id_taille)
      references taille_client (id_taille) on delete restrict on update restrict;

alter table Association_5 add constraint FK_ASSOCIAT_ASSOCIATI_COMMANDE foreign key (id_cammande)
      references Commande_coudre_habits (id_cammande) on delete restrict on update restrict;

alter table Association_5 add constraint FK_ASSOCIAT_ASSOCIATI_MODEL foreign key (id_mdole)
      references model (id_mdole) on delete restrict on update restrict;

alter table Association_9 add constraint FK_ASSOCIAT_ASSOCIATI_DEPENSES foreign key (id_depense)
      references depenses (id_depense) on delete restrict on update restrict;

alter table Association_9 add constraint FK_ASSOCIAT_ASSOCIATI_PERSONNE foreign key (id_personnel)
      references personnels (id_personnel) on delete restrict on update restrict;

alter table Commande_coudre_habits add constraint FK_COMMANDE_ASSOCIATI_FACTURE foreign key (id_facture)
      references facture (id_facture) on delete restrict on update restrict;

alter table clients add constraint FK_CLIENTS_ASSOCIATI_COMMANDE foreign key (id_cammande)
      references Commande_coudre_habits (id_cammande) on delete restrict on update restrict;

alter table clients add constraint FK_CLIENTS_ASSOCIATI_RENDEZ_V foreign key (id_rvd)
      references rendez_vous (id_rvd) on delete restrict on update restrict;

alter table role_utilisateur add constraint FK_ROLE_UTI_ASSOCIATI_UTILISAT foreign key (id_user)
      references utilisateur (id_user) on delete restrict on update restrict;

