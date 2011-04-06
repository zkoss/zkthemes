/* inp.silvertail.js

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
			//arrow = this.$n('a'), // REMOVED
			pointer = this.$n('p'), // ADDED
			ptofs = zk(parent).revisedOffset(),
			nodeofs = zk(node).revisedOffset();
		var dx = nodeofs[0] - ptofs[0], dy = nodeofs[1] - ptofs[1], dir;
		// MODIFIED: conditions of direction
		if (dx >= parent.offsetWidth - 22) {
			dir = dy < 6 - node.offsetHeight ? "ld": dy >= parent.offsetHeight - 7 ? "lu": "l";
		} else if (dx < 20 - node.offsetWidth) {
			dir = dy < 6 - node.offsetHeight ? "rd": dy >= parent.offsetHeight - 7 ? "ru": "r";
		} else {
			dir = dy < 0 ? "d": "u";
		}
		
		// ADDED: for setting the pointer position
		if(dir == "d" || dir == "u") {
			var md = (Math.max(dx, 0) + Math.min(node.offsetWidth + dx, parent.offsetWidth))/2 - dx - 6,
				mx = node.offsetWidth - 11;
			pointer.style.left = (md>mx? mx : md<1? 1 : md) + "px";
			if(dir == "d") { 
				pointer.style.top = null;
				pointer.style.bottom = zk.ie6_? "-14px" : "-5px"; 
			} else { 
				pointer.style.top = "-5px"; 
			}
		} else if(dir == "l" || dir == "r") {
			var md = (Math.max(dy, 0) + Math.min(node.offsetHeight + dy, parent.offsetHeight))/2 - dy - 6,
				mx = node.offsetHeight - 11;
			pointer.style.top = (md>mx? mx : md<1? 1 : md) + "px";
			if(dir == "r") { 
				pointer.style.left = null;
				pointer.style.right = "-5px"; 
			} else { 
				pointer.style.left = "-5px"; 
			}
		} else {
			if(dir == "lu" || dir== "ld"){
				pointer.style.left = "5px";
			} else {
				pointer.style.left = null;
				pointer.style.right = "5px";
			}
			if(dir == "ru" || dir == "lu"){
				pointer.style.top = "-10px";
			} else {
				pointer.style.top = null;
				pointer.style.bottom = zk.ie6_? "-14px" : "-10px";
			}
		}
		
		//arrow.className = 'z-errbox-left z-arrow-' + dir; // REMOVED
		pointer.className = 'z-pointer z-pointer-' + dir; // ADDED
	};
	/** Spinner **/
	zul.inp.Renderer.renderSpinnerButton = function (out, wgt) {
		var zcls = wgt.getZclass(),
			uuid = wgt.uuid;
		if(wgt.inRoundedMold()) return;
			out.push('<div id="', uuid, '-btn-up" class="', zcls, '-btn-upper"></div>',
					'<div id="', uuid, '-btn-down" class="', zcls, '-btn-lower"></div>');
		
	};
});