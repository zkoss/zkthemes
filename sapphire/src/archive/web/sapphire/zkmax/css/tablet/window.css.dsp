<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>

.z-window-modal-header, 
.z-window-popup-header, 
.z-window-highlighted-header,
.z-window-overlapped-header, 
.z-window-embedded-header {
	line-height: 36px;
	padding: 6px 0;
	font-size: ${fontSizeS};
	color: ${G_Font_Color2};
	font-weight: bold;
	${G_TextShadow}
}

.z-window-embedded-header a, 
.z-window-embedded-header a:visited, 
.z-window-embedded-header a:hover {
	color: #222222;
}
.z-window-modal-header-move,
.z-window-highlighted-header-move,
.z-window-overlapped-header-move,
.z-window-popup-header-move {
	cursor: move;
}

.z-window-embedded,
.z-window-modal,
.z-window-highlighted,
.z-window-overlapped,
.z-window-popup {
	background: rgba(214,227,238, 0.9);
	padding: 5px;
	border: 1px solid rgba(17,17,17, 0.3);
	${t:boxShadow('inset 0px 1px 1px #FFFFFF')}
	overflow: hidden;
	${t:applyCSS3('box-sizing', 'border-box')}
}
.z-window-embedded-shadow,
.z-window-modal-shadow,
.z-window-highlighted-shadow,
.z-window-overlapped-shadow,
.z-window-popup-shadow {
	${t:borderRadius('5px')};
	${t:boxShadow('inset 0px 1px 1px #FFFFFF, 0 0 4px rgba(0, 0, 0, 0.25)')}
}
.z-window-popup {
	${t:borderRadius('5px 5px 0 0')};
}
.z-window-modal-shadow,
.z-window-highlighted-shadow {
	${t:boxShadow('inset 0px 1px 1px #FFFFFF, 0 0 4px rgba(0, 0, 0, 0.7)')}
}

.z-window-embedded-cnt,
.z-window-modal-cnt,
.z-window-highlighted-cnt,
.z-window-overlapped-cnt,
.z-window-popup-cnt {
	border: 1px solid #C5C5C5;
	margin: 0;
	padding: 2px;
	background: white;
	overflow: hidden;
}

.z-window-popup-cnt {
	border-width: 1px 0 0 0;
	margin: 0 -5px -5px;
}
.z-window-popup-noheader {
	${t:borderRadius('0')};
	padding: 0;
}
.z-window-popup-noheader .z-window-popup-cnt {
	margin: 0;
	border: 0;
}

<%-- no border --%>
.z-window-embedded-noborder,
.z-window-modal-noborder,
.z-window-highlighted-noborder,
.z-window-overlapped-noborder,
.z-window-popup-noborder {
	border: 0px;
	padding: 0px;
}
.z-window-embedded-noborder .z-window-embedded-cnt,
.z-window-modal-noborder .z-window-modal-cnt,
.z-window-highlighted-noborder .z-window-highlighted-cnt,
.z-window-overlapped-noborder .z-window-overlapped-cnt,
.z-window-popup-noborder .z-window-popup-cnt {
	border: 0px;
}
.z-window-embedded-noborder:not(.z-window-embedded-noheader),
.z-window-modal-noborder:not(.z-window-modal-noheader),
.z-window-highlighted-noborder:not(.z-window-highlighted-noheader),
.z-window-overlapped-noborder:not(.z-window-overlapped-noheader),
.z-window-popup-noborder:not(.z-window-popup-noheader) {
	padding: 5px 5px 0 5px;
}
.z-window-embedded-noborder:not(.z-window-embedded-noheader) .z-window-embedded-cnt,
.z-window-modal-noborder:not(.z-window-modal-noheader) .z-window-modal-cnt,
.z-window-highlighted-noborder:not(.z-window-highlighted-noheader) .z-window-highlighted-cnt,
.z-window-overlapped-noborder:not(.z-window-overlapped-noheader) .z-window-overlapped-cnt,
.z-window-popup-noborder:not(.z-window-popup-noheader) .z-window-popup-cnt {
	margin: 0 -5px;
}

.z-window-modal-resize-faker,
.z-window-overlapped-resize-faker,
.z-window-popup-resize-faker,
.z-window-embedded-resize-faker,
.z-window-highlighted-resize-faker,
.z-window-resize-faker {
	position: absolute;
	border: 1px dashed #1854C2;
	overflow: hidden;
	z-index: 60000;
	left: 0;
	top: 0;
	background-color: #D7E6F7;
	opacity: .5;
}
.z-window-modal-move-ghost,
.z-window-overlapped-move-ghost,
.z-window-popup-move-ghost,
.z-window-highlighted-move-ghost,
.z-window-move-ghost {
	position: absolute;
	opacity: .65 !important;
	cursor: move !important;
	background: rgba(214,227,238, 0.9);
	padding: 5px;
	border: 1px solid rgba(17,17,17, 0.3);
	${t:boxShadow('inset 0px 1px 1px #FFFFFF, 0 0 4px rgba(0, 0, 0, 0.7)')}
	overflow: hidden;
}
.z-window-modal-move-ghost dl,
.z-window-overlapped-move-ghost dl,
.z-window-popup-move-ghost dl,
.z-window-highlighted-move-ghost dl,
.z-window-move-ghost dl {
	border: 1px solid #9F9F9F;
	margin: 0;
	padding: 2px;
	overflow: hidden;
	display: block;
	background: #FFFFFF;
	line-height: 0;
	font-size: 0;
}
.z-window-modal-move-ghost.z-window-modal-noborder,
.z-window-overlapped-move-ghost.z-window-overlapped-noborder,
.z-window-popup-move-ghost.z-window-popup-noborder,
.z-window-highlighted-move-ghost.z-window-highlighted-noborder {
	border: 0;
}
.z-window-modal-move-ghost.z-window-modal-noborder dl,
.z-window-overlapped-move-ghost.z-window-overlapped-noborder dl,
.z-window-popup-move-ghost.z-window-popup-noborder dl,
.z-window-highlighted-move-ghost.z-window-highlighted-noborder dl {
	margin: 0 -5px;
	border-width: 0;
}

.z-window-popup-move-ghost dl {
	border-width: 1px 0 0 0;
	margin: 0 -5px -5px;
}
<%-- Buttons --%>
.z-window-embedded-icon,
.z-window-popup-icon,
.z-window-modal-icon,
.z-window-overlapped-icon,
.z-window-highlighted-icon {
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
.z-window-embedded-icon:active,
.z-window-popup-icon:active,
.z-window-modal-icon:active,
.z-window-overlapped-icon:active,
.z-window-highlighted-icon:active {
	border-top-color: ${G_Background_Active_Border_Color_TL};
	border-left-color: ${G_Background_Active_Border_Color_TL};
	border-bottom-color: ${G_Background_Active_Border_Color_BR};
	border-right-color: ${G_Background_Active_Border_Color_BR};
	
	${t:gradient(G_Background_Button_Gradient_Direction, G_Background_Active)}
	${t:boxShadow(G_Background_Active_Shadow)}
}
<%-- Button Background Position --%>
.z-window-embedded-min, 
.z-window-modal-min, 
.z-window-overlapped-min,
.z-window-popup-min, 
.z-window-highlighted-min {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/wnd/min.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background)};
}

.z-window-embedded-max, 
.z-window-modal-max,
.z-window-overlapped-max,
.z-window-popup-max,
.z-window-highlighted-max {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/wnd/max.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background)};
}

.z-window-embedded-maxd, 
.z-window-modal-maxd,
.z-window-overlapped-maxd,
.z-window-popup-maxd, 
.z-window-highlighted-maxd {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/wnd/maxd.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background)};
}

.z-window-embedded-close,
.z-window-modal-close, 
.z-window-overlapped-close,
.z-window-popup-close, 
.z-window-highlighted-close {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/wnd/close.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background)};
}

.z-messagebox .z-label {
	font-family: ${fontFamilyC};
	font-size: ${fontSizeS};
	color: ${G_Font_Color1};
	${G_TextShadow}
	line-height: 32px;
}

.z-messagebox-window .z-window-modal-cnt,
.z-messagebox-window .z-window-highlighted-cnt {
	padding: 17px;
	padding-bottom: 15px;
}
.z-messagebox-btn {
	min-width: 48pt;
	width: 100%;
}
.z-msgbox {
	display: -moz-inline-box;
	display: inline-block;
	background-repeat: no-repeat;
	vertical-align: top;
	cursor: pointer;
	border: 0;
	width: 32px;
	height: 32px;
}
.z-msgbox-question {
	background-image: url(${c:encodeThemeURL('~./zul/img/msgbox/question-btn.png')});
}
.z-msgbox-exclamation {
	background-image: url(${c:encodeThemeURL('~./zul/img/msgbox/warning-btn.png')});
}
.z-msgbox-information {
	background-image: url(${c:encodeThemeURL('~./zul/img/msgbox/info-btn.png')});
}
.z-msgbox-error {
	background-image: url(${c:encodeThemeURL('~./zul/img/msgbox/stop-btn.png')});
}