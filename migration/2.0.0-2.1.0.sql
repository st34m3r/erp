--
-- $Id$
-- $Revision$
--
-- Attention a l ordre des requetes.
-- Ce fichier doit etre charge sur une version 2.0.0 
-- sans AUCUNE erreur ni warning
--

create table can_paiementfourn_facturefourn
(
  rowid integer AUTO_INCREMENT PRIMARY KEY,
  fk_paiementfourn INT(11) DEFAULT NULL,
  fk_facturefourn  INT(11) DEFAULT NULL,
  amount DOUBLE DEFAULT '0'
) Engine=innodb;
ALTER TABLE can_paiementfourn_facturefourn ADD INDEX idx_paiementfourn_facturefourn_fk_facture(fk_facturefourn);
ALTER TABLE can_paiementfourn_facturefourn ADD INDEX idx_paiementfourn_facturefourn_fk_paiement(fk_paiementfourn);


drop table if exists can_commande_model_pdf;
drop table if exists can_commande_fournisseur_model_pdf;

alter table can_commande add column note_public text after note;

alter table can_contrat add column note text;
alter table can_contrat add column note_public text after note;

alter table can_facture add column note_public text after note;
alter table can_facture add column remise_absolue real DEFAULT 0 after remise_percent;
alter table can_facture add column close_code  varchar(16)  after remise;
alter table can_facture add column close_note  varchar(128) after close_code;
alter table can_facture modify close_code  varchar(16);

alter table can_propal add column note_public text after note;
alter table can_propal add column remise_absolue real DEFAULT 0 after remise_percent;

alter table can_commande add column remise_absolue real DEFAULT 0 after remise_percent;

ALTER TABLE can_societe add mode_reglement tinyint;
ALTER TABLE can_societe add cond_reglement tinyint;
ALTER TABLE can_societe add tva_assuj      tinyint DEFAULT '1';
ALTER TABLE can_societe add email          varchar(128) after url;

ALTER TABLE can_societe change active statut tinyint DEFAULT 0;

ALTER TABLE can_societe modify mode_reglement     tinyint NULL;
ALTER TABLE can_societe modify cond_reglement     tinyint NULL;
ALTER TABLE can_societe modify cond_reglement     tinyint NULL;
ALTER TABLE can_societe modify fk_stcomm          tinyint        DEFAULT 0;
ALTER TABLE can_societe modify services           tinyint        DEFAULT 0;
ALTER TABLE can_societe modify client             tinyint        DEFAULT 0;
ALTER TABLE can_societe modify fournisseur        tinyint        DEFAULT 0;

ALTER TABLE can_societe add customer_bad       tinyint        DEFAULT 0 after fournisseur;
ALTER TABLE can_societe add customer_rate      real           DEFAULT 0 after customer_bad;
ALTER TABLE can_societe add supplier_rate      real           DEFAULT 0 after customer_rate;

ALTER TABLE can_societe modify siren       varchar(16);
ALTER TABLE can_societe modify siret       varchar(16);
ALTER TABLE can_societe modify ape         varchar(16);
ALTER TABLE can_societe add idprof4        varchar(16) after ape;

ALTER TABLE can_societe drop column id;

ALTER TABLE can_societe modify parent             integer;
UPDATE can_societe set parent = null where parent = 0;

ALTER TABLE can_product ADD COLUMN stock_loc VARCHAR(10) DEFAULT NULL;
ALTER TABLE can_product ADD COLUMN gencode VARCHAR(255) DEFAULT NULL;
ALTER TABLE can_product ADD COLUMN weight float DEFAULT NULL;
ALTER TABLE can_product ADD COLUMN weight_units tinyint DEFAULT NULL;
ALTER TABLE can_product ADD COLUMN canvas varchar(15) DEFAULT '';

ALTER TABLE can_stock_mouvement ADD COLUMN price FLOAT(13,4) DEFAULT 0;

insert into can_cond_reglement(rowid, code, sortorder, active, libelle, libelle_facture, fdm, nbjour) values (6,'PROFORMA',    6,1, 'Proforma','R�glement avant livraison',0,0);

alter table can_cond_reglement add (decalage smallint(6) default 0);

alter table can_commande add fk_cond_reglement int(11) DEFAULT NULL;
alter table can_commande add fk_mode_reglement int(11) DEFAULT NULL;


alter table can_categorie drop column fk_statut;
alter table can_categorie add visible tinyint DEFAULT 1 NOT NULL;
ALTER TABLE can_categorie ADD UNIQUE INDEX uk_categorie_ref (label);

alter table can_c_actioncomm  add module varchar(16) DEFAULT NULL after libelle;

delete from can_c_actioncomm where id in (1,2,3,4,5,8,9,50);
insert into can_c_actioncomm (id, code, type, libelle, module) values ( 1, 'AC_TEL',  'system', 'Appel Téléphonique' ,NULL);
insert into can_c_actioncomm (id, code, type, libelle, module) values ( 2, 'AC_FAX',  'system', 'Envoi Fax'          ,NULL);
insert into can_c_actioncomm (id, code, type, libelle, module) values ( 3, 'AC_PROP', 'system', 'Envoi Proposition'  ,'propal');
insert into can_c_actioncomm (id, code, type, libelle, module) values ( 4, 'AC_EMAIL','system', 'Envoi Email'        ,NULL);
insert into can_c_actioncomm (id, code, type, libelle, module) values ( 5, 'AC_RDV',  'system', 'Rendez-vous'        ,NULL);
insert into can_c_actioncomm (id, code, type, libelle, module) values ( 8, 'AC_COM',  'system', 'Envoi Commande'     ,'order');
insert into can_c_actioncomm (id, code, type, libelle, module) values ( 9, 'AC_FAC',  'system', 'Envoi Facture'      ,'invoice');
insert into can_c_actioncomm (id, code, type, libelle, module) values (50, 'AC_OTH',  'system', 'Autre'              ,NULL);

alter table can_actioncomm modify datea datetime;
alter table can_actioncomm add column datec datetime after id;
alter table can_actioncomm add column datep datetime after datec;
alter table can_actioncomm add column datep2 datetime after datep;
alter table can_actioncomm add column datea2 datetime after datea;
alter table can_actioncomm add column tms timestamp after datea2;
alter table can_actioncomm add column fk_commande integer after propalrowid;
alter table can_actioncomm add column fk_parent integer NOT NULL default 0 after fk_contact;
alter table can_actioncomm add column durationp real after percent;
alter table can_actioncomm add column durationa real after durationp;
alter table can_actioncomm add column fk_projet integer after label;
alter table can_actioncomm add column punctual smallint NOT NULL default 1 after priority;


update can_actioncomm set datec = datea where datec is null;
update can_actioncomm set datep = datea where datep is null AND percent < 100;
update can_actioncomm set datep = datec where datea is null AND datep is null AND percent < 100;
update can_actioncomm set datea = datec where datea is null AND datep is null AND percent = 100;
update can_actioncomm set fk_action = '8' where fk_action =  '3' and label = 'Envoi commande par mail';



drop table if exists can_expedition_model_pdf;


create table can_product_det
(
  rowid          integer AUTO_INCREMENT PRIMARY KEY,
  fk_product     integer      DEFAULT 0 NOT NULL,
  lang           varchar(5)   DEFAULT 0 NOT NULL,
  label          varchar(255) NOT NULL,
  description    text,
  note           text
)Engine=innodb;

ALTER TABLE `can_propal` ADD `date_livraison` DATE;
ALTER TABLE `can_commande` ADD `date_livraison` DATE;
update can_commande set date_livraison = null where date_livraison = '0000-00-00';
update can_commande set date_livraison = null where date_livraison = '1970-01-01';

ALTER TABLE can_facture_fourn DROP INDEX facnumber;
ALTER TABLE can_facture_fourn ADD UNIQUE INDEX uk_facture_fourn_ref (facnumber, fk_soc);
ALTER TABLE can_facture_fourn ADD note_public text after note;
alter table can_facture_fourn add column `type` smallint DEFAULT 0 NOT NULL after facnumber;

ALTER TABLE can_facture_fourn_det ADD INDEX idx_facture_fourn_det_fk_facture (fk_facture_fourn);
ALTER TABLE can_facture_fourn_det ADD CONSTRAINT fk_facture_fourn_det_fk_facture FOREIGN KEY (fk_facture_fourn) REFERENCES can_facture_fourn (rowid);


ALTER TABLE can_facturedet ADD COLUMN fk_remise_except	integer NULL AFTER remise;
ALTER TABLE can_facturedet ADD COLUMN total_ht        real AFTER price;
ALTER TABLE can_facturedet ADD COLUMN total_tva       real AFTER total_ht;
ALTER TABLE can_facturedet ADD COLUMN total_ttc       real AFTER total_tva;
ALTER TABLE can_facturedet ADD COLUMN info_bits		  integer DEFAULT 0 AFTER date_end;
ALTER TABLE can_facturedet modify fk_product integer NULL;

UPDATE can_facturedet SET info_bits=0 where (fk_remise_except IS NULL OR fk_remise_except = 0);
UPDATE can_facturedet SET fk_product=NULL where fk_product=0;

ALTER TABLE can_propaldet ADD COLUMN total_ht        real AFTER price;
ALTER TABLE can_propaldet ADD COLUMN total_tva       real AFTER total_ht;
ALTER TABLE can_propaldet ADD COLUMN total_ttc       real AFTER total_tva;
ALTER TABLE can_propaldet ADD COLUMN info_bits		 integer DEFAULT 0 AFTER total_ttc;

ALTER TABLE can_commandedet ADD COLUMN total_ht        real AFTER price;
ALTER TABLE can_commandedet ADD COLUMN total_tva       real AFTER total_ht;
ALTER TABLE can_commandedet ADD COLUMN total_ttc       real AFTER total_tva;
ALTER TABLE can_commandedet ADD COLUMN info_bits	   integer DEFAULT 0 AFTER total_ttc;

ALTER TABLE can_contratdet ADD COLUMN total_ht        real AFTER price_ht;
ALTER TABLE can_contratdet ADD COLUMN total_tva       real AFTER total_ht;
ALTER TABLE can_contratdet ADD COLUMN total_ttc       real AFTER total_tva;
ALTER TABLE can_contratdet ADD COLUMN info_bits	      integer DEFAULT 0 AFTER total_ttc;


ALTER TABLE can_commande ADD INDEX idx_commande_fk_soc (fk_soc);
ALTER TABLE can_commande ADD CONSTRAINT fk_commande_societe FOREIGN KEY (fk_soc) REFERENCES can_societe (idp);

ALTER TABLE can_commande_fournisseur ADD INDEX idx_commande_fournisseur_fk_soc (fk_soc);
ALTER TABLE can_commande_fournisseur ADD CONSTRAINT fk_commande_fournisseur_societe FOREIGN KEY (fk_soc) REFERENCES can_societe (idp);


alter table can_commande_fournisseur add note_public text after note;


drop table if exists can_avoir_model_pdf;


drop table if exists can_soc_recontact;


update can_const set name='PRODUIT_DESC_IN_FORM' where name='FORM_ADD_PROD_DESC';
update can_const set name='PRODUIT_CHANGE_PROD_DESC' where name='CHANGE_PROD_DESC';
update can_const set name='COMMANDE_ADD_PROD_DESC' where name='COM_ADD_PROD_DESC';
update can_const set name='PROPALE_ADD_PROD_DESC' where name='PROP_ADD_PROD_DESC';
update can_const set name='DON_FORM' where name='DONS_FORM';
update can_const set name='MAIN_SIZE_LISTE_LIMIT' where name='SIZE_LISTE_LIMIT';
update can_const set name='SOCIETE_FISCAL_MONTH_START' where name='FISCAL_MONTH_START';
update can_const set visible=0 where name='FACTURE_DISABLE_RECUR';
update can_const set visible=0 where name='MAILING_EMAIL_FROM';
update can_const set visible=1 where name='PRODUIT_CONFIRM_DELETE_LINE';
update can_const set name='NOTIFICATION_EMAIL_FROM', visible=0 where name='MAIN_MAIL_FROM';
update can_const set name='NOTIFICATION_EMAIL_FROM', visible=0 where name='MAIN_EMAIL_FROM';
update can_const set value=2048, visible=0 where name='MAIN_UPLOAD_DOC' and value=1;
delete from can_const where name = 'SIZE_LISTE_LIMIT';


insert into can_const(name,value,type,visible,note) values('MAIN_SHOW_DEVELOPMENT_MODULES','0','yesno',1,'Make development modules visible');

delete from can_const where name in ('OSC_CATALOG_URL','OSC_LANGUAGE_ID');
update can_const set visible=0 where name like 'OSC_DB_%';

alter table can_paiementfourn add statut smallint(6) NOT NULL DEFAULT 0;


alter table can_bank_url add column type enum("company","payment","member","subscription","donation","sc","payment_sc");
update can_bank_url set type=null where type='';
alter table can_bank_url modify type enum("company","payment","member","subscription","donation","sc","payment_sc") NOT NULL;

update can_bank_url set type = 'payment_supplier' where label = '(paiement)' and type='payment' and url like '%/fourn/%';

alter table can_bank_url drop index fk_bank;
alter table can_bank_url drop index fk_bank_2;
alter table can_bank_url drop index fk_bank_3;
alter table can_bank_url drop index fk_bank_4;
alter table can_bank_url drop index fk_bank_5;
alter table can_bank_url drop index fk_bank_6;
alter table can_bank_url drop index fk_bank_7;
alter table can_bank_url drop index fk_bank_8;
alter table can_bank_url drop index fk_bank_9;

ALTER TABLE can_bank_url DROP INDEX uk_bank_url;
ALTER TABLE can_bank_url ADD UNIQUE INDEX uk_bank_url (fk_bank,type);

create table can_societe_adresse_livraison
(
  rowid              integer AUTO_INCREMENT PRIMARY KEY,
  datec	             datetime,
  tms                timestamp,
  fk_societe         integer        DEFAULT 0,
  nom                varchar(60),
  address            varchar(255),
  cp                 varchar(10),
  ville              varchar(50),
  fk_departement     integer        DEFAULT 0,
  fk_pays            integer        DEFAULT 0,
  note               text,
  fk_user_creat      integer,
  fk_user_modif      integer
)Engine=innodb;

alter table can_societe_adresse_livraison add column label varchar(30) after tms;

alter table can_propal add column fk_adresse_livraison integer after date_livraison;
alter table can_commande add column fk_adresse_livraison integer after date_livraison;

alter table can_c_pays modify libelle varchar(50) NOT NULL;

SET FOREIGN_KEY_CHECKS = 0;
delete from can_c_pays;
SET FOREIGN_KEY_CHECKS = 1;
insert into can_c_pays (rowid,code,libelle) values (0,  ''  , '-'              );
insert into can_c_pays (rowid,code,libelle) values (1,  'FR', 'France'         );
insert into can_c_pays (rowid,code,libelle) values (2,  'BE', 'Belgique'       );
insert into can_c_pays (rowid,code,libelle) values (3,  'IT', 'Italie'         );
insert into can_c_pays (rowid,code,libelle) values (4,  'ES', 'Espagne'        );
insert into can_c_pays (rowid,code,libelle) values (5,  'DE', 'Allemagne'      );
insert into can_c_pays (rowid,code,libelle) values (6,  'CH', 'Suisse'         );
insert into can_c_pays (rowid,code,libelle) values (7,  'GB', 'Royaume uni'    );
insert into can_c_pays (rowid,code,libelle) values (8,  'IE', 'Irlande'        );
insert into can_c_pays (rowid,code,libelle) values (9,  'CN', 'Chine'          );
insert into can_c_pays (rowid,code,libelle) values (10, 'TN', 'Tunisie'        );
insert into can_c_pays (rowid,code,libelle) values (11, 'US', 'Etats Unis'     );
insert into can_c_pays (rowid,code,libelle) values (12, 'MA', 'Maroc'          );
insert into can_c_pays (rowid,code,libelle) values (13, 'DZ', 'Algérie'        );
insert into can_c_pays (rowid,code,libelle) values (14, 'CA', 'Canada'         );
insert into can_c_pays (rowid,code,libelle) values (15, 'TG', 'Togo'           );
insert into can_c_pays (rowid,code,libelle) values (16, 'GA', 'Gabon'          );
insert into can_c_pays (rowid,code,libelle) values (17, 'NL', 'Pays Bas'       );
insert into can_c_pays (rowid,code,libelle) values (18, 'HU', 'Hongrie'        );
insert into can_c_pays (rowid,code,libelle) values (19, 'RU', 'Russie'         );
insert into can_c_pays (rowid,code,libelle) values (20, 'SE', 'Suède'          );
insert into can_c_pays (rowid,code,libelle) values (21, 'CI', 'Côte d\'Ivoire' );
insert into can_c_pays (rowid,code,libelle) values (22, 'SN', 'Sénégal'        );
insert into can_c_pays (rowid,code,libelle) values (23, 'AR', 'Argentine'      );
insert into can_c_pays (rowid,code,libelle) values (24, 'CM', 'Cameroun'       );
insert into can_c_pays (rowid,code,libelle) values (25, 'PT', 'Portugal'       );
insert into can_c_pays (rowid,code,libelle) values (26, 'SA', 'Arabie Saoudite');
insert into can_c_pays (rowid,code,libelle) values (27, 'MC', 'Monaco'         );
insert into can_c_pays (rowid,code,libelle) values (28, 'AU', 'Australie'      );
insert into can_c_pays (rowid,code,libelle) values (29, 'SG', 'Singapoure'     );
insert into can_c_pays (rowid,code,libelle) values (30, 'AF', 'Afghanistan'    );
insert into can_c_pays (rowid,code,libelle) values (31, 'AX', 'Iles Aland'     );
insert into can_c_pays (rowid,code,libelle) values (32, 'AL', 'Albanie'        );
insert into can_c_pays (rowid,code,libelle) values (33, 'AS', 'Samoa américaines');
insert into can_c_pays (rowid,code,libelle) values (34, 'AD', 'Andorre'        );
insert into can_c_pays (rowid,code,libelle) values (35, 'AO', 'Angola'         );
insert into can_c_pays (rowid,code,libelle) values (36, 'AI', 'Anguilla'       );
insert into can_c_pays (rowid,code,libelle) values (37, 'AQ', 'Antarctique'    );
insert into can_c_pays (rowid,code,libelle) values (38, 'AG', 'Antigua-et-Barbuda');
insert into can_c_pays (rowid,code,libelle) values (39, 'AM', 'Arménie'        );
insert into can_c_pays (rowid,code,libelle) values (40, 'AW', 'Aruba'          );
insert into can_c_pays (rowid,code,libelle) values (41, 'AT', 'Autriche'       );
insert into can_c_pays (rowid,code,libelle) values (42, 'AZ', 'Azerbaïdjan'    );
insert into can_c_pays (rowid,code,libelle) values (43, 'BS', 'Bahamas'        );
insert into can_c_pays (rowid,code,libelle) values (44, 'BH', 'Bahreïn'        );
insert into can_c_pays (rowid,code,libelle) values (45, 'BD', 'Bangladesh'     );
insert into can_c_pays (rowid,code,libelle) values (46, 'BB', 'Barbade'        );
insert into can_c_pays (rowid,code,libelle) values (47, 'BY', 'Biélorussie'    );
insert into can_c_pays (rowid,code,libelle) values (48, 'BZ', 'Belize'         );
insert into can_c_pays (rowid,code,libelle) values (49, 'BJ', 'Bénin'          );
insert into can_c_pays (rowid,code,libelle) values (50, 'BM', 'Bermudes'       );
insert into can_c_pays (rowid,code,libelle) values (51, 'BT', 'Bhoutan'        );
insert into can_c_pays (rowid,code,libelle) values (52, 'BO', 'Bolivie'        );
insert into can_c_pays (rowid,code,libelle) values (53, 'BA', 'Bosnie-Herzégovine');
insert into can_c_pays (rowid,code,libelle) values (54, 'BW', 'Botswana'       );
insert into can_c_pays (rowid,code,libelle) values (55, 'BV', 'Ile Bouvet'     );
insert into can_c_pays (rowid,code,libelle) values (56, 'BR', 'Brésil'         );
insert into can_c_pays (rowid,code,libelle) values (57, 'IO', 'Territoire britannique de l\'Océan Indien');
insert into can_c_pays (rowid,code,libelle) values (58, 'BN', 'Brunei'         );
insert into can_c_pays (rowid,code,libelle) values (59, 'BG', 'Bulgarie'       );
insert into can_c_pays (rowid,code,libelle) values (60, 'BF', 'Burkina Faso'   );
insert into can_c_pays (rowid,code,libelle) values (61, 'BI', 'Burundi'        );
insert into can_c_pays (rowid,code,libelle) values (62, 'KH', 'Cambodge'       );
insert into can_c_pays (rowid,code,libelle) values (63, 'CV', 'Cap-Vert'       );
insert into can_c_pays (rowid,code,libelle) values (64, 'KY', 'Iles Cayman'    );
insert into can_c_pays (rowid,code,libelle) values (65, 'CF', 'République centrafricaine');
insert into can_c_pays (rowid,code,libelle) values (66, 'TD', 'Tchad'          );
insert into can_c_pays (rowid,code,libelle) values (67, 'CL', 'Chili'          );
insert into can_c_pays (rowid,code,libelle) values (68, 'CX', 'Ile Christmas'  );
insert into can_c_pays (rowid,code,libelle) values (69, 'CC', 'Iles des Cocos (Keeling)');
insert into can_c_pays (rowid,code,libelle) values (70, 'CO', 'Colombie'       );
insert into can_c_pays (rowid,code,libelle) values (71, 'KM', 'Comores'        );
insert into can_c_pays (rowid,code,libelle) values (72, 'CG', 'Congo'          );
insert into can_c_pays (rowid,code,libelle) values (73, 'CD', 'République démocratique du Congo');
insert into can_c_pays (rowid,code,libelle) values (74, 'CK', 'Iles Cook'      );
insert into can_c_pays (rowid,code,libelle) values (75, 'CR', 'Costa Rica'     );
insert into can_c_pays (rowid,code,libelle) values (76, 'HR', 'Croatie'        );
insert into can_c_pays (rowid,code,libelle) values (77, 'CU', 'Cuba'           );
insert into can_c_pays (rowid,code,libelle) values (78, 'CY', 'Chypre'         );
insert into can_c_pays (rowid,code,libelle) values (79, 'CZ', 'République Tchèque');
insert into can_c_pays (rowid,code,libelle) values (80, 'DK', 'Danemark'       );
insert into can_c_pays (rowid,code,libelle) values (81, 'DJ', 'Djibouti'       );
insert into can_c_pays (rowid,code,libelle) values (82, 'DM', 'Dominique'      );
insert into can_c_pays (rowid,code,libelle) values (83, 'DO', 'République Dominicaine');
insert into can_c_pays (rowid,code,libelle) values (84, 'EC', 'Equateur'       );
insert into can_c_pays (rowid,code,libelle) values (85, 'EG', 'Egypte'         );
insert into can_c_pays (rowid,code,libelle) values (86, 'SV', 'Salvador'       );
insert into can_c_pays (rowid,code,libelle) values (87, 'GQ', 'Guinée Equatoriale');
insert into can_c_pays (rowid,code,libelle) values (88, 'ER', 'Erythrée'       );
insert into can_c_pays (rowid,code,libelle) values (89, 'EE', 'Estonie'        );
insert into can_c_pays (rowid,code,libelle) values (90, 'ET', 'Ethiopie'       );
insert into can_c_pays (rowid,code,libelle) values (91, 'FK', 'Iles Falkland'  );
insert into can_c_pays (rowid,code,libelle) values (92, 'FO', 'Iles Féroé'     );
insert into can_c_pays (rowid,code,libelle) values (93, 'FJ', 'Iles Fidji'     );
insert into can_c_pays (rowid,code,libelle) values (94, 'FI', 'Finlande'       );
insert into can_c_pays (rowid,code,libelle) values (95, 'GF', 'Guyane française');
insert into can_c_pays (rowid,code,libelle) values (96, 'PF', 'Polynésie française');
insert into can_c_pays (rowid,code,libelle) values (97, 'TF', 'Terres australes françaises');
insert into can_c_pays (rowid,code,libelle) values (98, 'GM', 'Gambie'         );
insert into can_c_pays (rowid,code,libelle) values (99, 'GE', 'Géorgie'       );
insert into can_c_pays (rowid,code,libelle) values (100, 'GH', 'Ghana'         );
insert into can_c_pays (rowid,code,libelle) values (101, 'GI', 'Gibraltar'     );
insert into can_c_pays (rowid,code,libelle) values (102, 'GR', 'Grèce'         );
insert into can_c_pays (rowid,code,libelle) values (103, 'GL', 'Groenland'     );
insert into can_c_pays (rowid,code,libelle) values (104, 'GD', 'Grenade'       );
insert into can_c_pays (rowid,code,libelle) values (105, 'GP', 'Guadeloupe'    );
insert into can_c_pays (rowid,code,libelle) values (106, 'GU', 'Guam'          );
insert into can_c_pays (rowid,code,libelle) values (107, 'GT', 'Guatemala'     );
insert into can_c_pays (rowid,code,libelle) values (108, 'GN', 'Guinée'        );
insert into can_c_pays (rowid,code,libelle) values (109, 'GW', 'Guinée-Bissao' );
insert into can_c_pays (rowid,code,libelle) values (110, 'GY', 'Guyana'        );
insert into can_c_pays (rowid,code,libelle) values (111, 'HT', 'Haïti'         );
insert into can_c_pays (rowid,code,libelle) values (112, 'HM', 'Iles Heard et McDonald');
insert into can_c_pays (rowid,code,libelle) values (113, 'VA', 'Saint-Siège (Vatican)');
insert into can_c_pays (rowid,code,libelle) values (114, 'HN', 'Honduras'      );
insert into can_c_pays (rowid,code,libelle) values (115, 'HK', 'Hong Kong'     );
insert into can_c_pays (rowid,code,libelle) values (116, 'IS', 'Islande'       );
insert into can_c_pays (rowid,code,libelle) values (117, 'IN', 'Inde'          );
insert into can_c_pays (rowid,code,libelle) values (118, 'ID', 'Indonésie'     );
insert into can_c_pays (rowid,code,libelle) values (119, 'IR', 'Iran'          );
insert into can_c_pays (rowid,code,libelle) values (120, 'IQ', 'Iraq'          );
insert into can_c_pays (rowid,code,libelle) values (121, 'IL', 'Israël'        );
insert into can_c_pays (rowid,code,libelle) values (122, 'JM', 'Jamaïque'      );
insert into can_c_pays (rowid,code,libelle) values (123, 'JP', 'Japon'         );
insert into can_c_pays (rowid,code,libelle) values (124, 'JO', 'Jordanie'      );
insert into can_c_pays (rowid,code,libelle) values (125, 'KZ', 'Kazakhstan'    );
insert into can_c_pays (rowid,code,libelle) values (126, 'KE', 'Kenya'         );
insert into can_c_pays (rowid,code,libelle) values (127, 'KI', 'Kiribati'      );
insert into can_c_pays (rowid,code,libelle) values (128, 'KP', 'Corée du Nord' );
insert into can_c_pays (rowid,code,libelle) values (129, 'KR', 'Corée du Sud'  );
insert into can_c_pays (rowid,code,libelle) values (130, 'KW', 'Koweït'        );
insert into can_c_pays (rowid,code,libelle) values (131, 'KG', 'Kirghizistan'  );
insert into can_c_pays (rowid,code,libelle) values (132, 'LA', 'Laos'          );
insert into can_c_pays (rowid,code,libelle) values (133, 'LV', 'Lettonie'      );
insert into can_c_pays (rowid,code,libelle) values (134, 'LB', 'Liban'         );
insert into can_c_pays (rowid,code,libelle) values (135, 'LS', 'Lesotho'       );
insert into can_c_pays (rowid,code,libelle) values (136, 'LR', 'Liberia'       );
insert into can_c_pays (rowid,code,libelle) values (137, 'LY', 'Libye'         );
insert into can_c_pays (rowid,code,libelle) values (138, 'LI', 'Liechtenstein' );
insert into can_c_pays (rowid,code,libelle) values (139, 'LT', 'Lituanie'      );
insert into can_c_pays (rowid,code,libelle) values (140, 'LU', 'Luxembourg'    );
insert into can_c_pays (rowid,code,libelle) values (141, 'MO', 'Macao'         );
insert into can_c_pays (rowid,code,libelle) values (142, 'MK', 'ex-République yougoslave de Macédoine');
insert into can_c_pays (rowid,code,libelle) values (143, 'MG', 'Madagascar'    );
insert into can_c_pays (rowid,code,libelle) values (144, 'MW', 'Malawi'        );
insert into can_c_pays (rowid,code,libelle) values (145, 'MY', 'Malaisie'      );
insert into can_c_pays (rowid,code,libelle) values (146, 'MV', 'Maldives'      );
insert into can_c_pays (rowid,code,libelle) values (147, 'ML', 'Mali'          );
insert into can_c_pays (rowid,code,libelle) values (148, 'MT', 'Malte'         );
insert into can_c_pays (rowid,code,libelle) values (149, 'MH', 'Iles Marshall' );
insert into can_c_pays (rowid,code,libelle) values (150, 'MQ', 'Martinique'    );
insert into can_c_pays (rowid,code,libelle) values (151, 'MR', 'Mauritanie'    );
insert into can_c_pays (rowid,code,libelle) values (152, 'MU', 'Maurice'       );
insert into can_c_pays (rowid,code,libelle) values (153, 'YT', 'Mayotte'       );
insert into can_c_pays (rowid,code,libelle) values (154, 'MX', 'Mexique'       );
insert into can_c_pays (rowid,code,libelle) values (155, 'FM', 'Micronésie'    );
insert into can_c_pays (rowid,code,libelle) values (156, 'MD', 'Moldavie'      );
insert into can_c_pays (rowid,code,libelle) values (157, 'MN', 'Mongolie'      );
insert into can_c_pays (rowid,code,libelle) values (158, 'MS', 'Monserrat'     );
insert into can_c_pays (rowid,code,libelle) values (159, 'MZ', 'Mozambique'    );
insert into can_c_pays (rowid,code,libelle) values (160, 'MM', 'Birmanie'      );
insert into can_c_pays (rowid,code,libelle) values (161, 'NA', 'Namibie'       );
insert into can_c_pays (rowid,code,libelle) values (162, 'NR', 'Nauru'         );
insert into can_c_pays (rowid,code,libelle) values (163, 'NP', 'Népal'         );
insert into can_c_pays (rowid,code,libelle) values (164, 'AN', 'Antilles néerlandaises');
insert into can_c_pays (rowid,code,libelle) values (165, 'NC', 'Nouvelle-Calédonie');
insert into can_c_pays (rowid,code,libelle) values (166, 'NZ', 'Nouvelle-Zélande');
insert into can_c_pays (rowid,code,libelle) values (167, 'NI', 'Nicaragua'     );
insert into can_c_pays (rowid,code,libelle) values (168, 'NE', 'Niger'         );
insert into can_c_pays (rowid,code,libelle) values (169, 'NG', 'Nigeria'       );
insert into can_c_pays (rowid,code,libelle) values (170, 'NU', 'Nioué'         );
insert into can_c_pays (rowid,code,libelle) values (171, 'NF', 'Ile Norfolk'   );
insert into can_c_pays (rowid,code,libelle) values (172, 'MP', 'Mariannes du Nord');
insert into can_c_pays (rowid,code,libelle) values (173, 'NO', 'Norvège'       );
insert into can_c_pays (rowid,code,libelle) values (174, 'OM', 'Oman'          );
insert into can_c_pays (rowid,code,libelle) values (175, 'PK', 'Pakistan'      );
insert into can_c_pays (rowid,code,libelle) values (176, 'PW', 'Palaos'        );
insert into can_c_pays (rowid,code,libelle) values (177, 'PS', 'territoire Palestinien Occupé');
insert into can_c_pays (rowid,code,libelle) values (178, 'PA', 'Panama'        );
insert into can_c_pays (rowid,code,libelle) values (179, 'PG', 'Papouasie-Nouvelle-Guinée');
insert into can_c_pays (rowid,code,libelle) values (180, 'PY', 'Paraguay'      );
insert into can_c_pays (rowid,code,libelle) values (181, 'PE', 'Pérou'         );
insert into can_c_pays (rowid,code,libelle) values (182, 'PH', 'Philippines'   );
insert into can_c_pays (rowid,code,libelle) values (183, 'PN', 'Iles Pitcairn' );
insert into can_c_pays (rowid,code,libelle) values (184, 'PL', 'Pologne'       );
insert into can_c_pays (rowid,code,libelle) values (185, 'PR', 'Porto Rico'    );
insert into can_c_pays (rowid,code,libelle) values (186, 'QA', 'Qatar'         );
insert into can_c_pays (rowid,code,libelle) values (187, 'RE', 'Réunion'       );
insert into can_c_pays (rowid,code,libelle) values (188, 'RO', 'Roumanie'      );
insert into can_c_pays (rowid,code,libelle) values (189, 'RW', 'Rwanda'        );
insert into can_c_pays (rowid,code,libelle) values (190, 'SH', 'Sainte-Hélène' );
insert into can_c_pays (rowid,code,libelle) values (191, 'KN', 'Saint-Christophe-et-Niévès');
insert into can_c_pays (rowid,code,libelle) values (192, 'LC', 'Sainte-Lucie'  );
insert into can_c_pays (rowid,code,libelle) values (193, 'PM', 'Saint-Pierre-et-Miquelon');
insert into can_c_pays (rowid,code,libelle) values (194, 'VC', 'Saint-Vincent-et-les-Grenadines');
insert into can_c_pays (rowid,code,libelle) values (195, 'WS', 'Samoa'         );
insert into can_c_pays (rowid,code,libelle) values (196, 'SM', 'Saint-Marin'   );
insert into can_c_pays (rowid,code,libelle) values (197, 'ST', 'Sao Tomé-et-Principe');
insert into can_c_pays (rowid,code,libelle) values (198, 'RS', 'Serbie'        );
insert into can_c_pays (rowid,code,libelle) values (199, 'SC', 'Seychelles'    );
insert into can_c_pays (rowid,code,libelle) values (200, 'SL', 'Sierra Leone'  );
insert into can_c_pays (rowid,code,libelle) values (201, 'SK', 'Slovaquie'     );
insert into can_c_pays (rowid,code,libelle) values (202, 'SI', 'Slovénie'      );
insert into can_c_pays (rowid,code,libelle) values (203, 'SB', 'Iles Salomon'  );
insert into can_c_pays (rowid,code,libelle) values (204, 'SO', 'Somalie'       );
insert into can_c_pays (rowid,code,libelle) values (205, 'ZA', 'Afrique du Sud');
insert into can_c_pays (rowid,code,libelle) values (206, 'GS', 'Iles Géorgie du Sud et Sandwich du Sud');
insert into can_c_pays (rowid,code,libelle) values (207, 'LK', 'Sri Lanka'     );
insert into can_c_pays (rowid,code,libelle) values (208, 'SD', 'Soudan'        );
insert into can_c_pays (rowid,code,libelle) values (209, 'SR', 'Suriname'      );
insert into can_c_pays (rowid,code,libelle) values (210, 'SJ', 'Iles Svalbard et Jan Mayen');
insert into can_c_pays (rowid,code,libelle) values (211, 'SZ', 'Swaziland'     );
insert into can_c_pays (rowid,code,libelle) values (212, 'SY', 'Syrie'         );
insert into can_c_pays (rowid,code,libelle) values (213, 'TW', 'Taïwan'        );
insert into can_c_pays (rowid,code,libelle) values (214, 'TJ', 'Tadjikistan'   );
insert into can_c_pays (rowid,code,libelle) values (215, 'TZ', 'Tanzanie'      );
insert into can_c_pays (rowid,code,libelle) values (216, 'TH', 'Thaïlande'     );
insert into can_c_pays (rowid,code,libelle) values (217, 'TL', 'Timor Oriental');
insert into can_c_pays (rowid,code,libelle) values (218, 'TK', 'Tokélaou'      );
insert into can_c_pays (rowid,code,libelle) values (219, 'TO', 'Tonga'         );
insert into can_c_pays (rowid,code,libelle) values (220, 'TT', 'Trinité-et-Tobago');
insert into can_c_pays (rowid,code,libelle) values (221, 'TR', 'Turquie'       );
insert into can_c_pays (rowid,code,libelle) values (222, 'TM', 'Turkménistan'  );
insert into can_c_pays (rowid,code,libelle) values (223, 'TC', 'Iles Turks-et-Caicos');
insert into can_c_pays (rowid,code,libelle) values (224, 'TV', 'Tuvalu'        );
insert into can_c_pays (rowid,code,libelle) values (225, 'UG', 'Ouganda'       );
insert into can_c_pays (rowid,code,libelle) values (226, 'UA', 'Ukraine'       );
insert into can_c_pays (rowid,code,libelle) values (227, 'AE', 'Emirats arabes unis');
insert into can_c_pays (rowid,code,libelle) values (228, 'UM', 'Iles mineures éloignées des états-Unis');
insert into can_c_pays (rowid,code,libelle) values (229, 'UY', 'Uruguay'       );
insert into can_c_pays (rowid,code,libelle) values (230, 'UZ', 'Ouzbékistan'   );
insert into can_c_pays (rowid,code,libelle) values (231, 'VU', 'Vanuatu'       );
insert into can_c_pays (rowid,code,libelle) values (232, 'VE', 'Vénézuela'     );
insert into can_c_pays (rowid,code,libelle) values (233, 'VN', 'Viêt Nam'      );
insert into can_c_pays (rowid,code,libelle) values (234, 'VG', 'Iles Vierges britanniques');
insert into can_c_pays (rowid,code,libelle) values (235, 'VI', 'Iles Vierges américaines');
insert into can_c_pays (rowid,code,libelle) values (236, 'WF', 'Wallis-et-Futuna');
insert into can_c_pays (rowid,code,libelle) values (237, 'EH', 'Sahara occidental');
insert into can_c_pays (rowid,code,libelle) values (238, 'YE', 'Yémen'         );
insert into can_c_pays (rowid,code,libelle) values (239, 'ZM', 'Zambie'        );
insert into can_c_pays (rowid,code,libelle) values (240, 'ZW', 'Zimbabwe'      );

delete from can_c_regions where rowid='2901' and code_region='2901';
delete from can_c_departements where fk_region='2901';

insert into can_c_regions (rowid,fk_pays,code_region,cheflieu,tncc,nom) values (2801,28,2801,     '',0,'Australia');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (2801,'NSW','',1,'','New South Wales');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (2801,'VIC','',1,'','Victoria');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (2801,'QLD','',1,'','Queensland');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (2801, 'SA','',1,'','South Australia');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (2801,'ACT','',1,'','Australia Capital Territory');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (2801,'TAS','',1,'','Tasmania');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (2801, 'WA','',1,'','Western Australia');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (2801, 'NT','',1,'','Northern Territory');

delete from can_c_tva where rowid='291' and fk_pays='5';
delete from can_c_tva where rowid='292' and fk_pays='5';
delete from can_c_tva where rowid='291' and fk_pays='29';
delete from can_c_tva where rowid='292' and fk_pays='29';
delete from can_c_tva where rowid='261' and fk_pays='26';
delete from can_c_tva where rowid='262' and fk_pays='26';
delete from can_c_tva where rowid='263' and fk_pays='26';
insert into can_c_tva(rowid,fk_pays,taux,recuperableonly,note,active) values (281, 28,  '10','0','VAT Rate 10',1);
insert into can_c_tva(rowid,fk_pays,taux,recuperableonly,note,active) values (282, 28,   '0','0','VAT Rate 0',1);
insert into can_c_tva(rowid,fk_pays,taux,recuperableonly,note,active) values (251,25,  '17','0','VAT Rate 17',1);
insert into can_c_tva(rowid,fk_pays,taux,recuperableonly,note,active) values (252,25,  '12','0','VAT Rate 12',1);
insert into can_c_tva(rowid,fk_pays,taux,recuperableonly,note,active) values (253,25,   '0','0','VAT Rate 0',1);


update can_const set name='DON_ADDON_MODEL' where name='DON_ADDON';
update can_const set value='neptune' where value='pluton' and name = 'FACTURE_ADDON';
update can_const set value='azur' where value='orange' and name = 'PROPALE_ADDON';
update can_const set value='mod_commande_diamant' where value='mod_commande_jade' and name ='COMMANDE_ADDON';
insert into can_const (name, value, type, visible) values ('FICHEINTER_ADDON', 'pacific','chaine',0);

alter table can_propal_model_pdf rename to can_document_model;

alter table can_document_model DROP PRIMARY KEY;
alter table can_document_model add column rowid integer AUTO_INCREMENT PRIMARY KEY FIRST;
alter table can_document_model add column type varchar(20) NOT NULL after nom;
update can_document_model set type='propal' where type='';

delete from can_document_model where nom='adytek';
delete from can_document_model where nom='rouge' and type='order';
delete from can_document_model where nom='azur' and type='order';
delete from can_document_model where nom='orange' and type='propal';
delete from can_document_model where nom='transporteur' and type='shipping';
delete from can_document_model where nom='dorade' and type='shipping';




ALTER TABLE can_facture ADD UNIQUE INDEX idx_facture_uk_facnumber (facnumber);

alter table can_facture_rec add column remise_absolue real default 0 after remise_percent;
alter table can_facture_rec add column fk_mode_reglement integer default 0 after fk_cond_reglement;
alter table can_facture_rec add column date_lim_reglement date after fk_mode_reglement;
alter table can_facture_rec add column note_public text after note;
update can_facture_rec set fk_mode_reglement='0' where fk_mode_reglement='NULL';

ALTER TABLE can_facture_rec ADD INDEX idx_facture_rec_fk_soc (fk_soc);
ALTER TABLE can_facture_rec ADD INDEX idx_facture_rec_fk_user_author (fk_user_author);
ALTER TABLE can_facture_rec ADD INDEX idx_facture_rec_fk_projet (fk_projet);

ALTER TABLE can_facture_rec ADD CONSTRAINT fk_facture_rec_fk_user_author    FOREIGN KEY (fk_user_author) REFERENCES can_user (rowid);
ALTER TABLE can_facture_rec ADD CONSTRAINT fk_facture_rec_fk_projet         FOREIGN KEY (fk_projet) REFERENCES can_projet (rowid);

ALTER TABLE can_facture_rec ADD UNIQUE INDEX idx_facture_rec_uk_titre (titre);

ALTER TABLE can_commandedet ADD COLUMN fk_remise_except	integer NULL AFTER remise;
ALTER TABLE can_commandedet ADD COLUMN special_code tinyint(1) UNSIGNED DEFAULT 0;

ALTER TABLE can_propaldet ADD COLUMN fk_remise_except	integer NULL AFTER remise;

ALTER TABLE can_contratdet ADD COLUMN fk_remise_except	integer NULL AFTER remise;

create table can_livraison
(
  rowid                 integer AUTO_INCREMENT PRIMARY KEY,
  tms                   timestamp,
  fk_commande           integer DEFAULT 0,
  fk_expedition         integer,
  ref                   varchar(30) NOT NULL,
  date_creation         datetime,
  date_valid            datetime,
  fk_user_author        integer,
  fk_user_valid         integer,
  fk_statut             smallint  default 0,
  note                  text,
  note_public           text,
  model_pdf             varchar(50),
  date_livraison 	      date 	  default NULL,
  fk_adresse_livraison  integer,

  UNIQUE INDEX (ref),
  key(fk_commande)
)Engine=innodb;

alter table can_livraison drop foreign key fk_livraison_societe;
alter table can_livraison drop column fk_soc;


create table can_livraisondet
(
  rowid             integer AUTO_INCREMENT PRIMARY KEY,
  fk_livraison      integer,
  fk_commande_ligne integer NOT NULL,
  qty               real,
  key(fk_livraison),
  key(fk_commande_ligne)
)Engine=innodb;


insert into can_c_type_contact(rowid, element, source, code, libelle, active ) values (90, 'commande',  'internal', 'SALESREPSIGN',  'Commercial signataire de la commande', 1);
insert into can_c_type_contact(rowid, element, source, code, libelle, active ) values (91, 'commande',  'internal', 'SALESREPFOLL',  'Commercial suivi de la commande', 1);
insert into can_c_type_contact(rowid, element, source, code, libelle, active ) values (100, 'commande',  'external', 'BILLING',       'Contact client facturation commande', 1);
insert into can_c_type_contact(rowid, element, source, code, libelle, active ) values (101, 'commande',  'external', 'CUSTOMER',      'Contact client suivi commande', 1);

alter table can_bank_account add column ref varchar(12) NOT NULL;
alter table can_bank_account add column url varchar(128);
alter table can_bank_account add column currency_code varchar(2) NOT NULL;
alter table can_bank_account add column min_allowed integer DEFAULT 0;
alter table can_bank_account add column min_desired integer DEFAULT 0;
alter table can_bank_account add column comment varchar(254);
alter table can_bank_account modify bic varchar(11);

update can_bank_account set currency_code='EU';
update can_bank_account set rappro=0 where courant=2;

ALTER TABLE can_bank ADD COLUMN fk_bordereau  INTEGER DEFAULT 0;
ALTER TABLE can_bank ADD COLUMN banque   varchar(255);
ALTER TABLE can_bank ADD COLUMN emetteur varchar(255);

alter table can_accountingsystem_det rename to can_accountingaccount;


insert into can_rights_def (id, libelle, module, type, bydefault, subperms, perms) values (262,'Consulter tous les clients','commercial','r',1,'voir','client');
-- V4.1 insert into can_user_rights(fk_user,fk_id) select distinct fk_user, '262' from can_user_rights where fk_id = 261;
update can_rights_def set subperms='creer' where subperms='supprimer' AND module='user' AND perms='self' AND id=255;
update can_rights_def set module='tax' where module='compta' AND id in ('91','92','93');
update can_rights_def set subperms='receptionner' where id=186;


alter table can_commandedet add column rang integer DEFAULT 0;
alter table can_propaldet add column rang integer DEFAULT 0;

alter table can_facture drop column model;
alter table can_facture add column model_pdf varchar(50) after note_public;

alter table can_facture drop foreign key fk_facture_fk_facture;
alter table can_facture drop column fk_facture;
alter table can_facture add column fk_facture_source integer after fk_user_valid;
ALTER TABLE can_facture ADD INDEX idx_facture_fk_facture_source (fk_facture_source);
ALTER TABLE can_facture ADD CONSTRAINT fk_facture_source_fk_facture FOREIGN KEY (fk_facture_source)     REFERENCES can_facture (rowid);
alter table can_facture add column type smallint DEFAULT 0 NOT NULL after facnumber;


-- Supprimme orphelins pour permettre montée de la clé
-- V4 DELETE can_commandedet FROM can_commandedet LEFT JOIN can_commande ON can_commandedet.fk_commande = can_commande.rowid WHERE can_commande.rowid IS NULL;

ALTER TABLE can_commandedet ADD INDEX idx_commandedet_fk_commande (fk_commande);
ALTER TABLE can_commandedet ADD CONSTRAINT fk_commandedet_fk_commande FOREIGN KEY (fk_commande) REFERENCES can_commande (rowid);


-- drop table can_societe_remise_except;
create table can_societe_remise_except
(
  rowid           integer AUTO_INCREMENT PRIMARY KEY,
  fk_soc          integer NOT NULL,
  datec           datetime,
  amount_ht       real NOT NULL,
  fk_user         integer NOT NULL,
  fk_facture      integer,
  description     varchar(255) NOT NULL
)Engine=innodb;

alter table can_societe_remise_except ADD COLUMN amount_tva real DEFAULT 0 NOT NULL after amount_ht;
alter table can_societe_remise_except ADD COLUMN amount_ttc real DEFAULT 0 NOT NULL after amount_tva;
alter table can_societe_remise_except ADD COLUMN tva_tx real DEFAULT 0 NOT NULL after amount_ttc;
alter table can_societe_remise_except ADD COLUMN fk_facture_source integer after fk_user;

update can_societe_remise_except set amount_tva=0, tva_tx=0, amount_ttc = amount_ht where amount_ttc = 0;
delete from can_societe_remise_except WHERE amount_ht=0;

-- Supprimme orphelins pour permettre montée de la clé
-- V4 DELETE can_societe_remise_except FROM can_societe_remise_except LEFT JOIN can_facturedet ON can_societe_remise_except.fk_facture = can_facturedet.rowid WHERE can_facturedet.rowid IS NULL;

ALTER TABLE can_societe_remise_except DROP FOREIGN KEY fk_societe_remise_fk_facture;
ALTER TABLE can_societe_remise_except DROP FOREIGN KEY fk_societe_remise_fk_facture_source;

ALTER TABLE can_societe_remise_except ADD INDEX idx_societe_remise_except_fk_user (fk_user);
ALTER TABLE can_societe_remise_except ADD INDEX idx_societe_remise_except_fk_soc (fk_soc);
ALTER TABLE can_societe_remise_except ADD INDEX idx_societe_remise_except_fk_facture (fk_facture);
ALTER TABLE can_societe_remise_except ADD INDEX idx_societe_remise_except_fk_facture_source (fk_facture_source);
ALTER TABLE can_societe_remise_except ADD CONSTRAINT fk_societe_remise_fk_user    FOREIGN KEY (fk_user)    REFERENCES can_user (rowid);
ALTER TABLE can_societe_remise_except ADD CONSTRAINT fk_societe_remise_fk_soc     FOREIGN KEY (fk_soc)     REFERENCES can_societe (idp);
ALTER TABLE can_societe_remise_except ADD CONSTRAINT fk_societe_remise_fk_facture FOREIGN KEY (fk_facture) REFERENCES can_facturedet (rowid);
ALTER TABLE can_societe_remise_except ADD CONSTRAINT fk_societe_remise_fk_facture_source FOREIGN KEY (fk_facture_source) REFERENCES can_facture (rowid);

update can_societe_remise_except set description='Remise sans description' where description is NULL or description ='';
alter table can_societe_remise_except modify description varchar(255) NOT NULL;

insert into can_const (name, value, type, visible, note) VALUES ('PROPALE_VALIDITY_DURATION', '15', 'chaine', 0, 'Durée de validitée des propales');

alter table can_propal add column ref_client varchar(30) after ref;

alter table can_societe_adresse_livraison drop column fk_departement;

alter table can_user change datelastaccess datelastlogin datetime;
alter table can_user add column datepreviouslogin datetime after datelastlogin;
alter table can_user add column ldap_sid varchar(255) DEFAULT NULL;
alter table can_user add column statut tinyint DEFAULT 1;
alter table can_user add column lang varchar(6);
alter table can_user add column pass_crypted varchar(128) after pass;

alter table can_user add column office_phone      varchar(20);
alter table can_user add column office_fax        varchar(20);
alter table can_user add column user_mobile       varchar(20);


alter table can_user modify login varchar(24) NOT NULL;
alter table can_user drop code;


update can_user set pass_crypted = MD5(pass) where pass IS NOT NULL AND pass_crypted IS NULL and length(pass) < 32;
update can_user set pass_crypted = pass where pass IS NOT NULL AND pass_crypted IS NULL and length(pass) = 32;
update can_user set pass = NULL where length(pass) = 32;

ALTER TABLE can_user modify fk_societe        integer;
ALTER TABLE can_user modify fk_socpeople      integer;
alter table can_user add column fk_member integer after fk_socpeople;

update can_user set fk_societe = NULL where fk_societe = 0;
update can_user set fk_socpeople = NULL where fk_socpeople = 0;
update can_user set fk_member = NULL where fk_member = 0;

ALTER TABLE can_user DROP INDEX login;

ALTER TABLE can_user ADD UNIQUE INDEX uk_user_login (login);

ALTER TABLE can_user ADD INDEX uk_user_fk_societe   (fk_societe);

ALTER TABLE can_user ADD UNIQUE INDEX uk_user_fk_socpeople (fk_socpeople);
ALTER TABLE can_user ADD UNIQUE INDEX uk_user_fk_member    (fk_member);


alter table can_boxes add column fk_user integer;

alter table can_commande_fournisseur drop column fk_soc_contact;
alter table can_commande drop column fk_soc_contact;
alter table can_livraison drop column fk_soc_contact;
alter table can_propal drop column fk_soc_contact;

alter table can_commandedet drop column label;


insert into can_action_def (rowid,code,titre,description,objet_type) values (3,'NOTIFY_VAL_ORDER_SUUPLIER','Validation commande fournisseur','Déclenché lors de la validation d\'une commande fournisseur','order_supplier');



drop table if exists can_sqltables;


ALTER IGNORE TABLE can_categorie_product DROP FOREIGN KEY can_categorie_product_ibfk_1;
ALTER IGNORE TABLE can_categorie_product DROP FOREIGN KEY can_categorie_product_ibfk_2;
ALTER IGNORE TABLE can_categorie_product DROP FOREIGN KEY can_categorie_product_ibfk_3;
ALTER IGNORE TABLE can_categorie_product DROP FOREIGN KEY can_categorie_product_ibfk_4;
ALTER IGNORE TABLE can_categorie_product DROP FOREIGN KEY can_categorie_product_ibfk_5;

ALTER TABLE can_categorie_product ADD CONSTRAINT fk_categorie_product_categorie_rowid FOREIGN KEY (fk_categorie) REFERENCES can_categorie (rowid);
ALTER TABLE can_categorie_product ADD CONSTRAINT fk_categorie_product_product_rowid   FOREIGN KEY (fk_product)   REFERENCES can_product (rowid);

ALTER TABLE can_categorie_product ADD PRIMARY KEY (fk_categorie, fk_product);

alter table can_product modify label varchar(255) NOT NULL;
alter table can_product modify description text;
ALTER TABLE can_product ADD COLUMN price_base_type varchar(3) DEFAULT 'HT' AFTER price;
ALTER TABLE can_product ADD COLUMN price_ttc float(12,4) DEFAULT 0 AFTER price_base_type;
alter table can_product_det modify label varchar(255) NOT NULL;
alter table can_product_det modify description text;

create table can_accountingdebcred
(
 fk_transaction  integer		NOT NULL,
 fk_account      integer		NOT NULL,
	amount          real		NOT NULL,
	direction       varchar(1)	NOT NULL
)Engine=innodb;

alter table can_facturedet_rec add column total_ht real;
alter table can_facturedet_rec add column total_tva real;
alter table can_facturedet_rec add column total_ttc real;

alter table can_adherent add column phone            varchar(30) after email;
alter table can_adherent add column phone_perso      varchar(30) after phone;
alter table can_adherent add column phone_mobile     varchar(30) after phone_perso;

delete from can_adherent_type where libelle IS NULL;
alter table can_adherent_type modify libelle          varchar(50) NOT NULL;

update can_facture set fk_facture_source=null where fk_facture_source is not null and type = 0;
update can_facture set fk_statut=2 where paye=1;
update can_facture set fk_statut=2 where close_code is not null and close_code != '' and close_code != 'replaced';


update can_boxes set fk_user = 0 where fk_user IS NULL;
ALTER TABLE can_boxes modify fk_user integer default 0 NOT NULL;

-- Supprimme orphelins pour permettre montee de la cle
-- V4 DELETE can_boxes FROM can_boxes LEFT JOIN can_boxes_def ON can_boxes.box_id = can_boxes_def.rowid WHERE can_boxes_def.rowid IS NULL;

ALTER TABLE can_boxes ADD INDEX idx_boxes_boxid (box_id);
-- V4 ALTER TABLE can_boxes ADD CONSTRAINT fk_boxes_box_id FOREIGN KEY (box_id) REFERENCES can_boxes_def (rowid);

ALTER TABLE can_boxes ADD INDEX idx_boxes_fk_user (fk_user);


create table can_categorie_fournisseur
(
  fk_categorie  integer NOT NULL,
  fk_societe    integer NOT NULL,
  UNIQUE (fk_categorie, fk_societe)
)Engine=innodb;


create table can_fournisseur_ca
(
  fk_societe    integer,
  date_calcul   datetime,
  year          smallint UNSIGNED,
  ca_genere     float,
  UNIQUE (fk_societe, year)
)Engine=innodb;

alter table can_fournisseur_ca add ca_achat float(11,2) DEFAULT 0;

create table can_product_ca
(
  fk_product    integer,
  date_calcul   datetime,
  year          smallint UNSIGNED,
  ca_genere     float,
  UNIQUE (fk_product, year)
)Engine=innodb;

create table can_commande_fournisseur_dispatch
(
  rowid          integer AUTO_INCREMENT PRIMARY KEY,
  fk_commande    integer,
  fk_product     integer,
  qty            float,              -- quantit�
  fk_entrepot    integer,
  fk_user        integer,
  datec          datetime
)Engine=innodb;

ALTER TABLE can_commande_fournisseur_dispatch ADD INDEX (fk_commande);

create table can_stock_valorisation
(
  rowid              integer AUTO_INCREMENT PRIMARY KEY,
  tms                timestamp,             -- date technique mise a jour automatiquement
  date_valo          datetime,              -- date de valorisation
  fk_product         integer NOT NULL,      -- id du produit concerne par l'operation
  qty_ope            float(9,3),            -- quantite de l'operation
  price_ope          float(12,4),           -- prix unitaire du produit concerne par l'operation
  valo_ope           float(12,4),           -- valorisation de l'operation
  price_pmp          float(12,4),           -- valeur PMP de l'operation
  qty_stock          float(9,3) DEFAULT 0,  -- qunatite en stock
  valo_pmp           float(12,4),           -- valorisation du stock en PMP
  fk_stock_mouvement integer,               -- id du mouvement de stock

  key(fk_product)
)Engine=innodb;


create table can_entrepot_valorisation
(
  rowid           integer AUTO_INCREMENT PRIMARY KEY,
  tms             timestamp,      -- date technique mise a jour automatiquement
  date_calcul     date,           -- date auquel a ete calcule la valeur
  fk_entrepot     integer UNSIGNED NOT NULL ,
  valo_pmp        float(12,4),    -- valoristaion du stock en PMP
  key(fk_entrepot)
)Engine=innodb;

ALTER TABLE can_entrepot ADD COLUMN valo_pmp float(12,4) DEFAULT 0;

create table can_user_entrepot
(
  rowid        integer AUTO_INCREMENT PRIMARY KEY,
  fk_entrepot  integer UNSIGNED, -- pointe sur can_entrepot
  fk_user      integer UNSIGNED, -- pointe sur can_user
  consult      tinyint(1) UNSIGNED,
  send         tinyint(1) UNSIGNED
)Engine=innodb;

create table can_product_subproduct
(
  rowid                 integer AUTO_INCREMENT PRIMARY KEY,
  fk_product            integer NOT NULL, -- id du produit maitre
  fk_product_subproduct integer NOT NULL, -- id du sous-produit
  UNIQUE(fk_product, fk_product_subproduct)
)Engine=innodb;

create table can_bordereau_cheque
(
  rowid             integer AUTO_INCREMENT PRIMARY KEY,
  datec             datetime,
  date_bordereau    date,
  number            mediumint,
  amount            float(12,2),
  nbcheque          smallint UNSIGNED DEFAULT 0,
  fk_bank_account   integer,
  fk_user_author    integer,
  note              text,
  statut            tinyint(1) UNSIGNED DEFAULT 0
)Engine=innodb;

alter table can_product_price add price_level tinyint(4) NULL DEFAULT 1;
alter table can_product_price add column price_ttc float(12,4) DEFAULT 0 after price;
alter table can_product_price add column price_base_type varchar(3)  DEFAULT 'HT' after price_ttc;

ALTER TABLE can_document_model ADD UNIQUE uk_document_model (nom,type);

ALTER TABLE can_chargesociales drop column date_pai;

UPDATE can_facture SET type=0 where type=3;

create table can_export_model
(
  	rowid         integer AUTO_INCREMENT PRIMARY KEY,
  	label         varchar(50) NOT NULL,
  	type          varchar(20) NOT NULL,
  	field         text
)Engine=innodb;

ALTER table can_export_model add fk_user		  integer DEFAULT 0 NOT NULL after rowid;

ALTER TABLE can_export_model ADD UNIQUE uk_export_model (label);

UPDATE can_rights_def  SET ID=ID+1001 WHERE ID BETWEEN 180 AND 189 AND module='fournisseur';
UPDATE can_user_rights SET fk_id=fk_id+1001 WHERE fk_id BETWEEN 180 AND 189;
UPDATE can_usergroup_rights SET fk_id=fk_id+1001 WHERE fk_id BETWEEN 180 AND 189;

UPDATE can_rights_def  SET ID=ID+1000 WHERE ID BETWEEN 230 AND 236 AND module='fournisseur';
UPDATE can_user_rights SET fk_id=fk_id+1000 WHERE fk_id BETWEEN 230 AND 236;
UPDATE can_usergroup_rights SET fk_id=fk_id+1000 WHERE fk_id BETWEEN 230 AND 236;

UPDATE can_rights_def  SET ID=ID+1 WHERE ID BETWEEN 1320 AND 1320 AND module='facture';
UPDATE can_user_rights SET fk_id=fk_id+1 WHERE fk_id BETWEEN 1320 AND 1320;
UPDATE can_usergroup_rights SET fk_id=fk_id+1 WHERE fk_id BETWEEN 1320 AND 1320;

UPDATE can_rights_def  SET ID=ID+1 WHERE ID BETWEEN 1420 AND 1420 AND module='commande';
UPDATE can_user_rights SET fk_id=fk_id+1 WHERE fk_id BETWEEN 1420 AND 1420;
UPDATE can_usergroup_rights SET fk_id=fk_id+1 WHERE fk_id BETWEEN 1420 AND 1420;
