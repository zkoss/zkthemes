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

import org.zkoss.util.resource.ClassLocator;
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
	
	public String beforeWCS(Execution exec, String uri) {
		return uri;
	}
	
	public String beforeWidgetCSS(Execution exec, String uri) {
		String theme = Themes.getTheme(exec);
		if(!Themes.isAvailable(theme)) return uri;
		
		// inject .[themename] on CSS filenames
		if(uri.startsWith("~./js/zul/") || uri.startsWith("~./js/zkex/") 
				|| uri.startsWith("~./js/zkmax/") || uri.startsWith("~./zul/css/")) 
			return uri.replace(".css", "."+theme+".css");
		return uri;
	}
	
	public Collection getThemeURIs(Execution exec, List uris) {
		String theme = Themes.getTheme(exec);
		
		if(!Themes.isAvailable(theme)) {
			Messagebox.setTemplate(DEFAULT_MSGBOX_TEMPLATE_URI);
			return uris;
		}
		
		// If messagebox.[themename].zul is available, it will overrides the
		// default messagebox template (messagebox.zul)
		String newMsgboxTemplateURI = DEFAULT_MSGBOX_TEMPLATE_URI
			.replace(".zul", "."+theme+".zul");
		boolean customMsgboxTemplate = new ClassLocator().getResource(
				newMsgboxTemplateURI.replace("~./", "web/")) != null;
		Messagebox.setTemplate(customMsgboxTemplate? 
				newMsgboxTemplateURI : DEFAULT_MSGBOX_TEMPLATE_URI);
		
		// Use injectURI to give different URIs of zk.wcs for each theme, so
		// browser will cache them as if they are different files.
		for (ListIterator it = uris.listIterator(); it.hasNext();) {
			final String uri = (String)it.next();
			if (uri.startsWith(DEFAULT_WCS)) {
				it.set(Aide.injectURI(uri, theme));
				break;
			}
		}
		return uris;
	}
	
	public int getWCSCacheControl(Execution exec, String uri) {
		return 8760;
	}
}