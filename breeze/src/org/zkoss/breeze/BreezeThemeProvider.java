/* BreezeThemeProvider.java

	Purpose:
		
	Description:
		
	History:
		Jul 12, 2010 7:04:49 PM , Created by Sam

Copyright (C) 2010 Potix Corporation. All Rights Reserved.
*/
package org.zkoss.breeze;

import java.util.Collection;
import java.util.List;
import java.util.ListIterator;

import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.util.ThemeProvider;
import org.zkoss.zul.Messagebox;

/**
 * @author Sam
 *
 */
public class BreezeThemeProvider implements ThemeProvider {
	private final static String DEFAULT_WCS = "~./zul/css/zk.wcs";
	private final static String DEFAULT_MSGBOX_TEMPLATE_URI = "~./zul/html/messagebox.zul";
	private final static String BREEZE_MESSAGEBOX_TEMPLATE_URI = "~./zul/html/messagebox.breeze.zul";
	
	/**
	 * 
	 * @param exec
	 */
	public void setToBreeze(Execution exec){
		if(Themes.getTheme(exec).isEmpty()){
			Themes.setTheme(exec, Themes.BREEZE_THEME);
		}
	}
	
	public Collection getThemeURIs(Execution exec, List uris) {
		boolean isBreezeInUse = isBreezeInUse(exec);
		
		if(isUsingDefaultTemplate())
			Messagebox.setTemplate( isBreezeInUse? 
					BREEZE_MESSAGEBOX_TEMPLATE_URI : DEFAULT_MSGBOX_TEMPLATE_URI);
		
		if (isBreezeInUse) {
			bypassToBreezeThemeURI(uris, Themes.BREEZE_THEME);
			return uris;
		}
		
		return uris;
	}
	
	private static boolean isBreezeInUse(Execution exec){
		return Themes.BREEZE_THEME.equals(Themes.getTheme(exec));
	}
	
	/**
	 * 
	 * @return true if using default or breeze Messagebox template zul, false otherwise.
	 */
	private static boolean isUsingDefaultTemplate(){
		return BREEZE_MESSAGEBOX_TEMPLATE_URI.equals(Messagebox.getTemplate()) ||
		DEFAULT_MSGBOX_TEMPLATE_URI.equals(Messagebox.getTemplate());
	}
	
	/**
	 * Setup inject URI for cache
	 * @param uris
	 */
	private static void bypassToBreezeThemeURI (List uris, String themeName) {
		for (ListIterator it = uris.listIterator(); it.hasNext();) {
			final String uri = (String)it.next();
			if (uri.startsWith(DEFAULT_WCS)) {
				it.set(Aide.injectURI(uri, themeName));
				break;
			} 
		}
	}
	
	public int getWCSCacheControl(Execution exec, String uri) {
		return 8760; // an year. (JVM will utilize it, don't have to count the answer)
	}
	
	public String beforeWCS(Execution exec, String uri) {
		return uri;
	}

	public String beforeWidgetCSS(Execution exec, String uri) {
		if (!isBreezeInUse(exec)) return uri;
		
		//TODO: this identification logic is too naive.  
		if(uri.startsWith("~./js/zul/") || 
				uri.startsWith("~./js/zkex/") || 
				uri.startsWith("~./js/zkmax/")){
			return uri.replace(".css", ".breeze.css");
		}
		return uri;
	}
	
	
}
