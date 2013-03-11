<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>
.z-caption input, .z-caption td {
	font-size: ${fontSizeXS};
}
.z-caption .z-caption-l, .z-caption .z-caption-r {
	color: ${G_Font_Color2};
	font-size: ${fontSizeXS};
	line-height: 22px;
	height: 22px;
	font-weight: bold;
	${G_TextShadow}
}
.z-caption-l > img {
	vertical-align: text-bottom;
}
.z-caption button, .z-caption .z-button .z-button-btn {
	font-size: ${fontSizeXS}; font-weight: normal;
	padding-top: 0; padding-bottom: 0; margin-top: 0; margin-bottom: 0;
}
.z-caption a, .z-caption a:visited {
	font-size: ${fontSizeXS};
	font-weight: normal;
	color: ${G_Font_Color1};
	background: none;
	text-decoration: none;
}
.z-caption .z-toolbar a, .z-caption .z-toolbar a:visited, .z-caption .z-toolbar a:hover {
	background: none;
	border: 0;
	color: ${G_Font_Color3};
}
.z-caption a:hover {
	text-decoration: underline;
}
<%-- Window --%>
.z-window-modal-header .z-caption-l, 
.z-window-popup-header .z-caption-l, 
.z-window-highlighted-header .z-caption-l,
.z-window-overlapped-header .z-caption-l, 
.z-window-embedded-header .z-caption-l {
	line-height: 36px;
	font-size: ${fontSizeS};
	${G_TextShadow}
}

<%-- Panel --%>
.z-panel-header .z-caption-l {
	line-height: 35px;
	font-size: ${fontSizeS};
	${G_TextShadow}
}