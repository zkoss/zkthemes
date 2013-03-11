<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>

@media print {
    .z-borderlayout {
		<c:if test="${zk.safari > 0}"><%-- Bug 2949287--%>
			position: static;
		</c:if>
	}
}

@media screen {
    .z-borderlayout {
		position: relative;
	}
}

.z-borderlayout {
	width:100%;
	height:100%;
	overflow: hidden;
	background-color: #F0F0F0;
	border: 0;
}

.z-north,
.z-south,
.z-west,
.z-center,
.z-east {
	border: 1px solid #C5C5C5;
	position: absolute;
	overflow: hidden;
	background-color: white;
}
.z-north,
.z-south,
.z-center {
	width: 100%;
	<%-- Fixed for B30-1902533.zul--%>
}
.z-west,
.z-east {
	height: 100%;
	<%-- Fixed for B30-1902533.zul--%>
}
.z-west-noborder,
.z-center-noborder,
.z-east-noborder,
.z-north-noborder,
.z-south-noborder {
	border:0;
}

.z-west-header,
.z-center-header,
.z-east-header,
.z-north-header,
.z-south-header {
	color: ${G_Font_Color2};
	font-size: ${fontSizeM};
	font-family: ${fontFamilyT};
	font-weight: bold;
	padding: 5px;
	border-bottom: 1px solid #C5C5C5;
	white-space: nowrap;
	overflow: hidden;
	cursor: default;
	${t:gradient(G_Background_Gradient_Direction, G_Background)}
	line-height: 38px;
	font-size: ${fontSizeS};
}
.z-east-colpsd,
.z-west-colpsd,
.z-south-colpsd,
.z-north-colpsd {
	background-color: #FCFCFC;
	width: 36px;
	height: 36px;
 	cursor: pointer;<%-- ios issue --%>
	padding: 5px;
	border: 1px solid #C5C5C5;
	overflow: hidden;
	position: absolute;
}
.z-east-colpsd-over,
.z-west-colpsd-over,
.z-south-colpsd-over,
.z-north-colpsd-over {
	cursor: pointer;
	background-color: #FCFCFC;
}

.z-borderlayout-icon {
	margin: 3px 2px 0 0;
	overflow: hidden;
	cursor: pointer;
	border: 1px solid ${G_Background_Border_Color};
	${t:borderRadius('20px')}
	${t:gradient(G_Background_Button_Gradient_Direction, G_Background)}
	${t:applyCSS3('box-sizing', 'border-box')}
	height: 32px;
	width: 32px;
	float: right;
}
.z-borderlayout-icon:active {
	border-top-color: ${G_Background_Active_Border_Color_TL};
	border-left-color: ${G_Background_Active_Border_Color_TL};
	border-bottom-color: ${G_Background_Active_Border_Color_BR};
	border-right-color: ${G_Background_Active_Border_Color_BR};
	
	${t:gradient(G_Background_Button_Gradient_Direction, G_Background_Active)}
	${t:boxShadow(G_Background_Active_Shadow)}
}
.z-borderlayout-icon-img {
	background: transparent no-repeat center center;
	height: 100%;
	cursor: pointer;
}
.z-north-colps .z-borderlayout-icon-img,
.z-south-exp .z-borderlayout-icon-img {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/layout/north.png')});
}
.z-east-colps .z-borderlayout-icon-img,
.z-west-exp .z-borderlayout-icon-img {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/layout/east.png')});
}
.z-south-colps .z-borderlayout-icon-img,
.z-north-exp .z-borderlayout-icon-img {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/layout/south.png')});
}
.z-west-colps .z-borderlayout-icon-img,
.z-east-exp .z-borderlayout-icon-img {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/layout/west.png')});
}

.z-west, .z-west-colpsd {
	z-index: 12;
}
.z-center {
	z-index: 8;
}
.z-east, .z-east-colpsd {
	z-index: 10;
}
.z-north, .z-north-colpsd {
	z-index: 16;
}
.z-south, .z-south-colpsd {
	z-index: 14;
}
.z-west-splt {
	z-index: 12;
}
.z-east-splt {
	z-index: 10;
}
.z-north-splt {
	z-index: 16;
}
.z-south-splt {
	z-index: 14;
}

.z-east-splt,
.z-west-splt,
.z-north-splt,
.z-south-splt {
	${t:gradient('hor', '#FCFCFC 0%; #F0F0F0 100%')}
	height: 8px;
	width: 8px;
	position: absolute;
	cursor: col-resize;
	cursor: e-resize;
	line-height: 0;
	font-size: 0;
}
.z-north-splt,
.z-south-splt {
	${t:gradient('ver', '#FCFCFC 0%; #F0F0F0 100%')}
	cursor: row-resize;
	cursor: s-resize;
}

.z-east-splt-btn,
.z-west-splt-btn,
.z-north-splt-btn,
.z-south-splt-btn {
	opacity: 1;
	${t:gradient('ver', G_Background)}
	border: 1px solid #C5C5C5;
	${t:applyCSS3('box-sizing', 'border-box')};
	display: -moz-inline-box;
	vertical-align: top;
	display: inline-block;
    line-height: 1px;
    font-size: 1px;
    cursor: pointer;
	position: relative;
}
.z-east-splt-btn,
.z-west-splt-btn {
	${t:gradient('hor', G_Background)}
}

.z-east-splt-btn:active,
.z-west-splt-btn:active,
.z-north-splt-btn:active,
.z-south-splt-btn:active {
	${t:gradient('ver', G_Background_Active)}
	${t:boxShadow(G_Background_Active_Shadow)}
}
.z-east-splt-btn:active,
.z-west-splt-btn:active {
	${t:gradient('hor', G_Background_Active)}
}

.z-north-splt-btn:after,
.z-south-splt-btn:after,
.z-east-splt-btn:after,
.z-west-splt-btn:after {
	content:'';
	width: 0;
	height: 0;
	top: 12px;
	left: 2px;
	position: absolute;
	border-width: 3px;
	border-style: solid;
	border-color: transparent;
}
.z-west-splt-btn:after {
	border-right-color: #959595;
}
.z-east-splt-btn:after {
	left: 6px;
	border-left-color: #959595;
}

.z-north-splt-btn:after {
	top: 3px;
	left: 12px;
	border-bottom-color: #959595;
}

.z-south-splt-btn:after {
	top: 6px;
	left: 12px;
	border-top-color: #959595;
}

.z-west-splt-btn,
.z-east-splt-btn {
	width: 16px;
	min-height: 32px;
	height: 32px;
	left: -4px;
}
.z-north-splt-btn,
.z-south-splt-btn {
	min-height: 16px;
	height: 16px;
	width: 32px;
	top: -4px;
}
.z-north-capcnt,
.z-south-capcnt,
.z-west-capcnt,
.z-east-capcnt,
.z-center-capcnt {
	height: 32px;
}