/* SilvertailThemeWebAppInit.java

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
package org.zkoss.theme.silvertail;

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
public class SilvertailThemeWebAppInit implements WebAppInit {

	private final static String SILVERTAIL_NAME = "silvertail";
	private final static String SILVERTAIL_DISPLAY = "Silvertail";
	private final static int SILVERTAIL_PRIORITY = 600;
	
	public void init(WebApp webapp) throws Exception {
		Themes.register(SILVERTAIL_NAME, SILVERTAIL_DISPLAY, SILVERTAIL_PRIORITY);
		// Bug ZK-2963: register silvertail theme for tablet responsive theme
		String edition = WebApps.getEdition();
		if ("EE".equals(edition)) {
			Themes.register(ResponsiveThemeRegistry.TABLET_PREFIX + SILVERTAIL_NAME, SILVERTAIL_DISPLAY, SILVERTAIL_PRIORITY);
		}
	}
	
}