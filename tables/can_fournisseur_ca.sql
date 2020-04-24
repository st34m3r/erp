-- ============================================================================
-- Copyright (C) 2006 Rodolphe Quiedeville <rodolphe@quiedeville.org>
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

create table can_fournisseur_ca
(
  fk_societe    integer,
  date_calcul   datetime,
  year          smallint UNSIGNED,
  ca_genere     float,                  -- ca genere par les ventes des produits de ce fournisseur
  ca_achat      float(11,2) DEFAULT 0,  -- ca effectue aupres de ce fournisseur (somme de ses factures)
  UNIQUE (fk_societe, year)
)Engine=innodb;
