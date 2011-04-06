/* tab.sapphire.js

	Purpose:

	Description:

	History:
		Tue Jun 20 09:41:42     2010, Created by simon

Copyright (C) 2010 Potix Corporation. All Rights Reserved.
*/
zk.afterLoad('zul.tab', function(){
	
	/** Tab **/
	zul.tab.TabRenderer.isFrameRequired = function(wgt){
		return false;
	}
});