-- ===================================================================
-- Copyright (C) 2005      Rodolphe Quiedeville <rodolphe@quiedeville.org>
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
-- ===================================================================

--
-- Bons de prelevement
--
-- statut 1 : transmis a la banque
-- statut 2 : credite
--
create table can_prelevement_bons
(
  rowid          integer AUTO_INCREMENT PRIMARY KEY,
  ref            varchar(12),        -- reference
  entity         integer DEFAULT 1 NOT NULL, -- multi company id
  datec          datetime,           -- date de creation
  amount         real DEFAULT 0,     -- montant total du prelevement
  statut         smallint DEFAULT 0, -- statut
  credite        smallint DEFAULT 0, -- indique si le prelevement a ete credite
  note           text,
  date_trans     datetime,           -- date de transmission a la banque
  method_trans   smallint,           -- methode de transmission
  fk_user_trans  integer,            -- user qui a effectue la transmission
  date_credit    datetime,           -- date de credit sur le compte
  fk_user_credit integer             -- user qui a remonte l'info de credit

)Engine=innodb;
