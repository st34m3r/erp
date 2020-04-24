-- ============================================================================
-- Copyright (C) 2006 Laurent Destailleur  <eldy@users.sourceforge.net>
-- Copyright (C) 2009 Regis Houssin        <regis@dolibarr.fr>
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
--
-- $Id$
-- ============================================================================


-- Supprimme orphelins pour permettre montee de la cle
-- V4 DELETE can_commande FROM can_commande LEFT JOIN can_societe ON can_commande.fk_soc = can_societe.rowid WHERE can_societe.rowid IS NULL; 

ALTER TABLE can_commande ADD UNIQUE INDEX uk_commande_ref (ref, entity);

ALTER TABLE can_commande ADD INDEX idx_commande_fk_soc (fk_soc);
ALTER TABLE can_commande ADD CONSTRAINT fk_commande_fk_soc FOREIGN KEY (fk_soc) REFERENCES can_societe (rowid);
