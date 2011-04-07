/* WebAppInit.java

	Purpose:
		
	Description:
		
	History:
		Jun 29, 2010 11:56:16 AM , Created by Sam

Copyright (C) 2010 Potix Corporation. All Rights Reserved.
*/
package org.zkoss.breeze;

import org.zkoss.util.Utils;
import org.zkoss.zk.ui.Desktop;
import org.zkoss.zk.ui.WebApp;
import org.zkoss.zk.ui.metainfo.LanguageDefinition;

/**
 * Initial the breeze theme relative setting, includes
 * Library property setting, Theme provider setting and Component definition setting 
 * @author Sam
 */
public class ComponentWebAppInit implements org.zkoss.zk.ui.util.WebAppInit, org.zkoss.zk.ui.util.DesktopInit{
	
	private final static String KEY_BREEZE_THEME_PROVIDER = "org.zkoss.themeProvider.breeze";
	
	public void init(WebApp webapp) throws Exception {
		
		//add Widget afterload Definition...
		String breezePkg = Utils.compareVersion(Utils.parseVersion(webapp.getVersion()), Utils.parseVersion("5.0.5")) < 0 ?
							"zul.breeze": "zul.breeze505";
		LanguageDefinition.lookup("xul/html").addMergeJavaScriptPackage(breezePkg);

		if (webapp.getConfiguration().getThemeProvider() == null){
			BreezeThemeProvider breezeThemeProvider = new BreezeThemeProvider();
			webapp.getConfiguration().setThemeProvider(breezeThemeProvider);
			webapp.setAttribute(KEY_BREEZE_THEME_PROVIDER, breezeThemeProvider);
		}
	}

	public void init(Desktop desktop, Object data) throws Exception {
		Object obj = desktop.getSession().getWebApp().getAttribute(KEY_BREEZE_THEME_PROVIDER);
		if(obj == null || !(obj instanceof BreezeThemeProvider)){
			return;
		}
		/*	Note: DesktopInit will create new Instance for each desktop */
		BreezeThemeProvider provider = (BreezeThemeProvider)obj;
		provider.setToBreeze(desktop.getExecution());
	}
	
	
}
