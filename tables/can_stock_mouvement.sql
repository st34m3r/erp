-- ============================================================================
-- Copyright (C) 2003 Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2009 Laurent Destailleur  <eldy@users.sourceofrge.net>
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

create table can_stock_mouvement
(
  rowid           integer AUTO_INCREMENT PRIMARY KEY,
  tms             timestamp,
  datem           datetime,
  fk_product      integer NOT NULL,
  fk_entrepot     integer NOT NULL,
  value           integer,
  price           float(13,4) DEFAULT 0,
  type_mouvement  smallint,
  fk_user_author  integer,
  label           varchar(128)
)Engine=innodb;
