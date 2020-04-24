--
-- $Id$
--
-- Be carefull to requests order.
-- This file must be loaded by calling /install/index.php page
-- when current version is 2.8.0 or higher. 
--
-- To add a column:         ALTER TABLE can_table ADD COLUMN newcol varchar(60) NOT NULL DEFAULT '0' AFTER existingcol;
-- To rename a column:      ALTER TABLE can_table CHANGE COLUMN oldname newname varchar(60);
-- To change type of field: ALTER TABLE can_table MODIFY name varchar(60);
--

-- Fix bad old data
UPDATE can_bank_url SET type='payment' WHERE type='?' AND label='(payment)' AND url LIKE '%compta/paiement/fiche.php%';

-- Add recuperableonly field
alter table can_product       add column recuperableonly integer NOT NULL DEFAULT '0' after tva_tx;
alter table can_product_price add column recuperableonly integer NOT NULL DEFAULT '0' after tva_tx;

-- Rename envente into tosell and add tobuy
alter table can_product change column envente tosell tinyint DEFAULT 1;
alter table can_product add column tobuy tinyint DEFAULT 1 after tosell;
alter table can_product_price change column envente tosell tinyint DEFAULT 1;
 

ALTER TABLE can_boxes_def DROP INDEX uk_boxes_def;
ALTER TABLE can_boxes_def MODIFY note varchar(255);
ALTER TABLE can_boxes_def ADD UNIQUE INDEX uk_boxes_def (file, entity, note);

ALTER TABLE can_notify_def MODIFY fk_contact integer NULL;
ALTER TABLE can_notify_def ADD COLUMN fk_user integer NULL after fk_contact;
ALTER TABLE can_notify_def ADD COLUMN type varchar(16) DEFAULT 'email';

ALTER TABLE can_notify MODIFY fk_contact integer NULL;
ALTER TABLE can_notify ADD COLUMN fk_user integer NULL after fk_contact;
ALTER TABLE can_notify ADD COLUMN type varchar(16) DEFAULT 'email';

ALTER TABLE can_actioncomm MODIFY label varchar(128) NOT NULL;

ALTER TABLE can_expedition MODIFY date_expedition datetime;
ALTER TABLE can_expedition MODIFY date_delivery datetime NULL;

ALTER TABLE can_societe ADD COLUMN canvas varchar(32) DEFAULT NULL AFTER default_lang;

ALTER TABLE can_cond_reglement RENAME TO can_c_payment_term;
ALTER TABLE can_expedition_methode RENAME TO can_c_shipment_mode;

ALTER TABLE can_facturedet_rec ADD COLUMN special_code integer UNSIGNED DEFAULT 0 AFTER total_ttc;
ALTER TABLE can_facturedet_rec ADD COLUMN rang integer DEFAULT 0 AFTER special_code;

ALTER TABLE can_actioncomm ADD COLUMN fk_supplier_order   integer;
ALTER TABLE can_actioncomm ADD COLUMN fk_supplier_invoice integer;


ALTER TABLE can_tmp_caisse MODIFY fk_article integer NOT NULL;
