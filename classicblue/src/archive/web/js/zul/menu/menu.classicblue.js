/* menu.classicblue.js

	Purpose:

	Description:

	History:
		Tue Jun 20 09:41:42     2010, Created by sam

Copyright (C) 2010 Potix Corporation. All Rights Reserved.
*/

zk.afterLoad('zul.menu', function () {
	/**
	 * Menubar
	 * Sync each menu's width when on menu's orient is vertical
	 */
	zul.menu.Menubar.prototype._syncChdWidth = zk.$void;
	/**
	 * Sync each menu's width
	 */
	zul.menu.Menu.prototype._getArrowWidth = function () {
		return 15;
	};
});