/* sel.breeze.js

	Purpose:

	Description:

	History:
		Tue Jun 20 09:41:42     2010, Created by sam

Copyright (C) 2010 Potix Corporation. All Rights Reserved.
*/

zk.afterLoad('zul.sel', function () {
	
	/**
	 * Listheader
	 */
	var Listheader = zul.sel.Listheader;
	Listheader.prototype.bind_ = function () {
		this.$supers('bind_', arguments);
		var cm = this.$n('cm'),
			n = this.$n();
		if (cm) {
			var box = this.getListbox();
			if (box) box._headercm = cm;
			this.domListen_(cm, 'onClick')
				.domListen_(cm, 'onMouseOver')
				.domListen_(cm, 'onMouseOut');
		}
		if (n)
			this.domListen_(n, 'onMouseOver', '_doSortMouseEvt')
				.domListen_(n, 'onMouseOut', '_doSortMouseEvt');
	};
	Listheader.prototype.unbind_ = function () {
		var cm = this.$n('cm'),
			n = this.$n();
		if (cm) {
			var box = this.getListbox();
			if (box) box._headercm = null;
			this._checked = null;
			this.domUnlisten_(cm, 'onClick')
				.domUnlisten_(cm, 'onMouseOver')
				.domUnlisten_(cm, 'onMouseOut');
		}
		if (n)
			this.domUnlisten_(n, 'onMouseOver', '_doSortMouseEvt')
				.domUnlisten_(n, 'onMouseOut', '_doSortMouseEvt');
		this.$supers(zul.sel.Listheader, 'unbind_', arguments);
	};
	Listheader.prototype._doSortMouseEvt = function (evt) {
		var sort = this.getSortAscending();
		if (sort != 'none')
			jq(this.$n())[evt.name == 'onMouseOver' ? 'addClass' : 'removeClass'](this.getZclass() + '-sort-over');
	};
	zul.sel.Listheader.molds['default'] = function (out){
		var uuid = this.uuid,
			zcls = this.getZclass();
		out.push('<th', this.domAttrs_(), '><div id="', uuid, '-cave" class="',
				zcls, '-cnt"', this.domTextStyleAttr_(), '><div class="', zcls, '-sort-img"></div>', this.domContent_());
		
		if (this.parent._menupopup && this.parent._menupopup != 'none')
			out.push('<a id="', uuid, '-btn"  href="javascript:;" class="', zcls, '-btn"></a>');
		
		for (var w = this.firstChild; w; w = w.nextSibling)
			w.redraw(out);
		out.push('</div></th>');	
	};
	
	/**
	 * Treeitem
	 */
	var Treeitem = zul.sel.Treeitem;
	Treeitem.prototype.doMouseOver_ = function (evt) {
		var ico = this.$n('open');
		if (evt.domTarget == ico)
			jq(this.$n()).addClass(this.getZclass() + '-ico-over');
		this.$supers('doMouseOver_', arguments);
	};
	Treeitem.prototype.doMouseOut_ = function (evt) {
		var ico = this.$n('open');	
		if (evt.domTarget == ico)
			jq(this.$n()).removeClass(this.getZclass() + '-ico-over');
		this.$supers('doMouseOut_', arguments);
	};
	
	zul.sel.Listbox.molds['default'] = function (out) {
		var uuid = this.uuid,
			zcls = this.getZclass(),
			innerWidth = this.getInnerWidth(),
			wdAttr = innerWidth == '100%' ? ' width="100%"' : '',
			wdStyle =  innerWidth != '100%' ? 'width:' + innerWidth : '',
			inPaging = this.inPagingMold(), pgpos,
			tag = zk.ie || zk.gecko ? "a" : "button";
	
		out.push('<div', this.domAttrs_(), '>');
	
		if (inPaging && this.paging) {
			pgpos = this.getPagingPosition();
			if (pgpos == 'top' || pgpos == 'both') {
				out.push('<div id="', uuid, '-pgit" class="', zcls, '-pgi-t">');
				this.paging.redraw(out);
				out.push('</div>');
			}
		}
	
		if(this.listhead){
			out.push('<div id="', uuid, '-head" class="', zcls, '-header">',
				'<table', wdAttr, zUtl.cellps0,
				' style="table-layout:fixed;', wdStyle,'">');
			this.domFaker_(out, '-hdfaker', zcls);
			
			for (var hds = this.heads, j = 0, len = hds.length; j < len;)
				hds[j++].redraw(out);
		
			out.push('</table></div><div class="', zcls, '-header-bg"></div>');
		}
		out.push('<div id="', uuid, '-body" class="', zcls, '-body"');
	
		var hgh = this.getHeight();
		if (hgh) out.push(' style="overflow:hidden;height:', hgh, '"');
		else if (this.getRows() > 1) out.push(' style="overflow:hidden;height:"', this.getRows() * 15, 'px"');
		
		out.push('><table', wdAttr, zUtl.cellps0, ' id="', uuid, '-cave"');
		if (!this.isSizedByContent())
			out.push(' style="table-layout:fixed;', wdStyle,'"');		
		out.push('>');
		
		if(this.listhead)
			this.domFaker_(out, '-bdfaker', zcls);
	
		if (this.domPad_ && !inPaging)
			this.domPad_(out, '-tpad');
		out.push('<tbody id="',uuid,'-rows">');
		for (var item = this.firstItem; item; item = this.nextItem(item))
			item.redraw(out);
		out.push('</tbody>');
		if (this.domPad_ && !inPaging)
			this.domPad_(out, '-bpad');
		
		out.push('</table><', tag, ' id="', uuid,
			'-a" tabindex="-1" onclick="return false;" href="javascript:;" class="z-focus-a"></',
			tag, '>', "</div>");
	
		if (this.listfoot) {
			out.push('<div id="', uuid, '-foot" class="', zcls, '-footer">',
				'<table', wdAttr, zUtl.cellps0, ' style="table-layout:fixed;', wdStyle,'">');
			if (this.listhead) 
				this.domFaker_(out, '-ftfaker', zcls);
				
			this.listfoot.redraw(out);
			out.push('</table></div>');
		}
	
		if (this.frozen) {
			out.push('<div id="', uuid, '-frozen" class="', zcls, '-frozen">');
			this.frozen.redraw(out);
			out.push('</div>');
		}
		
		if (pgpos == 'bottom' || pgpos == 'both') {
			out.push('<div id="', uuid, '-pgib" class="', zcls, '-pgi-b">');
			this.paging.redraw(out);
			out.push('</div>');
		}
		out.push('</div>');
	};
});