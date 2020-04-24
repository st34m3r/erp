-- ============================================================================
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
-- ============================================================================


ALTER TABLE can_socpeople ADD INDEX idx_socpeople_fk_soc (fk_soc);
ALTER TABLE can_socpeople ADD INDEX idx_socpeople_fk_user_creat (fk_user_creat);

ALTER TABLE can_socpeople ADD CONSTRAINT fk_socpeople_fk_soc    FOREIGN KEY (fk_soc)     REFERENCES can_societe (rowid);
ALTER TABLE can_socpeople ADD CONSTRAINT fk_socpeople_user_creat_user_rowid FOREIGN KEY (fk_user_creat) REFERENCES can_user (rowid);
