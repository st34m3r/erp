-- ===================================================================
-- Copyright (C) 2006-2009 Laurent Destailleur  <eldy@users.sourceforge.net>
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


ALTER TABLE can_boxes ADD UNIQUE INDEX uk_boxes (box_id, position, fk_user);

-- Supprime orphelins pour permettre montee de la cle
-- V4 DELETE can_boxes FROM can_boxes LEFT JOIN can_boxes_def ON can_boxes.box_id = can_boxes_def.rowid WHERE can_boxes_def.rowid IS NULL;
-- POSTGRESQL V8 DELETE FROM can_boxes USING can_boxes_def WHERE can_boxes.box_id NOT IN (SELECT can_boxes_def.rowid FROM can_boxes_def);

ALTER TABLE can_boxes ADD INDEX idx_boxes_boxid (box_id);
ALTER TABLE can_boxes ADD CONSTRAINT fk_boxes_box_id FOREIGN KEY (box_id) REFERENCES can_boxes_def (rowid);

ALTER TABLE can_boxes ADD INDEX idx_boxes_fk_user (fk_user);
