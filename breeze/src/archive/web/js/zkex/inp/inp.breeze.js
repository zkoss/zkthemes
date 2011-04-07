/* inp.breeze.js

	Purpose:

	Description:

	History:
		Tue Jun 20 09:41:42     2010, Created by sam

Copyright (C) 2010 Potix Corporation. All Rights Reserved.
*/

zk.afterLoad('zkex.inp', function () {
	/**
	 * Colorbox
	 */
	var Colorbox = zkex.inp.Colorbox;
	Colorbox.prototype._open = false;
	Colorbox.prototype._syncShadow = function (target) {
		if (!this._popupShadow)
			this._popupShadow = new zk.eff.Shadow(this.$n("pp"), {stackup:(zk.useStackup === undefined ? zk.ie6_: zk.useStackup)});
		this._popupShadow.sync();
	};
	Colorbox.prototype._hideShadow = function () {
		var shadow = this._popupShadow;
		if (shadow)
			shadow.hide();
	};

	Colorbox.prototype._doBtnClick = function (evt) {
		var isOpen = this._open;
		if (this._open = !isOpen)
			this.openPopup();
		else
			this.closePopup();
		evt.stop();
	};
	Colorbox.prototype.bind_ = function () {
		this.$supers('bind_', arguments);
		
		if (!this._disabled)
			this.domListen_(this.$n(), 'onClick', '_doBtnClick');

		var paletteBtn = this.$n('palette-btn'),
			pickerBtn = this.$n('picker-btn');
		if (paletteBtn) {
			this._palette.$n().style.display = "none";
			this.domListen_(paletteBtn, 'onClick', 'openPalette');
		}
		if (pickerBtn) {
			this._picker.$n().style.display = "none";
			this.domListen_(pickerBtn, 'onClick', 'openPicker');
		}

		zWatch.listen({onSize: this, onShow: this});
	};
	Colorbox.prototype.unbind_ = function () {
		if (!this._disabled)
			this.domUnlisten_(this.$n(), 'onClick', '_doBtnClick');		
		zWatch.unlisten({onSize: this, onShow: this});
		
		if (this._popupShadow)
			this._popupShadow.destroy();

		this.domUnlisten_(this.$n('palette-btn'), 'onClick', 'openPalette')
			.domUnlisten_(this.$n('picker-btn'), 'onClick', 'openPicker');
		this.$supers('unbind_', arguments);
	};


	Colorbox.prototype.openPopup = function () {
		this._open = true;
		var node = this.$n(),
			pp = this.$n("pp"),
			picker = this._picker.$n();

		this.closePicker();
		this.openPalette();
		
		pp.style.width = pp.style.height = "auto";
		pp.style.position = "absolute";
		pp.style.overflow = "auto";
		pp.style.display = "block";
		pp.style.zIndex = "88000";
		jq(pp).zk.makeVParent();
		zk(pp).position(node, this._getPosition());
		this._syncShadow();
	};
	Colorbox.prototype.onHide = Colorbox.prototype.closePopup = function () {
		this._open = false;
		var node = this.$n(),
			pp = this.$n("pp");
		jq(pp).zk.undoVParent();
		this._hideShadow();
	};
	Colorbox.prototype.openPalette = function () {
		var pp = this._palette.$n();
		if (!pp)
			return;

		var picker = this._picker.$n();
		if (picker && zk(picker).isVisible())
			this.closePicker();
		pp.style.display = "block";
		jq(this.$n("pp")).addClass('z-palette-btn');
		this._syncShadow();

		var palette = this._palette;
		palette.setColor(this._currColor.getHex());
		palette.onShow();
	};
	Colorbox.prototype.closePalette = function (close) {
		var pp = this._palette.$n();
		if (!pp || !zk(pp).isVisible()) return;

		pp.style.display = "none";
		jq(this.$n("pp")).removeClass('z-palette-btn');
		
		if (close)
			this.closePopup();
	};

	Colorbox.prototype.openPicker = function () {
		var pp = this._picker.$n();
		if (!pp)
			return;

		this.closePalette();
		pp.style.display = "block";
		jq(this.$n("pp")).addClass('z-picker-btn');
		this._syncShadow();
		
		var picker = this._picker;
		picker.setColor(this._currColor.getHex());
		picker.onShow();
	};
	Colorbox.prototype.closePicker = function () {
		var pp = this._picker.$n();
		if (!pp || !zk(pp).isVisible()) return;

		pp.style.display = "none";
		jq(this.$n("pp")).removeClass('z-picker-btn');
	};
	Colorbox.prototype.onShow = Colorbox.prototype.onSize = function () {
		var colorNode = this.$n('currcolor');

		if (colorNode) {
			var	width = this.getWidth(),
				height = this.getHeight(),
				color = this._currColor;
			colorNode.style.backgroundColor = color.getHex();
			if (width) {
				var currColorWidth = colorNode.style.width;
				if (currColorWidth != width)
					colorNode.style.width = width;
			}
			if (height) {
				var currColorHeight = colorNode.style.height;
				if (currColorHeight != height)
					colorNode.style.height = height;
			}
		}
	};
	Colorbox.molds['default'] = function (out) {
		var zcls = this.getZclass(),
			uuid = this.uuid,
			imgSrc = zk.ajaxURI('/web/zkex/img/colorbox/select.gif', {desktop: this.desktop, au: true}),
			picker = this._picker,
			palette = this._palette;
			
		out.push('<div', this.domAttrs_(), '>',
		'<i id="', uuid, '-currcolor" class="', zcls, '-currcolor"></i>',
		'<img id="', uuid, '-btn" class="', zcls, '-btn" src="', imgSrc, '"></img>');
		if (picker || palette) {
			out.push('<div id="', uuid, '-pp" style="display:none;" class="', zcls, '-pp">', palette ? '<div id="' + uuid + '-palette-btn" class="' + zcls + '-palette-btn"></div>' : '', 
					picker ? '<div id="' + uuid + '-picker-btn" class="' + zcls + '-picker-btn"></div>' : '');
			if (picker)
				picker.redraw(out);
			if (palette)
				palette.redraw(out);
			out.push('</div>');
		}
		out.push('</div>');
	};
	
	/**
	 * ContentHandler
	 */
	var ContentHandler = zkex.inp.ContentHandler;
	ContentHandler.prototype.redraw = function (out) {
	 	var wgt = this._wgt,
			uuid = wgt.uuid,
			zcls = wgt.getZclass(),
			picker = this._picker,
			palette = this._palette;
		
		switch (this._type) {
		case 'color':
			out.push('<div id="', uuid, '-cnt-pp" style="display:none;" class="', zcls, '-pp">', palette ? '<div id="' + uuid + '-palette-btn" class="' + zcls + '-palette-btn"></div>' : '', 
					picker ? '<div id="' + uuid + '-picker-btn" class="' + zcls + '-picker-btn"></div>' : '');
			if (picker)
				this._picker.redraw(out);
			if (palette)
				this._palette.redraw(out);
			out.push('</div>');
			break;
		case 'content':
			out.push('<div id="', uuid, '-cnt-pp" class="', zcls, '-cnt-pp" style="display:none"><div class="', zcls,'-cnt-body">', this._content, '</div></div>');
		}
	};

	ContentHandler.prototype.openContent = function () {
		var	pp = this._pp;
		if (!pp) return;

		if (this._type == 'color')
			this.openPalette();
		
		pp.style.width = pp.style.height = "auto";
		pp.style.position = "absolute";
		pp.style.overflow = "auto";
		pp.style.display = "block";
		pp.style.zIndex = "88000";
		jq(pp).zk.makeVParent();

		zk(pp).position(this._wgt.$n(), this.getPosition());
		this._syncShadow();
	};

	ContentHandler.prototype.onShow = function () {
		this.openContent();
	};

	ContentHandler.prototype.onHide = function (close) {
		var pp = this._pp;
		if (!pp || !zk(pp).isVisible()) return;

		pp.style.display = "none";
		jq(pp).zk.undoVParent();
		this._hideShadow();
		if (close)
			zWatch.fire('onFloatUp', null);
	};

	ContentHandler.prototype.bind = function () {
	 	var wgt = this._wgt,
			uuid = wgt.uuid,
			type = this._type;
		if (!wgt.menupopup) {
			wgt.domListen_(wgt.$n(), 'onClick', 'onShow');
			zWatch.listen({onFloatUp: wgt, onHide: wgt});
		}
		this._pp = jq('#' + wgt.uuid + '-' + 'cnt-pp')[0];
		switch (type) {
		case 'color':
			if (!this._color)
				this._color = new zkex.inp.Color();
			var img = wgt.$n('img');
			if (img)
				img.style.backgroundColor = this._color.getHex();
			
			var palette = jq('#' + uuid + '-palette-btn')[0],
				picker = jq('#' + uuid + '-picker-btn')[0],
				self = this;
			jq('#' + uuid + '-palette-btn').bind('click', function () {
				self.openPalette();
			});
			jq('#' + uuid + '-picker-btn').bind('click', function () {
				self.openPicker();
			});
			break;
		case 'content':
			break;
		}
	};
	ContentHandler.prototype.unbind = function () {
	 	var wgt = this._wgt,
	 		uuid = wgt.uuid;
	 	if (!wgt.menupopup) {
			wgt.domUnlisten_(wgt.$n(), 'onClick', 'onShow');
			
			if (this._shadow) {
				this._shadow.destroy();
				this._shadow = null;
			}
			this._pp = null;
			switch (this._type) {
			case 'color':
				jq('#' + uuid + '-palette-btn').unbind('click');
				jq('#' + uuid + '-picker-btn').unbind('click');
				this._color = null;
				break;
			case 'content':
				zWatch.unlisten({onFloatUp: this, onHide: this});
				break;
			}
		}
	}
	ContentHandler.prototype.isOpen = function () {
		var pp = this._pp;
		return pp && zk(pp).isVisible();
	};

	ContentHandler.prototype._syncShadow = function () {
		if (!this._shadow)
			this._shadow = new zk.eff.Shadow(this._pp, {stackup:(zk.useStackup === undefined ? zk.ie6_: zk.useStackup)});
		this._shadow.sync();
	};

	ContentHandler.prototype._hideShadow = function () {
		this._shadow.hide();
	};

	ContentHandler.prototype.openPalette = function () {
		var node = this._wgt.$n(),
			pp = this._palette.$n();
		if (!node || !pp)
			return;
		
		var picker = this._picker.$n();
		if (picker && zk(picker).isVisible())
			this.closePicker();
		
		pp.style.display = "block";
		jq(this._wgt.$n('cnt-pp')).addClass('z-palette-btn');
		this._syncShadow();
		
		var palette = this._palette;
		palette.setColor(this._color.getHex());
		palette.onShow();
	};

	ContentHandler.prototype.closePalette = function (close) {
	 	var pp = this._palette.$n();
		if (!pp || !zk(pp).isVisible()) return;

		pp.style.display = "none";
		jq(this._wgt.$n('cnt-pp')).removeClass('z-palette-btn');
		if (close)
			zWatch.fire('onFloatUp', null);
	};

	ContentHandler.prototype.openPicker = function () {
		var wgt = this._wgt,
			node = wgt.$n(),
			pp = this._picker.$n();
		if (!node || !pp)
			return;
		
		this.closePalette();
		pp.style.display = "block";
		jq(this._wgt.$n('cnt-pp')).addClass('z-picker-btn');
		this._syncShadow();
		
		var picker = this._picker;
		picker.setColor(this._color.getHex());
		picker.onShow();
	};

	ContentHandler.prototype.closePicker = function (close) {
		var pp = this._picker.$n();
		if (!pp || !zk(pp).isVisible()) return;

		pp.style.display = "none";
		jq(this._wgt.$n('cnt-pp')).removeClass('z-picker-btn');
		if (close)
			zWatch.fire('onFloatUp', null);
	};
	
	/**
	 * Color Palette
	 */
	function getCell (out, r, g, b, zcls) {
		var color = new zkex.inp.Color();
		color.setRGB(r, g, b);

		var hex = color.getHex();
		out.push('<div class="', zcls, '-colorbox" style="background-color: ',
		hex, ';cursor:pointer;"><span style="display:none;">', hex, '</span></div>')
	}
	zkex.inp.PalettePop.prototype.redraw = function (out) {
		var zcls = this.getZclass(),
			uuid = this.uuid,
			j = k = i = 0;
		out.push('<div id="', uuid, '" class="', zcls, '">',
		'<div id="', uuid, '-newcolor" class="', zcls, '-newcolor"></div>',
		'<input id="', uuid, '-hex-inp" class="', zcls, '-hex-inp" type="text" size="7" maxlength="7"></input>');
		for (j = 0; j < 12; j++) {
			for (k = 0; k < 3; k++)
				for (i = 0; i <= 5; i++)
					out.push(getCell(out, k * 51 + (j % 2) * 51 * 3, Math.floor(j / 2) * 51, i * 51, zcls));
		}

		//grayscale
		j = 0;
		for (i = 0; i < 16; i++) {
			j = Math.floor((i + i * 16) % 256);
			out.push(getCell(out, j, j, j, zcls));
		}
		//add 2 white cell in the end
		out.push(getCell(out, 255, 255, 255, zcls));
		out.push(getCell(out, 255, 255, 255, zcls));

		out.push('</div>');
	};
	zkex.inp.PalettePop.prototype.onHide = function () {
		this._wgt.onHide();
	};
	zkex.inp.PalettePop.prototype.onFloatUp = function (ctl) {
		if (!zUtl.isAncestor(this.parent, ctl.origin))
			this._wgt.onHide();
	};
	
	/**
	 * Color Picker
	 */
	function arrowsIgnoreDrag (dg, pt, evt) {
		var wgt = dg.control,
			newColor = wgt.getNewColor(),
			arrowsNode = dg.node,
			offset = zk(wgt.$n('bar')).revisedOffset(),
			y = pt[1] - offset[1];
		arrowsNode.style.top = jq.px(y);
		newColor.setHSV((256 - y) * 359.99 / 255,
						newColor.getSaturation(),
						newColor.getValue());
		wgt._colorChanged('arrows');
		return false;
	}
	function arrowsSnap (dg, pt) {
		var lowBound = 0,
			upBound = 255,
			y = pt[1];
		y = y < lowBound ? lowBound : y > upBound ? upBound : y;

		return [pt[0], y];
	}
	function onArrowsChanging (dg, pt, evt) {
		var wgt = dg.control,
			newColor = wgt._newColor,
			arrowsNode = wgt.$n('arrows'),
			y = zk.parseInt(arrowsNode.style.top);

		newColor.setHSV((256 - y) * 359.99 / 255,
						newColor.getSaturation(),
						newColor.getValue());
		wgt._colorChanged("arrows");
	}
	function circleIgnoreDrag (dg, pt, evt) {
		var wgt = dg.control,
			newColor = wgt.getNewColor(),
			offset = zk(wgt.$n('overlay')).revisedOffset(),
			circleNode = dg.node,
			x = pt[0] - offset[0],
			y = pt[1] - offset[1],
			sat = x / 255,
			val = 1 - y / 255;

		circleNode.style.left = jq.px(x);
		circleNode.style.top = jq.px(y);
		newColor.setHSV(newColor.getHue(), sat, val);
		wgt._colorChanged();
		return false;
	}
	function circleSnap (dg, pt) {
		var lowBound = 0,
			upBound = 255,
			x = pt[0],
			y = pt[1];
		x = x < lowBound ? lowBound : x > upBound ? upBound : x;
		y = y < lowBound ? lowBound : y > upBound ? upBound : y;
		return [x, y];
	}
	function onCircleChanging (dg, pt, evt) {
		var wgt = dg.control,
			newColor = wgt._newColor,
			circleNode = wgt.$n('circle'),
			x = zk.parseInt(circleNode.style.left),
			y = zk.parseInt(circleNode.style.top),
			sat = x / 255,
			val = 1 - (y / 255);

		newColor.setHSV(newColor.getHue(), sat, val);
		wgt._colorChanged();
	}
	
	var PickerPop = zkex.inp.PickerPop;
	PickerPop.prototype.onHide = function () {
		this._wgt.onHide();
	};
	PickerPop.prototype.onFloatUp = function (ctl) {
		if (!zUtl.isAncestor(this.parent, ctl.origin))
			this._wgt.onHide();
	};
	PickerPop.prototype._doOk = function (evt) {
		var wgt = this._wgt;
		wgt.onChange(this._newColor.getHex());
		wgt.onHide(true);
		evt.stop();
	};
	//Remove cancel button
	PickerPop.prototype.redraw = function (out) {
		var zcls = this.getZclass(),
			uuid = this.uuid,
			okImgSrc = zk.ajaxURI('/web/zkex/img/colorbox/accept.gif', {au: true}),
			cancelImgSrc = zk.ajaxURI('/web/zkex/img/colorbox/cancel.gif', {au: true});
		
		out.push('<div', this.domAttrs_(), '>',
		'<div id="', uuid, '-gradient" class="', zcls, '-gradient">',
		'<div id="', uuid, '-overlay" class="', zcls, '-overlay"></div>',
		'<div id="', uuid, '-circle" class="', zcls, '-circle"></div></div>',
		'<div id="', uuid, '-hue" class="', zcls, '-hue">',
		'<div id="', uuid, '-bar" class="', zcls, '-bar"></div>',
		'<div id="', uuid, '-arrows" class="', zcls, '-arrows"></div></div>',
		'<div id="', uuid, '-color" class="', zcls, '-color">',
		'<div id="', uuid, '-newcolor" class="', zcls, '-newcolor"></div>',
		'<div id="', uuid, '-currcolor" class="', zcls, '-currcolor"></div></div>',
		'<div id="', uuid, '-hex" class="', zcls, '-hex" >',
		'<label id="', uuid, '-hex-text" class="', zcls, '-hex-text">Hex:</label>',
		'<input id="', uuid, '-hex-inp" class="', zcls, '-hex-inp" type="text" size="8" maxlength="7"></input></div>',
		'<div id="', uuid, '-r" class="', zcls + "-r", '">',
		'<label id="', uuid, '-r-text" class="', zcls, '-r-text">R.</label>',
		'<input id="', uuid, '-r-inp" class="', zcls, '-r-inp" type="text" size="3" maxlength="3"></input></div>',
		'<div id="', uuid, '-g" class="', zcls, '-g">',
		'<label id="', uuid, '-g-text" class="', zcls, '-g-text">G.</label>',
		'<input id="', uuid, '-g-inp" class="', zcls, '-g-inp" type="text" size="3" maxlength="3"></input></div>',
		'<div id="', uuid, '-b" class="', zcls, '-b">',
		'<label id="', uuid, '-b-text" class="', zcls, '-b-text">B.</label>',
		'<input id="', uuid, '-b-inp" class="', zcls, '-b-inp" type="text" size="3" maxlength="3"></input></div>',
		'<div id="', uuid, '-h" class="', zcls, '-h">',
		'<label id="', uuid, '-h-text" class="', zcls, '-h-text">H.</label>',
		'<input id="', uuid, '-h-inp" class="', zcls, '-h-inp" type="text" size="3" maxlength="3"></input></div>',
		'<div id="', uuid, '-s" class="', zcls, '-s">',
		'<label id="', uuid, '-s-text" class="', zcls, '-s-text">S.</label>',
		'<input id="', uuid, '-s-inp" class="', zcls, '-s-inp" type="text" size="3" maxlength="3"></input></div>',
		'<div id="', uuid, '-v" class="', zcls, '-v">',
		'<label id="', uuid, '-v-text" class="', zcls, '-v-text">V.</label>',
		'<input id="', uuid, '-v-inp" class="', zcls, '-v-inp" type="text" size="3" maxlength="3"></input></div>',
		'<button type="button" id="', uuid, '-ok-btn" class="', zcls, '-ok-btn"><img src="', okImgSrc,'"></img></button>',
		'</div>');
	};
	//Remove doCancel
	PickerPop.prototype.bind_ = function () {
		this.$supers(PickerPop, 'bind_', arguments);

		var arrowsNode = this.$n('arrows'),
			hueHandle = this.$n('hue'),
			circleNode = this.$n('circle'),
			overlayHandle = this.$n('gradient');

		this._arrowsDrag = new zk.Draggable(this, arrowsNode, {
			constraint: "vertical",
			handle: hueHandle,
			ignoredrag: arrowsIgnoreDrag,
			snap: arrowsSnap,
			change: onArrowsChanging,
			endeffect: zk.$void
		});
		this._circleDrag = new zk.Draggable(this, circleNode, {
			handle: overlayHandle,
			ignoredrag: circleIgnoreDrag,
			snap: circleSnap,
			change: onCircleChanging,
			endeffect: zk.$void
		});

		this.domListen_(this.$n('ok-btn'), "onClick", "_doOk");
		this.domListen_(this.$n('hex-inp'), "onBlur", "_doHexChange");

		this.$n('r-inp')._inpSrc = "R";
		this.$n('g-inp')._inpSrc = "G";
		this.$n('b-inp')._inpSrc = "B";
		this.$n('h-inp')._inpSrc = "H";
		this.$n('s-inp')._inpSrc = "S";
		this.$n('v-inp')._inpSrc = "V";

		zWatch.listen({onShow: this, onFloatUp: this, onHide: this});
	};
	//Remove doCancel
	PickerPop.prototype.unbind_ = function () {
		if (this._arrowsDrag) {
			this._arrowsDrag.destroy();
			this._arrowsDrag = null;
		}
		if (this._circleDrag) {
			this._circleDrag.destroy();
			this._circleDrag = null;
		}

		this.domUnlisten_(this.$n('ok-btn'), "onClick", "_doOk");
		this.domUnlisten_(this.$n('hex-inp'), "onBlur", "_doHexChange");

		this.$n('r-inp')._inpSrc = this.$n('g-inp')._inpSrc = this.$n('b-inp')._inpSrc =
		this.$n('h-inp')._inpSrc = this.$n('s-inp')._inpSrc = this.$n('v-inp')._inpSrc = null;

		zWatch.unlisten({onShow: this, onFloatUp: this, onHide: this});
		this.$supers(PickerPop, 'unbind_', arguments);
	};
});