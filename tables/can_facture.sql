-- ===========================================================================
-- Copyright (C) 2001-2005 Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2004-2009 Laurent Destailleur  <eldy@users.sourceforge.net>
-- Copyright (C) 2005-2009 Regis Houssin        <regis@dolibarr.fr>
-- Copyright (C) 2010 Juanjo Menent             <jmenent@2byte.es>
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


create table can_facture
(
  rowid               integer AUTO_INCREMENT PRIMARY KEY,
  facnumber           varchar(30)        NOT NULL,
  entity              integer  DEFAULT 1 NOT NULL,	-- multi company id
  type                smallint DEFAULT 0 NOT NULL,
  ref_client          varchar(30),
  increment           varchar(10),
  fk_soc              integer            NOT NULL,
  datec               datetime,                     -- date de creation de la facture
  datef               date,                         -- date de la facture
  date_valid          date,                         -- date de validation
  tms                 timestamp,                    -- date creation/modification
  paye                smallint DEFAULT 0 NOT NULL,
  amount              double(24,8)     DEFAULT 0 NOT NULL,
  remise_percent      real     DEFAULT 0,           -- remise relative
  remise_absolue      real     DEFAULT 0,           -- remise absolue
  remise              real     DEFAULT 0,           -- remise totale calculee

  close_code          varchar(16),		              -- Code motif cloture sans paiement complet
  close_note          varchar(128),		              -- Commentaire cloture sans paiement complet

  tva                 double(24,8)     DEFAULT 0,           -- montant tva apres remise totale
  localtax1			  double(24,8)     DEFAULT 0,           -- amount localtax1
  localtax2           double(24,8)     DEFAULT 0,           -- amount localtax2	
  total               double(24,8)     DEFAULT 0,           -- montant total ht apres remise totale
  total_ttc           double(24,8)     DEFAULT 0,           -- montant total ttc apres remise totale

  fk_statut           smallint DEFAULT 0 NOT NULL,

  fk_user_author      integer,                      -- createur de la facture
  fk_user_valid       integer,                      -- valideur de la facture

  fk_facture_source   integer,                      -- facture origine si facture avoir
  fk_projet           integer,                      -- projet auquel est associee la facture

  fk_cond_reglement   integer  DEFAULT 1 NOT NULL,  -- condition de reglement (30 jours, fin de mois ...)
  fk_mode_reglement   integer,                      -- mode de reglement (Virement, Prelevement)
  date_lim_reglement  date,                         -- date limite de reglement

  note                text,
  note_public         text,
  model_pdf           varchar(50),
  import_key          varchar(14)

)Engine=innodb;
