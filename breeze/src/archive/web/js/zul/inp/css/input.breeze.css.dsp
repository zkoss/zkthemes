<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>

.z-textbox-disd,
.z-decimalbox-disd,
.z-intbox-disd,
.z-longbox-disd,
.z-doublebox-disd {
	 opacity: .6;
	 -moz-opacity: .6;
	 filter: alpha(opacity=60);
}

.z-textbox-disd,   .z-decimalbox-disd,   .z-intbox-disd,   .z-longbox-disd,   .z-doublebox-disd,
.z-textbox-disd *, .z-decimalbox-disd *, .z-intbox-disd *, .z-longbox-disd *, .z-doublebox-disd * {
	color: #AAA !important;
}
.z-textbox, .z-decimalbox, .z-intbox, .z-longbox, .z-doublebox {
	background: #FFFFFF repeat-x 0 0;
	border: 1px solid #E6E6E6;
	border-top-color: #B2B2B2;
	font-family: ${fontFamilyC};
	font-size: ${fontSizeM};
	font-weight: normal;
	padding-top: 2px;
	padding-bottom: 2px;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
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
	background: #FFF6F6 repeat-x 0 0;
	border: 1px solid #F2AEB2;
	/* border-top: 1px solid #D59191; */
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
}

<%-- Inplace editing--%>
.z-textbox-inplace,
.z-decimalbox-inplace,
.z-intbox-inplace,
.z-longbox-inplace,
.z-doublebox-inplace {
	border: 0;
	padding: 3px 1px;
	background: none;
}
<c:if test="${c:isOpera()}">
.z-textbox-inplace,
.z-decimalbox-inplace,
.z-intbox-inplace,
.z-longbox-inplace,
.z-doublebox-inplace {
	padding: 3px 2px;
}
</c:if>
<c:if test="${c:isExplorer()}">
.z-textbox-inplace,
.z-decimalbox-inplace,
.z-intbox-inplace,
.z-longbox-inplace,
.z-doublebox-inplace {
	padding: 3px 2px;
}
</c:if>
<%-- error box --%>
.z-errbox {
	font-family: ${fontFamilyC};
	font-size: ${fontSizeM}; 
	font-weight: normal;
	-moz-box-shadow: 0 0 0 rgba(0, 0, 0, 0);
	overflow: visible !important;
}
.z-errbox .z-popup-cnt {
	font-family: ${fontFamilyC};
	font-size: 11;
	font-weight: bold;	
	color: #940000;
	padding: 2px 2px;
}
.z-errbox-center {
	padding: 5px 3px;
}
.z-errbox-left {
	background-image: url(${c:encodeURL('~./zul/img/breeze/errbox/error-icon.png')});
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
	background-image: url(${c:encodeURL('~./zul/img/breeze/errbox/pointerD.png')});
	height: 6px;
}
.z-pointer-u {
	background-image: url(${c:encodeURL('~./zul/img/breeze/errbox/pointerU.png')});
	height: 6px;
}
.z-pointer-l {
	background-image: url(${c:encodeURL('~./zul/img/breeze/errbox/pointerL.png')});
	width: 6px;
}
.z-pointer-r {
	background-image: url(${c:encodeURL('~./zul/img/breeze/errbox/pointerR.png')});
	width: 6px;
}
.z-pointer-ld {
	background-image: url(${c:encodeURL('~./zul/img/breeze/errbox/pointerLD.png')});
}
.z-pointer-lu {
	background-image: url(${c:encodeURL('~./zul/img/breeze/errbox/pointerLU.png')});
}
.z-pointer-rd {
	background-image: url(${c:encodeURL('~./zul/img/breeze/errbox/pointerRD.png')});
}
.z-pointer-ru {
	background-image: url(${c:encodeURL('~./zul/img/breeze/errbox/pointerRU.png')});
}

.z-errbox-close, .z-errbox-close-over {
	background-image: url(${c:encodeURL('~./zul/img/breeze/errbox/error-close.gif')});
	zoom: 1; <%--Bug 2916148 --%>
}
.z-errbox-close-over {
	background-image: url(${c:encodeURL('~./zul/img/breeze/errbox/error-close-over.gif')});
}
.z-errbox.z-popup .z-popup-cl {
	background: transparent repeat-x 0 0;
	background-color : #FFEDED;
	border: 1px solid #940000;
	-moz-border-radius: 1px 1px 1px 1px;
	-moz-box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.35);
}

<c:if test="${c:isExplorer()}">
.z-textbox-disd *, .z-decimalbox-disd *, .z-intbox-disd *, .z-longbox-disd *, .z-doublebox-disd * {
	filter: alpha(opacity=60);
}

<%-- IE 6 GIF  --%>
<c:if test="${c:browser('ie6-')}">
.z-pointer-d {
	background-image: url(${c:encodeURL('~./zul/img/breeze/errbox/pointerD.gif')});
}
.z-pointer-l {
	background-image: url(${c:encodeURL('~./zul/img/breeze/errbox/pointerL.gif')});
}
.z-pointer-ld {
	background-image: url(${c:encodeURL('~./zul/img/breeze/errbox/pointerLD.gif')});
}
.z-pointer-lu {
	background-image: url(${c:encodeURL('~./zul/img/breeze/errbox/pointerLU.gif')});
}
.z-pointer-rd {
	background-image: url(${c:encodeURL('~./zul/img/breeze/errbox/pointerRD.gif')});
}
.z-pointer-ru {
	background-image: url(${c:encodeURL('~./zul/img/breeze/errbox/pointerRU.gif')});
}
.z-pointer-r {
	background-image: url(${c:encodeURL('~./zul/img/breeze/errbox/pointerR.gif')});
}
.z-pointer-u {
	background-image: url(${c:encodeURL('~./zul/img/breeze/errbox/pointerU.gif')});
}
.z-errbox-left {
	background-image: url(${c:encodeURL('~./zul/img/breeze/errbox/error-icon.gif')});
}
.z-popup .z-popup-cl {
	background: transparent repeat-x 0 0;
	background-image: url(${c:encodeURL('~./zul/img/popup2/popup-bg.png')});
	background-position: 0 -2px;
	border: 1px solid #CFCFCF;
	padding-left: 0;
}
.z-errbox .z-popup-cl {
	background: none !important;
	background-color : #FFEDED !important;
	border: 1px solid #940000 !important;
	-moz-border-radius: 1px 1px 1px 1px !important;
	-moz-box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.35) !important;
}
</c:if>
</c:if>
