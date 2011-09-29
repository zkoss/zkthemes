/* wnd.classicblue.js

	Purpose:

	Description:

	History:
		Tue Jun 20 09:41:42     2010, Created by simon

Copyright (C) 2010 Potix Corporation. All Rights Reserved.
*/
zk.afterLoad('zul.wnd', function(){
	
	/** Window **/
	zul.wnd.WindowRenderer.shallCheckBorder = function (wgt) {
		return wgt._mode != 'embedded' && wgt._mode != 'popup';
	};
	
	/** Panel **/
	//MODIFIED: Panel has top rounded corner when framable is false and caption
	//is avaiable, so the condition for top is now isFramable || cap
	//also need to take off 2px for extra borders
	zul.wnd.Panel.prototype._titleHeight = function (n) {
		var rounded = this._rounded(),
			cap = this.$n('cap'),
			top = rounded ? jq(n).find('> div:first-child')[0].offsetHeight: 0;
		return cap ? (rounded ? jq(n).find('> div:first-child').next()[0]: cap).offsetHeight + top: top;
	};
	zul.wnd.PanelRenderer.isFrameRequired = function(wgt) {
		return wgt._rounded();
	}
});