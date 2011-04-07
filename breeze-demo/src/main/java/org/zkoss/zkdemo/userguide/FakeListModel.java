/* FakeListModel.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		Jul 1, 2010 8:58:42 AM , Created by Sam
}}IS_NOTE

Copyright (C) 2009 Potix Corporation. All Rights Reserved.

{{IS_RIGHT
	This program is distributed under GPL Version 3.0 in the hope that
	it will be useful, but WITHOUT ANY WARRANTY.
}}IS_RIGHT
*/
package org.zkoss.zkdemo.userguide;

import java.util.Comparator;

import org.zkoss.zul.AbstractListModel;
import org.zkoss.zul.ListModelExt;
import org.zkoss.zul.event.ListDataEvent;

/**
 * @author Sam
 *
 */
public class FakeListModel extends AbstractListModel implements ListModelExt {
	private int _size;
	private boolean _asc = true;

	public FakeListModel() {
		this(10000);
	}
	public FakeListModel(int size) {
		_size = size;
	}

	// ListModelExt
	public void sort(Comparator cmpr, boolean asc) {
//		System.out.println("==================SORT DATA================");
		_asc = asc;
		invalidate();
	}
	public void invalidate() {
		fireEvent(ListDataEvent.CONTENTS_CHANGED, -1, -1);
	}

	//AbstractListModel
	public Object getElementAt(int v) {
		String value = "Option "+(_asc ? v: _size - v - 1);
//		System.out.println(value);
		return value;
	}
	
	//AbstractListModel
	public int getSize() {
		return _size;
	}
	
	//AbstractListModel
	public void setSize(int size){
		_size = size;
	}
}
