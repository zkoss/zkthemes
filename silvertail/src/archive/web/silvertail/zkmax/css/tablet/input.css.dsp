<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>

.z-textbox-disd,
.z-decimalbox-disd,
.z-intbox-disd,
.z-longbox-disd,
.z-doublebox-disd {
	 opacity: .6;
}
.z-textbox-disd,   .z-decimalbox-disd,   .z-intbox-disd,   .z-longbox-disd,   .z-doublebox-disd,
.z-textbox-disd *, .z-decimalbox-disd *, .z-intbox-disd *, .z-longbox-disd *, .z-doublebox-disd * {
	color: #AAAAAA !important;
}
.z-textbox,
.z-decimalbox,
.z-intbox,
.z-longbox,
.z-doublebox {
	background: #FFFFFF repeat-x 0 0;
	border: 1px solid #E6E6E6;
	border-top-color: #B2B2B2;
	font-family: ${fontFamilyC};
	font-size: ${fontSizeXS};
	font-weight: normal;
	padding: 2px;
	${t:borderRadius('2px')}
	<c:if test="${zk.safari > 0}">
		margin: 0;
	</c:if>
	line-height: 26px;
	outline: none;
}
.z-textbox-focus, .z-textbox-focus input,
.z-decimalbox-focus, .z-decimalbox-focus input,
.z-intbox-focus, .z-intbox-focus input,
.z-longbox-focus, .z-longbox-focus input,
.z-doublebox-focus, .z-doublebox-focus input {
	background: #FFFFFF repeat-x 0 0;
	border: 1px solid #D5EAFD;
	border-top: 1px solid #94B9DA;
}
.z-textbox-text-invalid,
.z-decimalbox-text-invalid,
.z-intbox-text-invalid,
.z-longbox-text-invalid,
.z-doublebox-text-invalid {
	background: #FFF repeat-x 0 0;
	border: 1px solid #DD7777;
}
.z-textbox-readonly, .z-textbox-text-disd,
.z-intbox-readonly, .z-intbox-text-disd,
.z-longbox-readonly, .z-longbox-text-disd,
.z-doublebox-readonly, .z-doublebox-text-disd,
.z-decimalbox-readonly, .z-decimalbox-text-disd {
	background: #F0F0F0;
	border: 1px solid #E6E6E6;
	border-top: 1px solid #B2B2B2;
}
.z-textbox-readonly,
.z-intbox-readonly,
.z-longbox-readonly,
.z-doublebox-readonly,
.z-decimalbox-readonly {
	background: #FAFAFA;
	cursor: default;
}

<%-- Inplace editing--%>
.z-textbox-inplace,
.z-decimalbox-inplace,
.z-intbox-inplace,
.z-longbox-inplace,
.z-doublebox-inplace {
	border: 0;
	padding: 3px;
	background: none;
}

<%-- error box --%>
.z-errbox {
	font-family: ${fontFamilyC};
	font-size: ${fontSizeXS};
	font-weight: normal;
	${t:boxShadow('0 0 0 rgba(0, 0, 0, 0)')}
	overflow: visible !important;
}
.z-errbox .z-popup-cnt {
	font-family: ${fontFamilyC};
	font-size: ${fontSizeXS};
	font-weight: bold;
	padding: 2px 2px;
}
.z-errbox-center {
	color: #990000;
	padding: 3px 3px 5px;
}
.z-errbox-left {
	background-image: url(${c:encodeThemeURL('~./zul/img/errbox/error-icon.png')});
	background-repeat: no-repeat;
	background-position: 5px 4px;
	cursor: pointer; 
	border: 0;
	padding-left: 22px;
}
.z-errbox-right {
	background-repeat: no-repeat;
	cursor: pointer; 
	border: 0;
	padding-right: 11px;
	background-position: right 0;
}
.z-pointer {
	background-repeat: no-repeat;
	position: absolute;
	width: 15px;
	height: 11px;
}
.z-pointer-d {
	background-image: url(${c:encodeThemeURL('~./zul/img/errbox/pointerD.png')});
	height: 6px;
}
.z-pointer-u {
	background-image: url(${c:encodeThemeURL('~./zul/img/errbox/pointerU.png')});
	height: 6px;
}
.z-pointer-l {
	background-image: url(${c:encodeThemeURL('~./zul/img/errbox/pointerL.png')});
	width: 6px;
}
.z-pointer-r {
	background-image: url(${c:encodeThemeURL('~./zul/img/errbox/pointerR.png')});
	width: 6px;
}
.z-pointer-ld {
	background-image: url(${c:encodeThemeURL('~./zul/img/errbox/pointerLD.png')});
}
.z-pointer-lu {
	background-image: url(${c:encodeThemeURL('~./zul/img/errbox/pointerLU.png')});
}
.z-pointer-rd {
	background-image: url(${c:encodeThemeURL('~./zul/img/errbox/pointerRD.png')});
}
.z-pointer-ru {
	background-image: url(${c:encodeThemeURL('~./zul/img/errbox/pointerRU.png')});
}
.z-errbox-close,
.z-errbox-close-over {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/inp/error-close.png')});
}
.z-errbox.z-popup .z-popup-cl {
	background: transparent repeat-x 0 0;
	background-color: #FFEEEE;
	border: 1px solid #990000;
	${t:borderRadius('1px')}
	${t:boxShadow('1px 1px 3px rgba(0, 0, 0, 0.35)')}
}
