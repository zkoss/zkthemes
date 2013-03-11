<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>

<%-- Local Variable --%>
.z-tabbox,
.z-tabbox-ver,
.z-tabbox-accordion {
	overflow: hidden;
}
.z-tab-text,
.z-tab-ver-text,
.z-tab-accordion-text {
	overflow: hidden;
	text-overflow: ellipsis;
	display: block;
}
.z-tabs-space {
	font-size: 0;
	line-height: 0;
	background: none;
	border: 0;
	height: auto;
}
.z-tabs,
.z-tabs-ver {
	overflow: hidden;
	background: transparent none repeat 0 0;
	border: 0;
	padding: 0;
	margin: 0;
	position: relative;
}
.z-toolbar-tabs {
	overflow: hidden;
	position: absolute;
	background: none repeat scroll 0 0 transparent;
	right: 0;
	top: 0;
	z-index: 1;
	padding: 0 4px;
	border-bottom: 1px solid ${Tabs_Border_Bottom_Color};
}
.z-toolbar-tabs-outer {
	background: none repeat scroll 0 0 transparent;
	border-bottom: 0;
	overflow: auto;
}
.z-tabs-header {
	padding-bottom: 0;
}
.z-tabs-header {
	width: 100%;
	margin: 0;
	position: relative;
	overflow: hidden;
	zoom: 1;
}
.z-tabs-header .z-clear {
	height: 0;
}
.z-tabs-cnt,
.z-tabs-ver-cnt {
	background: none repeat scroll 0 0 transparent;
	padding-left: 0;
	padding-top: 0;
	list-style-image: none;
	list-style-position: outside;
	list-style-type: none;
	display: block;
	margin: 0;
	-moz-user-select: none;
}
.z-tabs-cnt {
	width: 100%;
	border-bottom: 1px solid ${Tabs_Border_Bottom_Color};
}
.z-tabs-ver-cnt {
	height: 4096px;
	border-right: 1px solid ${Tabs_Border_Bottom_Color};
}
.z-tab,
.z-tab-ver {
	position: relative;
	font-family: ${Tab_FontFamily};
	font-size: ${Tab_FontSize};
	font-weight: ${Tab_FontWeight};
	cursor: pointer;
	display: block;
	padding: 0;
	margin: 0;
	-moz-user-select: none;
	border: ${Tab_Border_Width} solid ${Tab_Border_Color};
	border-bottom-color: ${Tab_Border_Bottom_Color};
	${Tab_Background};
	min-height: 32px;
	line-height: 24px;
	${t:applyCSS3('box-sizing', 'border-box')};
}
.z-tab {
	float: left;
	${Tab_Border_Radius};
}
.z-tab-ver {
	${Tab_Ver_Border_Radius};
}
.z-tab-text,
.z-tab-ver-text {
	color: ${Tab_Color};
	cursor: pointer;
	font-family: ${Tab_FontFamily};
	font-size: ${Tab_FontSize};
	font-weight: ${Tab_FontWeight};
	padding: ${Tab_Text_Padding};
	white-space: nowrap;
	${Tab_Text_Shadow};
}
.z-tabs-edge,
.z-tabs-ver-edge {
	margin: 0 !important;
	padding: 0 !important;
	border: 0 none !important;
	background: transparent !important;
	font-size: 0 !important;
	line-height: 0 !important;
	overflow: hidden;
	zoom: 1;
}
.z-tabs-edge {
	float: left;
	width: 1px;
}

.z-tabs-ver-edge {
	height: 1px;
}
.z-tabs-header-scroll {
	margin-left: 32px;
	margin-right: 32px;
}
.z-tabs-scroll,
.z-tabs-ver-scroll {
	background: none repeat scroll 0 0 transparent;
	border: 0;
}
.z-tabs-scroll {
	padding-bottom: 0;
}
.z-tabs-right-scroll,
.z-tabs-left-scroll {
	border: ${Tabs_Scroll_Border_Width} solid ${Tabs_Scroll_Border_Color};
	${Tabs_Scroll_Border_Radius};
	${t:applyCSS3('box-sizing', 'border-box')};
	background: ${Tabs_Scroll_Right_Background};
	top: 0;
	right: 0;
	width: 32px;
	height: 100%;
	cursor: pointer;
	position: absolute;
	z-index: 25;
}
.z-tabs-scroll .z-tabs-left-scroll {
	left: 0;
	background: ${Tabs_Scroll_Left_Background};
}

.z-tabs-scroll .z-tabs-left-scroll:active {
	background-position: -32px 0, 0 0;
	${Tabs_Scroll_Active_Shadow};
}
.z-tabs-scroll .z-tabs-right-scroll:active {
	background-position: -32px -32px, 0 0;
	${Tabs_Scroll_Active_Shadow};
}
.z-tabs-scroll .z-toolbar-tabs-outer .z-tabs-cnt,
.z-tabs .z-toolbar-tabs-outer .z-tabs-cnt {
	border-bottom: 1px solid ${Tabbox_Border_Color};
}
<%-- Selected --%>
.z-tabs-cnt > .z-tab:active {
	${Tab_Active_Background};
	border-bottom-color: ${Tab_Active_Border_Bottom_Color};
	${Tabs_Scroll_Active_Shadow};
}
.z-tabs-cnt > li.z-tab.z-tab-seld:active,
.z-tabs-cnt > .z-tab-seld {
	background: ${Tab_Selected_Background};
	border-bottom: 1px solid ${Tab_Selected_Border_Bottom_Color};
	${Tab_Selected_Shadow};
}
.z-tabs-cnt > li.z-tab.z-tab-seld:active:first-child,
.z-tabs-cnt > .z-tab-seld:first-child {
	background: ${Tab_Selected_Background};
	border-bottom: 1px solid ${Tab_Selected_Border_Bottom_Color};
	${Tab_Selected_FirstChild_Shadow};
}
.z-tab-seld .z-tab-text {
	color: ${Tab_Selected_Color};
	cursor: default;
	font-weight: ${Tab_Selected_FontWeight};
	white-space: nowrap;
	padding-left: ${Tab_Selected_Padding_Left};
}

.z-tabs-cnt > .z-tab-disd.z-tab:active {
	${Tab_Border_Radius};
	${Tab_Background};
	${t:boxShadow('none')}
}
.z-tab-disd .z-tab-text,
.z-tab-disd-seld .z-tab-text {
	cursor: default;
	color: gray;
	opacity: .5;
}

<%-- Tabbox vertical --%>
.z-tabs-ver {
	float:left;
}
.z-tabs-ver-header-scroll {
	margin-top: 32px;
	margin-bottom: 32px;
}
.z-tabs-ver .z-tabs-ver-space,
.z-tabs-ver-space {
	background: none repeat scroll 0 0 transparent;
	border: 0;
	font-size: 0;
	line-height: 0;
	width: 0;
}
.z-tabs-ver-scroll .z-tabs-ver-space {
	background: none;
	border: 0;
	height: auto;
}
.z-tabs-ver-scroll .z-tabs-ver-header {
	background: none repeat scroll 0 0 transparent;
	overflow: hidden;
	position: relative;
}
.z-tabs-ver-space {
	float: left;
	border-left: 0 none;
	position: relative;
}

.z-tabs-ver-scroll .z-tabs-ver-up-scroll,
.z-tabs-ver-scroll .z-tabs-ver-down-scroll {
	border: ${Tabs_Scroll_Border_Width} solid ${Tabs_Scroll_Border_Color};
	${Tabs_Scroll_Border_Radius};
	${t:applyCSS3('box-sizing', 'border-box')};
	background: ${Tabs_Ver_Scroll_Down_Background};
	background-repeat: no-repeat;
	bottom: 0;
	left: 0;
	height: 32px;
	width: 100%;
	cursor: pointer;
	position: absolute;
	z-index: 25;
}
.z-tabs-ver-scroll .z-tabs-ver-up-scroll {
	top: 0;
	background: ${Tabs_Ver_Scroll_Up_Background};
}

.z-tabs-ver-scroll .z-tabs-ver-up-scroll:active {
	background-position: center -32px, 0 0;
	${Tabs_Scroll_Active_Shadow};
}
.z-tabs-ver-scroll .z-tabs-ver-down-scroll:active {
	background-position: center -96px, 0 0;
	${Tabs_Scroll_Active_Shadow};
}

.z-tabs-ver-cnt > li.z-tab-ver.z-tab-ver-seld:active,
.z-tabs-ver-cnt > .z-tab-ver-seld {
	background: ${Tab_Selected_Background};
	border-right: 1px solid ${Tab_Ver_Selected_Border_Right_Color};
	${Tab_Ver_Selected_Shadow};
}
.z-tabs-ver-cnt > li.z-tab-ver.z-tab-ver-seld:active:first-child,
.z-tabs-ver-cnt > .z-tab-ver-seld:first-child {
	background: ${Tab_Selected_Background};
	border-right: 1px solid ${Tab_Ver_Selected_Border_Right_Color};
	${Tab_Ver_Selected_FirstChild_Shadow};
}

<%-- Close icon --%>
.z-tab-close > .z-tab-text,
.z-tab-ver-close > .z-tab-ver-text {
	margin-right: 26px;
}
a.z-tab-close,
a.z-tab-ver-close {
	background: url(${Tab_Close_Icon}) no-repeat center center;
	cursor: pointer;
	display: block;
	width: 32px;
	min-height: 31px;
	height: 100%;
	position: absolute;
	right: 0;
	top: -1px;
	z-index: 15;
	opacity: .5;
}

.z-tab-seld a.z-tab-close,
a.z-tab-close:active,
.z-tab-ver-seld a.z-tab-ver-close,
a.z-tab-ver-close:active {
	opacity: 1;
}


.z-tab-disd a.z-tab-close,
.z-tab-disd  a.z-tab-close:active,
.z-tab-ver-disd a.z-tab-ver-close,
.z-tab-ver-disd a.z-tab-ver-close:active {
	opacity: 0.5;
}

.z-tab-ver-disd .z-tab-ver-text,
.z-tab-ver-disd-seld .z-tab-ver-text {
	cursor: default;
	color: gray;
	opacity: .5;
}
.z-tabs-ver-cnt > .z-tab-ver-disd.z-tab-ver:active {
	${Tab_Border_Radius};
	${Tab_Background};
	${t:boxShadow('none')}
}
<%-- Tabpanels Tabpanel --%>
.z-tabpanel,
.z-tabbox-ver .z-tabpanels-ver {
	border: ${Tabpanel_Border};
}
.z-tabbox-ver .z-tabpanels-ver .z-tabpanels-ver-inner {
	border-color: ${Tabbox_Border_Color};
}
.z-tabbox-ver .z-tabpanels-ver {
	border: ${Tabpanel_Border};
	border-width: 1px 1px 1px 0;
}
.z-tabpanel,
.z-tabbox-ver .z-tabpanel-ver {
	padding: ${Tabpanel_Padding};
}
.z-tabpanels-ver {
	float: left;
	overflow: hidden;
	position: relative;
}
.z-tabpanel {
	border-top: none;
}
.z-tabpanel-cnt { <%-- Bug 2104974 --%>
	height: 100%;
}

<%-- Tabbox accordion --%>
.z-tab-accordion {
	${Tab_Accordion_Background};
	border: ${Tab_Accordion_Border_Width} solid ${Tab_Accordion_Border_Color};
	${Tab_Accordion_Shadow};
}
.z-tabpanel-accordion-outer:first-child .z-tab-accordion {
	${Tab_Accordion_FirstChild_Border_Radius};
}
.z-tab-accordion-header {
	cursor: pointer;
	position: relative;
}
.z-tab-accordion-text {
	cursor: pointer;
	color: ${Tab_Accordion_Color};
	font-family: ${Tab_Accordion_FontFamily};
	font-weight: ${Tab_Accordion_FontWeight};
	font-size: ${Tab_Accordion_FontSize};
	text-decoration: none;
	padding: ${Tab_Accordion_Padding};
	min-height: 28px;
	line-height: 28px;
	${Tab_Accordion_Text_Shadow};
}
.z-tabbox-accordion .z-tabpanel-accordion {
	background: ${Tabpanel_Accordion_Background};
	border: ${Tab_Accordion_Border_Width} solid ${Tab_Accordion_Border_Color};
	border-top: ${Tabpanel_Accordion_Border_Top};
	padding: ${Tabpanel_Accordion_Padding};
	zoom: 1;
}
.z-tab-accordion-close .z-tab-accordion-text {
	margin-right: 26px;
}
a.z-tab-accordion-close {
	background: url(${Tab_Close_Icon}) no-repeat center center;
	cursor: pointer;
	width: 32px;
	height: 100%;
	min-height: 30px;
	position: absolute;
	top: 0;
	right: 0;
	z-index: 15;
	opacity: .5;
}
.z-tab-accordion-seld {
	${Tab_Accordion_Selected_Background};
}
.z-tab-accordion-seld a.z-tab-accordion-close,
.z-tab-accordion-seld a.z-tab-accordion-close:active,
a.z-tab-accordion-close-over:active,
.z-tab-accordion a.z-tab-accordion-close:active {
	opacity: 1.0;
}

<%-- Disabled --%>
.z-tab-accordion-disd .z-tab-accordion-header,
.z-tab-accordion-disd-seld .z-tab-accordion-header {
	color: gray;
	cursor: default;
	opacity: .5;
}
.z-tab-accordion-disd a.z-tab-accordion-close,
.z-tab-accordion-disd a.z-tab-accordion-close:active,
.z-tab-accordion-disd-seld a.z-tab-accordion-close,
.z-tab-accordion-disd-seld a.z-tab-accordion-close:active {
	opacity: .5;
	cursor: default;
}
.z-tab-accordion-disd .z-tab-accordion-text,
.z-tab-accordion-disd-seld .z-tab-accordion-text {
	cursor: default;
	color: gray;
}