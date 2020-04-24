-- Copyright (C) 2001-2004 Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2003      Jean-Louis Bergamo   <jlb@j1b.org>
-- Copyright (C) 2004-2010 Laurent Destailleur  <eldy@users.sourceforge.net>
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
-- Devises (code secondaire - code ISO4217 - libelle fr)
--

insert into can_c_currencies ( code, code_iso, active, label ) values ( 'BT', 'THB', 1, 'Bath thailandais'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'CD', 'DKK', 1, 'Couronnes dannoises'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'CN', 'NOK', 1, 'Couronnes norvegiennes'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'CS', 'SEK', 1, 'Couronnes suedoises'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'CZ', 'CZK', 1, 'Couronnes tcheques'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'TD', 'TND', 1, 'Dinar tunisien'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'DA', 'DZD', 1, 'Dinar algérien'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'DH', 'MAD', 1, 'Dirham'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'AD', 'AUD', 1, 'Dollars australiens'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'DC', 'CAD', 1, 'Dollars canadiens'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'HK', 'HKD', 1, 'Dollars hong kong'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'DS', 'SGD', 1, 'Dollars singapour'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'DU', 'USD', 1, 'Dollars us'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'EC', 'XEU', 1, 'Ecus'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'ES', 'PTE', 0, 'Escudos'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'FB', 'BEF', 0, 'Francs belges'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'FF', 'FRF', 0, 'Francs francais'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'FL', 'LUF', 0, 'Francs luxembourgeois'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'FO', 'NLG', 1, 'Florins'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'FS', 'CHF', 1, 'Francs suisses'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'LI', 'IEP', 1, 'Livres irlandaises'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'LR', 'ITL', 0, 'Lires'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'LS', 'GBP', 1, 'Livres sterling'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'MA', 'DEM', 0, 'Deutsch mark'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'MF', 'FIM', 1, 'Mark finlandais'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'MR', 'MRO', 1, 'Ouguiya Mauritanien');
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'PA', 'ARP', 1, 'Pesos argentins'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'PC', 'CLP', 1, 'Pesos chilien'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'PE', 'ESP', 1, 'Pesete'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'PL', 'PLN', 1, 'Zlotys polonais'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'SA', 'ATS', 1, 'Shiliing autrichiens'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'TW', 'TWD', 1, 'Dollar taiwanais'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'YE', 'JPY', 1, 'Yens'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'ZA', 'ZAR', 1, 'Rand africa'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'DR', 'GRD', 1, 'Drachme (grece)'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'EU', 'EUR', 1, 'Euros'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'RB', 'BRL', 1, 'Real bresilien'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'SK', 'SKK', 1, 'Couronnes slovaques'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'YC', 'CNY', 1, 'Yuang chinois'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'AE', 'AED', 1, 'Arabes emirats dirham');
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'CF', 'XAF', 1, 'Francs cfa beac');
-- insert into can_c_currencies ( code, code_iso, active, label ) values ( 'CF', 'XOF', 1, 'Francs cfa bceao'); doublon sur code court
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'EG', 'EGP', 1, 'Livre egyptienne');
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'KR', 'KRW', 1, 'Won coree du sud');
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'NZ', 'NZD', 1, 'Dollar neo-zelandais'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'TR', 'TRL', 1, 'Livre turque'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'ID', 'IDR', 1, 'Rupiahs d''indonesie'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'IN', 'INR', 1, 'Roupie indienne'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'LT', 'LTL', 1, 'Litas'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'RU', 'SUR', 1, 'Rouble'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'FH', 'HUF', 1, 'Forint hongrois'); 
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'LK', 'LKR', 1, 'Roupies sri lanka');
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'MU', 'MUR', 1, 'Roupies mauritiennes');
insert into can_c_currencies ( code, code_iso, active, label ) values ( 'SR', 'SAR', 1, 'Saudi riyal');

