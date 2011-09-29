/* grid.classicblue.js

	Purpose:

	Description:

	History:
		Tue Jun 20 09:41:42     2010, Created by sam

Copyright (C) 2010 Potix Corporation. All Rights Reserved.
*/

zk.afterLoad('zul.grid', function(){
	/** Column **/
	zul.grid.Renderer.updateColumnMenuButton = function (col) {
		var btn;
		if (btn = col.$n('btn')) btn.style.height = col.$n().offsetHeight - 1 + "px";
	};
});