-- ============================================================================
-- Copyright (C) 2009 Laurent Destailleur <eldy@users.sourceforge.net>
-- Copyright (C) 2009 Regis Houssin       <regis@dolibarr.fr>
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


ALTER TABLE can_adherent ADD UNIQUE INDEX uk_adherent_login (login, entity);
ALTER TABLE can_adherent ADD UNIQUE INDEX uk_adherent_fk_soc (fk_soc);

ALTER TABLE can_adherent ADD INDEX idx_adherent_fk_adherent_type (fk_adherent_type);

ALTER TABLE can_adherent ADD CONSTRAINT adherent_fk_soc FOREIGN KEY (fk_soc) REFERENCES can_societe (rowid);
ALTER TABLE can_adherent ADD CONSTRAINT fk_adherent_adherent_type FOREIGN KEY (fk_adherent_type)    REFERENCES can_adherent_type (rowid);
