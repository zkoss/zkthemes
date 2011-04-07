/* mesh.breeze.js

	Purpose:

	Description:

	History:
		Tue Jun 20 09:41:42     2010, Created by sam

Copyright (C) 2010 Potix Corporation. All Rights Reserved.
*/

zk.afterLoad('zul.mesh', function () {
	/**
	 * Returns whether the string is integer or not
	 * @return boolean 
	 */
	function _isUnsignedInteger(s) {
		  return (s.toString().search(/^[0-9]+$/) == 0);
	}
	
	
	var Paging = zul.mesh.Paging;
	/**
	 * Render Anchor differently base on target
	 * 
	 * Anchor with page number: append border about this type of anchor
	 * Anchor with label: use default
	 */
	Paging.prototype.appendAnchor = function (zclass, out, label, val, seld) {
		var zcls = zclass + "-cnt" + (seld ? " " + zclass + "-seld" : ""),
			isInt = _isUnsignedInteger(label);
		if ( !isInt )
			zclass += '-label';
		zclass += '-cnt' + (seld ? '-seld' : '');
		if (isInt)
			out.push('<div class="', zclass, '-l"><div class="', zclass, '-r"><div class="', zclass, '-m">');
		out.push('<a class="', zcls, '" href="javascript:;" onclick="zul.mesh.Paging.go(this,',
				val, ')">', label, '</a>');
		if (isInt)
			out.push('</div></div></div>');
	};
	
	Paging.prototype.bind_ = function () {
		this.$supers('bind_', arguments);
		if (this.getMold() == "os") return;
		var uuid = this.uuid,
			inputs = jq.$$(uuid, 'real'),
			zcls = this.getZclass(),
			Paging = this.$class;
	
		if (!this.$weave)
			for (var i = inputs.length; i--;)
				jq(inputs[i]).keydown(Paging._domKeyDown)
					.blur(Paging._domBlur);
		
		for (var postfix = ['first', 'prev', 'last', 'next'], k = postfix.length; k--; ) {
			var btn = jq.$$(uuid, postfix[k]);
			for (var j = btn.length; j--;) {
				if (!this.$weave)
					jq(btn[j]).mouseover(Paging._domMouseOver)
						.mouseout(Paging._domMouseOut)
						.mousedown(Paging._domMouseDown)
						.click(Paging['_dom' + postfix[k] + 'Click']);
	
				if (this._pageCount == 1)
					jq(btn[j]).addClass(zcls + "-btn-disd");
				else if (postfix[k] == 'first' || postfix[k] == 'prev') {
					if (this._activePage == 0) jq(btn[j]).addClass(zcls + "-btn-disd");
				} else if (this._activePage == this._pageCount - 1) {
					jq(btn[j]).addClass(zcls + "-btn-disd");
				}
			}
		}
		/**
		 * Added
		 */
		if (this.getMold() == 'os') {
			var childs = jq(this.$n()).find('div a'),
				i = childs.length;
			while (i-- > 0) {
				this.domListen_(childs[i], 'onMouseOver', '_doMouseEvt')
					.domListen_(childs[i], 'onMouseOut', '_doMouseEvt');
			}
		}
	};
	
	Paging.prototype._doMouseEvt =  function (evt) {
		var n = evt.domTarget,
			zcls = this.getZclass() + '-cnt-l';
			btn = jq(n).parents('.' + zcls)[0];
		jq(btn)[evt.name == 'onMouseOver' ? 'addClass' : 'removeClass'](zcls + '-over');
	};
	
	zul.mesh.Paging.molds['default'] = function (out) {
		if (this.getMold() == "os") {
			out.push('<div', this.domAttrs_(), '>', this._innerTags(), '</div>');
			return;
		}
		var uuid = this.uuid,
			zcls = this.getZclass();
		out.push('<div name="', uuid, '"', this.domAttrs_(), '>', '<table', zUtl.cellps0,
				'><tbody><tr><td><table id="', uuid, '-first" name="', uuid, '-first"',
				zUtl.cellps0, ' class="', zcls, '-btn"><tbody><tr>',
				'<td class="', zcls, '-btn-l"></td>',
				'<td class="', zcls, '-btn-m"><em unselectable="on">',
				'<button type="button" class="', zcls, '-first"> </button></em></td>',
				'<td class="', zcls, '-btn-r"></td></tr></tbody></table></td>',
				'<td><table id="', uuid, '-prev" name="', uuid, '-prev"', zUtl.cellps0,
				' class="', zcls, '-btn"><tbody><tr><td class="', zcls, '-btn-l"></td>',
				'<td class="', zcls, '-btn-m"><em unselectable="on"><button type="button" class="',
				zcls, '-prev"> </button></em></td><td class="', zcls, '-btn-r"></td>',
				'</tr></tbody></table></td><td><span class="', zcls, '-sep"></span></td>',
				'<td><span class="', zcls, '-text"></span></td><td><input id="',
				uuid, '-real" name="', uuid, '-real" type="text" class="', zcls,
				'-inp" value="', this.getActivePage() + 1, '" size="3"/></td>',
				'<td><span class="', zcls, '-text">/ ', this.getPageCount(), '</span></td>',
				'<td><span class="', zcls, '-sep"></span></td><td><table id="', uuid,
				'-next" name="', uuid, '-next"', zUtl.cellps0, ' class="', zcls, '-btn">',
				'<tbody><tr><td class="', zcls, '-btn-l"></td><td class="',
				zcls, '-btn-m"><em unselectable="on"><button type="button" class="',
				zcls, '-next"> </button></em></td><td class="', zcls, '-btn-r"></td>',
				'</tr></tbody></table></td><td><table id="', uuid, '-last" name="',
				uuid, '-last"', zUtl.cellps0, ' class="', zcls, '-btn"><tbody><tr>',
				'<td class="', zcls, '-btn-l"></td><td class="', zcls,
				'-btn-m"><em unselectable="on"><button type="button" class="', zcls,
				'-last"> </button></em></td><td class="', zcls, '-btn-r"></td>',
				'</tr></tbody></table></td></tr></tbody></table>');
				
		if (this.isDetailed()) out.push(this._infoTags());
		out.push('</div>');
	};
});