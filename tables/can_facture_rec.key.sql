-- ============================================================================
-- Copyright (C) 2002-2004 Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2004-2006 Laurent Destailleur  <eldy@users.sourceforge.net>
-- Copyright (C) 2009      Regis Houssin        <regis@dolibarr.fr>
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


ALTER TABLE can_facture_rec ADD UNIQUE INDEX idx_facture_rec_uk_titre (titre, entity);

ALTER TABLE can_facture_rec ADD INDEX idx_facture_rec_fk_soc (fk_soc);
ALTER TABLE can_facture_rec ADD INDEX idx_facture_rec_fk_user_author (fk_user_author);
ALTER TABLE can_facture_rec ADD INDEX idx_facture_rec_fk_projet (fk_projet);

ALTER TABLE can_facture_rec ADD CONSTRAINT fk_facture_rec_fk_soc            FOREIGN KEY (fk_soc) REFERENCES can_societe (rowid);
ALTER TABLE can_facture_rec ADD CONSTRAINT fk_facture_rec_fk_user_author    FOREIGN KEY (fk_user_author) REFERENCES can_user (rowid);
ALTER TABLE can_facture_rec ADD CONSTRAINT fk_facture_rec_fk_projet         FOREIGN KEY (fk_projet) REFERENCES can_projet (rowid);
