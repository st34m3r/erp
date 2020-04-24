-- ============================================================================
-- Copyright (C) 2002-2004 Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2004-2005 Laurent Destailleur  <eldy@users.sourceforge.net>
-- Copyright (C) 2005-2009 Regis Houssin        <regis@dolibarr.fr>
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


-- Supprimme orhpelins pour permettre mont�e de la cl�
-- V4 DELETE can_contratdet FROM can_contratdet, can_contrat LEFT JOIN can_societe ON can_contrat.fk_soc = can_societe.rowid WHERE can_contratdet.fk_contrat = can_contrat.rowid AND can_societe.rowid IS NULL; 
-- V4 DELETE can_contrat FROM can_contrat LEFT JOIN can_societe ON can_contrat.fk_soc = can_societe.rowid WHERE can_societe.rowid IS NULL;
-- V4 DELETE can_contrat FROM can_contrat LEFT JOIN can_user ON can_contrat.fk_user_author = can_user.rowid WHERE can_user.rowid IS NULL;

ALTER TABLE can_contrat ADD UNIQUE INDEX uk_contrat_ref (ref, entity);

ALTER TABLE can_contrat ADD INDEX idx_contrat_fk_soc (fk_soc);
ALTER TABLE can_contrat ADD INDEX idx_contrat_fk_user_author (fk_user_author);

ALTER TABLE can_contrat ADD CONSTRAINT fk_contrat_fk_soc FOREIGN KEY (fk_soc) REFERENCES can_societe (rowid);
ALTER TABLE can_contrat ADD CONSTRAINT fk_contrat_user_author FOREIGN KEY (fk_user_author) REFERENCES can_user (rowid);