/* tab.breeze.js

	Purpose:

	Description:

	History:
		Tue Jun 20 09:41:42     2010, Created by simon

Copyright (C) 2010 Potix Corporation. All Rights Reserved.
*/
zk.afterLoad('zul.tab', function(){
	
	/** Tabs **/
	// MODIFIED: now in vertical orientation Tabs has no border, but Tabpanels 
	// still has border, so we need to introduce a 2px offset
	zul.tab.Tabs.prototype._fixHgh = function () {
		var tabs = this.$n(),
			tabbox = this.getTabbox(),
			tbx = tabbox.$n(),
			head = this.$n("header"),
			u = this.$n("up"),
			d = this.$n("down"),
			cave =  this.$n("cave"),
			btnsize = u && d ? isNaN(u.offsetHeight + d.offsetHeight) ? 0 : u.offsetHeight + d.offsetHeight : 0;
		//fix tabpanels's height if tabbox's height is specified
		//Ignore accordion since its height is controlled by each tabpanel
		if (tabbox.isVertical()) {
			var child = jq(tbx).children('div');
			allTab = jq(cave).children();
			if (tbx.style.height) {
				this._forceStyle(tabs, "h", jq.px0(jq(tabs).zk.revisedHeight(tbx.offsetHeight, true)));
			} else {
				this._forceStyle(tbx, "h", jq.px0(allTab.length * 35));//give it default height
				this._forceStyle(tabs, "h", jq.px0(jq(tabs).zk.revisedHeight(tbx.offsetHeight, true)));
			}
			//coz we have to make the header full
			if (tabbox._scrolling) {
				this._forceStyle(head, "h", jq.px0(tabs.offsetHeight - btnsize));
			} else {
				this._forceStyle(head, "h", jq.px0(jq(head).zk.revisedHeight(tabs.offsetHeight, true)));
			}
			//separator(+border)
			this._forceStyle(child[1], "h", jq.px0(jq(child[1]).zk.revisedHeight(tabs.offsetHeight, true)));
			//tabpanels(+border)
			this._forceStyle(child[2], "h", jq.px0(jq(child[1]).zk.revisedHeight(tabs.offsetHeight - 2, true))); // MODIFIED
		} else {
			if (head) //accordion have no head
				head.style.height = "";
		}
	};
	// Tabs mold
	zul.tab.Tabs.molds['default'] = function (out) {
		var zcls = this.getZclass(),
			tbx = this.getTabbox(),
			uuid = this.uuid;
		
		out.push('<div ', this.domAttrs_(), '>');
		if (tbx.isVertical()) {
			out.push('<div id="', uuid, '-header" class="', zcls, '-header">',
					'<ul id="', uuid, '-cave" class="', zcls, '-cnt">');
			for (var w = this.firstChild; w; w = w.nextSibling)
				w.redraw(out);
			// MODIFIED: introduce a few small divs to achieve "button is always 
			// at the middle" feature
			out.push('<li id="', uuid, '-edge" class="', zcls, '-edge"></li></ul></div>',
					'<div id="', uuid, '-up"><div class="', zcls, '-up-scroll-hl">', 
					'</div><div class="',zcls,'-up-scroll-hr"></div></div><div id="', uuid, '-down"><div class="', zcls, 
					'-down-scroll-hl"></div><div class="',zcls,'-down-scroll-hr"></div></div></div><div id="', uuid,
					'-line" class="', zcls, '-space" ></div>');
		} else {
			var hasToolbar = tbx.isTabscroll() && tbx.toolbar;
			if (hasToolbar) {
				out.push('<div class="', tbx.toolbar.getZclass(), '-outer">');
					tbx.toolbar.redraw(out);	
			}
			out.push('<div id="', uuid, '-right">', '</div>',
				'<div id="', uuid, '-left">', '</div>', '<div id="', uuid, '-header"',
				' class="', zcls, '-header" >', '<ul id="', uuid, '-cave"', 'class="', zcls, '-cnt">');
				for (var w = this.firstChild; w; w = w.nextSibling)
					w.redraw(out);
			out.push('<li id="', uuid, '-edge"', ' class="', zcls, '-edge" ></li>',
				'<div id="',uuid,'-clear" class="z-clear"> </div>',
				'</ul></div>');
			if (hasToolbar)	out.push('</div>');	
			out.push('<div id="', uuid, '-line"',
				' class="', zcls, '-space" ></div></div>');
		}
	};
	
	/** Tab **/
	// MODIFIED: remove hardcoded style.cursor setting so it can be configured in CSS
	zul.tab.Tab.prototype.bind_ = function (desktop, skipper, after) {
		this.$supers('bind_', arguments);
		var closebtn = this.$n('close'),
			tab = this;
		if (closebtn) {
			this.domListen_(closebtn, "onClick", '_doCloseClick');
			if (zk.ie6_)
				this.domListen_(closebtn, "onMouseOver", '_toggleBtnOver')
					.domListen_(closebtn, "onMouseOut", '_toggleBtnOver');
		}
		
		after.push(function () {
			zk.afterMount(function () {
	   			if (tab.isSelected()) 
	   				tab._sel(false, true);
	   			else if (tab.parent._isInited())
	   				tab.parent._scrollcheck("init");
			});
		});
	};
	// Tab mold
	zul.tab.Tab.molds['default'] = function (out) {
		var zcls = this.getZclass(),
			tbx = this.getTabbox(),
			uuid = this.uuid;
		if (tbx.inAccordionMold()) {//Accordion
			if (tbx.getMold() == 'accordion-lite') {
				out.push('<div id="', this.uuid, '"', this.domAttrs_(), '>',
					'<div align="left" class="', zcls, '-header">');
				if (this.isClosable())
					out.push('<a id="', this.uuid, '-close" class="', zcls, '-close"></a>');
	
				out.push('<div href="javascript:;" id="', this.uuid, '-tl" class="', zcls, '-tl">',
						'<div class="', zcls, '-tr">',
						'<span class="', zcls, '-tm">',
						'<span class="', zcls, '-text">', this.domContent_(),
						'</span></span></div></div></div></div>');
			} else {
				if (tbx.getPanelSpacing() && this.getIndex())
					out.push('<div style="margin:0;display:list-item;width:100%;height:', 
							tbx.getpanelSpacing(), ';"></div>');
				
				// MODIFIED: remove unneeded tl, tr, hl, hr
				// MODIFIED: put button under header instead of hm
				out.push('<div id="', this.uuid, '"', this.domAttrs_(), '>',
						'<div align="left" class="', zcls, '-header" >');
				if (this.isClosable())
					out.push('<a id="', this.uuid, '-close" class="', zcls, '-close"></a>');
	
				out.push('<div class="', zcls, '-hm" ><span class="', zcls, '-text">', 
						this.domContent_(), '</span></div></div></div>');
			}
		} else {
			out.push('<li ', this.domAttrs_(), '>');
			if (this.isClosable())
				out.push('<a id="', uuid, '-close" class="', zcls, '-close"', 'onClick="return false;" ></a>');
			else if (tbx.isVertical())
				out.push('<a class="', zcls, '-noclose" ></a>');
	
			out.push('<div id="', uuid, '-hl" class="', zcls, '-hl"><div id="', uuid, '-hr" class="', zcls, '-hr">');
			if (this.isClosable())
				out.push('<div id="', uuid, '-hm" class="', zcls, '-hm ', zcls, '-hm-close">');
			else
				out.push('<div id="', uuid, '-hm" class="', zcls, '-hm ">');
			out.push('<span class="', zcls, '-text">', this.domContent_(), '</span></div></div></div></li>');
		}
	};
	
});