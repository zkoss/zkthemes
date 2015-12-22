/* ThemeDemoInitiator.java

	Purpose:
		
	Description:
		
	History:
		Fri, Dec 18, 2015  3:31:18 PM, Created by Christopher

Copyright (C) 2015 Potix Corporation. All Rights Reserved.

This program is distributed under LGPL Version 2.1 in the hope that
it will be useful, but WITHOUT ANY WARRANTY.
*/
package org.zkoss.theme.demo;

import java.util.Map;

import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.Page;
import org.zkoss.zk.ui.Sessions;
import org.zkoss.zk.ui.util.Initiator;
import org.zkoss.zul.theme.Themes;

/**
 * 
 * @author Christopher
 */
public class ThemeDemoInitiator implements Initiator {
	public void doInit(Page page, Map<String, Object> args) throws Exception {
		String theme = Themes.getCurrentTheme();
		boolean isNull = Sessions.getCurrent().hasAttribute("currentTheme");
		if ((!theme.equals("atlantic")) && (!isNull)) {
			Themes.setTheme(Executions.getCurrent(), "atlantic");
			Executions.sendRedirect(null);
		}
	}
}
