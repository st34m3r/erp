-- ============================================================================
-- Copyright (C) 2005 Rodolphe Quiedeville <rodolphe@quiedeville.org>
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


ALTER TABLE can_prelevement_lignes ADD INDEX idx_prelevement_lignes_fk_prelevement_bons (fk_prelevement_bons);


ALTER TABLE can_prelevement_lignes ADD CONSTRAINT fk_prelevement_lignes_fk_prelevement_bons FOREIGN KEY (fk_prelevement_bons) REFERENCES can_prelevement_bons (rowid);

