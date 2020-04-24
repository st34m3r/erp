-- ============================================================================
-- Copyright (C) 2004      Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2004-2009 Laurent Destailleur  <eldy@users.sourceforge.net>
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
-- ===========================================================================

create table can_user_param
(
  fk_user       integer      NOT NULL,
  entity        integer DEFAULT 1 NOT NULL,	-- multi company id
  param         varchar(64)  NOT NULL,
  value         varchar(255) NOT NULL
)Engine=innodb;

-- 
-- List of codes for the field entity
--
-- 1 : first company param
-- 2 : second company param
-- 3 : etc...
--