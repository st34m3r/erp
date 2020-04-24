--
-- $Id$
--
-- Be carefull to requests order.
-- This file must be loaded by calling /install/index.php page
-- when current version is 2.4.0 or higher. 
--

alter table can_product add column   price_min          double(24,8) DEFAULT 0;
alter table can_product add column   price_min_ttc      double(24,8) DEFAULT 0;
alter table can_product add column   finished			 tinyint	  DEFAULT NULL after canvas;

alter table can_product_price   add column price_min              double(24,8) default NULL;
alter table can_product_price   add column price_min_ttc          double(24,8) default NULL;

alter table can_societe add column gencod			 varchar(255);

delete from can_user_param where page <> '';

alter table can_expedition add column tracking_number varchar(50) after fk_expedition_methode;

alter table can_actioncomm add column location varchar(128) after percent;

-- remove enum type
alter table can_adherent_type modify column cotisation       varchar(3) NOT NULL DEFAULT 'yes';
alter table can_adherent_type modify column vote             varchar(3) NOT NULL DEFAULT 'yes';
alter table can_adherent modify column morphy           varchar(3) NOT NULL;
alter table can_c_paper_format modify column unit     varchar(5)                       NOT NULL;
alter table can_const modify column type        varchar(6);
alter table can_menu modify column type			varchar(4) NOT NULL;
alter table can_notify modify column objet_type      varchar(24) NOT NULL;
alter table can_projet_task_actors modify column role           varchar(5) DEFAULT 'admin';
alter table can_projet_task modify column statut             varchar(6) DEFAULT 'open';
alter table can_rights_def modify column   type          varchar(1);

ALTER TABLE can_menu ADD COLUMN enabled	varchar(255) NULL default '1' after perms;

ALTER TABLE `can_commandedet` ADD column `date_start` DATETIME DEFAULT NULL, ADD `date_end` DATETIME DEFAULT NULL ;

alter table can_categorie add column fk_soc integer DEFAULT NULL after description;

alter table can_product drop column nbvente;

alter table can_product     add column import_key         varchar(14);
alter table can_socpeople   add column import_key         varchar(14);
alter table can_facture     add column import_key         varchar(14);
alter table can_facturedet  add column import_key         varchar(14);
alter table can_commande    add column import_key         varchar(14);
alter table can_commandedet add column import_key         varchar(14);
alter table can_facture_fourn     add column import_key         varchar(14);
alter table can_facture_fourn_det add column import_key         varchar(14);

alter table can_commande    modify column source smallint NULL;

update can_c_prospectlevel set code='PL_NONE', label='None' where code='PL_UNKOWN' or code='PL_NONE';

update can_societe set fk_prospectlevel=null where fk_prospectlevel='PL_UNKOWN';

alter table can_expedition add height integer;
alter table can_expedition add width integer;
alter table can_expedition add size_units integer;
alter table can_expedition add size integer;
alter table can_expedition add weight_units integer;
alter table can_expedition add weight integer;

ALTER TABLE can_paiement_facture ADD UNIQUE INDEX uk_paiement_facture(fk_paiement, fk_facture);
ALTER TABLE can_paiementfourn_facturefourn ADD UNIQUE INDEX uk_paiementfourn_facturefourn(fk_paiementfourn, fk_facturefourn);

update can_expedition_methode set code='ENL', libelle='Enlevement' where code='enlevement';
update can_expedition_methode set code='TRANS', libelle='Transporteur' where code='transporteur';

alter table can_fichinterdet modify date datetime;

alter table can_don modify fk_don_projet   integer NULL;
alter table can_don modify fk_user_valid   integer NULL;
alter table can_don add note_public     text;
alter table can_don add model_pdf       varchar(50);
alter table can_don add import_key      varchar(14);

ALTER TABLE can_export_model DROP INDEX uk_export_model;
ALTER TABLE can_export_model ADD UNIQUE uk_export_model (label,type);

alter table can_adherent_options_label add column type varchar(8);
alter table can_adherent_options_label add column size integer DEFAULT 0;
alter table can_adherent_options_label add column pos integer DEFAULT 0;

-- Reverse option
update can_const set visible = 1, name = 'FACTURE_ENABLE_RECUR', value='1' where name = 'FACTURE_DISABLE_RECUR' and value = '0';
delete from can_const where name = 'FACTURE_DISABLE_RECUR' and value = '1';
delete from can_const where name like 'MAIN_FASTSEARCH_%';

alter table can_bank_account modify comment        text;

update can_bank_account set ref = label where ref is null or ref = '';

-- 2.5.1
update can_actioncomm set datep = datea where datep is null;


insert into can_c_type_contact(rowid, element, source, code, libelle, active ) values (70, 'facture_fourn', 'internal', 'SALESREPFOLL',  'Responsable suivi du paiement', 1);
insert into can_c_type_contact(rowid, element, source, code, libelle, active ) values (71, 'facture_fourn', 'external', 'BILLING',       'Contact fournisseur facturation', 1);
insert into can_c_type_contact(rowid, element, source, code, libelle, active ) values (72, 'facture_fourn', 'external', 'SHIPPING',      'Contact fournisseur livraison', 1);
insert into can_c_type_contact(rowid, element, source, code, libelle, active ) values (73, 'facture_fourn', 'external', 'SERVICE',       'Contact fournisseur prestation', 1);

alter table can_product_stock add column   pmp             double(24,8) default 0 NOT NULL;

alter table can_expedition_methode change statut active tinyint DEFAULT 1;

INSERT INTO can_expedition_methode (rowid,code,libelle,description,active) VALUES (1,'CATCH','Catch','Catch by client',1);
INSERT INTO can_expedition_methode (rowid,code,libelle,description,active) VALUES (2,'TRANS','Transporter','Generic transporter',1);
INSERT INTO can_expedition_methode (rowid,code,libelle,description,active) VALUES (3,'COLSUI','Colissimo Suivi','Colissimo Suivi',0);

