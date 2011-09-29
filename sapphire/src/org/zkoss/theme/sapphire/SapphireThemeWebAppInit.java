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

import java.io.IOException;
import java.io.Writer;

import org.zkoss.zk.ui.Desktop;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.Page;
import org.zkoss.zk.ui.WebApp;
import org.zkoss.zk.ui.sys.SEORenderer;
import org.zkoss.zk.ui.util.WebAppInit;
import org.zkoss.zkplus.theme.StandardThemeProvider;
import org.zkoss.zkplus.theme.Themes;

/**
 * Initial the theme relative setting, includes
 * Library property setting, Theme provider setting and Component definition setting 
 * 
 */
public class SapphireThemeWebAppInit implements WebAppInit, SEORenderer {

	private final static String SAPPHIRE_NAME = "sapphire";
	private final static String SAPPHIRE_DISPLAY = "Sapphire";
	private final static int SAPPHIRE_PRIORITY = 700;
	
	public void init(WebApp webapp) throws Exception {
		if (webapp.getConfiguration().getThemeProvider() == null)
			webapp.getConfiguration().setThemeProvider(new StandardThemeProvider());
		
		Themes.register(Themes.BREEZE_NAME, Themes.BREEZE_DISPLAY, Themes.BREEZE_PRIORITY);
		Themes.register(SAPPHIRE_NAME, SAPPHIRE_DISPLAY, SAPPHIRE_PRIORITY);
	}
	
	// desktop attribute
	private final static String THEME_INITED_DESKTOP = "org.zkoss.theme.desktop.inited";
	public void render(Page page, Writer out) throws IOException {
		final Desktop desktop = page.getDesktop();
		boolean inited = Boolean.TRUE.equals(desktop.getAttribute(THEME_INITED_DESKTOP));
		
		if (!inited) {
			desktop.setAttribute(THEME_INITED_DESKTOP, Boolean.TRUE);
			String name = Themes.getCurrentTheme();
			if (!Themes.BREEZE_NAME.equals(name))
				out.write("<script src='" + 
					Executions.encodeURL("~./js/zul." + name + ".wpd") + "'></script>");
		}
	}
}