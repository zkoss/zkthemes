/* wgt.sapphire.js

	Purpose:

	Description:

	History:
		Tue Jun 20 09:41:42     2010, Created by simon

Copyright (C) 2010 Potix Corporation. All Rights Reserved.
*/
zk.afterLoad('zul.wgt', function(){
	
	/** Popup **/
	zul.wgt.PopupRenderer.isFrameRequired = function(wgt){
		return false;
	}
});