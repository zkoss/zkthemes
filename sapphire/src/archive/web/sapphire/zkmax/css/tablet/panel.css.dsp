<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>

.z-panel,
.z-panel-head,
.z-panel-header,
.z-panel-body {
	overflow: hidden;
}
.z-panel-header {
	line-height: 36px;
	padding: 6px 0;
	font-size: ${fontSizeS};
	font-weight: normal;
	font-family: ${fontFamilyT};
	color: ${G_Font_Color2};
	font-weight: bold;
	${G_TextShadow}
	background-image: none;
	
}
.z-panel-head {
	${t:gradient(G_Background_Gradient_Direction, '#E5EFF7 0%; #E1EDF4 100%')}
	padding: 5px 5px 0;
	border: 1px solid rgba(17,17,17, 0.3);
	${t:boxShadow('inset 0px 1px 1px #FFFFFF')}
	overflow: hidden;
	${t:borderRadius('5px 5px 0 0')};
	border-bottom-color: #C5C5C5;
}
.z-panel-body {
	overflow: hidden;
	background: #F1F9FF;
	padding: 4px;
	border: 1px solid rgba(17,17,17, 0.3);
	border-top-width: 0;
	${t:borderRadius('0 0 5px 5px')}
}

.z-panel-noframe > .z-panel-body {
	background: transparent;
	padding: 0;
	border: 0;
}

.z-panel-noheader.z-panel-noframe > .z-panel-body > .z-panelchildren-noheader {
	border-top-width: 1px;
}

.z-panel-noframe > .z-panel-body > .z-panelchildren {
	border-top-width: 0;
}
.z-panel-noheader > .z-panel-body {
	border-top-width: 1px;
	${t:borderRadius('5px')};
}

.z-panel-shadow {
	${t:borderRadius('4px')}
	${t:boxShadow('0 0 3px rgba(0, 0, 0, 0.5)')}
}
.z-panel-resize-faker {
	position: absolute;
	border: 1px dashed #1854C2;
	overflow: hidden;
	z-index: 60000;
	left: 0;
	top: 0;
	background-color: #D7E6F7;
	opacity: .5;
}

.z-panel-move-ghost {
	position: absolute;
	background: #D7E6F7;
	overflow: hidden;
	opacity: .6 !important;
	cursor: move !important;
}
.z-panel-move-block {
	border: 2px dashed #B2CAD6;
}
.z-panel-move-ghost dl {
	border: 1px solid #B2CAD6;
	margin: 0;
	overflow: hidden;
	padding: 0;
	display: block;
	background: #D7E6F7;
	line-height: 0;
	font-size: 0;
}

.z-panelchildren {
	overflow: hidden;
	background-color: white;
	border: 1px solid #C5C5C5;
	position: relative;
}
<%-- This is for fixing border of toolbars at different position --%>
.z-panel-body > .z-panel-top > .z-toolbar,
.z-panel-body > .z-panel-btm > .z-toolbar {
	border: 1px solid #C5C5C5;
	border-top: 0;
	overflow: hidden;
	padding: 2px;
	min-height
}
.z-panel-body > .z-panel-top .z-toolbar {
	border-top: 1px solid #C5C5C5;
	border-bottom: 0;
}
.z-panelchildren-noheader {
	border-top: 1px solid #C5C5C5;
}
<%-- Panel noborder --%>
.z-panel-noborder.z-panel-noframe > .z-panel-body,
.z-panel-noborder.z-panel-noframe > .z-panel-body > .z-panelchildren-noborder,
.z-panel-noborder > .z-panel-body > .z-panel-btm > .z-toolbar {
	border: 0;
}

<%-- Panel Tool --%>
.z-panel-icon {
	overflow: hidden; 
	float: right;
	margin-left: 2px;
	cursor: pointer;
	border: 1px solid ${G_Background_Border_Color};
	${t:borderRadius('6px')}
	background-position: center center;
	background-repeat: no-repeat;
	height: 32px;
	width: 32px;
}
.z-panel-icon:active {
	border-top-color: ${G_Background_Active_Border_Color_TL};
	border-left-color: ${G_Background_Active_Border_Color_TL};
	border-bottom-color: ${G_Background_Active_Border_Color_BR};
	border-right-color: ${G_Background_Active_Border_Color_BR};
	
	${t:gradient(G_Background_Button_Gradient_Direction, G_Background_Active)}
	${t:boxShadow(G_Background_Active_Shadow)}
}

.z-panel-min {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/wnd/min.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background)};
}
.z-panel-max {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/wnd/max.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background)};
}
.z-panel-maxd {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/wnd/maxd.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background)};
}
.z-panel-close {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/wnd/close.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background)};
}
.z-panel-exp{
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/wnd/exp.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background)};
}
.z-panel-colpsd .z-panel-exp {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/wnd/colpsd.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background)};
}

.z-panel-body .z-panel-top .z-toolbar,
.z-panel-body .z-panel-btm .z-toolbar {
	padding: 8px 8px 7px;
}
.z-panel-colpsd {
	height:auto !important;
}