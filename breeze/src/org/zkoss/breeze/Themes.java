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
		String cp = exe.getContextPath();
		cookie.setPath(cp);
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
		String candidate = null;
		for(int i=0; i < cookies.length; i++){
			Cookie c = cookies[i];
			if(!THEME_COOKIE_KEY.equals(c.getName())) 
				continue;
			String theme = c.getValue();
			if(theme == null) 
				continue;
			String path = c.getPath();
			if(path != null && path.equals(exe.getContextPath()))
				return theme;
			// if no match on path, the first cookie of the same domain is used
			if(candidate == null)
				candidate = theme; 
		}
		return candidate == null? "" : candidate;
	}
}
