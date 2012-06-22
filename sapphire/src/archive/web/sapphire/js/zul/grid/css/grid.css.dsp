<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>

<%-- Grid --%>
div.z-grid {
	border: 1px solid #8FB9D0;
	background: #FFF;
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/column-bg.png')});
	overflow: hidden;
	zoom: 1;
}
div.z-grid-header, div.z-grid-header tr, div.z-grid-footer {
	border: 0; width: 100%;
}

div.z-grid-header, div.z-grid-footer {
	overflow: hidden;
}
div.z-grid-header tr.z-columns, div.z-grid-header tr.z-auxhead {
	background-repeat: repeat-x;
	background-color: white;
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/column-bg.png')});
}
div.z-grid-header th.z-column, div.z-grid-header th.z-auxheader {
	overflow: hidden;
	border: 1px solid;
	white-space: nowrap;
	padding: 0 0 0 2px;
	border-color: #8FB9D0 #8FB9D0 #8FB9D0 white;
	border-top: none;
	<c:if test="${!(zk.ie >= 8)}">
	<%-- Bug B50-3178977 for IE6/7, but cannot use it for IE8+ (Bug ZK-398)--%>
	position: relative;
	</c:if>
}
div.z-grid-header .z-column-sort div.z-column-cnt {
	cursor: pointer;
	padding-right: 9px;
	background: transparent no-repeat 99% center;
}
div.z-grid-header .z-column-sort-asc div.z-column-cnt {
	cursor: pointer;
	padding-right: 9px;
	background-color:transparent;
	background-position: 99% center;
	background-repeat: no-repeat;
}
div.z-grid-header .z-column-sort-dsc div.z-column-cnt {
	cursor: pointer;
	padding-right: 9px;
	background:transparent ;
	background-position: 99% center;
	background-repeat: no-repeat;
}
div.z-grid-body {
	background: white; border: 0; overflow: auto; width: 100%;
}
tbody.z-grid-empty-body td{
   	font-family: ${fontFamilyC};
    font-size: ${fontSizeM};
    font-weight: normal;
    color:#7d7d7d;
    font-style:italic;
    text-align:center;
}
div.z-grid-pgi-b {
	border-top: 1px solid #8FB9D0; overflow: hidden; width: 100%;
}
div.z-grid-pgi-t {
	border-bottom: 1px solid #8FB9D0; overflow: hidden; width: 100%;
}
div.z-footer-cnt, div.z-row-cnt, div.z-group-cnt, div.z-groupfoot-cnt, div.z-column-cnt {
	border: 0; margin: 0; padding: 0;
	font-family: ${fontFamilyC};
	font-size: ${fontSizeM}; font-weight: normal;
}
div.z-row-cnt {
	padding: 1px 0 1px 0;
}
div.z-footer-cnt, div.z-column-cnt{
	overflow: hidden;
	cursor: default;
	color: #00547A;
}
.z-word-wrap div.z-row-cnt,
.z-word-wrap div.z-group-cnt,
.z-word-wrap div.z-groupfoot-cnt,
.z-word-wrap div.z-footer-cnt, .z-word-wrap div.z-column-cnt {
	word-wrap: break-word;
}
<%-- faker uses only --%>
tr.z-grid-faker, tr.z-grid-faker th, tr.z-grid-faker div {
	height: 0 !important;
	border-top: 0 !important; border-right : 0 !important;border-bottom: 0 !important;border-left: 0 !important;
	padding-top: 0 !important;	padding-right: 0 !important; padding-bottom: 0 !important;padding-left: 0 !important;
	margin-top: 0 !important; margin-right : 0 !important;margin-bottom: 0 !important;margin-left: 0 !important;
	font-size: ${fontSizeM} !important;
} <%-- these above css cannot be overrided--%>
.z-cell, td.z-row-inner, td.z-groupfoot-inner {
	padding: 0; 
	overflow: hidden;
}
div.z-column-cnt, div.z-row-cnt {
	font-family: ${fontFamilyC};
	font-size: ${fontSizeM};
	font-weight: bold;
	color: #00547A;
}
div.z-column-cnt, div.z-grid-header div.z-auxheader-cnt {
	padding: 8px 4px 7px;
}
<%-- Group --%>
tr.z-group {
	background: #E9F2FB repeat-x 0 0;
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/group_bg.gif')});
}
td.z-group-inner {
	padding: 2px; overflow: hidden;
	border-bottom:1px solid #8FB9D0;
	border-top:1px solid #8FB9D0;
}
.z-group-inner .z-group-cnt .z-label, .z-group-inner .z-group-cnt {
	color:#00547A;
	padding: 4px 2px;
	width: auto;
	font-weight: bold;
	font-size: ${fontSizeM};
	font-family: ${fontFamilyT};
}
.z-group-inner .z-group-cnt {
	padding: 3px 2px 0;
}
.z-group-img {
	width: 18px;
	min-height: 18px;
	height: 100%;
	display:-moz-inline-box;
	vertical-align: top;
	display: inline-block;
	background-image: url(${c:encodeThemeURL('~./zul/img/tree/arrow-toggle.gif')});
	background-repeat: no-repeat;
	vertical-align: top; cursor: pointer; border: 0;
}
.z-group-img-open {
	background-position: 0 -18px;
}
.z-group-img-close {
	background-position: 0 0;
}
<%-- Group foot --%>
.z-groupfoot {
	height: 25px;
	background: #E9F2FB repeat-x 0 0;
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/groupfoot_bg.gif')});
}
.z-groupfoot-inner .z-groupfoot-cnt .z-label, .z-groupfoot-inner .z-groupfoot-cnt {
	color:#00547A;
	font-weight: bold;
	font-size: ${fontSizeM};
	font-family: ${fontFamilyT};
}
td.z-groupfoot-inner {
	padding-left: 9px;
}
div.z-grid-footer {
	background: #F9F9F9;
	border-top: 1px solid #8FB9D0;
}
td.z-footer {
	padding: 5px 10px 5px 9px;
}
<%-- ZK Column's menu --%>
.z-column .z-column-cnt {
	position: relative;
	<c:if test="${zk.ie == 6}">
		 zoom: 1;
	</c:if>
}
.z-column-btn {
	display: none;
	position: absolute;
	z-index: 15;
	cursor: pointer;
	top: 0;
	right: 0;
	width: 23px;
	background: url(${c:encodeThemeURL('~./zul/img/grid/hd-btn.png')}) no-repeat scroll left 0 transparent;
	background-position: 0 0;
	<c:if test="${zk.mobile > 0}">
		display: block;
		background: none;
		min-height: 20px;
	</c:if>
}
<c:if test="${zk.mobile > 0}">
.z-column-btn:after {
	content:'';
	position: absolute;
	width: 0;
	height: 0;
	right: 7px;
	top: 13px;
	border-width: 4px;
	border-style: solid;
	border-color: #000000 transparent transparent transparent;
}
</c:if>
.z-column-over .z-column-btn, .z-column-visi .z-column-btn {
	display: block;
}
a.z-column-btn:hover {
	display: inline;
	background-position: right 0;
}
.z-column-over  {
	background-image: none;
}
.z-columns-menu-grouping .z-menuitem-img {
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/menu-group.png')});
}
.z-columns-menu-asc .z-menuitem-img {
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/menu-arrowup.png')});
}
.z-columns-menu-dsc .z-menuitem-img {
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/menu-arrowdown.png')});
}
.z-columns-menu-ungrouping .z-menuitem-img {
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/menu-ungroup.png')});
}
div.z-grid-header th.z-column-over,
div.z-grid-header th.z-auxheader-over {
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/header-over.png')});
}
.z-column-sort-img {
	position: absolute;
	float: left;
	left: 50%;
	font-size: 0;
	margin-left: auto;
    margin-right: auto;
}
.z-column-sort .z-column-sort-img {
	margin-top:-5px;
	width: 8px;
	height: 5px;
}
div.z-grid-header .z-column-sort-asc, div.z-grid-header .z-column-sort-dsc {
	background: none transparent;
}
.z-column-sort-asc .z-column-sort-img,
.z-column-sort-dsc .z-column-sort-img {
    background-position: 0 0;
    background-repeat: no-repeat;
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/arrows.png')});
}
.z-column-sort-asc .z-column-sort-img {
	background-position: 0 0;
}
.z-column-sort-dsc .z-column-sort-img {
	background-position: 0 -5px;
}

.z-grid-header-bg {
	position:relative;
	margin-right: -11px;
	top: 0;
	height: 1px;
	font-size: 0;
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/head-bg.png')});
	margin-top: -1px;
}
<%-- ZK Column's sizing --%>
div.z-grid-header .z-column.z-column-sizing, 
div.z-grid-header .z-column.z-column-sizing div.z-column-cnt,
div.z-grid-header .z-column.z-column-sizing div.z-column-cnt .z-column-btn {
	cursor: e-resize;
}
div.z-grid-header .z-column-over-sort-asc, div.z-grid-header .z-column-over-sort-dsc {
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/column-bg.png')});
}
div.z-grid-header tr.z-columns th:last-child,
div.z-grid-header tr.z-auxhead th:last-child {
	border-right: none;
}
tr.z-row td.z-row-inner,
tr.z-row .z-cell {
	background: white;
	border: 1px solid white;
	border-right: 1px solid transparent;
	<c:if test="${zk.ie == 6}">
	border-right: 1px solid white;
	</c:if>
	padding: 4px 4px 4px 6px;
}
tr.z-grid-odd td.z-row-inner,
tr.z-grid-odd .z-cell {
	border-left: 1px solid transparent;
	background-color: #F0FAFF;
	border-top: 1px solid #F0FAFF;
	border-bottom: 1px solid #F0FAFF;
	border-left: 1px solid #FFF;
}
tr.z-grid-odd td.z-row-inner,
tr.z-grid-odd .z-cell,
tr.z-grid-odd {
	background: #F0FAFF;
}

tr.z-row-over > td.z-row-inner {
	border: 1px solid #6BA6BF;
}

<%-- IE6 not support row over --%>
<c:if test="${not c:browser('ie6-')}">
tr.z-row-over > td.z-row-inner > .z-row-cnt {
	color: #FFFFFF;
}
</c:if>
tr.z-row-over > td.z-row-inner, tr.z-row-over > .z-cell {
	background-color: #6BA6BF;
}

<%-- Autopaging --%>
.z-grid-autopaging .z-row-cnt {
	height: 30px;
	overflow: hidden;
}
<%-- IE --%>
<c:if test="${zk.ie > 0}">
div.z-grid-header, div.z-grid-footer {
	position:relative; <%-- Bug 1712708 and 1926094 --%>
}
div.z-grid-header th.z-column, div.z-grid-header th.z-auxheader {
	text-overflow: ellipsis;
}
div.z-column-cnt {
	white-space: nowrap; <%-- Bug #1839960  --%>
}
div.z-footer-cnt,
div.z-groupfoot-cnt, div.z-column-cnt {
	position: relative; <%-- Bug #1825896  --%>
}
<c:if test="${!(zk.ie >= 8)}">
div.z-row-cnt, div.z-group-cnt {
	position: relative; <%-- Bug #1825896  --%>
}
</c:if>
div.z-footer-cnt,
div.z-row-cnt,
div.z-group-cnt,
div.z-groupfoot-cnt {
	width: 100%;
}
div.z-grid-body {
	position: relative; <%-- Bug 1766244 --%>
}
<c:if test="${!(zk.ie >= 8)}">
tr.z-grid-faker {
	position: absolute; top: -1000px; left: -1000px;<%-- fixed a white line for IE --%>
}
</c:if>
<c:if test="${zk.ie >= 8}">
.z-column {
	text-align: left;
}
</c:if>

<c:if test="${zk.ie == 6}">
div.z-grid {
	position:relative; <%-- Bug 1914215 and Bug 1914054 --%>
}
.z-columns-menu-grouping .z-menuitem-img {
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/menu-group.gif')});
}
.z-columns-menu-asc .z-menuitem-img {
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/menu-arrowup.gif')});
}
.z-columns-menu-dsc .z-menuitem-img {
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/menu-arrowdown.gif')});
}
.z-columns-menu-ungrouping .z-menuitem-img {
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/menu-ungroup.gif')});
}
.z-group-inner .z-group-cnt {
	width: 100%;
}
tr.z-row td.z-row-inner {
	border-right: 1px solid #FFF;
}
.z-column-sort-asc .z-column-sort-img,
.z-column-sort-dsc .z-column-sort-img {
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/arrows.gif')});
}
</c:if>
<c:if test="${zk.ie < 8}">
div.z-grid-header-bg {
	display: none;
}
</c:if>
</c:if>

.z-grid-footer .z-footer {
	overflow: hidden; <%-- B50-ZK-410: Bug on footer labels applied to a grid --%>
}