/* SapphireThemeWebAppInit.java

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
package org.zkoss.theme.sapphire;

import org.zkoss.zk.ui.WebApp;
import org.zkoss.zk.ui.WebApps;
import org.zkoss.zk.ui.util.WebAppInit;
import org.zkoss.zkmax.theme.ResponsiveThemeRegistry;
import org.zkoss.zul.theme.Themes;

/**
 * Initial the theme relative setting, includes
 * Library property setting, Theme provider setting and Component definition setting 
 * 
 */
public class SapphireThemeWebAppInit implements WebAppInit {

	private final static String SAPPHIRE_NAME = "sapphire";
	private final static String SAPPHIRE_DISPLAY = "Sapphire";
	private final static int SAPPHIRE_PRIORITY = 700;
	
	public void init(WebApp webapp) throws Exception {
		Themes.register(SAPPHIRE_NAME, SAPPHIRE_DISPLAY, SAPPHIRE_PRIORITY);
		// Bug ZK-2963: register sapphire theme for tablet responsive theme
		String edition = WebApps.getEdition();
		if ("EE".equals(edition)) {
			Themes.register(ResponsiveThemeRegistry.TABLET_PREFIX + SAPPHIRE_NAME, SAPPHIRE_DISPLAY, SAPPHIRE_PRIORITY);
		}
	}
	
}