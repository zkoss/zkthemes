/* inp.classicblue.js

	Purpose:

	Description:

	History:
		Tue Jun 20 09:41:42     2010, Created by simon

Copyright (C) 2010 Potix Corporation. All Rights Reserved.
*/
zk.afterLoad('zul.inp', function(){
	
	/** Errorbox **/
	zul.inp.Errorbox.prototype._fixarrow = function () {
		var parent = this.parent.$n(),
			node = this.$n(),
			arrow = this.$n('a'),
			ptofs = zk(parent).revisedOffset(),
			nodeofs = zk(node).revisedOffset();
		var dx = nodeofs[0] - ptofs[0], dy = nodeofs[1] - ptofs[1], dir;
		if (dx >= parent.offsetWidth - 2) {
			dir = dy < -10 ? "ld": dy >= parent.offsetHeight - 2 ? "lu": "l";
		} else if (dx < 0) {
			dir = dy < -10 ? "rd": dy >= parent.offsetHeight - 2 ? "ru": "r";
		} else {
			dir = dy < 0 ? "d": "u";
		}
		arrow.className = 'z-errbox-left z-arrow-' + dir;
	};
	/** Spinner **/
	zul.inp.Renderer.renderSpinnerButton = zk.$void;
});