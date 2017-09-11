/* Sidebaritem.java

	Purpose:
		
	Description:
		
	History:
		Jul 19, 2010 11:10:45 AM , Created by simon

Copyright (C) 2010 Potix Corporation. All Rights Reserved.

*/
package org.zkoss.zkdemo.theme;

import java.util.HashMap;
import java.util.Map;

import org.zkoss.zk.ui.event.Event;
import org.zkoss.zul.Include;
import org.zkoss.zul.Toolbarbutton;

/**
 * @author simon
 *
 */
public class Sidebaritem extends Toolbarbutton {
	
	private String _topic;
	
	/**
	 * @return the topic
	 */
	public String getTopic() {
		return _topic;
	}
	
	/**
	 * @param topic, which represents the uri resource of center content. For
	 * example, "demo/window" will be mapped to "demo/window.zul"
	 */
	public void setTopic(String topic) {
		this._topic = topic;
	}

	public void onClick(Event event) {
		Map<String, String> stateMap = new HashMap<String, String>();
		stateMap.put("url", _topic);
		String hash = "?topic=" + _topic.replaceAll("\\/", "\\$");
		getDesktop().pushHistoryState(stateMap, "", hash);
		((Include) getFellow("xcontents")).setSrc("/" + _topic + ".zul");
	}

}
