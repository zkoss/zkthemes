/* Themes.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		Mar 22, 2011 7:33:44 PM , Created by sam
}}IS_NOTE

Copyright (C) 2011 Potix Corporation. All Rights Reserved.

{{IS_RIGHT
	This program is distributed under LGPL Version 3.0 in the hope that
	it will be useful, but WITHOUT ANY WARRANTY.
}}IS_RIGHT
*/
package org.zkoss.theme.sapphire;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.zkoss.lang.Library;
import org.zkoss.lang.Strings;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;

/**
 * @author sam
 *
 */
public class Themes {
	public final static String THEME_COOKIE_KEY = "zktheme";

	public final static String PREFERRED_THEME = "org.zkoss.theme.preferred";
	public final static String THEME_NAMES = "org.zkoss.theme.names";

	private final static String THEME_DEFAULT = SapphireThemeWebAppInit.THEME_DEFAULT;
	/**
	 * Sets the theme style in cookie
	 */
	public static void setTheme (Execution exe, String theme) {
		Cookie cookie = new Cookie(THEME_COOKIE_KEY, theme);
		cookie.setMaxAge(60*60*24*30); //store 30 days
		String cp = exe.getContextPath();
		// if path is empty, cookie path will be request path, which causes problems
		if(cp.length() == 0)
			cp = "/";
		cookie.setPath(cp);
		((HttpServletResponse)exe.getNativeResponse()).addCookie(cookie);
	}
	
	/**
	 * Returns the theme specified in cookies
	 * @param exe Execution
	 * @return the name of the theme or "" for default theme.
	 */
	public static String getTheme (Execution exe) {
		Cookie[] cookies = 
			((HttpServletRequest)exe.getNativeRequest()).getCookies();
		if(cookies == null) 
			return "";
		for(int i=0; i < cookies.length; i++){
			Cookie c = cookies[i];
			if(THEME_COOKIE_KEY.equals(c.getName())) {
				String theme = c.getValue();
				if(theme != null) 
					return theme;
			}
		}
		return "";
	}
	
	/**
	 * Returns the current theme
	 * @return
	 */
	public static String getCurrentTheme() {
		// Priority
		//	1. cookie's key
		//	2. library property
		//	3. theme's first priority
		String names = Library.getProperty(Themes.THEME_NAMES);
		
		String name = getTheme(Executions.getCurrent());
		if (!Strings.isEmpty(name) && containTheme(names, name)) {
			return name;
		}
		
		name = Library.getProperty(Themes.PREFERRED_THEME);
		if (!Strings.isEmpty(name) && containTheme(names, name)) {
			return name;
		}
		return Library.getProperty(THEME_DEFAULT);
	}
	
	/**
	 * Returns whether themes contains target theme or not
	 * @param themes
	 * @param targetTheme
	 * @return
	 */
	public static boolean containTheme(String themes, String targetTheme) {
		int index = themes.indexOf(targetTheme);
		return (index == 0 || (index > 0 && themes.charAt(index - 1) == ';')) &&
			themes.charAt(index + targetTheme.length()) == ';';
	}
}
