<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>

.z-toolbar {
	border-color: #C5C5C5; 
	border-style: solid; 
	border-width: 0 0 1px; 
	display: block;
	padding: 8px 8px 7px;
	${t:gradient(G_Background_Gradient_Direction, G_Background)}
	position: relative;
}
.z-caption .z-toolbar {
	background: none; border: 0;
}
.z-toolbar-tabs-body, .z-toolbar-tabs-body span,
.z-toolbar-body, .z-toolbar-body span {
	font-size: ${fontSizeXS};
}
<%-- toolbar horizontal alignment --%>
.z-toolbar-start,
.z-toolbar-panel .z-toolbar-panel-start .z-toolbar-panel-cnt {
	float: left; clear: none;
}
.z-toolbar-center,
.z-toolbar-panel .z-toolbar-panel-center .z-toolbar-panel-cnt {
	text-align: center;
	margin: 0 auto;
}
.z-toolbar-end,
.z-toolbar-panel .z-toolbar-panel-end .z-toolbar-panel-cnt {
	float: right; clear: none;
}
<%-- Toolbar Panel Mold--%>
.z-toolbar-panel {
	padding: 5px;
}

.z-toolbar-panel .z-toolbar-panel-body .z-toolbar-panel-hor,
.z-toolbar-panel .z-toolbar-panel-body .z-toolbar-panel-ver {
	border: 0;
	padding: 0;
}
.z-toolbar-panel .z-toolbar-panel-cnt .z-toolbar-panel-hor{
	padding: 3px;
}
.z-toolbar-panel .z-toolbar-panel-cnt .z-toolbar-panel-ver{
	padding: 1px;
}

.z-toolbar-panel .z-toolbar-panel-center{
	text-align: center;
}

<%-- Toolbarbutton --%>
.z-toolbarbutton {
	display:-moz-inline-box;
	display: inline-block;
	position: relative;
	cursor: pointer;
	margin: 0 2px;
	min-height: 26px;
	padding: 1px 0;
	border: 1px solid transparent;
}

.z-toolbarbutton:active {
	border: 1px solid ${G_Background_Active_Border_Color_TL};
	border-color-bottom: ${G_Background_Active_Border_Color_BR};
	border-color-right: ${G_Background_Active_Border_Color_BR};
	${t:borderRadius(G_Background_Button_Border_Radius)}	
	${t:gradient(G_Background_Button_Gradient_Direction, G_Background_Active)}
	${t:boxShadow(G_Background_Active_Shadow)}
}
.z-toolbarbutton-ck {
	border: 1px solid #C6DBE6;
	${t:borderRadius(G_Background_Button_Border_Radius)}
	${t:gradient(G_Background_Button_Gradient_Direction, '#F4FAFD 0%; #E2EFF6 100%')}
}
.z-toolbarbutton-cnt {
	padding: 2px 2px;
	position: relative;
	font-family: ${fontFamilyT};
	font-size: ${fontSizeXS};
	font-weight: normal;
	${G_TextShadow}
	line-height: 28px;
	vertical-align: middle;
}
.z-toolbarbutton-disd * {
	color:gray !important;
	cursor:default !important;
}
.z-toolbarbutton-disd {
	opacity: .5;
	-moz-opacity: .5;
	filter: alpha(opacity=50);
}
