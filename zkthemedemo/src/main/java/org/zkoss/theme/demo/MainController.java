/* MainController.java

{{IS_NOTE
 Purpose:
  
 Description:
  
 History:
  Feb 6, 2012 5:47:13 PM , Created by simonpai
}}IS_NOTE

Copyright (C) 2011 Potix Corporation. All Rights Reserved.

{{IS_RIGHT
}}IS_RIGHT
*/
package org.zkoss.theme.demo;

import java.util.Set;

import org.zkoss.lang.Library;
import org.zkoss.lang.Strings;
import org.zkoss.zk.ui.Component;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.SelectEvent;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.Comboitem;
import org.zkoss.zul.ComboitemRenderer;
import org.zkoss.zul.Include;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.theme.Themes;

/**
 * The main controller of Theme Demo
 * @author simonpai
 */
public class MainController extends SelectorComposer<Component> {
	
	private static final long serialVersionUID = 3982341042184109811L;
	
	@Wire("#xcontents")
	private Include _inc;
	@Wire("#themeCookieCombobox")
	private Combobox _themeCookieBox;
	@Wire("#themeLibraryCombobox")
	private Combobox _themeLibraryBox;
	
	private ListModelList<String> _model = 
		new ListModelList<String>(Themes.getThemes());
	
	@Listen("onSelect = #themeCookieCombobox")
	public void selectByCookie(SelectEvent<Comboitem, String> event) {
		String key = getSelectValue(event);
		Themes.setTheme(Executions.getCurrent(), key);
		Executions.sendRedirect(null);
	}
	
	@Listen("onSelect = #themeLibraryCombobox")
	public void selectByLibrary(SelectEvent<Comboitem, String> event) {
		Themes.setTheme(Executions.getCurrent(), ""); // remove cookie
		String key = getSelectValue(event);
		Library.setProperty("org.zkoss.theme.preferred", key);
		Executions.sendRedirect(null);
	}
	
	private static String getSelectValue(SelectEvent<Comboitem, String> event) {
		Set<Comboitem> set = event.getSelectedItems();
		return (String) (set.isEmpty() ? null : set.iterator().next().getValue());
	}
	
	@Override
	public void doAfterCompose(Component comp) throws Exception {
		super.doAfterCompose(comp);
		
		String topic = Executions.getCurrent().getParameter("topic");
		comp.getDesktop().setAttribute("topic", topic);
		String src = Strings.isEmpty(topic) ? "/demo/hello.zul" : ("/" + topic + ".zul");
		_inc.setSrc(src);
		
		String curr = Themes.getTheme(Executions.getCurrent());
		_model.addToSelection(curr);
		
		_themeCookieBox.setItemRenderer(COMBO_REND);
		_themeLibraryBox.setItemRenderer(COMBO_REND);
		_themeCookieBox.setModel(_model);
		_themeLibraryBox.setModel(_model);
		
	}
	
	public static final ComboitemRenderer<String> COMBO_REND = 
			new ComboitemRenderer<String>() {
		public void render(Comboitem item, String data, int index)
				throws Exception {
			item.setLabel(Themes.getDisplayName(data));
			item.setValue(data);
		}
	};
	
}
