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

import org.zkoss.web.servlet.JavaScript;
import org.zkoss.zk.ui.Component;
import org.zkoss.zk.ui.Desktop;
import org.zkoss.zk.ui.WebApp;
import org.zkoss.zk.ui.metainfo.LanguageDefinition;
import org.zkoss.zk.ui.util.Composer;
import org.zkoss.zk.ui.util.WebAppInit;
import org.zkoss.zkplus.theme.StandardThemeProvider;
import org.zkoss.zkplus.theme.Themes;

/**
 * Initial the theme relative setting, includes
 * Library property setting, Theme provider setting and Component definition setting 
 * @author sam
 */
public class BreezeThemeWebAppInit implements WebAppInit, Composer {
	
	private final static String BREEZE_NAME = "breeze";
	private final static String BREEZE_DISPLAY = "Breeze";
	private final static int BREEZE_PRIORITY = 500;
	
	public void init(WebApp webapp) throws Exception {
		if (webapp.getConfiguration().getThemeProvider() == null)
			webapp.getConfiguration().setThemeProvider(new StandardThemeProvider());
		
		Themes.register(Themes.CLASSICBLUE_NAME, Themes.CLASSICBLUE_DISPLAY, Themes.CLASSICBLUE_PRIORITY);
		Themes.register(BREEZE_NAME, BREEZE_DISPLAY, BREEZE_PRIORITY);
	}
	
	// desktop attribute
	private final static String THEME_INITED_DESKTOP = "org.zkoss.theme.desktop.inited";
	
	public void doAfterCompose(Component comp) throws Exception {
		
		Desktop desktop = comp.getDesktop();
		boolean inited = Boolean.TRUE.equals(desktop.getAttribute(THEME_INITED_DESKTOP));
		
		if (!inited) {
			desktop.setAttribute(THEME_INITED_DESKTOP, Boolean.TRUE);
			String name = Themes.getCurrentTheme();
			// load theme specific javascript
			if (!Themes.CLASSICBLUE_NAME.equals(name))
				LanguageDefinition.getByExtension("zul").
					addJavaScript(new JavaScript("zk.load('zul." + name + "')"));
		}
	}
	
}