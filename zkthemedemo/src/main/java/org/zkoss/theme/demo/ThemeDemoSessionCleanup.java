/* ThemeDemoSessionCleanup.java

	Purpose:
		
	Description:
		
	History:
		Fri, Dec 18, 2015  3:31:05 PM, Created by Christopher

Copyright (C) 2015 Potix Corporation. All Rights Reserved.

This program is distributed under LGPL Version 2.1 in the hope that
it will be useful, but WITHOUT ANY WARRANTY.
*/
package org.zkoss.theme.demo;

import org.zkoss.zk.ui.Session;
import org.zkoss.zk.ui.util.SessionCleanup;

/**
 * 
 * @author Christopher
 */
public class ThemeDemoSessionCleanup implements SessionCleanup {
	public static final String CURR_THEME = "currentTheme";

	public void cleanup(Session sess) throws Exception {
		sess.removeAttribute("currentTheme");
	}
}
