/* inp.breeze.js

	Purpose:

	Description:

	History:
		Tue Jun 20 09:41:42     2010, Created by simon

Copyright (C) 2010 Potix Corporation. All Rights Reserved.
*/
zk.afterLoad('zul.inp', function(){
	
	/** Errorbox **/
	zul.inp.Errorbox.prototype._fixarrow = function () {
		var parent = this.parent.$n(),
			node = this.$n(),
			//arrow = this.$n('a'), // REMOVED
			pointer = this.$n('p'), // ADDED
			ptofs = zk(parent).revisedOffset(),
			nodeofs = zk(node).revisedOffset();
		var dx = nodeofs[0] - ptofs[0], dy = nodeofs[1] - ptofs[1], dir;
		// MODIFIED: conditions of direction
		if (dx >= parent.offsetWidth - 22) {
			dir = dy < 6 - node.offsetHeight ? "ld": dy >= parent.offsetHeight - 7 ? "lu": "l";
		} else if (dx < 20 - node.offsetWidth) {
			dir = dy < 6 - node.offsetHeight ? "rd": dy >= parent.offsetHeight - 7 ? "ru": "r";
		} else {
			dir = dy < 0 ? "d": "u";
		}
		
		// ADDED: for setting the pointer position
		if(dir == "d" || dir == "u") {
			var md = (Math.max(dx, 0) + Math.min(node.offsetWidth + dx, parent.offsetWidth))/2 - dx - 6,
				mx = node.offsetWidth - 11;
			pointer.style.left = (md>mx? mx : md<1? 1 : md) + "px";
			if(dir == "d") { 
				pointer.style.top = null;
				pointer.style.bottom = zk.ie6_? "-14px" : "-5px"; 
			} else { 
				pointer.style.top = "-5px"; 
			}
		} else if(dir == "l" || dir == "r") {
			var md = (Math.max(dy, 0) + Math.min(node.offsetHeight + dy, parent.offsetHeight))/2 - dy - 6,
				mx = node.offsetHeight - 11;
			pointer.style.top = (md>mx? mx : md<1? 1 : md) + "px";
			if(dir == "r") { 
				pointer.style.left = null;
				pointer.style.right = "-5px"; 
			} else { 
				pointer.style.left = "-5px"; 
			}
		} else {
			if(dir == "lu" || dir== "ld"){
				pointer.style.left = "5px";
			} else {
				pointer.style.left = null;
				pointer.style.right = "5px";
			}
			if(dir == "ru" || dir == "lu"){
				pointer.style.top = "-10px";
			} else {
				pointer.style.top = null;
				pointer.style.bottom = zk.ie6_? "-14px" : "-10px";
			}
		}
		
		//arrow.className = 'z-errbox-left z-arrow-' + dir; // REMOVED
		pointer.className = 'z-pointer z-pointer-' + dir; // ADDED
	};
	/** InputWidget **/
	var _xInputWidget = {}
	zk.override(zul.inp.InputWidget.prototype, _xInputWidget, {
		setReadonly: function (readonly) {
			var inp = this.getInputNode();
			if (inp) {
				var zcls = this.getZclass(),
					fnm = readonly ? 'addClass': 'removeClass';
				inp.readOnly = readonly;
				jq(this.$n())[fnm](zcls + '-real-readonly'); //ADDED
				jq(inp)[fnm](zcls + '-readonly');
				
				if (!this.inRoundedMold()) return;
				
				var btn = this.$n('btn');
				jq(btn)[fnm](zcls + '-btn-readonly');
				
				if (zk.ie6_)		
					jq(btn)[fnm](zcls + (this._buttonVisible ? '-btn-readonly':
													'-btn-right-edge-readonly'));
			}
		},
		domClass_: function (no) {
			var sc = this.$supers('domClass_', arguments),
				zcls = this.getZclass();
			if ((!no || !no.zclass) && this._disabled)
				sc += ' ' + zcls + '-disd';
			
			if ((!no || !no.input) && this._inplace)
			sc += ' ' + this.getInplaceCSS();
			
			// ADDED
			if ((!no || !no.zclass) && this._readonly)
				sc += ' ' + zcls + '-real-readonly';
			
			return sc;
		}
	});
	/** ComboWidget **/
	// FIXED
	var _xComboWidget = {}
	zk.override(zul.inp.ComboWidget.prototype, _xComboWidget, {
		bind_: function () {
			this.$supers(zul.inp.ComboWidget, 'bind_', arguments);

			var btn = this.$n('btn'),
				inp = this.getInputNode();
				
			if (this._inplace)
				jq(inp).addClass(this.getInplaceCSS());
				
			if (btn) {
				this._auxb = new zul.Auxbutton(this, btn, inp);
				this.domListen_(btn, 'onClick', '_doBtnClick');
			}
			// FIXED: _readonly -> !_buttonVisible
			if (!this._buttonVisible && !this.inRoundedMold())
				jq(inp).addClass(this.getZclass() + '-right-edge');
			
			zWatch.listen({onSize: this, onShow: this, onFloatUp: this, onResponse: this});
			if (!zk.css3) jq.onzsync(this);
			
			// NOTE: merge with getPopupNode_ in 5.0.4
			this.setFloating_(true,{node:this.$n("pp")});
		}
	});
	/** Combobox **/
	zul.inp.Combobox.prototype.bind_ = function() {
		this.$supers(zul.inp.Combobox, 'bind_', arguments);
	};
	
	/** Bandbox **/
	zul.inp.Bandbox.prototype.bind_ = function() {
		this.$supers(zul.inp.Bandbox, 'bind_', arguments);
	};
	
	/** Spinner **/
	zul.inp.Spinner.prototype._doDropBtnUp = function (evt) {
		if(this.inRoundedMold())
			jq(this._currentbtn).removeClass(this.getZclass() + "-btn-clk");
		else {
			jq(this._currentbtn).removeClass(this.getZclass() + "-btn-up-clk");
			jq(this._currentbtn).removeClass(this.getZclass() + "-btn-down-clk");
		}
		this.domUnlisten_(document.body, "onMouseUp", "_doDropBtnUp"); // FIXED
		this._currentbtn = null;
	};
	zul.inp.Spinner.prototype._btnDown = function(evt){
		if (this.inRoundedMold() && !this._buttonVisible) return;
		var inp = this.inp;
		if(inp.disabled) return;
		if (inp && !inp.disabled && !zk.dragging) {
			if (this._currentbtn)
				this._doDropBtnUp(evt);
			this.domListen_(document.body, "onMouseUp", "_doDropBtnUp"); // FIXED
		}
			this.checkValue();
		
		if (this._isOverUpBtn(evt)) { //up
			this._increase(true);
			this._startAutoIncProc(true);
		} else {
			this._increase(false);
			this._startAutoIncProc(false);
		}
		
		// ADDED
		var sfx = this.inRoundedMold()? "" : this._isOverUpBtn(evt)? "-up":"-down",
				btn = this.$n("btn" + sfx);
		this._currentbtn = btn;
		jq(btn).addClass(this.getZclass() + "-btn" + sfx + "-clk");
		
		// disable browser's text selection
		evt.stop();
	};
	zul.inp.Spinner.prototype._isOverUpBtn = function(evt){
		var btn = this.$n("btn"),
			ofs = zk(btn).revisedOffset();
		return (evt.pageY - ofs[1]) < btn.offsetHeight/2;
	};
	//Fixed in 5.0.3, but need to override for working with earlier version
	zul.inp.Spinner.prototype.bind_ = function () {
		this.$supers(zul.inp.Spinner, 'bind_', arguments); 
		this.timeId = null;
		var inp = this.inp = this.$n("real"),
			btn = this.$n("btn");
		zWatch.listen({onSize: this, onShow: this});
		
		if (this._inplace)
			jq(inp).addClass(this.getInplaceCSS());

		// FIXED: _readonly -> !_buttonVisible
		if (!this._buttonVisible && !this.inRoundedMold())
			jq(inp).addClass(this.getZclass() + '-right-edge');
		
		if(btn)
			this.domListen_(btn, "onmousedown", "_btnDown")
				.domListen_(btn, "onmouseup", "_btnUp")
				.domListen_(btn, "onmouseout", "_btnOut")
				.domListen_(btn, "ommouseover", "_btnOver");
		
		this.syncWidth();
	};
	//Fixed in 5.0.3, but need to override for working with earlier version
	zul.inp.Spinner.prototype.unbind_ = function () {
		if(this.timerId){
			clearTimeout(this.timerId);
			this.timerId = null;
		}
		zWatch.unlisten({onSize: this, onShow: this});
		var btn = this.$n("btn");
		if(btn)
			this.domUnlisten_(btn, "onmousedown", "_btnDown")
				.domUnlisten_(btn, "onmouseup", "_btnUp")
				.domUnlisten_(btn, "onmouseout", "_btnOut")
				.domUnlisten_(btn, "ommouseover", "_btnOver");
		
		this.$supers(zul.inp.Spinner, 'unbind_', arguments);
	};
	// Spinner mold
	zul.inp.Spinner.molds['default'] = function (out) {
		var zcls = this.getZclass(),
			uuid = this.uuid,
			isRounded = this.inRoundedMold(),
			isButtonVisible = this._buttonVisible;
		
		out.push('<i', this.domAttrs_({text:true}), '>',
				'<input id="', uuid,'-real"', 'class="', zcls,'-inp');
		//ADDED
		if(!isRounded && !isButtonVisible)
			out.push(" ", zcls, "-right-edge");
		out.push('"', this.textAttrs_(),'/>', '<i id="', uuid,'-btn"',
				'class="', zcls,'-btn ');
		
		if (isRounded) {
			if (!isButtonVisible)
				out.push(' ', zcls, '-btn-right-edge');
			if (this._readonly)
				out.push(' ', zcls, '-btn-readonly');	
			if (zk.ie6_ && !isButtonVisible && this._readonly)
				out.push(' ', zcls, '-btn-right-edge-readonly');
		} else if (!isButtonVisible)
			out.push('" style="display:none"');	
		
		out.push('">');
		// ADDED: for splitting timebox/spinner button to two pieces
		if(!isRounded)
			out.push('<div id="', uuid, '-btn-up" class="', zcls, '-btn-upper"></div>',
					'<div id="', uuid, '-btn-down" class="', zcls, '-btn-lower"></div>');
		out.push('</i></i>');
	};
	
	/** Timebox **/
	zul.inp.Timebox.prototype._dodropbtnup = function (evt) {
		if(this.inRoundedMold())
			jq(this._currentbtn).removeClass(this.getZclass() + "-btn-clk");
		else {
			jq(this._currentbtn).removeClass(this.getZclass() + "-btn-up-clk");
			jq(this._currentbtn).removeClass(this.getZclass() + "-btn-down-clk");
		}
		this.domUnlisten_(document.body, "onMouseup", "_dodropbtnup");
		this._currentbtn = null;
	};
	zul.inp.Timebox.prototype._btnDown = function(evt) {
		if (this.inRoundedMold() && !this._buttonVisible) return;
		var inp = this.getInputNode();

		if(!inp || inp.disabled) return;
		if (this._currentbtn)
			this._dodropbtnup(evt);
		this.domListen_(document.body, "onMouseup", "_dodropbtnup");
		
		if (!this._fmthdler)
			this._parseFormat(this._format);

		if (!inp.value)
			inp.value = this.coerceToString_();
			
		if (this._isOverUpBtn(evt)) { //up
			this._doUp();
			this._startAutoIncProc(true);
		} else {
			this._doDown();
			this._startAutoIncProc(false);
		}
		// ADDED
		var sfx = this.inRoundedMold()? "" : this._isOverUpBtn(evt)? "-up":"-down",
			btn = this.$n("btn" + sfx);
		this._currentbtn = btn;
		jq(btn).addClass(this.getZclass() + "-btn" + sfx + "-clk");
		
		// cache it for IE
		this._lastPos = this._getPos();
		this._changed = true;
		
		// disable browser's text selection
		evt.stop();
	};
	zul.inp.Timebox.prototype._isOverUpBtn = function(evt){
		var btn = this.$n("btn"),
			ofs = zk(btn).revisedOffset();
		return (evt.pageY - ofs[1]) < btn.offsetHeight/2;
	};
	// Fixed in 5.0.3, but need to override for working with 5.0.2
	zul.inp.Timebox.prototype.bind_ = function () {
		this.$supers(zul.inp.Timebox, 'bind_', arguments);
		var inp = this.getInputNode(),
			btn = this.$n("btn");
		zWatch.listen({onSize: this, onShow: this});

		if (this._inplace)
			jq(inp).addClass(this.getInplaceCSS());

		// FIXED: _readonly -> !_buttonVisible
		if (!this._buttonVisible && !this.inRoundedMold())
			jq(inp).addClass(this.getZclass() + '-right-edge');
		
		if (btn) {
			this.domListen_(btn, "onmousedown", "_btnDown");
			this.domListen_(btn, "onmouseup", "_btnUp");
			this.domListen_(btn, "onmouseout", "_btnOut");
			this.domListen_(btn, "onmouseover", "_btnOver");
		}
		this.syncWidth();
	};
	//Fixed in 5.0.3, but need to override for working with 5.0.2
	zul.inp.Timebox.prototype.unbind_ = function () {
		if(this.timerId){
			clearTimeout(this.timerId);
			this.timerId = null;
		}
		zWatch.unlisten({onSize: this, onShow: this});
		var btn = this.$n("btn");
		if (btn) {
			this.domUnlisten_(btn, "onmousedown", "_btnDown");
			this.domUnlisten_(btn, "onmouseup", "_btnUp");
			this.domUnlisten_(btn, "onmouseout", "_btnOut");
			this.domUnlisten_(btn, "onmouseover", "_btnOver");
		}
		this._changed = false;
		this.$supers(zul.inp.Timebox, 'unbind_', arguments);
	};
	// Timebox mold
	zul.inp.Timebox.molds['default'] = zul.inp.Spinner.molds['default'];	
	
});