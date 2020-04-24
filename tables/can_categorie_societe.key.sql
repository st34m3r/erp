-- ============================================================================
-- Copyright (C) 2007 Patrick Raguin       <patrick.raguin@gmail.com>
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

ALTER TABLE can_categorie_societe ADD PRIMARY KEY (fk_categorie, fk_societe);
ALTER TABLE can_categorie_societe ADD INDEX idx_categorie_societe_fk_categorie (fk_categorie);
ALTER TABLE can_categorie_societe ADD INDEX idx_categorie_societe_fk_societe (fk_societe);

ALTER TABLE can_categorie_societe ADD CONSTRAINT fk_categorie_societe_categorie_rowid FOREIGN KEY (fk_categorie) REFERENCES can_categorie (rowid);
ALTER TABLE can_categorie_societe ADD CONSTRAINT fk_categorie_societe_fk_soc   FOREIGN KEY (fk_societe) REFERENCES can_societe (rowid);
