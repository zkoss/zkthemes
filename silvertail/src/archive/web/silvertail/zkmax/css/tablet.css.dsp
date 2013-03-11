<%--
tablet.css.dsp

	Purpose:
		
	Description:
		
	History:
		Tue, Jul 03, 2012 11:49:04 AM, Created by jumperchen

Copyright (C) 2012 Potix Corporation. All Rights Reserved.

This program is distributed under LGPL Version 3.0 in the hope that
it will be useful, but WITHOUT ANY WARRANTY.
--%><%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>
<%@ taglib uri="http://www.zkoss.org/dsp/zk/core" prefix="z" %>
<c:set var="self" value="${requestScope.arg.self}"/>
<c:if test="${empty fontSizeM}">
<c:set var="val" value="${c:property('org.zkoss.zul.theme.fontSizeM')}"/>
<c:set var="fontSizeM" value="${val}" scope="request" unless="${empty val}"/>
<c:set var="fontSizeM" value="18px" scope="request" if="${empty fontSizeM}"/>
</c:if>
<c:if test="${empty fontSizeMS}">
<c:set var="val" value="${c:property('org.zkoss.zul.theme.fontSizeMS')}"/>
<c:set var="fontSizeMS" value="${val}" scope="request" unless="${empty val}"/>
<c:set var="fontSizeMS" value="16px" scope="request" if="${empty fontSizeMS}"/>
</c:if>
<c:if test="${empty fontSizeS}">
<c:set var="val" value="${c:property('org.zkoss.zul.theme.fontSizeS')}"/>
<c:set var="fontSizeS" value="${val}" scope="request" unless="${empty val}"/>
<c:set var="fontSizeS" value="14px" scope="request" if="${empty fontSizeS}"/>
</c:if>
<c:if test="${empty fontSizeXS}">
<c:set var="val" value="${c:property('org.zkoss.zul.theme.fontSizeXS')}"/>
<c:set var="fontSizeXS" value="${val}" scope="request" unless="${empty val}"/>
<c:set var="fontSizeXS" value="12px" scope="request" if="${empty fontSizeXS}"/>
</c:if>

<c:if test="${empty fontFamilyT}"><%-- title --%>
<c:set var="val" value="${c:property('org.zkoss.zul.theme.fontFamilyT')}"/>
<c:set var="fontFamilyT" value="${val}" scope="request" unless="${empty val}"/>
<c:set var="fontFamilyT" value="\"Helvetica Neue\", Helvetica, Arial, \"Lucida Grande\", sans-serif"
	scope="request" if="${empty fontFamilyT}"/>
</c:if>
<c:if test="${empty fontFamilyC}"><%-- content --%>
<c:set var="val" value="${c:property('org.zkoss.zul.theme.fontFamilyC')}"/>
<c:set var="fontFamilyC" value="${val}" scope="request" unless="${empty val}"/>
<c:set var="fontFamilyC" value="\"Helvetica Neue\", Helvetica, Arial, \"Lucida Grande\", sans-serif"
	scope="request" if="${empty fontFamilyC}"/>
</c:if>

${t:loadProperties('~./zkmax/css/default.theme-properties')}

*,
*:before,
*:after {
  -webkit-touch-callout: none;
  -webkit-user-drag: none;
  -webkit-user-select: none;
}
input[type=number]::-webkit-inner-spin-button,
input[type=number]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
input,
input:focus,
textarea,
textarea:focus {
    -webkit-tap-highlight-color: rgba(255, 255, 255, 0);
	-webkit-appearance: none;
	-moz-appearance: none;
	 -webkit-user-modify: read-write-plaintext-only; <%-- Android 4.0.3 bug --%>
	 outline: none;
	 -webkit-user-select: text;
}

<%-- Local Variable --%>
<c:set var="errorIcon" value="${c:encodeThemeURL('~./zkmax/img/tablet/errors.png')}"/>

*:focus {
  outline: none;
}
<%-- Checkbox and Radio --%>
input[type=checkbox],
input[type=radio] {
	width: 24px;
	height: 24px;
	${t:gradient(G_Background_Button_Gradient_Direction, G_Background)};
	border: 1px solid #CFCFCF;
	position: relative;
	top: -2px;
}
input[type=checkbox]:checked {
	background-image: url(${G_CheckboxIcon}),
			${t:gradValue(G_Background_Button_Gradient_Direction, G_Background)};
}
input[type=checkbox]:active {
	background-image: ${t:gradValue(G_Background_Button_Gradient_Direction, G_Background_Active)};
	${t:boxShadow('inset 0 1px 1px rgba(210, 210, 210, 0.75)')}
}
input[type=checkbox]:checked:active {
	background-image: url(${G_CheckboxIcon}),
			${t:gradValue(G_Background_Button_Gradient_Direction, G_Background_Active)};
}
input[type=radio] {
	${t:borderRadius('2em')}
}
input[type=radio]:checked {
	${t:gradient(G_Background_Button_Gradient_Direction, G_Background)}
	${t:borderRadius('2em')}
	background-size: contain;
}
input[type=radio]:checked:after {
	content:'';
	width: 0;
	height: 0;
	top: 6px;
	left: 6px;
	${t:borderRadius('2em')}
	position: absolute;
	border: 5px solid #0076A3;
}
input[type=radio]:active {
	${t:gradient(G_Background_Button_Gradient_Direction, G_Background_Active)};
	${t:boxShadow('inset 0 1px 1px rgba(210, 210, 210, 0.75)')}
}
input[type=radio]:checked:active {
	${t:gradient(G_Background_Button_Gradient_Direction, G_Background_Active)}
}

div.z-error .redraw {
	background: url(${errorIcon}) no-repeat scroll 0 0 transparent;
}
div.z-error .close {
	background: url(${errorIcon}) no-repeat scroll -16px 0 transparent;
}
.z-label,
.z-radio-cnt,
.z-checkbox-cnt,
.z-loading,
.z-apply-loading-indicator,
.z-a,
.z-biglistbox-body td,
.z-temp .z-loading,
.z-temp .z-loading-indicator {
	font-size: ${fontSizeXS};
}

.z-apply-loading-icon,
.z-loading-icon,
.z-renderdefer {
	background-image: url('data:image/gif;base64,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');
}
.z-radio-cnt,
.z-checkbox-cnt {
	cursor: pointer;
}
.z-radio,
.z-checkbox {
	display: inline-block;
	line-height: 28px;
}

div.z-drop-cnt {
	font-size: ${fontSizeS};
	${G_TextShadow}
}

<%-- ProgressMeter --%>
@-webkit-keyframes z-progressmeter {
    0% {
       background-position: 0 0;
    }
    100% {
       background-position: 20px 20px;
    }
}
div.z-progressmeter {
	height: 15px;
	position: relative;
	background: #F0F0F0;
	border: 1px solid #CFCFCF;
	text-align: start;
	${t:borderRadius('5px')}
	${t:boxShadow('inset 0 -1px 1px rgba(255,255,255,0.3)')}
}
span.z-progressmeter-img {
	display: -moz-inline-box;
	display: inline-block;
	${t:gradient('ver', '#E8F6FD 0%; #C6E9FA 100%')}
	height: 15px;
	line-height: 0;
	font-size: 0;
	${t:borderRadius('5px 0 0 5px')}
}
span.z-progressmeter-img > span {
	position: absolute;
	top: 0; left: 0; bottom: 0; right: 0;
	${t:gradient('diag-', ' rgba(255, 255, 255, 1) 25%; transparent 25%; transparent 50%; rgba(255, 255, 255, 1) 50%; rgba(255, 255, 255, 1) 75%; transparent 75%; transparent 100%')}
	z-index: 1;
	${t:applyCSS3('background-size', '20px 20px')}
	${t:applyCSS3('animation', 'z-progressmeter 2s linear infinite')}
	overflow: hidden;
	${t:borderRadius('0 5px 5px 0')}
}
<%-- Separator --%>
.z-separator-hor, .z-separator-hor-bar {
	height: 7px; overflow: hidden; line-height: 0; font-size: 0;
}
.z-separator-ver, .z-separator-ver-bar {
	display:-moz-inline-box;
	display: inline-block;
	width: 10px;
	overflow: hidden;
}
.z-separator-hor-bar {
	${t:gradient('ver', ' transparent 0%; transparent 3px; #808080 3px; #808080 4px; transparent 4px; transparent 100%')}
}
.z-separator-ver-bar {
	${t:gradient('hor', ' transparent 0%; transparent 5px; #808080 5px; #808080 6px; transparent 6px; transparent 100%')}
}
.z-html {
	display: inline-block;
}
<c:include page="tablet/biglistbox.css.dsp"/>
<c:include page="tablet/borderlayout.css.dsp"/>
<c:include page="tablet/box.css.dsp"/>
<c:include page="tablet/button.css.dsp"/>
<c:include page="tablet/calendar.css.dsp"/>
<c:include page="tablet/caption.css.dsp"/>
<c:include page="tablet/chosenbox.css.dsp"/>
<c:include page="tablet/colorbox.css.dsp"/>
<c:include page="tablet/combo.css.dsp"/>
<c:include page="tablet/combobutton.css.dsp"/>
<c:include page="tablet/grid.css.dsp"/>
<c:include page="tablet/groupbox.css.dsp"/>
<c:include page="tablet/listbox.css.dsp"/>
<c:include page="tablet/input.css.dsp"/>
<c:include page="tablet/menu.css.dsp"/>
<c:include page="tablet/paging.css.dsp"/>
<c:include page="tablet/panel.css.dsp"/>
<c:include page="tablet/popup.css.dsp"/>
<c:include page="tablet/slider.css.dsp"/>
<c:include page="tablet/tabbox.css.dsp"/>
<c:include page="tablet/toolbar.css.dsp"/>
<c:include page="tablet/tree.css.dsp"/>
<c:include page="tablet/window.css.dsp"/>
