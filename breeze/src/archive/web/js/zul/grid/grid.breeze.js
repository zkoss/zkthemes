/* grid.breeze.js

	Purpose:

	Description:

	History:
		Tue Jun 20 09:41:42     2010, Created by sam

Copyright (C) 2010 Potix Corporation. All Rights Reserved.
*/

zk.afterLoad('zul.grid', function(){
	/** Column **/
	var Column = zul.grid.Column;
	Column.prototype._doMouseOver = function (evt) {
		var isSort = this.isSortable_();
		if (isSort || (this.parent._menupopup && this.parent._menupopup != 'none')) {
			var btn = this.$n('btn'),
				n = this.$n(),
				zcls = this.getZclass(),
				cls = n.className,
				sorted = zcls.indexOf('-sort-asc') != -1 ? '-sort-asc' : zcls.indexOf('-sort-dsc') != -1 ? '-sort-dsc' : '';
			jq(n).addClass(zcls + "-over");
			if (sorted)
				jq(n).addClass(zcls + sorted);
			if (btn) {
				btn.style.height = zk.ie6_ || zk.ie7_  ? n.offsetHeight - 4  + 'px': n.offsetHeight + "px";
			}
		}
	};
	
	Column.molds['default'] = function (out) {
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
	
	/** Row **/
	var Row = zul.grid.Row;
	Row.prototype.doMouseOver_ = function (evt) {
		var n = this.$n(),
			zcls = this.getZclass() + '-over';
		if (zk.gecko && this._draggable
		&& !jq.nodeName(evt.domTarget, "input", "textarea")) {
			if (n) n.firstChild.style.MozUserSelect = "none";
		}
		
		// ADDED: remove onMouseOver CSS class
		if (n && !jq(n).hasClass(zcls))
			jq(n).addClass(zcls);
		this.$supers('doMouseOver_', arguments);
	};

	Row.prototype.doMouseOut_ = function (evt) {
		var n = this.$n(),
			zcls = this.getZclass() + '-over'; // ADDED: add CSS class when onMouseOver on Row
		if (zk.gecko && this._draggable)
			if (n) n.firstChild.style.MozUserSelect = "none";
		
		// ADDED
		/**
		 * Calculate widget on page's position, removes CSS class
		 * when the event's position is out of the range of the widget.
		 */
		if (n && jq(n).hasClass(zcls)) {
			var x = evt.pageX,
				y = evt.pageY,
				of = zk(n).revisedOffset(),
				p = 2;	/* Add extra padding for fault-tolerant */
			if (x < (of[0] + p) || x > (of[0] + n.clientWidth - p) ||
				y < (of[1] + p) || y > (of[1] + n.clientHeight - p)	)
				jq(n).removeClass(zcls);
		}
		this.$supers('doMouseOut_', arguments);
	};
	
	zul.grid.Grid.molds['default'] = function (out) {
		var uuid = this.uuid,
			zcls = this.getZclass(),
			innerWidth = this.getInnerWidth(),
			wdAttr = this.getHflex() == 'min' ? '' : innerWidth == '100%' ? ' width="100%"' : '',
			wdStyle = innerWidth != '100%' ? 'width:' + innerWidth : '',
			inPaging = this.inPagingMold(), pgpos;

		out.push('<div', this.domAttrs_(), '>');

		if (inPaging && this.paging) {
			pgpos = this.getPagingPosition();
			if (pgpos == 'top' || pgpos == 'both') {
				out.push('<div id="', uuid, '-pgit" class="', zcls, '-pgi-t">');
				this.paging.redraw(out);
				out.push('</div>');
			}
		}

		if (this.columns) {
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
		if (hgh) out.push(' style="height:', hgh, '"');
		
		out.push('><table', wdAttr, zUtl.cellps0);
		if (!this.isSizedByContent())
			out.push(' style="table-layout:fixed;', wdStyle,'"');		
		out.push('>');
		
		if (this.columns)
			this.domFaker_(out, '-bdfaker', zcls);

		if (this.rows) {
			if (this.domPad_ && !this.inPagingMold())
				this.domPad_(out, '-tpad');
			this.rows.redraw(out);
			if (this.domPad_ && !this.inPagingMold())
				this.domPad_(out, '-bpad');
		}
		
		out.push('</table></div>');
		
		if (this.foot) {
			out.push('<div id="', uuid, '-foot" class="', zcls, '-footer">',
				'<table', wdAttr, zUtl.cellps0, ' style="table-layout:fixed;', wdStyle,'">');
			if (this.columns) 
				this.domFaker_(out, '-ftfaker', zcls);
				
			this.foot.redraw(out);
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