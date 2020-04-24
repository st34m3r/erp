-- ===================================================================
-- Copyright (C) 2005      Laurent Destailleur  <eldy@users.sourceforge.net>
-- Copyright (C) 2008-2010 Regis Houssin        <regis@dolibarr.fr>
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
-- ===================================================================


ALTER TABLE can_livraison ADD UNIQUE INDEX idx_livraison_uk_ref (ref, entity);

ALTER TABLE can_livraison ADD INDEX idx_livraison_fk_soc (fk_soc);
ALTER TABLE can_livraison ADD INDEX idx_livraison_fk_user_author (fk_user_author);
ALTER TABLE can_livraison ADD INDEX idx_livraison_fk_user_valid (fk_user_valid);
-- obsolete ALTER TABLE can_livraison ADD INDEX idx_livraison_fk_adresse_livraison (fk_adresse_livraison);

ALTER TABLE can_livraison ADD CONSTRAINT fk_livraison_fk_soc			FOREIGN KEY (fk_soc)			REFERENCES can_societe (rowid);
ALTER TABLE can_livraison ADD CONSTRAINT fk_livraison_fk_user_author	FOREIGN KEY (fk_user_author)	REFERENCES can_user (rowid);
ALTER TABLE can_livraison ADD CONSTRAINT fk_livraison_fk_user_valid		FOREIGN KEY (fk_user_valid)		REFERENCES can_user (rowid);
-- obsolete ALTER TABLE can_livraison ADD CONSTRAINT fk_livraison_fk_adresse_livraison	FOREIGN KEY (fk_adresse_livraison)	REFERENCES can_societe_address (rowid);
