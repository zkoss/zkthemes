<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>
.z-biglistbox {
	overflow: hidden;
	zoom: 1;
	border: 1px solid #CFCFCF;
	background: #f0f0f0;
	position: relative;
}
.z-biglistbox-head, .z-biglistbox-head tr {
	border: 0;
	width: 100%;
	line-height: 17px;
}
.z-biglistbox-head,
.z-biglistbox-body,
.z-biglistbox-head-shim,
.z-biglistbox-body-shim {
	overflow: hidden;
	float: left;
}
.z-biglistbox-head-shim,
.z-biglistbox-body-shim {
	width: 3px;
	height: 1px;
}
.z-biglistbox-head-outer, .z-biglistbox-body-outer {
	overflow: hidden;
}
.z-biglistbox-head tr {
	${t:gradient(G_Background_Gradient_Direction, G_Background)}
}
.z-biglistbox-body td {
	padding: 5px;
	white-space: nowrap;
	border: 1px solid transparent;
	border-left: 1px solid #FFF;
	${t:applyCSS3('box-sizing', 'border-box')}
}
.z-biglistbox-body tr {
	line-height: 20px;
}
.z-biglistbox-body {
	background: white;
	border: 0;
	overflow: hidden;
	width: 100%;
	position: relative;
}
.z-biglistbox-vbar-fx {
	position: absolute;
	top: -3px;
	background: #e1e1e1;
	border: 1px solid #cccccc;
	width: 3px;
	height: 100%;
}
.z-biglistbox-vbar-tick {
	position: absolute;
	bottom: 0;
	border: 1px solid #CFCFCF;
	${t:gradient('hor', G_Background)}
	height: 32px;
	${t:applyCSS3('box-sizing', 'border-box')}
	overflow: hidden;
	width: 9px;
	z-index: 20;
	cursor: w-resize;
}
<%-- no supported yet
.z-biglistbox-hbar-tick {
	position: absolute;
	border: 1px solid #CFCFCF;
	${t:gradient('hor', G_Background)}
	height: 32px;
	${t:applyCSS3('box-sizing', 'border-box')}
	overflow: hidden;
	width: 16px;
	z-index: 20;
	cursor: n-resize;
}
--%>
.z-biglistbox-body td {
	overflow: hidden;
	padding: 0 2px;
	font-size: ${fontSizeXS};
	font-weight: normal;
	border: 1px solid transparent;
	cursor: pointer;
}
.z-biglistbox-body td {
	padding: 5px;
	border: 1px solid transparent;
	border-left: 1px solid #FFF;
}
.z-biglistbox-head .z-biglistbox-header  {
	overflow: hidden;
	cursor: default;
}
.z-biglistbox-outer {
	position: relative;
	background: white;
	margin: 0 32px 32px 0;
	border: 1px solid #CFCFCF;
	border-top: 0px;
	border-left: 0px;
}

<%-- sorting --%>
.z-biglistbox-header {
	overflow: hidden;
	border: 1px solid;
	white-space: nowrap;
	color: #636363;
	border-color: #CFCFCF #CFCFCF #CFCFCF white;
	border-top: none;
	text-align: left;
	padding: 7px 9px 7px 5px;
	font-family: ${fontFamilyC};
	font-size: ${fontSizeXS};
	font-weight: bold;
}

th.z-biglistbox-header-sort .z-biglistbox-cnt {
	cursor: pointer;
	padding-right: 9px;
	background: transparent no-repeat 99% center;
	padding: 7px 5px;
	font-weight: bold;
}
th.z-biglistbox-header-sort-asc .z-biglistbox-cnt {
	cursor: pointer;
	padding-right: 9px;
	background: transparent no-repeat 99% center;
}
th.z-biglistbox-header-sort-dsc .z-biglistbox-cnt {
	cursor: pointer;
	padding-right: 9px;
	background: transparent no-repeat 99% center;
}
.z-biglistbox-header-cnt {
	white-space: nowrap; <%-- Bug #1839960  --%>
	position: relative; <%-- Bug #1825896  --%>
}
.z-biglistbox-sort-img {
	position: absolute;
	float: left;
	left: 50%;
	font-size: 0;
	margin-left: auto;
    margin-right: auto;
}
.z-biglistbox-sort .z-biglistbox-sort-img {
	margin-top: -5px;
	width: 8px;
	height: 5px;
}
.z-biglistbox-sort-asc .z-biglistbox-sort-img,
.z-biglistbox-sort-dsc .z-biglistbox-sort-img {
	background-position: 0 0;
    background-repeat: no-repeat;
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/arrows.png')});
}

.z-biglistbox-sort-asc .z-biglistbox-sort-img {
	background-position: 0 0;
}

.z-biglistbox-sort-dsc .z-biglistbox-sort-img {
	background-position: 0 -5px;
}

<%-- faker uses only --%>
thead.z-biglistbox-faker th {
	border: 0;
	height: 0;
	margin: 0;
	line-height: 0;
	font-size: 0;
	padding: 0;
	width: 45px;
	overflow: hidden;
}

<%-- scrollbar --%>
.z-biglistbox-ws-v {
	position: absolute;
	top: 0;
	z-index: 10;
	width: 32px;
	height: 100%;
	right: -33px;
	${t:boxShadow('inset 1px 1px 7px rgba(210, 210, 210, 0.75), inset -1px -1px 7px rgba(210, 210, 210, 0.75)')}
}
.z-biglistbox-ws-v .z-biglistbox-ws-drag {
	${t:applyCSS3('box-sizing', 'border-box')}
	height: 176px;
	width: 32px;
	overflow: hidden;
	position: absolute;
	z-index: 15;
	cursor: pointer;
	background-position: center center;
	background-repeat: no-repeat;
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/big/drag-v.png')}),
		${t:gradValue(G_Background_Gradient_Direction, G_Background)};
	border: 1px solid ${G_Background_Border_Color};
	${t:borderRadius('2em')}
}
.z-biglistbox-ws-v .z-biglistbox-ws-home,
.z-biglistbox-ws-v .z-biglistbox-ws-up {
	border-bottom: 1px solid ${G_Background_Border_Color};
	background-position: center center;
	background-repeat: no-repeat;
}
.z-biglistbox-ws-v .z-biglistbox-ws-down,
.z-biglistbox-ws-v .z-biglistbox-ws-end {
	border-top: 1px solid ${G_Background_Border_Color};
	background-position: center center;
	background-repeat: no-repeat;
}
.z-biglistbox-ws-v .z-biglistbox-ws-home {
	top: 0;
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/big/drag-v-home.png')});
}
.z-biglistbox-ws-v .z-biglistbox-ws-up {
	top: 32px;
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/big/drag-v-up.png')});
}
.z-biglistbox-ws-v .z-biglistbox-ws-down {
	bottom: 32px;
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/big/drag-v-down.png')});
}
.z-biglistbox-ws-v .z-biglistbox-ws-end {
	bottom: 0;
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/big/drag-v-end.png')});
}
.z-biglistbox-ws-v .z-biglistbox-ws-home:active {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/big/drag-v-home.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background_Active)};
	${t:boxShadow(G_Background_Active_Shadow)}
}
.z-biglistbox-ws-v .z-biglistbox-ws-up:active {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/big/drag-v-up.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background_Active)};
	${t:boxShadow(G_Background_Active_Shadow)}
}
.z-biglistbox-ws-v .z-biglistbox-ws-down:active {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/big/drag-v-down.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background_Active)};
	${t:boxShadow(G_Background_Active_Shadow)}
}
.z-biglistbox-ws-v .z-biglistbox-ws-end:active {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/big/drag-v-end.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background_Active)};
	${t:boxShadow(G_Background_Active_Shadow)}
}
.z-biglistbox-ws-v .z-biglistbox-ws-home,
.z-biglistbox-ws-v .z-biglistbox-ws-up,
.z-biglistbox-ws-v .z-biglistbox-ws-down,
.z-biglistbox-ws-v .z-biglistbox-ws-end {
	position: absolute;
	${t:applyCSS3('box-sizing', 'border-box')}
	height: 32px;
	width: 100%;
}
.z-biglistbox-ws-v .z-biglistbox-ws-home:active {
	${t:borderRadius('2em 2em 0 0')}
}
.z-biglistbox-ws-v .z-biglistbox-ws-end:active {
	${t:borderRadius('0 0 2em 2em')}
}

.z-biglistbox-ws-v .z-biglistbox-ws-pos {
	position: absolute;
	z-index: 10;
	width: 24px;
	height: 176px;
	left: 4px;
	background-color: #000000;
	${t:borderRadius('2em')}
	top: 0;
	opacity: 0.25;
	visibility: visible;
}
.z-biglistbox-ws-v .z-biglistbox-ws-endbar {
	${t:borderRadius('1px 1px 2px 2px')}
	border: 1px solid #CFCFCF;
	width: 30px;
	background: #FDFDFD;
	height: 7px;
	overflow: hidden;
	position: absolute;
	z-index: 20;
	right: 0px;
}
<%-- horizontal --%>
.z-biglistbox-ws-h {
	position: absolute;
	left: 0;
	z-index: 10;
	width: 100%;
	height: 32px;
	bottom: -33px;
	${t:boxShadow('inset 1px 1px 7px rgba(210, 210, 210, 0.75), inset -1px -1px 7px rgba(210, 210, 210, 0.75)')}
}
.z-biglistbox-ws-h .z-biglistbox-ws-drag {
	${t:applyCSS3('box-sizing', 'border-box')}
	height: 32px;
	width: 176px;
	overflow: hidden;
	position: absolute;
	z-index: 15;
	cursor: pointer;
	background-position: center center;
	background-repeat: no-repeat;
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/big/drag-h.png')}),
		${t:gradValue(G_Background_Gradient_Direction, G_Background)};
	border: 1px solid ${G_Background_Border_Color};
	${t:borderRadius('2em')}
}
.z-biglistbox-ws-h .z-biglistbox-ws-home,
.z-biglistbox-ws-h .z-biglistbox-ws-up {
	border-right: 1px solid ${G_Background_Border_Color};
	background-position: center center;
	background-repeat: no-repeat;
}
.z-biglistbox-ws-h .z-biglistbox-ws-down,
.z-biglistbox-ws-h .z-biglistbox-ws-end {
	border-left: 1px solid ${G_Background_Border_Color};
	background-position: center center;
	background-repeat: no-repeat;
}
.z-biglistbox-ws-h .z-biglistbox-ws-home {
	left: 0;
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/big/drag-h-home.png')});
}
.z-biglistbox-ws-h .z-biglistbox-ws-up {
	left: 32px;
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/big/drag-h-up.png')});
}
.z-biglistbox-ws-h .z-biglistbox-ws-down {
	right: 32px;
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/big/drag-h-down.png')});
}
.z-biglistbox-ws-h .z-biglistbox-ws-end {
	right: 0;
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/big/drag-h-end.png')});
}
.z-biglistbox-ws-h .z-biglistbox-ws-home:active {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/big/drag-h-home.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background_Active)};
	${t:boxShadow(G_Background_Active_Shadow)}
}
.z-biglistbox-ws-h .z-biglistbox-ws-up:active {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/big/drag-h-up.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background_Active)};
	${t:boxShadow(G_Background_Active_Shadow)}
}
.z-biglistbox-ws-h .z-biglistbox-ws-down:active {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/big/drag-h-down.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background_Active)};
	${t:boxShadow(G_Background_Active_Shadow)}
}
.z-biglistbox-ws-h .z-biglistbox-ws-end:active {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/big/drag-h-end.png')}),
		${t:gradValue(G_Background_Button_Gradient_Direction, G_Background_Active)};
	${t:boxShadow(G_Background_Active_Shadow)}
}
.z-biglistbox-ws-h .z-biglistbox-ws-home,
.z-biglistbox-ws-h .z-biglistbox-ws-up,
.z-biglistbox-ws-h .z-biglistbox-ws-down,
.z-biglistbox-ws-h .z-biglistbox-ws-end {
	position: absolute;
	${t:applyCSS3('box-sizing', 'border-box')}
	height: 100%;
	width: 32px;
}
.z-biglistbox-ws-h .z-biglistbox-ws-home:active {
	${t:borderRadius('2em 0 0 2em')}
}
.z-biglistbox-ws-h .z-biglistbox-ws-end:active {
	${t:borderRadius('0 2em 2em 0')}
}
.z-biglistbox-ws-h .z-biglistbox-ws-pos {
	position: absolute;
	z-index: 10;
	height: 24px;
	width: 176px;
	top: 4px;
	background-color: #000;
	${t:borderRadius('2em')}
	left: 0;
	opacity: 0.25;
	visibility: visible;
}
.z-biglistbox-ws-h .z-biglistbox-ws-endbar {
	${t:borderRadius('1px 2px 2px 1px')}
	border: 1px solid #CFCFCF;
	height: 30px;
	background: #FDFDFD;
	overflow: hidden;
	position: absolute;
	width: 7px;
	z-index: 20;
	right: -12px;
}
tr.z-biglistbox-odd {
	background: #F7F7F7;
}
tr.z-biglistbox-odd > td {
	border-color: #F7F7F7 #F7F7F7 #F7F7F7 #FFFFFF;
}
tr.z-biglistbox-seld {
	${t:gradient(G_Background_Button_Gradient_Direction, '#F2F9FE 0%; #D6F0FD 100%')}
}
<%-- scrolling --%>
.z-biglistbox-load {
	display: none;
	position: absolute;
}
.z-biglistbox-load-image {
	width: 32px;
	height: 32px;
}
.z-biglistbox-load-image-up {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/layout/load-up.png')});
}
.z-biglistbox-load-image-down {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/layout/load-down.png')});
}
.z-biglistbox-load-image-left {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/layout/load-left.png')});
}
.z-biglistbox-load-image-right {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/layout/load-right.png')});
}
.z-biglistbox-load-count {
	vertical-align: middle;
	text-align: center;
}