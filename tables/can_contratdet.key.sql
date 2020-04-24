-- ============================================================================
-- Copyright (C) 2004 Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2005 Laurent Destailleur  <eldy@users.sourceforge.net>
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


ALTER TABLE can_contratdet ADD INDEX idx_contratdet_fk_contrat (fk_contrat);
ALTER TABLE can_contratdet ADD INDEX idx_contratdet_fk_product (fk_product);
ALTER TABLE can_contratdet ADD INDEX idx_contratdet_date_ouverture_prevue (date_ouverture_prevue);
ALTER TABLE can_contratdet ADD INDEX idx_contratdet_date_ouverture (date_ouverture);
ALTER TABLE can_contratdet ADD INDEX idx_contratdet_date_fin_validite (date_fin_validite);

ALTER TABLE can_contratdet ADD CONSTRAINT fk_contratdet_fk_contrat FOREIGN KEY (fk_contrat) REFERENCES can_contrat (rowid);
ALTER TABLE can_contratdet ADD CONSTRAINT fk_contratdet_fk_product FOREIGN KEY (fk_product) REFERENCES can_product (rowid);
