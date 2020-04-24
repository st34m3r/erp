--
-- $Id$
--
-- Script to repair some fatal errors due to database corruption
-- 
-- when current version is 2.6.0 or higher. 
--


-- Request to clean corrupted database
delete from can_facture where facnumber = '(PROV)';
delete from can_commande where ref = '(PROV)';
delete from can_propal where ref = '(PROV)';
delete from can_facture where facnumber = '';
delete from can_commande where ref = '';
delete from can_propal where ref = '';
