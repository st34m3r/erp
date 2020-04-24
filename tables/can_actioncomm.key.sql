-- ============================================================================
-- Copyright (C) 2005 Laurent Destailleur  <eldy@users.sourceforge.net>
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


ALTER TABLE can_actioncomm ADD INDEX idx_actioncomm_datea (datea);
ALTER TABLE can_actioncomm ADD INDEX idx_actioncomm_fk_soc (fk_soc);
ALTER TABLE can_actioncomm ADD INDEX idx_actioncomm_fk_contact (fk_contact);
ALTER TABLE can_actioncomm ADD INDEX idx_actioncomm_fk_facture (fk_facture);
ALTER TABLE can_actioncomm ADD INDEX idx_actioncomm_fk_supplier_order (fk_supplier_order);
ALTER TABLE can_actioncomm ADD INDEX idx_actioncomm_fk_supplier_invoice (fk_supplier_invoice);
