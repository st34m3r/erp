-- ========================================================================
-- Copyright (C) 2005           Laurent Destailleur  <eldy@users.sourceforge.net>
-- Copyright (C) 2010           Juanjo Menent        <jmenent@2byte.es>
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
-- ========================================================================

create table can_c_tva
(
  rowid             integer NOT NULL AUTO_INCREMENT PRIMARY KEY,
  fk_pays           integer NOT NULL,
  taux              double  NOT NULL,
  localtax1         double  NOT NULL DEFAULT 0,
  localtax2         double  NOT NULL DEFAULT 0,
  recuperableonly   integer NOT NULL DEFAULT 0,
  note              varchar(128),
  active            tinyint DEFAULT 1 NOT NULL

)Engine=innodb;

