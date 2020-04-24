-- ============================================================================
-- Copyright (C) 2004 Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2005-2007 Laurent Destailleur  <eldy@users.sourceforge.net>
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
--
-- Remises exceptionnelles
--
-- ============================================================================


ALTER TABLE can_societe_remise_except ADD INDEX idx_societe_remise_except_fk_user (fk_user);
ALTER TABLE can_societe_remise_except ADD INDEX idx_societe_remise_except_fk_soc (fk_soc);
ALTER TABLE can_societe_remise_except ADD INDEX idx_societe_remise_except_fk_facture_line (fk_facture_line);
ALTER TABLE can_societe_remise_except ADD INDEX idx_societe_remise_except_fk_facture (fk_facture);
ALTER TABLE can_societe_remise_except ADD INDEX idx_societe_remise_except_fk_facture_source (fk_facture_source);


ALTER TABLE can_societe_remise_except ADD CONSTRAINT fk_societe_remise_fk_user    FOREIGN KEY (fk_user)    REFERENCES can_user (rowid);
ALTER TABLE can_societe_remise_except ADD CONSTRAINT fk_societe_remise_fk_soc     FOREIGN KEY (fk_soc)     REFERENCES can_societe (rowid);
ALTER TABLE can_societe_remise_except ADD CONSTRAINT fk_societe_remise_fk_facture_line   FOREIGN KEY (fk_facture_line) REFERENCES can_facturedet (rowid);
ALTER TABLE can_societe_remise_except ADD CONSTRAINT fk_societe_remise_fk_facture        FOREIGN KEY (fk_facture)        REFERENCES can_facture (rowid);
ALTER TABLE can_societe_remise_except ADD CONSTRAINT fk_societe_remise_fk_facture_source FOREIGN KEY (fk_facture_source) REFERENCES can_facture (rowid);



