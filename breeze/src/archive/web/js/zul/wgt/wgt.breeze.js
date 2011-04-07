/* wgt.breeze.js

	Purpose:

	Description:

	History:
		Tue Jun 20 09:41:42     2010, Created by simon

Copyright (C) 2010 Potix Corporation. All Rights Reserved.
*/
zk.afterLoad('zul.wgt', function(){
	
	/** Popup **/
	// MODIFIED: remove top and bottom parts from calculation
	zul.wgt.Popup.prototype._offsetHeight = function () {
		var node = this.$n(),
			h = node.offsetHeight, 
			bd = this.$n('body');
			h -= zk(bd).padBorderHeight();
		return h;
	};
	
	// MODIFIED: no tl/bl divs, so don't need to fix width for first/last child
	zul.wgt.Popup.prototype._fixWdh = zk.$void;
	
	zul.wgt.Popup.molds['default'] = function (out) {
		var uuid = this.uuid,
		zcls = this.getZclass();
		// MODIFIED: remove rounded corners & frames (tl, tr, tm, bl, br, bm, cr, cm)
		out.push('<div', this.domAttrs_(), '>');
		// ADDED: a div for pointer in Errorbox
		if(this._fixarrow) out.push('<div id=', uuid, '-p class="z-pointer"></div>');
		out.push('<div id="', uuid, '-body" class="', zcls, '-cl"><div id="', uuid, 
				'-cave" class="', zcls, '-cnt">');
		this.prologHTML_(out);
		for (var w = this.firstChild; w; w = w.nextSibling)
			w.redraw(out);
		this.epilogHTML_(out);
		out.push('</div></div></div>');
	};
	
});