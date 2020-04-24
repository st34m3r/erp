--
-- $Id$
--
-- Attention a l ordre des requetes.
-- Ce fichier doit etre charge sur une version 2.2.0 
--

DROP TABLE can_facture_tva_sum;
DROP TABLE can_c_ape;

delete from can_const where name='MAIN_GRAPH_LIBRARY' and (value like 'phplot%' or value like 'artichow%');

ALTER TABLE can_societe_adresse_livraison ADD COLUMN tel varchar(20) after fk_pays;
ALTER TABLE can_societe_adresse_livraison ADD COLUMN fax varchar(20) after tel;

RENAME TABLE can_c_barcode TO can_c_barcode_type; 

alter table can_c_barcode_type modify coder varchar(16) NOT NULL;
update can_c_barcode_type set coder = 0 where coder in (1,2);

update can_const set value='' where name='MAIN_FORCE_SETLOCALE_LC_ALL'      and value='MAIN_FORCE_SETLOCALE_LC_ALL';
update can_const set value='' where name='MAIN_FORCE_SETLOCALE_LC_MONETARY' and value='MAIN_FORCE_SETLOCALE_LC_MONETARY';
update can_const set value='' where name='MAIN_FORCE_SETLOCALE_LC_NUMERIC'  and value='MAIN_FORCE_SETLOCALE_LC_NUMERIC';
update can_const set value='' where name='MAIN_FORCE_SETLOCALE_LC_TIME'     and value='MAIN_FORCE_SETLOCALE_LC_TIME';

-- remove old deprecated options
update can_const set name='SOCIETE_CODECLIENT_ADDON' where name='CODECLIENT_ADDON';
update can_const set name='SOCIETE_CODEFOURNISSEUR_ADDON' where name='CODEFOURNISSEUR_ADDON';
delete from can_const where name='CODECLIENT_ADDON';
delete from can_const where name='CODEFOURNISSEUR_ADDON';

alter table can_const add tms timestamp;
update can_const set tms=sysdate() where tms is null;
update can_const set tms=sysdate() where tms <= 0;


alter table can_document_model modify type varchar(20) NOT NULL;

DELETE FROM can_rights_def WHERE module = 'menudb';

ALTER table can_boxes_def drop column name;
ALTER table can_boxes_def add column tms timestamp;

-- Rename primary key of can_menu
ALTER TABLE can_menu_const drop foreign key fk_menu_const_fk_menu;
alter table can_menu drop primary key;
alter table can_menu modify rowid integer AUTO_INCREMENT NOT NULL PRIMARY KEY;
ALTER TABLE can_menu_const ADD CONSTRAINT fk_menu_const_fk_menu FOREIGN KEY (fk_menu) REFERENCES can_menu (rowid);

alter table can_menu modify user integer NOT NULL default '0';
alter table can_menu change `order` position integer NOT NULL;
alter table can_menu change `right` perms varchar(255);
alter table can_menu add column module varchar(64) after menu_handler;
alter table can_menu add column tms timestamp;

-- Add a unique key
update can_menu set url='/comm/prospect/prospects.php?leftmenu=prospects' where rowid=702 and url='/contact/index.php?leftmenu=prospects&type=p';
ALTER TABLE can_menu ADD UNIQUE INDEX idx_menu_uk_menu (menu_handler, fk_menu, url);

-- Drop unused table
drop table if exists can_so_gr;

-- Modification expedition
create table can_co_exp
(
  rowid         integer AUTO_INCREMENT PRIMARY KEY,
  fk_commande   integer NOT NULL,
  fk_expedition integer NOT NULL,

  key(fk_commande),
  key(fk_expedition)
)Engine=innodb;

-- V4 ALTER TABLE can_expedition DROP INDEX fk_expedition_methode;
-- V4 ALTER TABLE can_expedition DROP INDEX fk_commande;
-- V4 ALTER TABLE can_expedition DROP INDEX ref;
-- V4 ALTER TABLE can_expeditiondet DROP INDEX fk_expedition;
-- V4 ALTER TABLE can_expeditiondet DROP INDEX fk_commande_ligne;

-- V4.1 update can_commande set fk_adresse_livraison = null where fk_adresse_livraison is not null and fk_adresse_livraison not in (select rowid from can_societe_adresse_livraison);
-- V4.1 delete from can_expeditiondet where fk_expedition not in (select rowid from can_expedition);
-- V4.1 delete from can_livraisondet where fk_livraison not in (select rowid from can_livraison);

alter table can_expedition add column fk_soc integer NOT NULL after ref;
alter table can_expedition add column fk_adresse_livraison integer DEFAULT NULL after date_expedition;
-- V4.1 UPDATE can_expedition as e SET e.fk_soc = (SELECT c.fk_soc FROM can_commande AS c WHERE e.fk_commande = c.rowid);
-- V4.1 UPDATE can_expedition as e SET e.fk_adresse_livraison = (SELECT c.fk_adresse_livraison FROM can_commande AS c WHERE e.fk_commande = c.rowid);
update can_expedition set fk_adresse_livraison=NULL where fk_adresse_livraison = 0;

ALTER TABLE can_expedition ADD INDEX idx_expedition_fk_soc (fk_soc);
ALTER TABLE can_expedition ADD INDEX idx_expedition_fk_user_author (fk_user_author);
ALTER TABLE can_expedition ADD INDEX idx_expedition_fk_user_valid (fk_user_valid);
ALTER TABLE can_expedition ADD INDEX idx_expedition_fk_adresse_livraison (fk_adresse_livraison);
ALTER TABLE can_expedition ADD INDEX idx_expedition_fk_expedition_methode (fk_expedition_methode);
-- V4 ALTER TABLE can_expedition ADD CONSTRAINT fk_expedition_fk_soc                FOREIGN KEY (fk_soc)                 REFERENCES can_societe (rowid);
-- V4 ALTER TABLE can_expedition ADD CONSTRAINT fk_expedition_fk_user_author        FOREIGN KEY (fk_user_author)         REFERENCES can_user (rowid);
-- V4 ALTER TABLE can_expedition ADD CONSTRAINT fk_expedition_fk_user_valid         FOREIGN KEY (fk_user_valid)          REFERENCES can_user (rowid);
-- V4 ALTER TABLE can_expedition ADD CONSTRAINT fk_expedition_fk_adresse_livraison  FOREIGN KEY (fk_adresse_livraison)   REFERENCES can_societe_adresse_livraison (rowid);
-- V4 ALTER TABLE can_expedition ADD CONSTRAINT fk_expedition_fk_expedition_methode FOREIGN KEY (fk_expedition_methode)  REFERENCES can_expedition_methode (rowid);
ALTER TABLE can_expedition ADD UNIQUE INDEX idx_expedition_uk_ref (ref);

ALTER TABLE can_expeditiondet CHANGE fk_commande_ligne fk_origin_line integer;
ALTER TABLE can_expeditiondet ADD COLUMN fk_entrepot integer after fk_origin_line;
ALTER TABLE can_expeditiondet ADD COLUMN rang integer DEFAULT 0 after qty;
-- V4.1 UPDATE can_expeditiondet as ed SET ed.fk_entrepot = (SELECT e.fk_entrepot FROM can_expedition AS e WHERE ed.fk_expedition = e.rowid);
ALTER TABLE can_expedition DROP COLUMN fk_entrepot;

ALTER TABLE can_expeditiondet ADD INDEX idx_expeditiondet_fk_expedition (fk_expedition);
ALTER TABLE can_expeditiondet ADD INDEX idx_expeditiondet_fk_entrepot (fk_entrepot);
-- V4 ALTER TABLE can_expeditiondet ADD CONSTRAINT fk_expeditiondet_fk_expedition FOREIGN KEY (fk_expedition) REFERENCES can_expedition (rowid);
-- V4 ALTER TABLE can_expeditiondet ADD CONSTRAINT fk_expeditiondet_fk_entrepot   FOREIGN KEY (fk_entrepot)   REFERENCES can_entrepot (rowid);

-- Modification livraison
create table can_co_liv
(
  rowid         integer AUTO_INCREMENT PRIMARY KEY,
  fk_commande   integer NOT NULL,
  fk_livraison  integer NOT NULL,

  key(fk_commande),
  key(fk_livraison)
)Engine=innodb;

-- V4 ALTER TABLE can_livraison DROP INDEX fk_commande;
-- V4 ALTER TABLE can_livraison DROP INDEX ref;
-- V4 ALTER TABLE can_livraisondet DROP INDEX fk_livraison;
-- V4 ALTER TABLE can_livraisondet DROP INDEX fk_commande_ligne;
ALTER TABLE can_livraison DROP COLUMN total_ttc;

ALTER TABLE can_livraison add column total_ht double(24,8) DEFAULT 0;
ALTER TABLE can_livraison MODIFY total_ht double(24,8) DEFAULT 0;
ALTER TABLE can_livraison MODIFY fk_adresse_livraison integer DEFAULT NULL;
alter table can_livraison add column ref_client varchar(30) after ref;
alter table can_livraison add column fk_soc integer NOT NULL after ref_client;
UPDATE can_livraison SET fk_adresse_livraison = NULL WHERE fk_adresse_livraison = 0;
-- V4.1 UPDATE can_livraison as l SET l.fk_soc = (SELECT c.fk_soc FROM can_commande AS c WHERE l.fk_commande = c.rowid);

ALTER TABLE can_livraison ADD INDEX idx_livraison_fk_soc (fk_soc);
ALTER TABLE can_livraison ADD INDEX idx_livraison_fk_user_author (fk_user_author);
ALTER TABLE can_livraison ADD INDEX idx_livraison_fk_user_valid (fk_user_valid);
ALTER TABLE can_livraison ADD INDEX idx_livraison_fk_adresse_livraison (fk_adresse_livraison);
-- V4 ALTER TABLE can_livraison ADD CONSTRAINT fk_livraison_fk_soc                FOREIGN KEY (fk_soc)                 REFERENCES can_societe (rowid);
-- V4 ALTER TABLE can_livraison ADD CONSTRAINT fk_livraison_fk_user_author        FOREIGN KEY (fk_user_author)         REFERENCES can_user (rowid);
-- V4 ALTER TABLE can_livraison ADD CONSTRAINT fk_livraison_fk_user_valid         FOREIGN KEY (fk_user_valid)          REFERENCES can_user (rowid);
-- V4 ALTER TABLE can_livraison ADD CONSTRAINT fk_livraison_fk_adresse_livraison  FOREIGN KEY (fk_adresse_livraison)   REFERENCES can_societe_adresse_livraison (rowid);
ALTER TABLE can_livraison ADD UNIQUE INDEX idx_livraison_uk_ref (ref);

alter table can_livraisondet add column fk_product  integer after fk_livraison;
alter table can_livraisondet add column description text after fk_product;
alter table can_livraisondet add column subprice    double(24,8) DEFAULT 0 after qty;
alter table can_livraisondet add column total_ht    double(24,8) DEFAULT 0 after subprice;
alter table can_livraisondet add column rang        integer      DEFAULT 0 after total_ht;

ALTER TABLE can_livraisondet ADD INDEX idx_livraisondet_fk_expedition (fk_livraison);
-- V4 ALTER TABLE can_livraisondet ADD CONSTRAINT fk_livraisondet_fk_livraison FOREIGN KEY (fk_livraison) REFERENCES can_livraison (rowid);

create table can_pr_exp
(
  rowid         integer AUTO_INCREMENT PRIMARY KEY,
  fk_propal     integer NOT NULL,
  fk_expedition integer NOT NULL,

  key(fk_propal),
  key(fk_expedition)
)Engine=innodb;

create table can_pr_liv
(
  rowid         integer AUTO_INCREMENT PRIMARY KEY,
  fk_propal     integer NOT NULL,
  fk_livraison  integer NOT NULL,

  key(fk_propal),
  key(fk_livraison)
)Engine=innodb;

ALTER TABLE can_paiement modify fk_bank integer NOT NULL DEFAULT 0;


create table can_element_element
(
  rowid           	integer AUTO_INCREMENT PRIMARY KEY,  
  sourceid			integer NOT NULL,
  sourcetype		varchar(12) NOT NULL,
  targetid			integer NOT NULL,
  targettype		varchar(12) NOT NULL
) Engine=innodb;


ALTER TABLE can_element_element 
	ADD UNIQUE INDEX idx_element_element_idx1 (sourceid, sourcetype, targetid, targettype);

ALTER TABLE can_element_element ADD INDEX idx_element_element_targetid (targetid);


ALTER  TABLE can_actioncomm add column fk_user_mod integer after fk_user_author;
ALTER  TABLE can_actioncomm add column fk_user_done integer after fk_user_action;

drop table if exists can_events;
create table can_events
(
  rowid          integer AUTO_INCREMENT PRIMARY KEY,
  tms            timestamp,            
  type			 varchar(32)  NOT NULL, 
  dateevent      datetime,             
  fk_user        integer,              
  description    varchar(250) NOT NULL,        
  ip			 varchar(32) NOT NULL,
  fk_object      integer               
) Engine=innodb;


ALTER TABLE can_events ADD INDEX idx_events_dateevent (dateevent);

ALTER TABLE can_c_forme_juridique ADD isvatexempted	tinyint DEFAULT 0  NOT NULL after libelle;

ALTER TABLE can_facturedet        ADD product_type	  integer      DEFAULT NULL after total_ttc;
ALTER TABLE can_facture_fourn_det ADD product_type	  integer      DEFAULT NULL after total_ttc;

-- V4.1 update can_facturedet        set product_type = 0 where fk_product in (select rowid from can_product where fk_product_type = 0);
-- V4.1 update can_facture_fourn_det set product_type = 0 where fk_product in (select rowid from can_product where fk_product_type = 0);
-- V4.1 update can_facturedet        set product_type = 1 where fk_product in (select rowid from can_product where fk_product_type = 1);
-- V4.1 update can_facture_fourn_det set product_type = 1 where fk_product in (select rowid from can_product where fk_product_type = 1);
-- V4.1 update can_facturedet        set product_type = 1 where product_type is null;
-- V4.1 update can_facture_fourn_det set product_type = 1 where product_type is null;

create table can_c_prospectlevel
(
  code            varchar(12) PRIMARY KEY,
  label           varchar(30),
  sortorder       smallint,
  active          smallint    DEFAULT 1 NOT NULL
) Engine=innodb;

insert into can_c_prospectlevel (code,label,sortorder) values ('PL_UNKOWN',    'Unknown',  1);
insert into can_c_prospectlevel (code,label,sortorder) values ('PL_LOW',       'Low',      2);
insert into can_c_prospectlevel (code,label,sortorder) values ('PL_MEDIUM',    'Medium',   3);
insert into can_c_prospectlevel (code,label,sortorder) values ('PL_HIGH',      'High',     4);


alter table can_societe add column fk_prospectlevel varchar(12) after fournisseur;
alter table can_societe modify tva_assuj tinyint        DEFAULT 1;


--update can_actioncomm set datea = datep where datea is null and percent = 100;
--update can_actioncomm set datea2 = datea where datea2 is null and percent = 100;
update can_actioncomm set datep = datea where datep is null and datea is not null;
update can_actioncomm set datep = datec where datep is null and datea is null;
update can_actioncomm set datep2 = datep where datep2 is null and percent = 100;


alter table can_projet modify fk_soc           integer;

update can_rights_def set module='societe' where module='commercial' and perms='client' and subperms='voir';

insert into can_c_chargesociales (id, libelle, deductible, active, actioncompta) values (25, 'Impots revenus',         0,1,'TAXREV');

alter table can_socpeople add   priv           smallint NOT NULL DEFAULT 0 after jabberid;

alter table can_tva modify fk_bank         integer;

delete from can_const where name='MAIN_USE_PREVIEW_TABS';

alter table can_menu_const drop column user;
update can_menu set leftmenu = '1' where leftmenu != '0';
alter table can_menu modify leftmenu varchar(1) default '1';


create table can_ecm_directories
(
  rowid           integer AUTO_INCREMENT PRIMARY KEY,
  label           varchar(32) NOT NULL,
  fk_parent       integer,
  description     varchar(255) NOT NULL,
  cachenbofdoc    integer NOT NULL DEFAULT 0,
  date_c		  datetime,
  date_m		  timestamp,
  fk_user_c		  integer,
  fk_user_m		  integer
) Engine=innodb;

create table can_ecm_documents
(
  rowid           integer AUTO_INCREMENT PRIMARY KEY,
  ref             varchar(16)  NOT NULL,
  filename        varchar(255) NOT NULL,
  filesize        integer      NOT NULL,
  filemime        varchar(32)  NOT NULL,
  fullpath_dol    varchar(255) NOT NULL,
  fullpath_orig   varchar(255) NOT NULL,
  description     text,
  manualkeyword   text,
  fk_create       integer  NOT NULL,
  fk_update       integer,
  date_c	      datetime NOT NULL,
  date_u		  timestamp,
  fk_directory    integer,
  fk_status		  smallint DEFAULT 0,
  private         smallint DEFAULT 0
) Engine=innodb;

ALTER TABLE can_bank modify num_chq varchar(50);

ALTER TABLE can_menu_const ADD UNIQUE KEY uk_menu_const(fk_menu, fk_constraint);

INSERT INTO can_c_paper_format (rowid, code, label, width, height, unit, active) VALUES (100, 'USLetter',    'Format Letter (A)',    '216',  '279',  'mm', 0);
INSERT INTO can_c_paper_format (rowid, code, label, width, height, unit, active) VALUES (105, 'USLegal',     'Format Legal',     '216',  '356',  'mm', 0);
INSERT INTO can_c_paper_format (rowid, code, label, width, height, unit, active) VALUES (110, 'USExecutive', 'Format Executive', '190',  '254',  'mm', 0);
INSERT INTO can_c_paper_format (rowid, code, label, width, height, unit, active) VALUES (115, 'USLedger',    'Format Ledger/Tabloid (B)', '279',  '432',  'mm', 0);

INSERT INTO can_c_paper_format (rowid, code, label, width, height, unit, active) VALUES (200, 'Canadian P1', 'Format Canadian P1',    '560',  '860',  'mm', 0);
INSERT INTO can_c_paper_format (rowid, code, label, width, height, unit, active) VALUES (205, 'Canadian P2', 'Format Canadian P2',    '430',  '560',  'mm', 0);
INSERT INTO can_c_paper_format (rowid, code, label, width, height, unit, active) VALUES (210, 'Canadian P3', 'Format Canadian P3',    '280',  '430',  'mm', 0);
INSERT INTO can_c_paper_format (rowid, code, label, width, height, unit, active) VALUES (215, 'Canadian P4', 'Format Canadian P4',    '215',  '280',  'mm', 0);
INSERT INTO can_c_paper_format (rowid, code, label, width, height, unit, active) VALUES (220, 'Canadian P5', 'Format Canadian P5',    '140',  '215',  'mm', 0);
INSERT INTO can_c_paper_format (rowid, code, label, width, height, unit, active) VALUES (225, 'Canadian P6', 'Format Canadian P6',    '107',  '140',  'mm', 0);

ALTER TABLE can_commande_fournisseurdet DROP COLUMN price;

alter table can_adherent modify fk_user_mod integer;
alter table can_adherent modify fk_user_valid integer;

create table can_c_type_fees
(
  id        integer      AUTO_INCREMENT PRIMARY KEY,
  code      varchar(12)  UNIQUE NOT NULL,
  libelle   varchar(30),
  active    tinyint DEFAULT 1   NOT NULL
)Engine=innodb;


alter table can_deplacement modify type varchar(12) NOT NULL;
alter table can_deplacement modify km real;

insert into can_c_type_fees (code,libelle,active) values ('TF_OTHER',    'Other',  1);
insert into can_c_type_fees (code,libelle,active) values ('TF_TRIP',     'Trip',   1);
insert into can_c_type_fees (code,libelle,active) values ('TF_LUNCH',    'Lunch',  1);

drop table can_comfourn_facfourn;

alter table can_element_element modify sourcetype		varchar(16) NOT NULL;
alter table can_element_element modify targettype		varchar(16) NOT NULL;

update can_societe set fk_typent = 0 where fk_typent is null;

ALTER TABLE can_surveys_answers_summary Engine=innodb;

