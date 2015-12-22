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

import java.util.Comparator;
import java.util.Set;

import org.zkoss.lang.Strings;
import org.zkoss.zk.ui.Component;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.Sessions;
import org.zkoss.zk.ui.event.SelectEvent;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.util.Clients;
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
	@Wire("#themeCombobox")
	private Combobox _themeBox;
	
	private ListModelList<String> _model = 
		new ListModelList<String>(Themes.getThemes());
	
	@Listen("onSelect = #themeCombobox")
	public void selectByLibrary(SelectEvent<Comboitem, String> event) {
		String key = getSelectValue(event);
		Sessions.getCurrent().setAttribute("currentTheme", key);
		Themes.setTheme(Executions.getCurrent(), key);
		Executions.sendRedirect(null);
	}
	
	private static String getSelectValue(SelectEvent<Comboitem, String> event) {
		Set<Comboitem> set = event.getSelectedItems();
		return (String) (set.isEmpty() ? null : set.iterator().next().getValue());
	}
	
	public void doAfterCompose(Component comp) throws Exception {
		super.doAfterCompose(comp);
		this._model.sort(new Comparator<String>() {
			public int compare(String o1, String o2) {
				return o1.toLowerCase().compareTo(o2.toLowerCase());
			}
		}, true);

		String topic = Executions.getCurrent().getParameter("topic");
		comp.getDesktop().setAttribute("topic", topic);
		 String src = Strings.isEmpty(topic) ? "/demo/hello.zul" : ("/" + topic + ".zul");
		_inc.setSrc(src);

		String curr = Themes.getCurrentTheme();
		_model.addToSelection(curr);
		if (curr.equals("atlantic")) {
			Clients.evalJavaScript("jq('body').addClass('grey');");
		} else {
			Clients.evalJavaScript("jq('body').removeClass('grey');");
		}
		_themeBox.setItemRenderer(COMBO_REND);
		_themeBox.setModel(_model);

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
