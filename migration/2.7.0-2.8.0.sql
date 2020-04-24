--
-- $Id$
--
-- Be carefull to requests order.
-- This file must be loaded by calling /install/index.php page
-- when current version is 2.7.0 or higher. 
--

ALTER TABLE can_actioncomm CHANGE fk_projet fk_project integer;

ALTER TABLE can_don ADD COLUMN ref varchar(30) DEFAULT NULL AFTER rowid;
ALTER TABLE can_don ADD COLUMN entity integer DEFAULT 1 NOT NULL AFTER ref;

ALTER TABLE can_stock_mouvement ADD COLUMN label varchar(128);

ALTER TABLE can_deplacement ADD COLUMN ref varchar(30) DEFAULT NULL AFTER rowid;
ALTER TABLE can_deplacement ADD COLUMN entity integer DEFAULT 1 NOT NULL AFTER ref;
ALTER TABLE can_deplacement ADD COLUMN note_public text;

ALTER TABLE can_element_element DROP INDEX idx_element_element_idx1;
ALTER TABLE can_element_element DROP INDEX idx_element_element_targetid;
ALTER TABLE can_element_element CHANGE sourceid fk_source integer NOT NULL;
ALTER TABLE can_element_element CHANGE targetid fk_target integer NOT NULL;
ALTER TABLE can_element_element ADD UNIQUE INDEX idx_element_element_idx1 (fk_source, sourcetype, fk_target, targettype);
ALTER TABLE can_element_element ADD INDEX idx_element_element_fk_target (fk_target);

ALTER TABLE can_ecm_document RENAME TO can_ecm_documents;
ALTER TABLE can_ecm_documents ADD COLUMN entity integer DEFAULT 1 NOT NULL AFTER ref;
ALTER TABLE can_ecm_documents ADD COLUMN crc varchar(32) DEFAULT '' NOT NULL AFTER private;
ALTER TABLE can_ecm_documents ADD COLUMN cryptkey varchar(50) DEFAULT '' NOT NULL AFTER crc;
ALTER TABLE can_ecm_documents ADD COLUMN cipher varchar(50) DEFAULT 'twofish' NOT NULL AFTER cryptkey;

ALTER TABLE can_facture_fourn_det MODIFY COLUMN qty real;


ALTER TABLE can_notify ADD COLUMN email VARCHAR(255);

ALTER TABLE can_c_currencies ADD COLUMN labelsing   varchar(64);
update can_c_currencies set labelsing='Euro' where code_iso='EUR';
update can_c_currencies set labelsing='Dollar' where code_iso='USD';

insert into can_action_def (rowid,code,titre,description,objet_type) values (5,'NOTIFY_VAL_ORDER','Validation commande client','Executed when a customer order is validated','order');
insert into can_action_def (rowid,code,titre,description,objet_type) values (6,'NOTIFY_VAL_PROPAL','Validation proposition client','Executed when a commercial proposal is validated','propal');

UPDATE can_c_type_contact SET element='project' WHERE element='projet';

UPDATE can_const set value='mail' where value='simplemail' and name='MAIN_MAIL_SENDMODE';

ALTER TABLE can_projet ADD COLUMN model_pdf varchar(50) AFTER note;

ALTER TABLE can_societe ADD COLUMN localtax1_assuj          tinyint        DEFAULT 0 after tva_assuj;
ALTER TABLE can_societe ADD COLUMN localtax2_assuj          tinyint        DEFAULT 0 after localtax1_assuj;

ALTER TABLE can_user ADD COLUMN   photo varchar(255) after statut;

-- Create table of extra fields
create table can_extra_fields
(
  rowid                 integer AUTO_INCREMENT PRIMARY KEY,
  tms                   timestamp,
  entity                integer  DEFAULT 1 NOT NULL,
  object 				varchar(64) NOT NULL,
  assign 				integer,
  name 					varchar(64) NOT NULL,
  label					varchar(64) NOT NULL,
  format				varchar(8) 	NOT NULL,
  fieldsize 			integer,
  maxlength 			integer,
  options 				varchar(45),
  rank 					integer
)Engine=innodb;

ALTER TABLE can_extra_fields ADD UNIQUE INDEX idx_extra_fields_name (name, entity);

-- Create table of possible values
create table can_extra_fields_options
(
  rowid                 integer AUTO_INCREMENT PRIMARY KEY,
  tms                   timestamp,
  fk_extra_fields 		integer NOT NULL,
  value 				varchar(255) NOT NULL,
  rank 					integer
)Engine=innodb;

ALTER TABLE can_extra_fields_options ADD INDEX idx_extra_fields_options_fk_extra_fields (fk_extra_fields);
ALTER TABLE can_extra_fields_options ADD CONSTRAINT fk_extra_fields_options_fk_extra_fields FOREIGN KEY (fk_extra_fields) REFERENCES can_extra_fields (rowid);

-- Create table of values
create table can_extra_fields_values
(
  rowid                 integer AUTO_INCREMENT PRIMARY KEY,
  tms                   timestamp,
  entity                integer  DEFAULT 1 NOT NULL,
  datec					datetime,
  datem					datetime,
  fk_object 			integer NOT NULL,
  fk_extra_fields		integer NOT NULL,
  value					varchar(255),
  fk_user_create 		integer,
  fk_user_modif 		integer
)Engine=innodb;

ALTER TABLE can_extra_fields_values ADD INDEX idx_extra_fields_values_fk_extra_fields (fk_extra_fields, entity);
ALTER TABLE can_extra_fields_values ADD CONSTRAINT fk_extra_fields_values_fk_extra_fields FOREIGN KEY (fk_extra_fields) REFERENCES can_extra_fields (rowid);

ALTER TABLE can_bank_class DROP INDEX idx_bank_class_lineid;
ALTER TABLE can_bank_class DROP INDEX uk_bank_class_lineid;
ALTER TABLE can_bank_class ADD UNIQUE INDEX uk_bank_class_lineid (lineid, fk_categ);

ALTER TABLE can_rights_def MODIFY COLUMN module varchar(64);

-- Enhancement of project tasks
ALTER TABLE can_projet ADD COLUMN datee DATE AFTER dateo;
ALTER TABLE can_projet ADD COLUMN public integer;

ALTER TABLE can_projet_task ADD COLUMN datec datetime AFTER fk_task_parent;
ALTER TABLE can_projet_task ADD COLUMN tms timestamp AFTER datec;
ALTER TABLE can_projet_task ADD COLUMN dateo datetime AFTER tms;
ALTER TABLE can_projet_task ADD COLUMN datee datetime AFTER dateo;
ALTER TABLE can_projet_task ADD COLUMN datev datetime AFTER datee;
ALTER TABLE can_projet_task CHANGE title label varchar(255) NOT NULL;
ALTER TABLE can_projet_task ADD COLUMN description text AFTER label;
ALTER TABLE can_projet_task MODIFY description text;
ALTER TABLE can_projet_task MODIFY duration_effective real DEFAULT 0 NOT NULL;
ALTER TABLE can_projet_task ADD COLUMN progress	integer	DEFAULT 0 AFTER duration_effective;
ALTER TABLE can_projet_task ADD COLUMN priority	integer	DEFAULT 0 AFTER progress;
ALTER TABLE can_projet_task ADD COLUMN fk_milestone     integer DEFAULT 0 AFTER priority;
ALTER TABLE can_projet_task ADD COLUMN fk_user_modif integer AFTER fk_user_creat;
ALTER TABLE can_projet_task ADD COLUMN fk_user_valid integer AFTER fk_user_modif;
UPDATE can_projet_task SET statut='1' WHERE statut='open';
ALTER TABLE can_projet_task CHANGE statut fk_statut smallint DEFAULT 0 NOT NULL;
ALTER TABLE can_projet_task CHANGE note note_private text;
ALTER TABLE can_projet_task ADD COLUMN note_public text AFTER note_private;
ALTER TABLE can_projet_task ADD COLUMN rang	integer	DEFAULT 0 AFTER note_public;

-- Delete old key
ALTER TABLE can_projet_task DROP INDEX fk_projet;
ALTER TABLE can_projet_task DROP INDEX fk_user_creat;
ALTER TABLE can_projet_task DROP INDEX statut;
-- Add new key
ALTER TABLE can_projet_task ADD INDEX idx_projet_task_fk_projet (fk_projet);
ALTER TABLE can_projet_task ADD INDEX idx_projet_task_fk_user_creat (fk_user_creat);
ALTER TABLE can_projet_task ADD INDEX idx_projet_task_fk_user_valid (fk_user_valid);
-- V4.1 DELETE FROM can_projet_task WHERE fk_projet NOT IN (SELECT rowid from can_projet);
-- V4.1 UPDATE can_projet_task set fk_user_creat=NULL WHERE fk_user_creat IS NOT NULL AND fk_user_creat NOT IN (SELECT rowid from can_user);
-- V4.1 UPDATE can_projet_task set fk_user_valid=NULL WHERE fk_user_valid IS NOT NULL AND fk_user_valid NOT IN (SELECT rowid from can_user);
ALTER TABLE can_projet_task ADD CONSTRAINT fk_projet_task_fk_projet 	FOREIGN KEY (fk_projet) REFERENCES can_projet (rowid);
ALTER TABLE can_projet_task ADD CONSTRAINT fk_projet_task_fk_user_creat FOREIGN KEY (fk_user_creat) REFERENCES can_user (rowid);
ALTER TABLE can_projet_task ADD CONSTRAINT fk_projet_task_fk_user_valid FOREIGN KEY (fk_user_valid) REFERENCES can_user (rowid);

ALTER TABLE can_element_contact DROP FOREIGN KEY fk_element_contact_fk_c_type_contact;
ALTER TABLE can_element_contact DROP INDEX fk_element_contact_fk_c_type_contact;
UPDATE can_c_type_contact SET rowid='160' WHERE rowid='80';
UPDATE can_c_type_contact SET rowid='170' WHERE rowid='81';
UPDATE can_element_contact SET fk_c_type_contact='160' WHERE fk_c_type_contact='80';
UPDATE can_element_contact SET fk_c_type_contact='170' WHERE fk_c_type_contact='81';
ALTER TABLE can_element_contact ADD CONSTRAINT fk_element_contact_fk_c_type_contact FOREIGN KEY (fk_c_type_contact) REFERENCES can_c_type_contact(rowid);

insert into can_c_type_contact(rowid, element, source, code, libelle, active ) values (161, 'project',  'internal', 'CONTRIBUTOR', 'Intervenant', 1);
insert into can_c_type_contact(rowid, element, source, code, libelle, active ) values (171, 'project',  'external', 'CONTRIBUTOR', 'Intervenant', 1);
insert into can_c_type_contact(rowid, element, source, code, libelle, active ) values (180, 'project_task',  'internal', 'TASKEXECUTIVE', 'Responsable', 1);
insert into can_c_type_contact(rowid, element, source, code, libelle, active ) values (181, 'project_task',  'internal', 'CONTRIBUTOR', 'Intervenant', 1);
insert into can_c_type_contact(rowid, element, source, code, libelle, active ) values (190, 'project_task',  'external', 'TASKEXECUTIVE', 'Responsable', 1);
insert into can_c_type_contact(rowid, element, source, code, libelle, active ) values (191, 'project_task',  'external', 'CONTRIBUTOR', 'Intervenant', 1);

ALTER TABLE can_projet ADD COLUMN description text AFTER title;
ALTER TABLE can_projet CHANGE note note_private text;
ALTER TABLE can_projet ADD COLUMN note_public text AFTER note_private;
ALTER TABLE can_projet MODIFY fk_statut smallint DEFAULT 0 NOT NULL;
ALTER TABLE can_projet MODIFY fk_user_creat integer NOT NULL;

-- Uniformize code: change tva_taux to tva_tx
ALTER TABLE can_facturedet CHANGE tva_taux tva_tx real;
ALTER TABLE can_facture_fourn_det CHANGE tva_taux tva_tx double(6,3);
ALTER TABLE can_facturedet_rec CHANGE tva_taux tva_tx real DEFAULT 19.6;

-- Create table for entities
create table can_entity
(
  rowid				integer AUTO_INCREMENT PRIMARY KEY,
  tms				timestamp,
  label				varchar(255) NOT NULL,
  description		text,
  datec				datetime,
  fk_user_creat		integer,
  visible			tinyint DEFAULT 1 NOT NULL,
  active			tinyint DEFAULT 1 NOT NULL
) Engine=innodb;

INSERT INTO can_entity (rowid, label, description, datec, fk_user_creat, visible, active) VALUES (1, 'Default Entity', 'This is the default entity', NOW(), 1, 1, 1);

-- Add constraint
-- V4.1 DELETE FROM can_fichinterdet WHERE fk_fichinter NOT IN (SELECT rowid from can_fichinter);
ALTER TABLE can_fichinterdet ADD INDEX idx_fichinterdet_fk_fichinter (fk_fichinter);
ALTER TABLE can_fichinterdet ADD CONSTRAINT fk_fichinterdet_fk_fichinter FOREIGN KEY (fk_fichinter) REFERENCES can_fichinter (rowid);


