/* menu.breeze.js

	Purpose:

	Description:

	History:
		Tue Jun 20 09:41:42     2010, Created by sam

Copyright (C) 2010 Potix Corporation. All Rights Reserved.
*/

zk.afterLoad('zul.menu', function () {
	/**
	 * Menubar
	 * Sync each menu's width when on menu's orient is vertical
	 */
	var Menubar = zul.menu.Menubar;
	Menubar.prototype.onChildAdded_ = function (child) {
		this.$supers('onChildAdded_', arguments);
		this._checkScrolling();
		this._syncChdWidth();	//ADDED
	};
		
	Menubar.prototype.onChildRemoved_ = function (child) {
		this.$supers('onChildRemoved_', arguments);
		if (!this.childReplacing_)
			this._checkScrolling();
		this._syncChdWidth(); //ADDED
	};

	Menubar.prototype.bind_ = function () {
		this.$supers('bind_', arguments);
		if (this.checkScrollable()) {
			var left = this.$n('left'),
				right = this.$n('right');
			if (left && right) {
				this.domListen_(left, 'onClick', '_doScroll');
				this.domListen_(left, 'onMouseover', '_onOver');
				this.domListen_(left, 'onMouseout', '_onOut');
				this.domListen_(right, 'onClick', '_doScroll');
				this.domListen_(right, 'onMouseover', '_onOver');
				this.domListen_(right, 'onMouseout', '_onOut');
			}
			zWatch.listen({onSize: this, onShow: this});
		}
		this._syncChdWidth(); //ADDED
	};

	/**
	 * Sync each menu's width
	 */
	Menubar.prototype._syncChdWidth = function () {
		var max = -1;
		if (this.getOrient() == 'vertical') {
			var menus = [];
			for (var w = this.firstChild; w; w = w.nextSibling) {
				if (w.$instanceof(zul.menu.Menu)) {
					var btn = w.$n('b');
					if (btn) {
						menus.push(w);
						var width = btn.clientWidth;
						if (width > max)
							max = width;
					}
				}
			}
			var i = menus.length;
			while (i-- > 0) {
				var btn = menus[i].$n('b'),
					curWidth = btn.clientWidth;
				if (curWidth < max)
					jq(btn).css('width', max + 'px');
			}
		}
	};
	
	
	/**
	 * Menu
	 * 
	 * When Menu is open, the status remain open when move to next menu  
	 */
	var Menu = zul.menu.Menu;
	/**
	 * If Menu is in top, use body-seld to indicate the Active state
	 */
	Menu._isActive = function (wgt) {
		var top = wgt.isTopmost(),
			n = top ? wgt.$n('a') : wgt.$n(),
			zcls = wgt.getZclass();
		if (top) {
			var p = wgt.menupopup;
				c = p.isOpen() ? '-body-seld' : '-body-over';
			zcls += c;
		} else
			zcls += '-over';
		return jq(n).hasClass(zcls);
	};

	Menu._addActive = function (wgt) {
		var top = wgt.isTopmost(),
			n = top ? wgt.$n('a') : wgt.$n(),
			zcls = wgt.getZclass();
		if (top) {
			var p = wgt.menupopup,
				c = p.isOpen() ? '-body-seld' : '-body-over';
			zcls += c;
		} else	
			zcls += '-over';
		
		jq(n).addClass(zcls);
		if (!top && wgt.parent.parent.$instanceof(zul.menu.Menu)) {
			this._addActive(wgt.parent.parent);
		}
	};

	Menu._rmActive = function (wgt) {
		var top = wgt.isTopmost(),
			n = top ? wgt.$n('a') : wgt.$n(),
			zcls = wgt.getZclass();
		if (top) {
			var p = wgt.menupopup;
				c = p.isOpen() ? '-body-seld' : '-body-over';

			zcls += c;
		} else
			zcls += '-over';
		jq(n).removeClass(zcls);
	};
	
	Menu._rmOver = function (wgt) {
		var top = wgt.isTopmost(),
			n = top ? wgt.$n('a') : wgt.$n(),
			zcls = wgt.getZclass() + (top ? '-body-over' : '-over');

		jq(n).removeClass(zcls);	
	};
	
	Menu.prototype._doMouseOut = function (evt) {
		if (zk.ie && jq.isAncestor(this.$n('a'), evt.domEvent.relatedTarget || evt.domEvent.toElement))
			return; // don't deactivate
	
		var	topmost = this.isTopmost();
		if (topmost) {
			//MODIFY: Only remove over state when mouse out
			this.$class._rmOver(this);
		} else if (!this.menupopup || !this.menupopup.isOpen())
			this.$class._rmActive(this);
	};

	Menu.molds['default'] = function (out) {
		var uuid = this.uuid,
			zcls = this.getZclass(),
			btn = zk.ie && !zk.ie8 ? 'input' : 'button',
			contentHandler = this._contentHandler;
	
		if (this.isTopmost()) {
			out.push('<td align="left"', this.domAttrs_(), '><table id="', uuid,
					'-a"', zUtl.cellps0, ' class="', zcls, '-body');
	
			if (this.getImage()) {
				out.push(' ', zcls, '-body');
				if (this.getLabel())
					out.push('-text');
	
				out.push('-img');
			}
	
			out.push('" style="width: auto;"><tbody><tr><td class="', zcls,
					'-inner-l"><span class="', zcls, '-space"></span></td><td class="', zcls,
					'-inner-m"><div><', btn, ' id="', uuid,
					'-b" type="button" class="', zcls, '-btn"');
			if (this.getImage())
				out.push(' style="background-image:url(', this.getImage(), ')"');
	
			out.push('>', zUtl.encodeXML(this.getLabel()), '&nbsp;</', btn, '>');
	
			if (this.menupopup)
				this.menupopup.redraw(out);
			else if (contentHandler)
				contentHandler.redraw(out);
	
			out.push('</div></td><td class="', zcls, '-inner-r"><span class="', zcls, '-space"></span></td></tr></tbody></table></td>');
	
		} else {
			//ADDED: append DIV for border
			out.push('<li', this.domAttrs_(), '><div class="', zcls, '-cl"><div class="', zcls, '-cr"><div class="', zcls, '-cm">')
			
			out.push('<a href="javascript:;" id="', uuid,
					'-a" class="', zcls, '-cnt ', zcls, '-cnt-img">', this.domContent_(), '</a></div></div></div>'); //ADDED:
			if (this.menupopup)
				this.menupopup.redraw(out);
			else if (contentHandler)
				contentHandler.redraw(out);
	
			out.push('</li>');
		}
	};
	
	zul.menu.Menuitem.molds['default'] = function (out) {
		var uuid = this.uuid,
			zcls = this.getZclass(),
			btn = zk.ie && !zk.ie8 ? 'input' : 'button',
			target = this.getTarget(),
			img = this.getImage();
	
		if (this.isTopmost()) {
			out.push('<td align="left"', this.domAttrs_(), '><a href="',
					this.getHref() ? this.getHref() : 'javascript:;', '"');
			if (target)
				out.push(' target="', target, '"');
			out.push(' class="', zcls, '-cnt"><table id="', uuid, '-a"', zUtl.cellps0,
					' class="', zcls, '-body');
			if (img) {
				out.push(' ', zcls, '-body');
				if (this.getLabel())
					out.push('-text');
	
				out.push('-img');
			}
			out.push('" style="width: auto;"><tbody><tr><td class="', zcls,
					'-inner-l"><span class="', zcls, '-space"></span></td><td class="', zcls,
					'-inner-m"><div><', btn, ' id="', uuid,
					'-b" type="button" class="', zcls, '-btn"');
			if (img)
				out.push(' style="background-image:url(', img, ')"');
	
			out.push('>', zUtl.encodeXML(this.getLabel()), '&nbsp;</', btn, '></div></td><td class="',
						zcls, '-inner-r"><span class="', zcls, '-space"></span></td></tr></tbody></table></a></td>');
		} else {
			//ADDED: append DIV for border
			out.push('<li', this.domAttrs_(), '><div class="', zcls, '-cl"><div class="', zcls, '-cr"><div class="', zcls, '-cm">');
			var cls = zcls + '-cnt' +
					(!img && this.isCheckmark() ?
							' ' + zcls + (this.isChecked() ? '-cnt-ck' : '-cnt-unck') : ''),
				mold = this.getMold();
			
			out.push('<a href="', this.getHref() ? this.getHref() : 'javascript:;', '"');
			if (target)
				out.push(' target="', target, '"');
			out.push(' id="', uuid, '-a" class="', cls, '">', this.domContent_(), '</a></div></div></div></li>'); //ADDED
		}
	};
	
	/**
	 * Menupopup
	 * 
	 * Fine-tune the popup position
	 */
	var Menupopup = zul.menu.Menupopup;
	Menupopup.prototype.open = function (ref, offset, position, opts) {
		if (this.parent.$instanceof(zul.menu.Menu)) {
			if (!offset) {
				ref = this.parent.$n('a');
				if (!position)
					if (this.parent.isTopmost())
						position = this.parent.parent.getOrient() == 'vertical'
							? 'end_before' : 'after_start';
					else position = 'end_before';
			}
		}
		this.$super('open', ref, offset, position, opts || {sendOnOpen: true, disableMask: true});
		//open will fire onShow which invoke this.zsync()
		
		//ADDED
		/**
		 * Fine-tune 
		 * the popup position, the code below need to be done after this.$super('open);
		 */
		if (this.parent.$instanceof(zul.menu.Menu)) {
			var n = this.$n();
			if (n) {
				var top = zk.parseInt(n.style.top),
					pos = top + 2; //shift the popup position
				jq(n).css('top', pos + 'px');
			}
		}
	};

	Menupopup._rmActive = function (wgt) {
		//*Do not close the Menu widget in Top*//
		if (wgt.parent.$instanceof(zul.menu.Menu)) {
			wgt.parent.$class._rmActive(wgt.parent);
		}
	};
});