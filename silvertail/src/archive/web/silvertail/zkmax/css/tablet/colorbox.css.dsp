<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>

<c:set var="size" value="32" />
<c:set var="border" value="1" />
<c:set var="space" value="5" />
<c:set var="gradientSize" value="384" />

.z-colorbox,
.z-colorbox-currcolor {
	height: 24px;
	width: 42px;
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
.z-menu-pp {
	${t:boxShadow('1px 1px 3px rgba(0, 0, 0, 0.5)')}
}
.z-colorbox-pp {
	${t:boxShadow('0 0 15px rgba(0, 0, 0, 0.35)')}
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

.z-colorpalette {
	width: ${(size + border * 2) * 18 + border * 4}px; 
	height: ${(size + border * 2) * 14 + border * 4 + space}px;
	border: ${border}px solid #86A4BE;
	background-color: #FFFFFF;
	padding-left: ${border * 4}px;
}

.z-colorpalette-newcolor {
	width: ${size*2}px;
	height: ${size}px;
	border: ${border}px solid #86A4BE;
	left: ${(size + border * 2) * 6}px;
	margin: 4px 2px;
	position: relative;
}

.z-colorpalette-colorbox {
	width: ${size}px; 
	height: ${size}px; 
	float: left; 
	border: 1px solid #FFFFFF;
	display: inline;
}

.z-colorpalette-hex-inp {
	position: absolute;
	top: 5px;
	left: ${(size + border * 2) * 8 + 10}px;
	/* input will be larger then assign size */
	width: ${size * 3 - 5}px;
	height: ${size - 10}px;
	font-family: ${fontFamilyC};
	font-size: ${fontSizeS};
	font-weight: normal;
}

.z-colorpalette-ok-btn {
	position: absolute;
	top: ${space}px;
	left: ${(size + border * 2) * 18 + border * 4 - size * 3 - space}px;
	width: ${size * 3}px;
	height: ${size}px;
}

<%-- Color Picker --%>
.z-colorpicker {
	width: ${gradientSize + (size + space * 2) * 7 + space}px;
	height: ${gradientSize + size * 1.5 + space * 2}px;
	overflow: hidden;
	position: relative;
	background-color:#FFFFFF;
}

.z-colorpicker-gradient, .z-colorpicker-overlay {
	width: ${gradientSize}px;
	height: ${gradientSize}px;
}

.z-colorpicker-gradient {
	left: ${space*2}px;
	top: ${space * 2 + size}px;
	position: absolute;
	cursor: crosshair;
}

.z-colorpicker-overlay {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/colorbox/colorpicker_gradient.png')});
}
.z-colorpicker-circle {
	position: absolute;
	top: 0;
	left: 0;
	width: 11px;
	height: 11px;
	overflow: hidden;
	margin: -5px 0 0 -5px;
	background-image: url(${c:encodeThemeURL('~./zkex/img/colorbox/colorpicker_select.gif')});
}
<%-- Color Picker HUE --%>
.z-colorpicker-hue {
	position: absolute;
	top: ${space * 2 + size}px;
	left: ${gradientSize + size * 0.5 + space * 3}px;
	width: ${size}px;
	height: ${gradientSize}px;
}
.z-colorpicker-bar, .z-colorpicker-arrows {
	position: absolute;
	overflow: hidden;
	cursor: n-resize;
}

.z-colorpicker-bar {
	width: ${size}px;
	height: ${gradientSize}px;
	left: ${space}px;
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/colorbox/colorpicker_hue.png')});
}

.z-colorpicker-arrows {
	width: 40px;
	height: 10px;
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/colorbox/colorpicker_arrows.png')});
	margin: -4px 0 0 0;
	left: 1px;
}

<%-- Color Picker right area --%>
<c:set var="rLeft" value="${gradientSize + size * 1.5 + space * 7}" />
.z-colorpicker-color {
	top: ${(size + space * 2) * 5}px;
	left: ${rLeft + space}px;
	border: double;
	position: absolute;
	background: transparent;
}

.z-colorpicker-newcolor, .z-colorpicker-currcolor {
	position: relative;
	width: ${size * 2}px;
	height: ${size}px;
}

.z-colorpicker-ok-btn {
	top: ${space}px;
	left: ${gradientSize + (size + space * 2) * 6.5 - size * 3 - space * 2}px;
	width: ${size * 3}px;
	height: ${size}px;
	position: absolute;
}

<%-- Color picker input --%>
.z-colorpicker-hex {
	position: absolute;
	top: ${(size + space * 2) * 5}px;
	left: ${rLeft + size * 3 - space * 3}px;
}

.z-colorpicker-hex-inp {
	width: ${size * 2 - 5}px;
	height: ${size - 5}px;
	margin-left: 5px;
}

.z-colorpicker-r {
	position: absolute;
	top: ${space * 3 + size}px;
	left: ${rLeft - space}px;
}
.z-colorpicker-g {
	position: absolute;
	top: ${(size + space * 2) * 2 + space}px;
	left: ${rLeft - space}px;
}
.z-colorpicker-b {
	position: absolute;
	top: ${(size + space * 2) * 3 + space}px;
	left: ${rLeft - space}px;
}
.z-colorpicker-h {
	position: absolute;
	top: ${space * 3 + size}px;
	left: ${rLeft + size * 3}px;
}
.z-colorpicker-s {
	position: absolute;
	top: ${(size + space * 2) * 2 + space}px;
	left: ${rLeft + size * 3}px;
}
.z-colorpicker-v {
	position: absolute;
	top: ${(size + space * 2) * 3 + space}px;
	left: ${rLeft + size * 3}px;
}

.z-colorpicker-r-text, .z-colorpicker-g-text, .z-colorpicker-b-text,
.z-colorpicker-h-text, .z-colorpicker-s-text, .z-colorpicker-v-text,
.z-colorpicker-r-inp, .z-colorpicker-g-inp, .z-colorpicker-b-inp,
.z-colorpicker-h-inp, .z-colorpicker-s-inp, .z-colorpicker-v-inp,
.z-colorpicker-hex-text, .z-colorpicker-hex-inp {
	font-family: ${fontFamilyC};
	font-size: ${fontSizeS};
	font-weight: normal;
}

.z-colorpicker-r-inp, .z-colorpicker-g-inp, .z-colorpicker-b-inp,
.z-colorpicker-h-inp, .z-colorpicker-s-inp, .z-colorpicker-v-inp {
	width: ${size * 2 - 20}px;
	height: ${size - 10}px;
	margin-left: 5px;
}
<%-- palette/picker swap buttonz --%>
.z-colorbox-palette-btn,
.z-menu-palette-btn,
.z-colorbox-picker-btn,
.z-menu-picker-btn {
	z-index: 10;
	width: ${size}px;
	height: ${size}px;
	cursor: pointer;
	position: absolute;
	background: url(${c:encodeThemeURL('~./zkmax/img/tablet/colorbox/cb-buttons.png')});
}

.z-colorbox-palette-btn,
.z-menu-palette-btn {
	left: ${space * 2}px;
	top: ${space}px;
	background-position: 0 0;
}

.z-colorbox-picker-btn,
.z-menu-picker-btn {
	left: ${size + border * 2 + space * 4}px;
	top: ${space}px;
	background-position: 0 ${-size}px;
}

.z-palette-btn .z-colorbox-palette-btn,
.z-palette-btn .z-menu-palette-btn {
	left: ${space}px;
	background-position: ${-size}px 0;
}

.z-palette-btn .z-colorbox-picker-btn,
.z-palette-btn .z-menu-picker-btn {
	left: ${size + border * 2 + space * 3}px;
}

.z-picker-btn .z-colorbox-picker-btn,
.z-picker-btn .z-menu-picker-btn {
	background-position: ${-size}px ${-size}px;
}