/* WebAppInit.java

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

import org.zkoss.lang.Library;
import org.zkoss.lang.Strings;
import org.zkoss.zk.ui.Component;
import org.zkoss.zk.ui.Desktop;
import org.zkoss.zk.ui.WebApp;
import org.zkoss.zk.ui.impl.PageImpl;
import org.zkoss.zk.ui.util.Composer;
import org.zkoss.zk.ui.util.WebAppInit;

/**
 * Initial the theme relative setting, includes
 * Library property setting, Theme provider setting and Component definition setting 
 * 
 */
public class SilvertailThemeWebAppInit implements WebAppInit, Composer {

	private final static String SILVERTAIL_NAME = "silvertail";
	private final static String SILVERTAIL_DISPLAY = "Silvertail";
	private final static int SILVERTAIL_PRIORITY = 600;
	
	/*package*/ final static String CLASSICBLUE_NAME = "classicblue";
	private final static String CLASSICBLUE_DISPLAY = "Classic blue";
	private final static int CLASSICBLUE_PRIORITY = 1000;
	
	/*package*/ final static String THEME_DEFAULT = "org.zkoss.theme.default.name";
	private final static String PREFIX_KEY_PRIORITY = "org.zkoss.theme.priority.";
	private final static String PREFIX_KEY_THEME_DISPLAYS = "org.zkoss.theme.display.";
	
	public void init(WebApp webapp) throws Exception {

		if (webapp.getConfiguration().getThemeProvider() == null){
			webapp.getConfiguration().setThemeProvider(new SilvertailThemeProvider());
		}
		initClassicBlueTheme();
		initSilvertailTheme();
	}

	private static void initClassicBlueTheme() {
		appendThemeName(CLASSICBLUE_NAME);
		setThemeDisplay(CLASSICBLUE_NAME, CLASSICBLUE_DISPLAY);
		updateFirstPriority(CLASSICBLUE_NAME, CLASSICBLUE_PRIORITY);
	}
	
	private static void initSilvertailTheme() {
		appendThemeName(SILVERTAIL_NAME);
		setThemeDisplay(SILVERTAIL_NAME, SILVERTAIL_DISPLAY);
		updateFirstPriority(SILVERTAIL_NAME, SILVERTAIL_PRIORITY);
	}
	
	private static void appendThemeName(String name) {
		String vals = Library.getProperty(Themes.THEME_NAMES);
		if (vals == null) {
			Library.setProperty(Themes.THEME_NAMES, name + ";");
		} else if (!Themes.containTheme(vals, name)) {
			Library.setProperty(Themes.THEME_NAMES, vals + name + ";");
		}
	}
	
	private static void setThemeDisplay(String name, String display) {
		Library.setProperty(PREFIX_KEY_THEME_DISPLAYS + name, display);
	}
	
	private static void updateFirstPriority(String name, int priority) {
		Library.setProperty(PREFIX_KEY_PRIORITY + name, "" + priority);
		
		String defaultTheme = Library.getProperty(THEME_DEFAULT);
		if (Library.getIntProperty(PREFIX_KEY_PRIORITY + defaultTheme, Integer.MAX_VALUE) < priority)
			return;
		Library.setProperty(THEME_DEFAULT, name);
	}
	
	//desktop attribute
	private final static String THEME_INITED_DESKTOP = "org.zkoss.theme.desktop.inited";
	public void doAfterCompose(Component comp) throws Exception {
		Desktop desktop = comp.getDesktop();
		
		boolean inited = Boolean.TRUE.equals(desktop.getAttribute(THEME_INITED_DESKTOP));
		if (!inited) {
			desktop.setAttribute(THEME_INITED_DESKTOP, Boolean.TRUE);
			PageImpl pageImpl = (PageImpl)desktop.getFirstPage();
			String name = Themes.getCurrentTheme();
			if (!CLASSICBLUE_NAME.equals(name))
				pageImpl.addAfterHeadTags("<script>zk.load('zul." + name + "')</script>");	
		}
	}
}