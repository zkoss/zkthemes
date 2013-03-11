<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>

.z-popup,
.z-popup-plain {
	position: absolute;
	top: 0;
	left: 0;
	border: 0 none;
	font-family: ${fontFamilyC};
	font-size: ${fontSizeXS};
	font-weight: normal;
	margin: 0;
	overflow: hidden;
	padding: 0;
	${t:borderRadius('1px')}
	${t:boxShadow('0 0 15px rgba(0, 0, 0, 0.35)')}
}
.z-popup .z-popup-cl {
	${t:gradient(G_Background_Button_Gradient_Direction, '#FFFFFF 0%; #F5F5F5 100%')}
	border: 1px solid #CFCFCF;
	padding-left: 0;
}
.z-popup .z-popup-cnt {
	margin: 0;
	color: #555555;
	line-height: 20px;
	color: ${G_Font_Color2};
	padding: 10px;
	fint-size: ${fontSizeXS};
}

<%-- notification --%>
.z-notification {
	position: absolute;
	top: 0;
	left: 0;
	border: 0 none;
	margin: 0;
	padding: 0;
	background: none;
}
.z-notification .z-notification-cl,
.z-notification .z-notification-cnt {
	width: 250px;
	min-height: 100px;
}
.z-notification-ref .z-notification-cl,
.z-notification-ref .z-notification-cnt {
	width: 125px;
	min-height: 50px;
}
.z-notification .z-notification-cl {
	position: relative;
	padding: 15px;
	padding-left: 55px;
	${t:borderRadius('10px')}
	${t:boxShadow('1px 1px 3px rgba(0, 0, 0, 0.35)')}
	background: transparent no-repeat 15px 15px;
}
.z-notification-ref .z-notification-cl {
	overflow: hidden;
	padding: 5px;
	padding-left: 55px;
	${t:borderRadius('5px')}
	background-position: 17px 18px;
}
.z-notification .z-notification-close,
.z-notification-ref .z-notification-close {
	position: absolute;
	width: 12px;
	height: 12px;
	cursor: pointer;
}
.z-notification .z-notification-close {
	top: 10px;
	right: 10px;
}
.z-notification-ref .z-notification-close {
	top: 5px;
	right: 5px;
}
.z-notification .z-notification-cnt {
	overflow: hidden;
	margin: 0 !important;
	background: none;
	font-family: ${fontFamilyC};
	font-size: ${fontSizeS};
	font-weight: normal;
}

.z-notification-ref .z-notification-cnt {
	display: table-cell;
	vertical-align: middle;
	font-size: ${fontSizeS};
}
.z-notification .z-notification-pointer {
	position: absolute;
	display: none;
	width: 0;
	height: 0;
	border: 10px solid transparent;
	z-index: 100;
}
<%-- notification: base style --%>
.z-notification .z-notification-cl {
	background-color: rgba(51, 51, 51, 0.9);
	color: #FFFFFF;
}
.z-notification .z-notification-pointer-l,
.z-notification .z-notification-pointer-r,
.z-notification .z-notification-pointer-u,
.z-notification .z-notification-pointer-d {
	border: 10px solid transparent;
}
.z-notification .z-notification-pointer-l {
	border-right-color: rgba(51, 51, 51, 0.9);
}
.z-notification .z-notification-pointer-r {
	border-left-color: rgba(51, 51, 51, 0.9);
}
.z-notification .z-notification-pointer-u {
	border-bottom-color: rgba(51, 51, 51, 0.9);
}
.z-notification .z-notification-pointer-d {
	border-top-color: rgba(51, 51, 51, 0.9);
}

<%-- bug ZK-1135: IE8 does not support rgba --%>
<c:set var="infoColor" value="rgba(33, 155, 166, 0.88)" />
<c:set var="warningColor" value="rgba(234, 67, 23, 0.88)" />
<c:set var="errorColor" value="rgba(190, 0, 5, 0.88)" />

<%-- notification: info --%>
.z-notification-info .z-notification-cl {
	background-color: ${infoColor};
	background-image: url(${c:encodeThemeURL('~./zul/img/popup/notif-info.png')});
}
.z-notification-info .z-notification-pointer-l {
	border-right-color: ${infoColor};
}
.z-notification-info .z-notification-pointer-r {
	border-left-color: ${infoColor};
}
.z-notification-info .z-notification-pointer-u {
	border-bottom-color: ${infoColor};
}
.z-notification-info .z-notification-pointer-d {
	border-top-color: ${infoColor};
}

<%-- notification: warning --%>
.z-notification-warning .z-notification-cl {
	background-color: ${warningColor};
	background-image: url(${c:encodeThemeURL('~./zul/img/popup/notif-warning.png')});
}
.z-notification-warning .z-notification-pointer-l {
	border-right-color: ${warningColor};
}
.z-notification-warning .z-notification-pointer-r {
	border-left-color: ${warningColor};
}
.z-notification-warning .z-notification-pointer-u {
	border-bottom-color: ${warningColor};
}
.z-notification-warning .z-notification-pointer-d {
	border-top-color: ${warningColor};
}

<%-- notification: error --%>
.z-notification-error .z-notification-cl {
	background-color: ${errorColor};
	background-image: url(${c:encodeThemeURL('~./zul/img/popup/notif-error.png')});
}
.z-notification-error .z-notification-pointer-l {
	border-right-color: ${errorColor};
}
.z-notification-error .z-notification-pointer-r {
	border-left-color: ${errorColor};
}
.z-notification-error .z-notification-pointer-u {
	border-bottom-color: ${errorColor};
}
.z-notification-error .z-notification-pointer-d {
	border-top-color: ${errorColor};
}

.z-notification .z-notification-close,
.z-notification .z-notification-close-over {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/popup/notif-close.png')});
	background-repeat: no-repeat;
	background-position: center; 
}
.z-notification-cnt {
	padding-right: 18px; 
}
.z-notification .z-notification-close,
.z-notification .z-notification-close-over,
.z-notification-ref .z-notification-close,
.z-notification-ref .z-notification-close-over {
	width: 18px;
	height: 18px;
}