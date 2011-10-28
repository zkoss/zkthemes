/* menu.js

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
	/**
	 * Sync each menu's width
	 */
	zul.menu.Menubar.prototype._syncChdWidth = function () {
		var max = -1;
		if (this.getOrient() == 'vertical') {
			var menus = [];
			for (var w = this.firstChild; w; w = w.nextSibling) {
				if (w.$instanceof(zul.menu.Menu)) {
					var btn = w.$n('b');
					if (btn) {
						menus.push(w);
						var width = btn.clientWidth;
						if (width > max)
							max = width;
					}
				}
			}
			var i = menus.length;
			while (i-- > 0) {
				var btn = menus[i].$n('b'),
					curWidth = btn.clientWidth;
				if (curWidth < max)
					jq(btn).css('width', max + 'px');
			}
		}
	};
	zul.menu.Menu.prototype._getArrowWidth = function () {
		return 20;
	};
});