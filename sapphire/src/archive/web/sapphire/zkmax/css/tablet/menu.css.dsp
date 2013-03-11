<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>

<%-- define common font property --%>
.z-menubar-hor ul,
.z-menubar-ver ul {
	overflow: hidden;
	background: transparent none repeat 0 0;
	border: 0;
	padding: 0;
	margin: 0;
	position: relative;
	list-style-image: none;
	list-style-position: outside;
	list-style-type: none;
}
.z-menubar-ver ul {
	display: inline-table;
}
.z-menubar-hor li,
.z-menubar-ver li {
	padding: 0;
	margin: 2px;
	min-height: 32px;
	line-height: 30px;
	${t:applyCSS3('box-sizing', 'border-box')};
	position: relative;
}
.z-menubar-ver li {
	margin: ${Menubar_Ver_Margin};
}
.z-menubar-ver li:first-child {
	margin: 2px;
}
.z-menubar-hor li {
	float: left;
	display: inline-block;
}

.z-menubar-hor li.z-menu,
.z-menubar-hor li.z-menuitem,
.z-menubar-ver li.z-menu,
.z-menubar-ver li.z-menuitem {
	cursor: pointer;
	border: ${Menu_Border_Width} solid ${Menu_Border_Color};
	${Menu_Border_Radius};
	${Menu_Background};
	padding: ${Menu_Padding};
}

.z-menu:active,
.z-menu-body-seld,
.z-menuitem:active {
	border: ${Menu_Active_Border};	
	${Menu_Active_Background};
	${Menu_Active_Shadow};
}
.z-menuitem.z-menuitem-disd,
.z-menuitem.z-menuitem-disd:active {
	color:gray;
	cursor:default;
	border: ${Menu_Border_Width} solid ${Menu_Border_Color};
	${Menu_Border_Radius};
	${Menu_Background};
	${t:boxShadow('none')};
	opacity: 0.5;
}
.z-menu-text,
.z-menuitem-text {
	display: inline-block;
	font-family: ${Menu_FontFamily};
	font-size: ${Menu_FontSize};
	font-weight: ${Menu_FontWeight};
	${Menu_Text_Shadow};
	vertical-align: middle;
	color: ${Menu_Color};
}
.z-menubar-hor .z-menu-cnt,
.z-menubar-hor .z-menuitem-cnt,
.z-menubar-ver .z-menu-cnt,
.z-menubar-ver .z-menuitem-cnt {
	line-height: 26px;
	min-height: 28px;
	display: block;
}
.z-menubar-hor .z-menu-cnt,
.z-menubar-ver .z-menu-cnt {
	margin-right: 15px;
}
.z-menubar-hor .z-menu-cnt:after,
.z-menubar-ver .z-menu-cnt:after {
	content:'';
	width: 0;
	height: 0;
	top: 14px;
	right: 5px;
	position: absolute;
	border-width: 6px;
	border-style: solid;
	border-color: ${Menubar_Arrow_Border_Color} transparent transparent transparent;
}
.z-menubar-ver .z-menu-cnt:after {
	top: 10px;
	right: 0;
	border-color: transparent transparent transparent ${Menubar_Arrow_Border_Color};
}

<%-- define common horizontal and vertical property --%>
.z-menubar-hor,
.z-menubar-ver {
	position: relative;
	display: block;
	padding: ${Menubar_Padding};
	border-top: ${Menubar_Border_Top};
	border-bottom: ${Menubar_Border_Bottom};
	${Menubar_Background};
}
.z-menu-cnt, .z-menuitem-cnt {
	text-decoration: none;
	cursor: pointer;
}
<%-- menupopup --%>
.z-menupopup-shadow, .z-menu-palette-pp, .z-menu-picker-pp, .z-menu-cnt-pp {
	${Menupopup_Shadow};
}
.z-menupopup {
	background: ${Menupopup_Background};
	background-color: ${Menupopup_Background_Color};
	border: ${Menupopup_Border_Width} solid ${Menupopup_Border_Color};
	padding: ${Menupopup_Padding};
	z-index: 88000;
	left: 0;
	top: 0;
	font-weight: ${Menupopup_FontWeight};
	white-space: nowrap;
	font-family: ${Menupopup_FontFamily};
	font-size: ${Menupopup_FontSize};
}
.z-menupopup a {
	text-decoration: none !important;
}
.z-menupopup .z-menupopup-cnt {
	${Menupopup_Content_Background};
	border: 0 none;
	padding: 0;
	margin: 0;
	overflow: hidden;
}
<%-- define menu & menuitem in menupopup --%>
.z-menupopup-cnt .z-menu,
.z-menupopup-cnt .z-menuitem,
.z-menupopup-cnt .z-menuseparator {
	line-height: 100%;
	list-style-image: none !important;
	list-style-position: outside !important;
	list-style-type: none !important;
	margin: ${Menupopup_Menu_Margin};
	display: block;
	padding: ${Menupopup_Menuseparator_Padding};
	cursor: pointer;
}
.z-menupopup-cnt .z-menu,
.z-menupopup-cnt .z-menuitem {
	background: ${Menupopup_Menu_Background};
	border-color: ${Menupopup_Menu_Border_Color};
	padding: ${Menupopup_Menu_Padding};
}
.z-menupopup-cnt .z-menu-text,
.z-menupopup-cnt .z-menuitem-text {
	padding-left: ${Menupopup_Menu_Text_Padding_Left};
}
.z-menupopup-cnt .z-menu-cnt:after {
	content:'';
	width: 0;
	height: 0;
	top: 8px;
	right: -1px;
	position: absolute;
	border-width: 6px;
	border-style: solid;
	border-color: transparent transparent transparent ${Menubar_Arrow_Border_Color};
}
.z-menupopup-cnt .z-menu a.z-menu-cnt,
.z-menupopup-cnt .z-menuitem a.z-menuitem-cnt {
	color: ${Menupopup_Menu_Content_Color};
	display: block;
	line-height: 24px;
	outline-color: -moz-use-text-color;
	outline-style: none;
	outline-width: 0;
	padding: ${Menupopup_Menu_Content_Padding};
	white-space: nowrap;
	position: relative;
}
.z-menupopup-cnt .z-menuitem a.z-menuitem-cnt {
	padding: ${Menupopup_Menuitem_Content_Padding};
}
.z-menu-cnt > img,
.z-menuitem-cnt > img {
	vertical-align: text-bottom;
}
.z-menubar-hor .z-menu-img[src=${G_EmptyIcon}],
.z-menubar-hor .z-menuitem-img[src=${G_EmptyIcon}],
.z-menubar-ver .z-menu-img[src=${G_EmptyIcon}],
.z-menubar-ver .z-menuitem-img[src=${G_EmptyIcon}] {
	width: 0;
	height: 0;
}
.z-menupopup-cnt .z-menu-img,
.z-menupopup-cnt .z-menuitem-img {
	min-width: 16px;
	min-height: 16px;
}

.z-menupopup-cnt .z-menu:active,
.z-menupopup-cnt .z-menu:hover,
.z-menupopup-cnt .z-menu-body-seld,
.z-menupopup-cnt .z-menuitem:active,
.z-menupopup-cnt .z-menuitem:hover {
	border: ${Menu_Border_Width} solid ${Menupopup_Menu_Active_Border_Color};
	${Menu_Border_Radius};
	padding: ${Menupopup_Menu_Active_Padding};
	${Menupopup_Menu_Active_Background};
	${Menupopup_Menu_Active_Shadow};
}
.z-menupopup-cnt .z-menuitem.z-menuitem-disd,
.z-menupopup-cnt .z-menuitem.z-menuitem-disd:active {
	color: gray;
	cursor: default;
	display: block;
	border: 1px solid ${Menupopup_Menu_Disable_Border_Color};
	${Menu_Border_Radius};
	background: transparent;
	${t:boxShadow('none')};
	opacity: 0.5;
}
<%--define checked menuitem effect in menupopup --%>
.z-menupopup-cnt .z-menuitem-cnt-ck .z-menuitem-img,
.z-menupopup-cnt .z-menuitem-cnt-unck .z-menuitem-img {
	${Menuitem_Checkmark_Background};
	border: ${Menuitem_Checkmark_Border};
	${t:applyCSS3('box-sizing', 'border-box')};
}
.z-menupopup-cnt .z-menuitem-cnt-ck .z-menuitem-img {
	background-image: ${Menuitem_Checkmark_Checkbox_Selected_Background};
}
<%--define disabled menuitem effect in menupopup--%>
.z-menupopup-cnt .z-menuitem-disd,
.z-menupopup-cnt .z-menuitem-disd *{
	color:gray !important;
	cursor:default !important;
}
<%--define separator--%>
.z-menupopup-cnt .z-menuseparator {
	font-size: 1px;
	line-height: 1px;
	background-color: ${Menuseparator_Background_Color};
	border-bottom: 1px solid ${Menuseparator_Border_Color};
	display: block;
	width: auto;
	position: relative;
	left: 27px;
	padding: 0px;
	height: 1px;
}
.z-menubar-hor .z-menuseparator {
	border-left: 1px solid ${Menuseparator_Border_Color_TL};
}
.z-menubar-ver .z-menuseparator {
	border-top: 1px solid ${Menuseparator_Border_Color_TL};
	line-height: 0;
	height: 0;
	min-height: 0;
}
<%--define menubar hor scroll--%>
.z-menubar-hor-scroll {
	overflow: hidden;
}
.z-menubar-hor-body {
	margin: 0;
	width: 100%;
}
.z-menubar-hor-body-scroll {
	position: relative;
	overflow: hidden;
	margin-left: 32px;
	margin-right: 32px;
}
.z-menubar-hor-cnt {
	width: 5000px;
}
.z-menubar-hor-left, .z-menubar-hor-right {
	width: 32px;
	position: absolute;
}
.z-menubar-hor-left-scroll, .z-menubar-hor-right-scroll {
	border: ${Menubar_Scroll_Button_Border_Width} solid ${Menubar_Scroll_Button_Border_Color};
	${Menubar_Scroll_Button_Border_Radius};
	${t:applyCSS3('box-sizing', 'border-box')};
	${Menubar_Scroll_Button_Background};
	top: 0;
	right: 0;
	width: 32px;
	height: 100%;
	cursor: pointer;
	position: absolute;
	z-index: 25;
}
.z-menubar-hor-left-scroll:after,
.z-menubar-hor-right-scroll:after {
	content:'';
	width: 0;
	height: 0;
	top: 16px;
	position: absolute;
	border-width: 6px;
	border-style: solid;
	border-color: transparent ${Menubar_Scroll_Button_After_Border_Color} transparent transparent;
}
.z-menubar-hor-left-scroll:after {
	left: 5px;
}
.z-menubar-hor-right-scroll:after {
	border-color: transparent transparent transparent ${Menubar_Scroll_Button_After_Border_Color};
	right: 5px;
}
.z-menubar-hor-left-scroll {
	left: 0;
}
.z-menubar-hor-left-scroll:active:after {
	border-right-color: ${Menubar_Scroll_Button_After_Active_Border_Color};
}
.z-menubar-hor-right-scroll:active:after {
	border-left-color: ${Menubar_Scroll_Button_After_Active_Border_Color};
}
.z-menubar-hor-left-scroll:active {
	${Menubar_Scroll_Button_After_Active_Shadow};
}
.z-menubar-hor-right-scroll:active {
	${Menubar_Scroll_Button_After_Active_Shadow};
}