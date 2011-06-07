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

import java.io.IOException;
import java.io.Writer;

import org.zkoss.zk.ui.Desktop;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.Page;
import org.zkoss.zk.ui.WebApp;
import org.zkoss.zk.ui.sys.SEORenderer;
import org.zkoss.zk.ui.util.WebAppInit;
import org.zkoss.zkplus.theme.Themes;

/**
 * Initial the theme relative setting, includes
 * Library property setting, Theme provider setting and Component definition setting 
 * @author sam
 */
public class BreezeThemeWebAppInit implements WebAppInit, SEORenderer {
	
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
	public void render(Page page, Writer out) throws IOException {
		final Desktop desktop = page.getDesktop();
		boolean inited = Boolean.TRUE.equals(desktop.getAttribute(THEME_INITED_DESKTOP));
		
		if (!inited) {
			desktop.setAttribute(THEME_INITED_DESKTOP, Boolean.TRUE);
			String name = Themes.getCurrentTheme();
			if (!Themes.CLASSICBLUE_NAME.equals(name))
				out.write("<script src='" + 
					Executions.encodeURL("~./js/zul." + name + ".wpd") + "'></script>");
		}
	}
}