/* grid.sapphire.js

	Purpose:

	Description:

	History:
		Tue Jun 20 09:41:42     2010, Created by sam

Copyright (C) 2010 Potix Corporation. All Rights Reserved.
*/

zk.afterLoad('zkex.grid', function () {
	
	/**
	 * Group
	 */
	var Group = zkex.grid.Group;
	Group.prototype.bind_ = function () {
		this.$supers('bind_', arguments);
		var n = this.$n(),
			img = this.$n("img");
		//ADDED: remove DOM event on img node
		if (n)
			this.domListen_(n, 'onClick', '_doImgClick');
		
		var table = n.parentNode.parentNode;
		if (!this._spans && table.tBodies.length > 1) {
			var span = 0;
			for (var row = table.rows[0], i = row.cells.length; i--;)
				if(zk(row.cells[i]).isVisible()) span++;
			for (var cells = n.cells, i = cells.length; i--;)
				span -= cells[i].colSpan;
			if (span > 0 && n.cells.length) n.cells[n.cells.length - 1].colSpan += span;
		}
	};
	
	Group.prototype.unbind_ = function (skipper, after) {
		//ADDED
		this.domUnlisten_(this.$n(), 'onClick', '_doImgClick');
		if (this._unbindafter && this._unbindafter.length) after.push(this._unbindafter.pop());
		this._unbindafter = null;
		this.$supers('unbind_', arguments);
	};
});