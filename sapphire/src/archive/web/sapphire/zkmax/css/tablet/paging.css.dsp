<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>

<%-- Local Variable --%>
<c:set var="focusShadow" value="inset 1px 1px 1px rgba(210, 210, 210, 0.75), 0 0 7px #CFCFCF"/>
<c:set var="borderShadow" value="${t:boxShadow('0 0 7px #CFCFCF')}"/>

.z-grid .z-paging,
.z-grid .z-paging-os,
.z-listbox .z-paging,
.z-listbox .z-paging-os,
.z-tree .z-paging,
.z-tree .z-paging-os {
	border-bottom: 0;
	padding-bottom: 6px;
}
<%-- os mold --%>
.z-paging,
.z-paging-os {
	background: #F9F9F9;
	padding: 6px 2px 5px 10px;
	position: relative;
	border-bottom: 1px solid #CFCFCF;
}
.z-paging-os .z-paging-os-cnt {
	border: 0;
	font-size: ${fontSizeS};
	color: #006DA3; 
	font-weight: normal;
	text-decoration: none;
	font-family: ${fontFamilyC};
	font-size: ${fontSizeS};
	padding: 2px 5px 2px 6px;
	border: 1px solid #CFCFCF;
	height: 26px;
	line-height: 26px;
	min-width: 26px;
	${t:gradient(G_Background_Button_Gradient_Direction, G_Background)}
	${t:borderRadius(G_Background_Button_Border_Radius)}
	display: inline-block;
	margin: 2px;
	text-align: center;
	${G_TextShadow}
}
.z-paging-os .z-paging-os-cnt:active {
	border-top-color: ${G_Background_Active_Border_Color_TL};
	border-left-color: ${G_Background_Active_Border_Color_TL};
	border-bottom-color: ${G_Background_Active_Border_Color_BR};
	border-right-color: ${G_Background_Active_Border_Color_BR};
	${t:gradient(G_Background_Button_Gradient_Direction, G_Background_Active)}
	${t:boxShadow(focusShadow)}
}
.z-paging-os .z-paging-os-seld {
	font-family: ${fontFamilyC};
	font-size: ${fontSizeS};
	color: ${G_Font_Color1}; 
	border-color: ${G_Background_Hover_Border_Color};
	${t:gradient(G_Background_Button_Gradient_Direction, G_Background_Hover)}
	text-shadow: 0 1px 1px ${G_Background_Active_Border_Color_BR};
}
.z-paging-os span {
	font-family: ${fontFamilyC};
	font-size: ${fontSizeXS};
	color: ${G_Font_Color1}; 
	font-weight: normal;
	position:absolute;
	right: 8px;
	top: 10px;
	${G_TextShadow}
	line-height: 40px;
}

<%-- default mold font properties --%>
.z-paging td,
.z-paging span,
.z-paging input,
.z-paging div,
.z-paging button{
	font-weight:normal;
	white-space:nowrap;
	font-family: ${fontFamilyT};
	font-size: ${fontSizeS};
	${G_TextShadow}
}
.z-paging > table {
	margin: 2px;
}
.z-paging td {
	vertical-align:middle;
}

.z-paging-text {
	padding-left: 4px;
}

.z-paging-first,
.z-paging-last,
.z-paging-next,
.z-paging-prev {
	background-repeat: no-repeat;
	cursor: pointer;
	height: 32px;
	width: 32px;
	margin-right: 4px;
	white-space:nowrap;
	${t:applyCSS3('box-sizing', 'border-box')};
	border: 1px solid ${G_Background_Border_Color};
	${t:borderRadius(G_Background_Button_Border_Radius)}
	${t:gradient(G_Background_Button_Gradient_Direction, G_Background)}
	background-repeat: no-repeat;
	background-position: center center;
}
.z-paging .z-paging-sep {
	background:no-repeat center center;
	border:0 none;
	cursor:default;
	display:block;
	font-size:1px;
	height:16px;
	margin:0 2px;
	overflow:hidden;
	width:4px;
	background-image:none;
}

.z-paging-inp,
.z-paging input.z-paging-inp {
	border:1px solid #CFCFCF;
	height: 28px;
	line-height: 28px;
	font-family: ${fontFamilyC};
	font-size: ${fontSizeS};
	color: ${G_Font_Color1};
}

.z-paging .z-paging-next {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/paging/next.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background)};
}
.z-paging .z-paging-prev {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/paging/prev.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background)};
}
.z-paging .z-paging-last {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/paging/last.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background)};
}
.z-paging .z-paging-first {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/paging/first.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background)};
}

<%-- mouse click on a button --%>
.z-paging-btn-clk.z-paging-next {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/paging/next.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background_Active)};
	${borderShadow}
}
.z-paging-btn-clk.z-paging-prev {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/paging/prev.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background_Active)};
	${borderShadow}
}
.z-paging-btn-clk.z-paging-last {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/paging/last.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background_Active)};
	${borderShadow}
}
.z-paging-btn-clk.z-paging-first {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/paging/first.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background_Active)};
	${borderShadow}
}

<%-- disabled button --%>
.z-paging .z-paging-btn-disd {
	color:gray;
	cursor:default;
	opacity:0.4;
}
.z-paging .z-paging-btn-disd *{
	color:gray !important;
	cursor:default !important;
}

<%--paging info--%>
.z-paging-info,
.z-paging div.z-paging-info {
	color: ${G_Font_Color1};
	position: absolute;
	right: 8px;
	top: 11px;
	font-family: ${fontFamilyC};
	font-size: ${fontSizeXS};
	line-height: 40px;
}