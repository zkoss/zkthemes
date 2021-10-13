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
import org.zkoss.zk.ui.WebApps;
import org.zkoss.zk.ui.util.WebAppInit;
import org.zkoss.zkmax.theme.ResponsiveThemeRegistry;
import org.zkoss.zul.theme.Themes;

/**
 * Initial the theme relative setting, includes
 * Library property setting, Theme provider setting and Component definition setting 
 * @author sam
 */
public class BreezeThemeWebAppInit implements WebAppInit {
	private static final String THEME_NAME = "breeze";
	private static final String THEME_DISPLAY = "Breeze";
	private static final int THEME_PRIORITY = 700;

	public void init(WebApp webapp) throws Exception {
		Themes.register(THEME_NAME, THEME_DISPLAY, THEME_PRIORITY);
		// Bug ZK-2963: register theme for tablet responsive theme
		String edition = WebApps.getEdition();
		if ("EE".equals(edition)) {
			Themes.register(ResponsiveThemeRegistry.TABLET_PREFIX + THEME_NAME, THEME_DISPLAY, THEME_PRIORITY);
		}
	}
}
