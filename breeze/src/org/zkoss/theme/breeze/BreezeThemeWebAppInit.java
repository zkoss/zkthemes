/* BreezeThemeWebAppInit.java

	Purpose:
		
	Description:
		
	History:
		Jun 29, 2010 11:56:16 AM , Created by Sam

Copyright (C) 2010 Potix Corporation. All Rights Reserved.

{{IS_RIGHT
	This program is distributed under LGPL Version 3.0 in the hope that
	it will be useful, but WITHOUT ANY WARRANTY.
}}IS_RIGHT
*/
package org.zkoss.theme.breeze;

import org.zkoss.zk.ui.WebApp;
import org.zkoss.zk.ui.util.WebAppInit;
import org.zkoss.zul.theme.StandardThemeProvider;
import org.zkoss.zul.theme.Themes;

/**
 * Initial the theme relative setting, includes
 * Library property setting, Theme provider setting and Component definition setting 
 * @author sam
 */
public class BreezeThemeWebAppInit implements WebAppInit {
	
	private final static String BREEZE_NAME = "breeze";
	private final static String BREEZE_DISPLAY = "Breeze";
	private final static int BREEZE_PRIORITY = 500;
	
	public void init(WebApp webapp) throws Exception {
		if (webapp.getConfiguration().getThemeProvider() == null)
			webapp.getConfiguration().setThemeProvider(new StandardThemeProvider());
		
		//Themes.register(Themes.BREEZE_NAME, Themes.BREEZE_DISPLAY, Themes.BREEZE_PRIORITY);
		Themes.register(BREEZE_NAME, BREEZE_DISPLAY, BREEZE_PRIORITY);
	}
	
}