<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>

.z-combobutton,
.z-combobutton-img {
	display:inline-block;
}

.z-combobutton .z-combobutton-btn,
.z-combobutton-over .z-combobutton-btn {
	display:inline-block;
	width: 21px;
	height: 21px;
	<c:if test="${c:browser('ie7-') || c:browser('ie6-')}">
		margin-top: 1px;
	</c:if>
}

.z-combobutton-img {
	width: 19px;
	height: 19px;
	margin: 1px;
}

.z-combobutton .z-combobutton-btn-img,
.z-combobutton-over .z-combobutton-btn-img {
	background: transparent no-repeat;
	background-image:url(${c:encodeURL('~./zul/img/silvertail/button/combobutton-right-btn.gif')});
	padding-top: 3px;
	padding-right: 3px;
	width: 15px;
	height: 15px;
}

.z-combobutton-over .z-combobutton-btn-img {
	background-image:url(${c:encodeURL('~./zul/img/silvertail/button/combobutton-right-btn.gif')});
}

.z-combobutton .z-combobutton-cbbtn,
.z-combobutton-over .z-combobutton-cbbtn {
	background: transparent;
	border:0 none;
    font-size: ${fontSizeM};;
    font-family: arial,sans-serif;
    font-weight: normal;
    height: 21px;
    white-space: nowrap;
    outline-color:-moz-use-text-color;
	outline-style:none;
	outline-width:0;
	text-decoration: none;
}

<c:if test="${c:browser('gecko')}">
.z-combobutton .z-combobutton-cbbtn::-moz-focus-inner {
	border: 0 none;
}
</c:if>

.z-combobutton-pp {
	display: block;
	position: absolute;
	background: white; border: 1px solid #CCCCCC; padding: 2px;
	font-size: ${fontSizeS};
	font-family: ${fontFamilyC};
	overflow: auto;
}

.z-combobutton .z-combobutton-btn,
.z-combobutton-over .z-combobutton-btn,
.z-combobutton .z-combobutton-btn-img,
.z-combobutton-over .z-combobutton-btn-img,
.z-combobutton .z-combobutton-cbbtn,
.z-combobutton-over .z-combobutton-cbbtn,
.z-combobutton .z-combobutton-cbbtn-img,
.z-combobutton .z-combobutton-inner-l,
.z-combobutton .z-combobutton-inner-r {
	cursor: pointer;
}

.z-combobutton,
.z-combobutton .z-combobutton-btn,
.z-combobutton-over .z-combobutton-btn,
.z-combobutton .z-combobutton-inner-l,
.z-combobutton .z-combobutton-inner-r,
.z-combobutton-over .z-combobutton-inner-l,
.z-combobutton-over .z-combobutton-inner-r,
.z-combobutton-clk .z-combobutton-inner-l,
.z-combobutton-clk .z-combobutton-inner-r {
	display: inline-block;
}

<%-- 1 x 2 layout below --%>
<%-- default --%>
.z-combobutton .z-combobutton-inner-l {
	background-repeat: no-repeat;
	background-position : 0 0;
	background-image : url(${c:encodeURL('~./zul/img/silvertail/button/combobutton-btn-def-l.png')});
	height: 21px;
	float: left;
}

.z-combobutton .z-combobutton-inner-r {
	background: transparent no-repeat left;
	background-position: right 0;
	background-image : url(${c:encodeURL('~./zul/img/silvertail/button/combobutton-btn-def-r.png')});
	height: 21px;
	border-left: 2px solid #CCCCCC;
	float: left;
}

<%-- over and click --%>
.z-combobutton-over .z-combobutton-inner-r {
	border-color: #AAAAAA;
}

.z-combobutton-over .z-combobutton-inner-l,
.z-combobutton-clk .z-combobutton-inner-l {
	background-image : url(${c:encodeURL('~./zul/img/silvertail/button/combobutton-btn-sld-l.png')});
}

.z-combobutton-over .z-combobutton-inner-r,
.z-combobutton-clk .z-combobutton-inner-r {
	background-image : url(${c:encodeURL('~./zul/img/silvertail/button/combobutton-btn-sld-r.png')});
}

<c:if test="${c:browser('ie6-')}">
.z-combobutton .z-combobutton-inner-l {
	background-image : url(${c:encodeURL('~./zul/img/silvertail/button/combobutton-btn-def-l.gif')});
}

.z-combobutton .z-combobutton-inner-r {
	background-image : url(${c:encodeURL('~./zul/img/silvertail/button/combobutton-btn-def-r.gif')});
}

.z-combobutton-over .z-combobutton-inner-l,
.z-combobutton-clk .z-combobutton-inner-l {
	background-image : url(${c:encodeURL('~./zul/img/silvertail/button/combobutton-btn-sld-l.gif')});
}

.z-combobutton-over .z-combobutton-inner-r,
.z-combobutton-clk .z-combobutton-inner-r {
	background-image : url(${c:encodeURL('~./zul/img/silvertail/button/combobutton-btn-sld-r.gif')});
}
</c:if>