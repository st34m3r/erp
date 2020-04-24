-- Copyright (C) 2001-2004 Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2003      Jean-Louis Bergamo   <jlb@j1b.org>
-- Copyright (C) 2004-2009 Laurent Destailleur  <eldy@users.sourceforge.net>
-- Copyright (C) 2004      Benoit Mortier       <benoit.mortier@opensides.be>
-- Copyright (C) 2004      Guillaume Delecourt  <guillaume.delecourt@opensides.be>
-- Copyright (C) 2005-2009 Regis Houssin        <regis@dolibarr.fr>
-- Copyright (C) 2007 	   Patrick Raguin       <patrick.raguin@gmail.com>
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
--

--
-- Ne pas placer de commentaire en fin de ligne, ce fichier est parsé lors
-- de l'install et tous les sigles '--' sont supprimés.
--

--
-- Types paiement
--

delete from can_c_paiement;
insert into can_c_paiement (id,code,libelle,type,active) values (0, '',    '-',                 3,1);
insert into can_c_paiement (id,code,libelle,type,active) values (1, 'TIP', 'TIP',               2,1);
insert into can_c_paiement (id,code,libelle,type,active) values (2, 'VIR', 'Virement',          2,1);
insert into can_c_paiement (id,code,libelle,type,active) values (3, 'PRE', 'Prélèvement',       2,1);
insert into can_c_paiement (id,code,libelle,type,active) values (4, 'LIQ', 'Espèces',           2,1);
insert into can_c_paiement (id,code,libelle,type,active) values (5, 'VAD', 'Paiement en ligne', 2,0);
insert into can_c_paiement (id,code,libelle,type,active) values (6, 'CB',  'Carte Bancaire',    2,1);
insert into can_c_paiement (id,code,libelle,type,active) values (7, 'CHQ', 'Chèque',            2,1);
insert into can_c_paiement (id,code,libelle,type,active) values (8, 'TRA', 'Traite',            2,0);
insert into can_c_paiement (id,code,libelle,type,active) values (9, 'LCR', 'LCR',               2,0);
insert into can_c_paiement (id,code,libelle,type,active) values (10,'FAC', 'Factor',            2,0);
insert into can_c_paiement (id,code,libelle,type,active) values (11,'PRO', 'Proforma',          2,0);
