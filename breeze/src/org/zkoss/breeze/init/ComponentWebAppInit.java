/* WebAppInit.java

	Purpose:
		
	Description:
		
	History:
		Jun 29, 2010 11:56:16 AM , Created by Sam

Copyright (C) 2010 Potix Corporation. All Rights Reserved.
*/
package org.zkoss.breeze.init;

import org.zkoss.breeze.BreezeThemeProvider;
import org.zkoss.util.logging.Log;
import org.zkoss.util.resource.ClassLocator;
import org.zkoss.zk.ui.WebApp;
import org.zkoss.zk.ui.metainfo.DefinitionLoaders;

/**
 * Initial the breeze theme relative setting, includes
 * Library property setting, Theme provider setting and Component definition setting 
 * @author Sam
 */
public class ComponentWebAppInit implements org.zkoss.zk.ui.util.WebAppInit{
	private static final Log log = Log.lookup(ComponentWebAppInit.class);
	
	public void init(WebApp webapp) throws Exception {
		if (webapp.getConfiguration().getThemeProvider() == null)
			webapp.getConfiguration().setThemeProvider(new BreezeThemeProvider());

		try {
			ClassLocator cl = new ClassLocator();
			DefinitionLoaders.addAddon(new ClassLocator(), cl.getResource("metainfo/zk/lang-addon-zkex.xml"));
		} catch (Exception ex) {
			log.error(ex); //keep running
		}
	}
}
