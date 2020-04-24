-- Copyright (C) 2001-2004 Rodolphe Quiedeville <rodolphe@quiedeville.org>
-- Copyright (C) 2003      Jean-Louis Bergamo   <jlb@j1b.org>
-- Copyright (C) 2004-2009 Laurent Destailleur  <eldy@users.sourceforge.net>
-- Copyright (C) 2004      Benoit Mortier       <benoit.mortier@opensides.be>
-- Copyright (C) 2004      Guillaume Delecourt  <guillaume.delecourt@opensides.be>
-- Copyright (C) 2005-2009 Regis Houssin        <regis@dolibarr.fr>
-- Copyright (C) 2007 	   Patrick Raguin       <patrick.raguin@gmail.com>
-- Copyright (C) 2010 	   Juanjo Menent        <jmenent@2byte.es>
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
-- Departements/Cantons/Provinces
--

insert into can_c_departements (rowid, fk_region, code_departement,cheflieu,tncc,ncc,nom) values (0,0,'0','0',0,'-','-');

-- Departements France
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (82,'01','01053',5,'AIN','Ain');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (22,'02','02408',5,'AISNE','Aisne');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (83,'03','03190',5,'ALLIER','Allier');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (93,'04','04070',4,'ALPES-DE-HAUTE-PROVENCE','Alpes-de-Haute-Provence');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (93,'05','05061',4,'HAUTES-ALPES','Hautes-Alpes');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (93,'06','06088',4,'ALPES-MARITIMES','Alpes-Maritimes');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (82,'07','07186',5,'ARDECHE','Ardèche');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (21,'08','08105',4,'ARDENNES','Ardennes');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (73,'09','09122',5,'ARIEGE','Ariège');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (21,'10','10387',5,'AUBE','Aube');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (91,'11','11069',5,'AUDE','Aude');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (73,'12','12202',5,'AVEYRON','Aveyron');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (93,'13','13055',4,'BOUCHES-DU-RHONE','Bouches-du-Rhône');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (25,'14','14118',2,'CALVADOS','Calvados');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (83,'15','15014',2,'CANTAL','Cantal');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (54,'16','16015',3,'CHARENTE','Charente');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (54,'17','17300',3,'CHARENTE-MARITIME','Charente-Maritime');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (24,'18','18033',2,'CHER','Cher');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (74,'19','19272',3,'CORREZE','Corrèze');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (94,'2A','2A004',3,'CORSE-DU-SUD','Corse-du-Sud');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (94,'2B','2B033',3,'HAUTE-CORSE','Haute-Corse');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (26,'21','21231',3,'COTE-D\'OR','Côte-d\'Or');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (53,'22','22278',4,'COTES-D\'ARMOR','Côtes-d\'Armor');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (74,'23','23096',3,'CREUSE','Creuse');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (72,'24','24322',3,'DORDOGNE','Dordogne');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (43,'25','25056',2,'DOUBS','Doubs');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (82,'26','26362',3,'DROME','Drôme');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (23,'27','27229',5,'EURE','Eure');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (24,'28','28085',1,'EURE-ET-LOIR','Eure-et-Loir');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (53,'29','29232',2,'FINISTERE','Finistère');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (91,'30','30189',2,'GARD','Gard');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (73,'31','31555',3,'HAUTE-GARONNE','Haute-Garonne');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (73,'32','32013',2,'GERS','Gers');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (72,'33','33063',3,'GIRONDE','Gironde');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (91,'34','34172',5,'HERAULT','Hérault');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (53,'35','35238',1,'ILLE-ET-VILAINE','Ille-et-Vilaine');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (24,'36','36044',5,'INDRE','Indre');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (24,'37','37261',1,'INDRE-ET-LOIRE','Indre-et-Loire');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (82,'38','38185',5,'ISERE','Isère');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (43,'39','39300',2,'JURA','Jura');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (72,'40','40192',4,'LANDES','Landes');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (24,'41','41018',0,'LOIR-ET-CHER','Loir-et-Cher');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (82,'42','42218',3,'LOIRE','Loire');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (83,'43','43157',3,'HAUTE-LOIRE','Haute-Loire');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (52,'44','44109',3,'LOIRE-ATLANTIQUE','Loire-Atlantique');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (24,'45','45234',2,'LOIRET','Loiret');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (73,'46','46042',2,'LOT','Lot');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (72,'47','47001',0,'LOT-ET-GARONNE','Lot-et-Garonne');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (91,'48','48095',3,'LOZERE','Lozère');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (52,'49','49007',0,'MAINE-ET-LOIRE','Maine-et-Loire');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (25,'50','50502',3,'MANCHE','Manche');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (21,'51','51108',3,'MARNE','Marne');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (21,'52','52121',3,'HAUTE-MARNE','Haute-Marne');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (52,'53','53130',3,'MAYENNE','Mayenne');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (41,'54','54395',0,'MEURTHE-ET-MOSELLE','Meurthe-et-Moselle');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (41,'55','55029',3,'MEUSE','Meuse');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (53,'56','56260',2,'MORBIHAN','Morbihan');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (41,'57','57463',3,'MOSELLE','Moselle');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (26,'58','58194',3,'NIEVRE','Nièvre');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (31,'59','59350',2,'NORD','Nord');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (22,'60','60057',5,'OISE','Oise');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (25,'61','61001',5,'ORNE','Orne');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (31,'62','62041',2,'PAS-DE-CALAIS','Pas-de-Calais');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (83,'63','63113',2,'PUY-DE-DOME','Puy-de-Dôme');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (72,'64','64445',4,'PYRENEES-ATLANTIQUES','Pyrénées-Atlantiques');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (73,'65','65440',4,'HAUTES-PYRENEES','Hautes-Pyrénées');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (91,'66','66136',4,'PYRENEES-ORIENTALES','Pyrénées-Orientales');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (42,'67','67482',2,'BAS-RHIN','Bas-Rhin');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (42,'68','68066',2,'HAUT-RHIN','Haut-Rhin');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (82,'69','69123',2,'RHONE','Rhône');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (43,'70','70550',3,'HAUTE-SAONE','Haute-Saône');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (26,'71','71270',0,'SAONE-ET-LOIRE','Saône-et-Loire');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (52,'72','72181',3,'SARTHE','Sarthe');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (82,'73','73065',3,'SAVOIE','Savoie');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (82,'74','74010',3,'HAUTE-SAVOIE','Haute-Savoie');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (11,'75','75056',0,'PARIS','Paris');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (23,'76','76540',3,'SEINE-MARITIME','Seine-Maritime');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (11,'77','77288',0,'SEINE-ET-MARNE','Seine-et-Marne');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (11,'78','78646',4,'YVELINES','Yvelines');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (54,'79','79191',4,'DEUX-SEVRES','Deux-Sèvres');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (22,'80','80021',3,'SOMME','Somme');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (73,'81','81004',2,'TARN','Tarn');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (73,'82','82121',0,'TARN-ET-GARONNE','Tarn-et-Garonne');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (93,'83','83137',2,'VAR','Var');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (93,'84','84007',0,'VAUCLUSE','Vaucluse');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (52,'85','85191',3,'VENDEE','Vendée');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (54,'86','86194',3,'VIENNE','Vienne');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (74,'87','87085',3,'HAUTE-VIENNE','Haute-Vienne');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (41,'88','88160',4,'VOSGES','Vosges');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (26,'89','89024',5,'YONNE','Yonne');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (43,'90','90010',0,'TERRITOIRE DE BELFORT','Territoire de Belfort');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (11,'91','91228',5,'ESSONNE','Essonne');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (11,'92','92050',4,'HAUTS-DE-SEINE','Hauts-de-Seine');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (11,'93','93008',3,'SEINE-SAINT-DENIS','Seine-Saint-Denis');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (11,'94','94028',2,'VAL-DE-MARNE','Val-de-Marne');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (11,'95','95500',2,'VAL-D\'OISE','Val-d\'Oise');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values ( 1,'971','97105',3,'GUADELOUPE','Guadeloupe');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values ( 2,'972','97209',3,'MARTINIQUE','Martinique');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values ( 3,'973','97302',3,'GUYANE','Guyane');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values ( 4,'974','97411',3,'REUNION','Réunion');

-- Provinces Belgium
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (201,'01','',1,'ANVERS','Anvers');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (203,'02','',3,'BRUXELLES-CAPITALE','Bruxelles-Capitale');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (202,'03','',2,'BRABANT-WALLON','Brabant-Wallon');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (201,'04','',1,'BRABANT-FLAMAND','Brabant-Flamand');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (201,'05','',1,'FLANDRE-OCCIDENTALE','Flandre-Occidentale');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (201,'06','',1,'FLANDRE-ORIENTALE','Flandre-Orientale');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (202,'07','',2,'HAINAUT','Hainaut');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (201,'08','',2,'LIEGE','Liège');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (202,'09','',1,'LIMBOURG','Limbourg');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (202,'10','',2,'LUXEMBOURG','Luxembourg');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (201,'11','',2,'NAMUR','Namur');

-- Provinces Australia
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (2801,'NSW','',1,'','New South Wales');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (2801,'VIC','',1,'','Victoria');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (2801,'QLD','',1,'','Queensland');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (2801,'SA' ,'',1,'','South Australia');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (2801,'ACT','',1,'','Australia Capital Territory');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (2801,'TAS','',1,'','Tasmania');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (2801,'WA' ,'',1,'','Western Australia');
insert into can_c_departements (fk_region, code_departement,cheflieu,tncc,ncc,nom) values (2801,'NT' ,'',1,'','Northern Territory');

-- Provinces Spain
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('01', 419, '', 19, 'PAIS VASCO', 'País Vasco', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('02', 404, '', 4, 'ALBACETE', 'Albacete', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('03', 411, '', 11, 'ALICANTE', 'Alicante', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('04', 401, '', 1, 'ALMERIA', 'Almería', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('05', 403, '', 3, 'AVILA', 'Avila', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('06', 412, '', 12, 'BADAJOZ', 'Badajoz', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('07', 414, '', 14, 'ISLAS BALEARES', 'Islas Baleares', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('08', 406, '', 6, 'BARCELONA', 'Barcelona', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('09', 403, '', 8, 'BURGOS', 'Burgos', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('10', 412, '', 12, 'CACERES', 'Cáceres', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('11', 401, '', 1, 'CADIz', 'Cádiz', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('12', 411, '', 11, 'CASTELLON', 'Castellón', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('13', 404, '', 4, 'CIUDAD REAL', 'Ciudad Real', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('14', 401, '', 1, 'CORDOBA', 'Córdoba', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('15', 413, '', 13, 'LA CORUÑA', 'La Coruña', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('16', 404, '', 4, 'CUENCA', 'Cuenca', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('17', 406, '', 6, 'GERONA', 'Gerona', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('18', 401, '', 1, 'GRANADA', 'Granada', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('19', 404, '', 4, 'GUADALAJARA', 'Guadalajara', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('20', 419, '', 19, 'GUIPUZCOA', 'Guipúzcoa', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('21', 401, '', 1, 'HUELVA', 'Huelva', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('22', 402, '', 2, 'HUESCA', 'Huesca', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('23', 401, '', 1, 'JAEN', 'Jaén', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('24', 403, '', 3, 'LEON', 'León', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('25', 406, '', 6, 'LERIDA', 'Lérida', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('26', 415, '', 15, 'LA RIOJA', 'La Rioja', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('27', 413, '', 13, 'LUGO', 'Lugo', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('28', 416, '', 16, 'MADRID', 'Madrid', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('29', 401, '', 1, 'MALAGA', 'Málaga', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('30', 417, '', 17, 'MURCIA', 'Murcia', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('31', 408, '', 8, 'NAVARRA', 'Navarra', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('32', 413, '', 13, 'ORENSE', 'Orense', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('33', 418, '', 18, 'ASTURIAS', 'Asturias', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('34', 403, '', 3, 'PALENCIA', 'Palencia', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('35', 405, '', 5, 'LAS PALMAS', 'Las Palmas', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('36', 413, '', 13, 'PONTEVEDRA', 'Pontevedra', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('37', 403, '', 3, 'SALAMANCA', 'Salamanca', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('38', 405, '', 5, 'STA. CRUZ DE TENERIFE', 'Sta. Cruz de Tenerife', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('39', 410, '', 10, 'CANTABRIA', 'Cantabria', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('40', 403, '', 3, 'SEGOVIA', 'Segovia', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('41', 401, '', 1, 'SEVILLA', 'Sevilla', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('42', 403, '', 3, 'SORIA', 'Soria', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('43', 406, '', 6, 'TARRAGONA', 'Tarragona', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('44', 402, '', 2, 'TERUEL', 'Teruel', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('45', 404, '', 5, 'TOLEDO', 'Toledo', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('46', 411, '', 11, 'VALENCIA', 'Valencia', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('47', 403, '', 3, 'VALLADOLID', 'Valladolid', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('48', 419, '', 19, 'VIZCAYA', 'Vizcaya', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('49', 403, '', 3, 'ZAMORA', 'Zamora', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('50', 402, '', 1, 'ZARAGOZA', 'Zaragoza', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('51', 407, '', 7, 'CEUTA', 'Ceuta', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('52', 409, '', 9, 'MELILLA', 'Melilla', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('53', 420, '', 20, 'OTROS', 'Otros', 1);

-- Cantons Switzerland 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'AG','ARGOVIE','Argovie',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'AI','APPENZELL RHODES INTERIEURES','Appenzell Rhodes intérieures',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'AR','APPENZELL RHODES EXTERIEURES','Appenzell Rhodes extérieures',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'BE','BERNE','Berne',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'BL','BALE CAMPAGNE','Bâle Campagne',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'BS','BALE VILLE','Bâle Ville',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'FR','FRIBOURG','Fribourg',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'GE','GENEVE','Genève',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'GL','GLARIS','Glaris',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'GR','GRISONS','Grisons',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'JU','JURA','Jura',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'LU','LUCERNE','Lucerne',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'NE','NEUCHATEL','Neuchâtel',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'NW','NIDWALD','Nidwald',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'OW','OBWALD','Obwald',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'SG','SAINT-GALL','Saint-Gall',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'SH','SCHAFFHOUSE','Schaffhouse',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'SO','SOLEURE','Soleure',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'SZ','SCHWYZ','Schwyz',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'TG','THURGOVIE','Thurgovie',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'TI','TESSIN','Tessin',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'UR','URI','Uri',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'VD','VAUD','Vaud',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'VS','VALAIS','Valais',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'ZG','ZUG','Zug',1); 
INSERT INTO can_c_departements (fk_region, code_departement, ncc, nom, active) VALUES (601,'ZH','ZURICH','Zürich',1);

-- Provinces US
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('AL', 1101, '', 0, 'ALABAMA', 'Alabama', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('AK', 1101, '', 0, 'ALASKA', 'Alaska', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('AZ', 1101, '', 0, 'ARIZONA', 'Arizona', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('AR', 1101, '', 0, 'ARKANSAS', 'Arkansas', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('CA', 1101, '', 0, 'CALIFORNIA', 'California', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('CO', 1101, '', 0, 'COLORADO', 'Colorado', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('CT', 1101, '', 0, 'CONNECTICUT', 'Connecticut', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('DE', 1101, '', 0, 'DELAWARE', 'Delaware', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('FL', 1101, '', 0, 'FLORIDA', 'Florida', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('GA', 1101, '', 0, 'GEORGIA', 'Georgia', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('HI', 1101, '', 0, 'HAWAII', 'Hawaii', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('ID', 1101, '', 0, 'IDAHO', 'Idaho', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('IL', 1101, '', 0, 'ILLINOIS','Illinois', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('IN', 1101, '', 0, 'INDIANA', 'Indiana', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('IA', 1101, '', 0, 'IOWA', 'Iowa', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('KS', 1101, '', 0, 'KANSAS', 'Kansas', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('KY', 1101, '', 0, 'KENTUCKY', 'Kentucky', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('LA', 1101, '', 0, 'LOUISIANA', 'Louisiana', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('ME', 1101, '', 0, 'MAINE', 'Maine', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('MD', 1101, '', 0, 'MARYLAND', 'Maryland', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('MA', 1101, '', 0, 'MASSACHUSSETTS', 'Massachusetts', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('MI', 1101, '', 0, 'MICHIGAN', 'Michigan', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('MN', 1101, '', 0, 'MINNESOTA', 'Minnesota', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('MS', 1101, '', 0, 'MISSISSIPPI', 'Mississippi', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('MO', 1101, '', 0, 'MISSOURI', 'Missouri', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('MT', 1101, '', 0, 'MONTANA', 'Montana', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('NE', 1101, '', 0, 'NEBRASKA', 'Nebraska', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('NV', 1101, '', 0, 'NEVADA', 'Nevada', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('NH', 1101, '', 0, 'NEW HAMPSHIRE', 'New Hampshire', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('NJ', 1101, '', 0, 'NEW JERSEY', 'New Jersey', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('NM', 1101, '', 0, 'NEW MEXICO', 'New Mexico', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('NY', 1101, '', 0, 'NEW YORK', 'New York', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('NC', 1101, '', 0, 'NORTH CAROLINA', 'North Carolina', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('ND', 1101, '', 0, 'NORTH DAKOTA', 'North Dakota', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('OH', 1101, '', 0, 'OHIO', 'Ohio', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('OK', 1101, '', 0, 'OKLAHOMA', 'Oklahoma', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('OR', 1101, '', 0, 'OREGON', 'Oregon', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('PA', 1101, '', 0, 'PENNSYLVANIA', 'Pennsylvania', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('RI', 1101, '', 0, 'RHODE ISLAND', 'Rhode Island', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('SC', 1101, '', 0, 'SOUTH CAROLINA', 'South Carolina', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('SD', 1101, '', 0, 'SOUTH DAKOTA', 'South Dakota', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('TN', 1101, '', 0, 'TENNESSEE', 'Tennessee', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('TX', 1101, '', 0, 'TEXAS', 'Texas', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('UT', 1101, '', 0, 'UTAH', 'Utah', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('VT', 1101, '', 0, 'VERMONT', 'Vermont', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('VA', 1101, '', 0, 'VIRGINIA', 'Virginia', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('WA', 1101, '', 0, 'WASHINGTON', 'Washington', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('WV', 1101, '', 0, 'WEST VIRGINIA', 'West Virginia', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('WI', 1101, '', 0, 'WISCONSIN', 'Wisconsin', 1);
insert into can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) values ('WY', 1101, '', 0, 'WYOMING', 'Wyoming', 1);

-- San Salvador
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('SS', 8601, NULL, NULL, NULL, 'San Salvador', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('SA', 8603, NULL, NULL, NULL, 'Santa Ana', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('AH', 8603, NULL, NULL, NULL, 'Ahuachapan', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('SO', 8603, NULL, NULL, NULL, 'Sonsonate', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('US', 8602, NULL, NULL, NULL, 'Usulutan', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('SM', 8602, NULL, NULL, NULL, 'San Miguel', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('MO', 8602, NULL, NULL, NULL, 'Morazan', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('LU', 8602, NULL, NULL, NULL, 'La Union', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('LL', 8601, NULL, NULL, NULL, 'La Libertad', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('CH', 8601, NULL, NULL, NULL, 'Chalatenango', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('CA', 8601, NULL, NULL, NULL, 'Cabañas', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('LP', 8601, NULL, NULL, NULL, 'La Paz', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('SV', 8601, NULL, NULL, NULL, 'San Vicente', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('CU', 8601, NULL, NULL, NULL, 'Cuscatlan', 1);

-- Provinces Argentina
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2301', 2301, '', 0, 'CATAMARCA', 'Catamarca', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2302', 2301, '', 0, 'YUJUY', 'Yujuy', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2303', 2301, '', 0, 'TUCAMAN', 'Tucamán', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2304', 2301, '', 0, 'SANTIAGO DEL ESTERO', 'Santiago del Estero', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2305', 2301, '', 0, 'SALTA', 'Salta', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2306', 2302, '', 0, 'CHACO', 'Chaco', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2307', 2302, '', 0, 'CORRIENTES', 'Corrientes', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2308', 2302, '', 0, 'ENTRE RIOS', 'Entre Ríos', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2309', 2302, '', 0, 'FORMOSA MISIONES', 'Formosa Misiones', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2310', 2302, '', 0, 'SANTA FE', 'Santa Fe', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2311', 2303, '', 0, 'LA RIOJA', 'La Rioja', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2312', 2303, '', 0, 'MENDOZA', 'Mendoza', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2313', 2303, '', 0, 'SAN JUAN', 'San Juan', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2314', 2303, '', 0, 'SAN LUIS', 'San Luis', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2315', 2304, '', 0, 'CORDOBA', 'Córdoba', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2316', 2304, '', 0, 'BUENOS AIRES', 'Buenos Aires', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2317', 2304, '', 0, 'CABA', 'Caba', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2318', 2305, '', 0, 'LA PAMPA', 'La Pampa', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2319', 2305, '', 0, 'NEUQUEN', 'Neuquén', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2320', 2305, '', 0, 'RIO NEGRO', 'Río Negro', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2321', 2305, '', 0, 'CHUBUT', 'Chubut', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2322', 2305, '', 0, 'SANTA CRUZ', 'Santa Cruz', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2323', 2305, '', 0, 'TIERRA DEL FUEGO', 'Tierra del Fuego', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2324', 2305, '', 0, 'ISLAS MALVINAS', 'Islas Malvinas', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('2325', 2305, '', 0, 'ANTARTIDA', 'Antártida', 1);

-- Provinces India
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('AN', 11701, NULL, 0, 'AN', 'Andaman & Nicobar', 1);    
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('AP', 11701, NULL, 0, 'AP', 'Andhra Pradesh', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('AR', 11701, NULL, 0, 'AR', 'Arunachal Pradesh', 1);     
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('AS', 11701, NULL, 0, 'AS', 'Assam', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('BR', 11701, NULL, 0, 'BR', 'Bihar', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('CG', 11701, NULL, 0, 'CG', 'Chattisgarh', 1);     
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('CH', 11701, NULL, 0, 'CH', 'Chandigarh', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('DD', 11701, NULL, 0, 'DD', 'Daman & Diu', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('DL', 11701, NULL, 0, 'DL', 'Delhi', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('DN', 11701, NULL, 0, 'DN', 'Dadra and Nagar Haveli', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('GA', 11701, NULL, 0, 'GA', 'Goa', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('GJ', 11701, NULL, 0, 'GJ', 'Gujarat', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('HP', 11701, NULL, 0, 'HP', 'Himachal Pradesh', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('HR', 11701, NULL, 0, 'HR', 'Haryana', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('JH', 11701, NULL, 0, 'JH', 'Jharkhand', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('JK', 11701, NULL, 0, 'JK', 'Jammu & Kashmir', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('KA', 11701, NULL, 0, 'KA', 'Karnataka', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('KL', 11701, NULL, 0, 'KL', 'Kerala', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('LD', 11701, NULL, 0, 'LD', 'Lakshadweep', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('MH', 11701, NULL, 0, 'MH', 'Maharashtra', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('ML', 11701, NULL, 0, 'ML', 'Meghalaya', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('MN', 11701, NULL, 0, 'MN', 'Manipur', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('MP', 11701, NULL, 0, 'MP', 'Madhya Pradesh', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('MZ', 11701, NULL, 0, 'MZ', 'Mizoram', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('NL', 11701, NULL, 0, 'NL', 'Nagaland', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('OR', 11701, NULL, 0, 'OR', 'Orissa', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('PB', 11701, NULL, 0, 'PB', 'Punjab', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('PY', 11701, NULL, 0, 'PY', 'Puducherry', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('RJ', 11701, NULL, 0, 'RJ', 'Rajasthan', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('SK', 11701, NULL, 0, 'SK', 'Sikkim', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('TN', 11701, NULL, 0, 'TN', 'Tamil Nadu', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('TR', 11701, NULL, 0, 'TR', 'Tripura', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('UL', 11701, NULL, 0, 'UL', 'Uttarakhand', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('UP', 11701, NULL, 0, 'UP', 'Uttar Pradesh', 1);
INSERT INTO can_c_departements ( code_departement, fk_region, cheflieu, tncc, ncc, nom, active) VALUES ('WB', 11701, NULL, 0, 'WB', 'West Bengal', 1);
