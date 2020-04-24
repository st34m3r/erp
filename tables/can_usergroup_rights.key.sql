-- ============================================================================
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
-- ===========================================================================


-- Supprime orhpelins pour permettre montee de la cle
-- V4 DELETE can_usergroup_rights FROM can_usergroup_rights LEFT JOIN can_usergroup ON can_usergroup_rights.fk_usergroup = can_usergroup.rowid WHERE can_usergroup.rowid IS NULL;


ALTER TABLE can_usergroup_rights ADD CONSTRAINT fk_usergroup_rights_fk_usergroup FOREIGN KEY (fk_usergroup)    REFERENCES can_usergroup (rowid);
