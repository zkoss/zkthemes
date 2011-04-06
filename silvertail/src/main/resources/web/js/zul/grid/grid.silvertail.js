/* grid.silvertail.js

	Purpose:

	Description:

	History:
		Tue Jun 20 09:41:42     2010, Created by sam

Copyright (C) 2010 Potix Corporation. All Rights Reserved.
*/

zk.afterLoad('zul.grid', function(){
	/** Column **/
	zul.grid.Renderer.updateColumnMenuButton = function (wgt) {
		var n = wgt.$n(),
			btn;
	 	if (btn = wgt.$n('btn')) btn.style.height = zk.ie6_ || zk.ie7_  ? n.offsetHeight - 1  + 'px': n.offsetHeight + "px";
	};
});