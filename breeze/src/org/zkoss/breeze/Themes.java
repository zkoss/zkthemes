/* Themes.java

	Purpose:
		
	Description:
		
	History:
		Jul 12, 2010 7:07:02 PM , Created by Sam

Copyright (C) 2010 Potix Corporation. All Rights Reserved.
*/
package org.zkoss.breeze;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.zkoss.lang.Library;
import org.zkoss.zk.ui.Execution;

/**
 * @author Sam
 *
 */
public class Themes {
	public final static String THEME_COOKIE_KEY = "zktheme";
	public final static String BREEZE_THEME = "breeze";
	
	
	/**
	 * Sets the theme style in cookie
	 */
	public static void setTheme (Execution exe, String theme) {
		Cookie cookie = new Cookie(THEME_COOKIE_KEY, theme);
		cookie.setMaxAge(60*60*24*30); //store 30 days
		((HttpServletResponse)exe.getNativeResponse()).addCookie(cookie);
	}
	
	/**
	 * Returns the theme specified in cookies
	 * @param exe Execution
	 * @return the name of the theme or "" for default theme.
	 */
	public static String getTheme (Execution exe) {
		Cookie[] cookies = ((HttpServletRequest)exe.getNativeRequest()).getCookies();
		if(cookies == null) return "";
		for(int i=0; i<cookies.length; i++){
			if(!THEME_COOKIE_KEY.equals(cookies[i].getName())) continue;
			String t = cookies[i].getValue();
			if (t != null) return t;
		}
		return "";
	}
}
