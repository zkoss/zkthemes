<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%-- Colorbox --%>
.z-colorbox, .z-colorbox-currcolor {
	width: 42px;
	height: 22px;
}
.z-colorbox {
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	margin:0 2px;
	overflow: hidden;
	display: inline-block;
	vertical-align: middle;
	border: 1px solid #86A4BE;
	padding: 3px;
	background-color:#FFFFFF;
	position: relative;
	<c:if test="${c:isExplorer()}">
		zoom: 1;
		*display: inline;
	</c:if>
}
.z-colorbox-btn, .z-colorbox-currcolor {
	overflow: hidden;
	cursor: pointer;
	position: absolute;
}
.z-colorbox-btn {
	bottom: 1px;
	right: 0;
}
.z-colorbox-currcolor {
	top: 3px;
	left: 3px;
}
.z-colorpicker, .z-colorpicker-gradient, z-colorpicker-bar {
	border: 1px solid #86A4BE;
}
.z-colorbox-disb {
	opacity: .6;
	-moz-opacity: .6;
	filter: alpha(opacity=60);
}
.z-colorbox-disb, .z-colorbox-disb * {
	cursor: default !important;
	color: #AAA !important;
}
<%-- Popup shadow --%>
.z-colorbox-pp,
.z-menu-pp {
	-moz-box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
	-webkit-box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
}
<%-- Colorpicker --%>
.z-colorpicker {
	width: 382px;
	height: 330px;
	overflow: hidden;
	position: relative;
	background-color:#FFFFFF;
}
<%-- Colorpicker gradient--%>
.z-colorpicker-gradient, .z-colorpicker-overlay {
	width: 256px;
	height: 256px;
}
.z-colorpicker-gradient {
	left: 7px;
	top: 31px;
	position: absolute;
	cursor: crosshair;
}
.z-colorpicker-overlay {
	background-image: url(${c:encodeThemeURL('~./zkex/img/colorbox/colorpicker_gradient.png')});
}
.z-colorpicker-circle {
	position: absolute;
	top: 0;
	left: 0;
	width: 11px;
	height: 11px;
	overflow: hidden;
	background-image: url(${c:encodeThemeURL('~./zkex/img/colorbox/colorpicker_select.gif')});
	margin: -5px 0 0 -5px;
}
<%-- Colorpicker hue--%>
.z-colorpicker-hue {
	position: absolute;
	top: 31px;
	left: 272px;
	width: 27px;
	height: 256px;
}
.z-colorpicker-bar, .z-colorpicker-arrows {
	position: absolute;
	overflow: hidden;
	cursor: n-resize;
}
.z-colorpicker-bar {
	width: 12px;
	height: 256px;
	left: 7px;
	background-image: url(${c:encodeThemeURL('~./zkex/img/colorbox/colorpicker_hue.png')});
}
.z-colorpicker-arrows {
	width: 27px;
	height: 9px;
	background-image: url(${c:encodeThemeURL('~./zkex/img/colorbox/colorpicker_arrows.gif')});
	margin: -4px 0 0 0;
	left: 0;
}
<%-- Colorpicker colors --%>
.z-colorpicker-color {
	top: 34px;
	left: 315px;
	border: double;
	position: absolute;
	background: transparent;
}
.z-colorpicker-newcolor, .z-colorpicker-currcolor {
	position: relative;
	width: 48px;
	height: 32px;
}
.z-colorpicker-newcolor {
	border-bottom: 1px solid;
}
.z-colorpicker-currcolor {
	border-top: 1px solid;
}
<%-- Colorpicker input --%>
.z-colorpicker-r, .z-colorpicker-g, .z-colorpicker-b,
.z-colorpicker-h, .z-colorpicker-s, .z-colorpicker-v {
	position: absolute;
	left: 310px;
}
.z-colorpicker-r {
	top: 122px;
}
.z-colorpicker-g {
	top: 147px;
}
.z-colorpicker-b {
	top: 172px;
}
.z-colorpicker-h {
	top: 212px;
}
.z-colorpicker-s {
	top: 237px;
}
.z-colorpicker-v {
	top: 262px;
}
.z-colorpicker-r-text, .z-colorpicker-g-text, .z-colorpicker-b-text,
.z-colorpicker-h-text, .z-colorpicker-s-text, .z-colorpicker-v-text,
.z-colorpicker-r-inp, .z-colorpicker-g-inp, .z-colorpicker-b-inp,
.z-colorpicker-h-inp, .z-colorpicker-s-inp, .z-colorpicker-v-inp,
.z-colorpicker-hex-text, .z-colorpicker-hex-inp {
	font-family: ${fontFamilyC};
	font-size: ${fontSizeM};
	font-weight: normal;
}
.z-colorpicker-r-inp, .z-colorpicker-g-inp, .z-colorpicker-b-inp,
.z-colorpicker-h-inp, .z-colorpicker-s-inp, .z-colorpicker-v-inp {
	margin-left: 5px;
	text-align: left;
}
<%-- Colorpicker input : hex --%>
.z-colorpicker-hex {
	position: absolute;
	top: 300px;
	left: 10px;	
}
.z-colorpicker-hex-inp {
	margin-left: 5px;
}
<%-- Colorpicker btn --%>
.z-colorpicker-ok-btn, .z-colorpicker-cancel-btn {
	cursor: pointer;
	top: 300px;
	position: absolute;
}
.z-colorpicker-ok-btn {
	left: 328px;
	width: 42px;
}
.z-colorpicker-cancel-btn {
	left: 275px;
	width: 42px;
}
<%-- Color Palette --%>
.z-colorpalette {
	width: 256px; 
	height: 220px;
	border: 1px solid #86A4BE;
	background-color: #FFFFFF;
	padding-left: 4px;
}
.z-colorpalette-newcolor {
	width: 50px;
	height: 20px;
	border: 1px solid #86A4BE;
	margin: 4px 2px;
	position: relative;
	left: 123px;
}
.z-colorpalette-hex-inp, .z-colorpalette-btn {
	position: absolute;
	top: 5px;
	left: 185px;
}
.z-colorpalette-hex-inp {
	width: 65px;
	height: 16px;
}

.z-colorbox-palette-btn,
.z-menu-palette-btn,
.z-colorbox-picker-btn,
.z-menu-picker-btn {
	z-index: 10;
	width: 22px;
	height: 22px;
	cursor: pointer;
	position: absolute;
	background: url(${c:encodeThemeURL('~./zkex/img/colorbox/cb-buttons.gif')});
}

.z-colorbox-palette-btn,
.z-menu-palette-btn {
	left: 6px;
	top: 5px;
	background-position: 0 0;
}
.z-colorbox-picker-btn,
.z-menu-picker-btn {
	left: 31px;
	top: 5px;
	background-position: 0 -44px;
}
.z-palette-btn .z-colorbox-palette-btn,
.z-palette-btn .z-menu-palette-btn {
	left: 6px;
	background-position: 0 -22px;
}
.z-palette-btn .z-colorbox-picker-btn,
.z-palette-btn .z-menu-picker-btn {
	left: 31px;
}
.z-picker-btn .z-colorbox-picker-btn,
.z-picker-btn .z-menu-picker-btn {
	background-position: 0 -66px;
}
.z-colorpalette-colorbox {
	width: 12px; 
	height: 12px; 
	float: left; 
	border: 1px solid #FFFFFF;
	display: inline;
}
.z-colorpalette-colorbox-over {
	border: 1px solid #000000;
}