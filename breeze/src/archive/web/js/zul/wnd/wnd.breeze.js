/* wnd.breeze.js

	Purpose:

	Description:

	History:
		Tue Jun 20 09:41:42     2010, Created by simon

Copyright (C) 2010 Potix Corporation. All Rights Reserved.
*/
zk.afterLoad('zul.wnd', function(){
	
	/** Window **/
	// MODIFIED: use _withFrame rather than hardcoded condition
	zul.wnd.Window.prototype._offsetHeight = function (n) {
		var h = n.offsetHeight - this._titleHeight(n);
		if(this._withFrame()) {
			var cave = this.$n('cave'),
				bl = jq(n).find('>div:last')[0],
				cap = this.$n("cap");
			h -= bl.offsetHeight;
			if (cave) h -= zk(cave.parentNode).padBorderHeight();
			if (cap) h -= zk(cap.parentNode).padBorderHeight();
		}
		return h - zk(n).padBorderHeight();
	};
	// MODIFIED: use _withFrame rather than hardcoded condition
	zul.wnd.Window.prototype._titleHeight = function (n) {
		var cap = this.$n('cap'),
			$tl = jq(n).find('>div:first'), tl = $tl[0];
		return cap ? cap.offsetHeight + tl.offsetHeight:
			this._withFrame() ? tl.offsetHeight: 0;
	};
	// ADDED: factored out from original code
	zul.wnd.Window.prototype._withFrame = function() {
		return this._mode != 'popup' && (this._mode != 'embedded' || this.getBorder() != "none");
	};
	// Window mold
	zul.wnd.Window.molds['default'] = function (out, skipper) {
		var zcls = this.getZclass(),
		uuid = this.uuid,
		title = this.getTitle(),
		caption = this.caption,
		contentStyle = this.getContentStyle(),
		contentSclass = this.getContentSclass(),
		mode = this.getMode(),
		withFrame = this._withFrame(), // MODIFIED
		noborder = 'normal' != this.getBorder() ? '-noborder' : '';
		
		out.push('<div', this.domAttrs_(), '>');
	
		if (caption || title) {
			out.push('<div class="', zcls, '-tl"><div class="',
				zcls, '-tr"></div></div><div class="',
				zcls, '-hl"><div class="', zcls,
				'-hr"><div class="', zcls, '-hm"><div id="',
				uuid, '-cap" class="', zcls, '-header">');
		
			if (caption) caption.redraw(out);
			else {
				if (this.isClosable())
					out.push('<div id="', uuid, '-close" class="', zcls, '-icon ', zcls, '-close"></div>');
				if (this.isMaximizable()) {
					out.push('<div id="', uuid, '-max" class="', zcls, '-icon ', zcls, '-max');
					if (this.isMaximized())
						out.push(' ', zcls, '-maxd');
					out.push('"></div>');
				}
				if (this.isMinimizable())
					out.push('<div id="' + uuid, '-min" class="', zcls, '-icon ', zcls, '-min"></div>');
				out.push(zUtl.encodeXML(title));
			}
			out.push('</div></div></div></div>');
		} else if (withFrame)
			out.push('<div class="', zcls, '-tl', noborder,
					'"><div class="', zcls, '-tr', noborder, '"></div></div>'); // ADDED
		
		if (withFrame)
			out.push('<div class="', zcls, '-cl', noborder,
				'"><div class="', zcls, '-cr', noborder,
				'"><div class="', zcls, '-cm', noborder, '">');
		
		out.push('<div id="', uuid, '-cave" class="');
		if (contentSclass) out.push(contentSclass, ' ');
		out.push(zcls, '-cnt', noborder, '"');
		if (contentStyle) out.push(' style="', contentStyle, '"');
		out.push('>');
		
		if (!skipper)
			for (var w = this.firstChild; w; w = w.nextSibling)
				if (w != caption)
					w.redraw(out);
		out.push('</div>');
		if (withFrame)
			out.push('</div></div></div><div class="', zcls, '-bl', noborder,
				'"><div class="', zcls, '-br', noborder, '"></div></div>');
		out.push('</div>');
	};
	
	/** Panel **/
	//MODIFIED: Panel has top rounded corner when framable is false and caption
	//is avaiable, so the condition for top is now isFramable || cap
	//also need to take off 2px for extra borders
	zul.wnd.Panel.prototype._titleHeight = function (n) {
		var isFramable = this.isFramable(),
			cap = this.$n('cap'),
			top = isFramable || cap ? jq(n).find('> div:first-child')[0].offsetHeight: 0;
		return cap ? (isFramable ? jq(n).find('> div:first-child').next()[0].offsetHeight : cap.offsetHeight + 2) + top : top;
	};
	// Panel mold
	zul.wnd.Panel.molds['default'] = function (out, skipper) {
		var zcls = this.getZclass(),
		uuid = this.uuid,
		title = this.getTitle(),
		caption = this.caption,
		framable = this.isFramable(),
		noborder = this.getBorder() != 'normal',
		noheader = !caption && !title;
		
		out.push('<div', this.domAttrs_(), '>');
		if (caption || title) {
			// MODIFIED: framable -> true
			out.push('<div class="', zcls, '-tl"><div class="', zcls, 
					'-tr"></div></div><div class="', zcls, '-hl"><div class="', 
					zcls, '-hr"><div class="', zcls, '-hm">');
			out.push('<div id="', uuid, '-cap" class="', zcls, '-header ');
			if (!framable && noborder) out.push(zcls, '-header-noborder');		
			out.push('">');
			if (!caption) {
				if (this.isClosable())
					out.push('<div id="', uuid, '-close" class="', zcls, '-icon ',
							zcls, '-close"></div>');
				if (this.isMaximizable()) {
					out.push('<div id="', uuid, '-max" class="', zcls, '-icon ', zcls, '-max');
					if (this.isMaximized())
						out.push(' ', zcls, '-maxd');
					out.push('"></div>');
				}
				if (this.isMinimizable())
					out.push('<div id="', uuid, '-min" class="', zcls, '-icon ',
							zcls, '-min"></div>');
				if (this.isCollapsible())
					out.push('<div id="', uuid, '-exp" class="', zcls, '-icon ',
							zcls, '-exp"></div>');
				out.push(zUtl.encodeXML(title));
			} else caption.redraw(out);
			out.push('</div>');
			
			// MODIFIED: framable -> true
			out.push('</div></div></div>');
		} else if (framable) {
			// MODIFIED: use -gray zclass for tl/tr in desktop mold
			out.push('<div class="', zcls,'-tl-gray"><div class="', zcls, 
					'-tr-gray"></div></div>');
		}
		out.push('<div id="', uuid, '-body" class="', zcls, '-body"');
		if (!this.isOpen()) out.push(' style="display:none;"');
		out.push('>');
		
		if (framable) {
			out.push('<div class="', zcls, '-cl"><div class="', zcls,
					'-cr"><div class="', zcls, '-cm');
			if (noheader) out.push(' ', zcls, '-noheader');
			out.push('">');		
		}
		if (this.tbar) {
			out.push('<div id="', uuid, '-tb" class="', zcls, '-top');
			
			if (noborder) out.push(' ', zcls, '-top-noborder');
			if (noheader) out.push(' ', zcls, '-noheader');
			out.push('">');
			this.tbar.redraw(out);
			out.push('</div>');
		}
		if (this.panelchildren) this.panelchildren.redraw(out);
			
		if (this.bbar) {
			out.push('<div id="', uuid, '-bb" class="', zcls, '-btm');
			
			if (noborder) out.push(' ', zcls, '-btm-noborder');
			if (noheader) out.push(' ', zcls, '-noheader');
			out.push('">');
			this.bbar.redraw(out);
			out.push('</div>');
		}
		
		if (framable) {
			out.push('</div></div></div><div class="', zcls, '-fl');
			if (!this.fbar) out.push(' ', zcls, '-nobtm2');
			out.push('"><div class="', zcls, '-fr"><div class="', zcls, '-fm">');
		}
		if (this.fbar) {
			out.push('<div id="', uuid, '-fb" class="', zcls, '-btm2">');
			this.fbar.redraw(out);
			out.push('</div>');
		}
		if (framable) out.push('</div></div></div><div class="', zcls, 
				'-bl"><div class="', zcls ,'-br"></div></div>');
		out.push('</div></div>');
	};
	
});