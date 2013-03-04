<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>
<%-- Normal Calendar --%>
.z-calendar {
	min-width: 420px;
	background: ${Calendar_Background};
	border: ${Calendar_Border_Width} solid ${Calendar_Border_Color};
	font-family: ${Calendar_FontFamily};
	font-size: ${Calendar_FontSize};
	font-weight: ${Calendar_FontWeight};
	padding: ${Calendar_Padding};
}
.z-calendar,
.z-calendar-title-over {
	${t:borderRadius(Calendar_Border_Radius_Size)}
}

.z-calendar-tdl,
.z-calendar-tdr {
	position: relative;
	padding-bottom: 10px;
	width: 32px;
	height: 32px;
	cursor: pointer;
}
.z-calendar-left,
.z-calendar-right {
	position: relative;
}

.z-calendar-calctrl td {
	font-size: ${Calendar_Content_FontSize}; 
	text-align: center;
	white-space: nowrap;
}
.z-calendar-caldow td {
	text-align: center;
}
.z-calendar-title,
.z-calendar-calctrl .z-calendar-ctrler {
	cursor: pointer;
	font-weight: ${Calendar_Title_FontWeight};
	font-family: ${Calendar_Title_FontFamily};
	font-size: ${Calendar_Title_FontSize};
	color: ${Calendar_Title_Color};
}
.z-calendar-calyear td,
.z-calendar-calmon td {
	padding: 12px 3px;
}
.z-calendar-calday {
	table-layout: fixed;
}
.z-calendar-calyear td,
.z-calendar-calmon td,
.z-calendar-caldayrow td {
	font-size: ${Calendar_Content_FontSize};
	text-align: center;
	cursor: pointer; 
	text-decoration: none;
	-moz-user-select: none;
	color: ${Calendar_Title_Color};
}
.z-calendar-calday td {
	padding: 3px 0;
}
.z-calendar-caldow .z-calendar-wkend,
.z-calendar-caldow .z-calendar-wkday,
.z-calendar-caldow .z-calendar-woy {
	font-size: ${Calendar_Week_FontSize};
	font-family: ${Calendar_Title_FontFamily};
	font-weight: ${Calendar_Title_FontWeight};
}

.z-calendar-calyear td.z-calendar-seld,
.z-calendar-calmon td.z-calendar-seld,
.z-calendar-calday td.z-calendar-seld {
	background: ${Calendar_Selected_Background};
	${t:borderRadius(Calendar_Selected_Border_Radius_Size)};
	text-shadow: ${Calendar_Selected_Text_Shadow};
}
.z-calendar-tdl,
.z-calendar-tdr {
	position: relative;
	padding-bottom: 10px;
	width: 32px;
	height: 32px;
	cursor: pointer;
}
.z-calendar-calday td {
	padding: 5px 0;
}
.z-calendar-caldow .z-calendar-wkend {
	color: ${Calendar_Weekend_Color};
}
.z-calendar-caldow .z-calendar-wkday {
	color: ${Calendar_Title_Color};
}
.z-calendar .z-calendar-outside {
	color: ${Calendar_Disable_Color};
	text-shadow: none;
}
<%-- Calendar weekend --%>
td.z-calendar-wkend {
	background: ${Calendar_Weekend_Background};
}

td.z-calendar-woy {
	background: ${Calendar_WeekOfYear_Background};
	font-style: italic;
	color: ${Calendar_WeekOfYear_Color};
}
<%-- Calendar Arrow --%>
.z-calendar-left,
.z-calendar-right {
	margin-bottom: 6px;
}
.z-calendar-left-icon,
.z-calendar-right-icon {
	height: 0;
	width: 0;
	line-height: 0;
	position: absolute;
	cursor: pointer;
	font-size: 0;
}
.z-calendar-left-icon {
	border-style: solid;
	border-width: ${Calendar_Icon_Border_Width}px;
	<c:if test="${zk.android > 0}">
	border-width: ${Calendar_Icon_Border_Width + 1}px; <%-- the left icon looks less than the right on android tablet --%>
	top: -1px;
	</c:if>
	border-color: transparent ${Calendar_Icon_Border_Color} transparent transparent;
}
.z-calendar-right-icon {
	border-style: solid;
	border-width: ${Calendar_Icon_Border_Width}px;
	border-color: transparent transparent transparent ${Calendar_Icon_Border_Color};
}
.z-calendar-over .z-calendar-left-icon {
	border-right-color: ${Calendar_Icon_Hover_Border_Color};
}
.z-calendar-over .z-calendar-right-icon {
	border-left-color: ${Calendar_Icon_Hover_Border_Color};
}
.z-calendar-icon-disd .z-calendar-left-icon {
	border-right-color: ${Calendar_Icon_Disable_Border_Color};
	cursor: auto;
}
.z-calendar-icon-disd .z-calendar-right-icon {
	border-left-color: ${Calendar_Icon_Disable_Border_Color};
	cursor: auto;
}
<%-- Calendar and Timebox wheel --%>
.z-datebox-pp .z-calendar {
	border: 0px;
	min-width: 100px;
}
.z-calendar-wheel-cave {
	position: relative;
}
.z-calendar-wheel-body {
	${t:box('box-orient', 'horizontal')}
	width: 100%;
}
.z-calendar-wheel-date {
	${t:box2('box-orient', 'horizontal', 'box-flex', '1')}
	position: relative;
	margin-right: 4px;
	background: ${Calendar_Wheeltime_Background};
	${t:borderRadius(Calendar_Border_Radius_Size)}
	width: 100%;
}
.z-calendar-wheel-line {
	position: absolute;
	top: 50%;
	height: 0;
	width: 100%;
	border-top: ${Calendar_Wheelline_Border_Top};
	border-bottom: ${Calendar_Wheelline_Border_Bottom};
	z-index: 1;
}
.z-calendar-wheel-list {
	${t:applyCSS3('box-flex', '1')}
	overflow: hidden;
	position: relative;
	margin: 0 2px;
	color: ${Calendar_Wheellist_Color};
	background: ${Calendar_Wheellist_Background};
	height: 210px;
}
.z-calendar-wheel-list ul {
	list-style: none;
	margin: 0;
	padding: 0;
	position: relative;
	z-index: 2;
	width: 100%;
}
.z-calendar-wheel-list li {
	list-style: none;
	margin: 0;
	padding: 0 5px;
	display: block;
	text-align: center;
	font-size: 40px;
	white-space: nowrap;
	${Calendar_Wheellist_Text_Shadow};
	opacity: .3;
	width: 100%;
	height: 70px;
	line-height: 70px;
}
li.z-calendar-wheel-list-seld {
	opacity: 1;
}
.z-calendar-wheel-footer {
	clear: both;
	padding: 5px 0;
	height: 50px;
}
.z-calendar-wheel-button {
	width: 45%;
	font-size: 30px;
	font-weight: bold;
	padding: ${Button_Padding};
	margin: ${Button_Margin};
	border: ${Button_Border_Width} solid ${Button_Border_Color};
	${Button_Border_Radius};
	${Button_Background};
	${Button_Text_Shadow};
	color: ${Button_Color};
}
.z-calendar-wheel-button:hover {
	border-color: ${Button_Hover_Border_Color};
	${Button_Hover_Background};
	${Button_Hover_Shadow};
}
.z-calendar-wheel-button:focus {
	border-color: ${G_Background_Focus_Border_Color};
	${Button_Focus_Background};
	${Button_Focus_Shadow};
}
.z-calendar-wheel-button:active {
	border-color: ${Button_Active_Border_Color};
	${Button_Active_Background};
	${Button_Active_Shadow};
}
.z-calendar-wheel-left {
	float: left;
}
.z-calendar-wheel-right {
	float: right;
}
<%-- iPhone --%>
@media only screen
	and (min-device-width : 320px) 
	and (max-device-width : 480px) {
	.z-calendar-wheel-date {
		margin-right: 2px;
	}
	.z-calendar-wheel-list {
		margin: 0 1px 0 0;
		height: 120px;
	}
	.z-calendar-wheel-list li {
		padding: 0;
		font-size: 20px;
		height: 40px;
		line-height: 40px;
	}
	.z-calendar-wheel-button {
		font-size: 22px;
	}
	.z-calendar-wheel-footer {
		height: 35px;
	}
}
<%-- Android --%>
@media only screen
	and (min-device-width : 480px) 
	and (max-device-width : 720px) {
	.z-calendar-wheel-date {
		margin-right: 2px;
	}
	.z-calendar-wheel-list {
		margin: 0 1px 0 0;
		height: 150px;
	}
	.z-calendar-wheel-list li {
		padding: 0;
		font-size: 24px;
		height: 50px;
		line-height: 50px;
	}
	.z-calendar-wheel-button {
		font-size: 26px;
	}
	.z-calendar-wheel-footer {
		height: 40px;
	}
}
