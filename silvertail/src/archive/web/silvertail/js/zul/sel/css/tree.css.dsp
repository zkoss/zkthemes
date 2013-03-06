<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>

<%-- Tree --%>
div.z-tree {
	background: #FFFFFF;
	overflow: hidden; 
	zoom: 1;
	border: 1px solid #CFCFCF;
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/column-bg.png')});
}
div.z-tree-header, div.z-tree-header tr, div.z-tree-footer {
	border: 0; width: 100%;
}
div.z-tree-header, div.z-tree-footer {
	overflow: hidden;
}
div.z-tree-header tr.z-treecols, div.z-tree-header tr.z-auxhead {
	background: #FFFFFF;
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/column-bg.png')});
}
div.z-tree-header th.z-treecol, div.z-tree-header th.z-auxheader {
	overflow: hidden; 
	border: 1px solid;
	white-space: nowrap;
	border-color: #CFCFCF #CFCFCF #CFCFCF white;
	border-top: none;
	padding: 0;
}
div.z-tree-body, div.z-dottree-body, div.z-filetree-body, div.z-vfiletree-body {
	background: white; border: 0; overflow: auto; width: 100%; position: relative;
}
div.z-tree-pgi-b {
	border-top: 1px solid #CFCFCF; overflow: hidden;
}
div.z-tree-pgi-t {
	border-bottom: 1px solid #CFCFCF; overflow: hidden;
}
div.z-tree-body td.z-treecell, div.z-tree-footer td.z-treefooter {
	cursor: pointer;
	font-size: ${fontSizeM}; font-weight: normal; overflow: hidden;
	padding: 1px 2px;
}
div.z-tree-footer {
	background: #F9F9F9;
	border-top:1px solid #CFCFCF;
}
tr.z-tree-faker, tr.z-tree-faker th, tr.z-tree-faker div,
tr.z-dottree-faker, tr.z-dottree-faker th, tr.z-dottree-faker div,
tr.z-filetree-faker, tr.z-filetree-faker th, tr.z-filetree-faker div,
tr.z-vfiletree-faker, tr.z-vfiletree-faker th, tr.z-vfiletree-faker div {
	border-top: 0 !important; border-right : 0 !important;border-bottom: 0 !important;border-left: 0 !important;
	padding-top: 0 !important;	padding-right: 0 !important; padding-bottom: 0 !important;padding-left: 0 !important;
	margin-top: 0 !important; margin-right : 0 !important;margin-bottom: 0 !important;margin-left: 0 !important;
	height: 0 !important;
	font-size: ${fontSizeM} !important;
} <%-- these above css cannot be overrided--%>
<%-- tree icons --%>
span.z-tree-ico, span.z-tree-line, span.checkmark-spacer {
	width: 18px; height: 18px;
	display:-moz-inline-box; vertical-align:top;
	display:inline-block;
}
span.z-tree-ico {
	background-repeat: no-repeat;
}
span.z-tree-root-open, span.z-tree-tee-open, span.z-tree-last-open,
span.z-tree-root-close, span.z-tree-tee-close, span.z-tree-last-close {
	background-image: url(${c:encodeThemeURL('~./zul/img/tree/arrow-toggle.png')});
}
span.z-tree-root-open, span.z-tree-tee-open, span.z-tree-last-open {
	background-position: 0 -18px;
}
span.z-tree-root-close, span.z-tree-tee-close, span.z-tree-last-close {
	background-position: 0 0;
}
.z-treerow-ico-over span.z-tree-root-open, 
.z-treerow-ico-over span.z-tree-tee-open,
.z-treerow-ico-over span.z-tree-last-open {
	background-position: right -18px;
}
.z-treerow-ico-over span.z-tree-root-close,
.z-treerow-ico-over span.z-tree-tee-close,
.z-treerow-ico-over span.z-tree-last-close {
	background-position: right 0;
}
div.z-tree-header tr.z-treecols th:last-child, 
div.z-tree div.z-tree-header tr.z-auxhead th:last-child {
	border-right: none;
}

div.z-tree-footer td.z-treefooter {
	color:#363636;
	padding: 2px 10px;
}
<%-- Treecol, Treefooter, and Treecell--%>
div.z-tree-header th.z-treecol-sort-over {
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/header-over.png')});
}
div.z-treecol-cnt {
	position: relative;
}
td.z-treecell {
	border: 1px solid transparent;
	border-left: 1px solid #FFF;
}
div.z-treecell-cnt {
	padding: 1px 0 1px 0;
}
div.z-treefooter-cnt, div.z-treecell-cnt, div.z-treecol-cnt {
	border: 0; margin: 0; padding: 0;
	font-family: ${fontFamilyC};
	font-size: ${fontSizeM}; font-weight: normal;
	color:#363636;
}
div.z-treefooter-cnt, div.z-treecol-cnt {
	overflow: hidden;
	cursor: default;
	font-family: ${fontFamilyC};
	font-size: ${fontSizeM};
	font-weight: bold;
	color: #363636;
}
div.z-treecol-cnt, div.z-tree-header div.z-auxheader-cnt {
	padding: 8px 5px 7px;
}
.z-word-wrap div.z-treecell-cnt, .z-word-wrap div.z-treefooter-cnt,
	.z-word-wrap div.z-treecol-cnt {
	word-wrap: break-word;
}
<%-- ZK Treecol's sizing --%>
.z-tree-header .z-treecol.z-treecol-sizing, .z-tree-header .z-treecol.z-treecol-sizing .z-treecol-cnt,
.z-dottree-header .z-treecol.z-treecol-sizing, .z-dottree-header .z-treecol.z-treecol-sizing .z-treecol-cnt,
.z-filetree-header .z-treecol.z-treecol-sizing, .z-filetree-header .z-treecol.z-treecol-sizing .z-treecol-cnt,
.z-vfiletree-header .z-treecol.z-treecol-sizing, .z-vfiletree-header .z-treecol.z-treecol-sizing .z-treecol-cnt {
	cursor: e-resize;
}
<%-- ZK Treecol's sorting --%>
div.z-tree-header th.z-treecol-sort div.z-treecol-cnt,
div.z-dottree-header th.z-treecol-sort div.z-treecol-cnt,
div.z-filetree-header th.z-treecol-sort div.z-treecol-cnt,
div.z-vfiletree-header th.z-treecol-sort div.z-treecol-cnt {
	cursor: pointer; padding-right: 9px;
	background: transparent no-repeat 99% center;
	padding: 7px 10px;
	font-weight:bold;
}
div.z-tree-header th.z-treecol-sort-asc div.z-treecol-cnt,
div.z-dottree-header th.z-treecol-sort-asc div.z-treecol-cnt,
div.z-filetree-header th.z-treecol-sort-asc div.z-treecol-cnt,
div.z-vfiletree-header th.z-treecol-sort-asc div.z-treecol-cnt {
	cursor: pointer; padding-right: 9px;
	background: transparent no-repeat 99% center;
}
div.z-tree-header th.z-treecol-sort-dsc div.z-treecol-cnt,
div.z-dottree-header th.z-treecol-sort-dsc div.z-treecol-cnt,
div.z-filetree-header th.z-treecol-sort-dsc div.z-treecol-cnt,
div.z-vfiletree-header th.z-treecol-sort-dsc div.z-treecol-cnt {
	cursor: pointer; padding-right: 9px;
	background: transparent no-repeat 99% center;
}
.z-treecol-sort-img {
	position: absolute;
	float: left;
	left: 50%;
	font-size: 0;
	margin-left: auto;
    margin-right: auto;
}
.z-treecol-sort .z-treecol-sort-img {
	margin-top: -5px;
	width: 8px;
	height: 5px;
}
.z-treecol-sort-asc .z-treecol-sort-img,
.z-treecol-sort-dsc .z-treecol-sort-img {
	background-position: 0 0;
    background-repeat: no-repeat;
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/arrows.png')});
}

.z-treecol-sort-asc .z-treecol-sort-img {
	background-position: 0 0;
}

.z-treecol-sort-dsc .z-treecol-sort-img {
	background-position: 0 -5px;
}

div.z-tree-header th.z-treecol-sort div.z-treecol-cnt,
div.z-tree-header th.z-treecol-sort-asc div.z-treecol-cnt,
div.z-tree-header th.z-treecol-sort-dsc div.z-treecol-cnt,
div.z-dottree-header th.z-treecol-sort div.z-treecol-cnt,
div.z-dottree-header th.z-treecol-sort-asc div.z-treecol-cnt,
div.z-dottree-header th.z-treecol-sort-dsc div.z-treecol-cnt,
div.z-filetree-header th.z-treecol-sort div.z-treecol-cnt,
div.z-filetree-header th.z-treecol-sort-asc div.z-treecol-cnt,
div.z-filetree-header th.z-treecol-sort-dsc div.z-treecol-cnt,
div.z-vfiletree-header th.z-treecol-sort div.z-treecol-cnt,
div.z-vfiletree-header th.z-treecol-sort-asc div.z-treecol-cnt,
div.z-vfiletree-header th.z-treecol-sort-dsc div.z-treecol-cnt {
	background-image: none;
}
<%-- Treerow --%>
tr.z-treerow, tr.z-treerow a, tr.z-treerow a:visited {
	font-size: ${fontSizeM}; font-weight: normal; color: black;
	text-decoration: none;
}
tr.z-treerow a:hover {
	text-decoration: underline;
}
tr.z-treerow-disd *, td.z-treecell-disd * {
	color: #AAAAAA !important; cursor: default!important;
}
tr.z-treerow-disd a:visited, tr.z-treerow-disd a:hover,
td.z-treecell-disd a:visited, td.z-treecell-disd a:hover {
	text-decoration: none !important;
	cursor: default !important;
	border-color: #D0DEF0 !important;
}
tr.z-treerow-seld {
	background: #CCCCCC;
}
tr.z-treerow-over > td.z-treecell {
	border-top: 1px solid #E1E1E1;
	border-bottom: 1px solid #E1E1E1;
}
tr.z-treerow-over {
	background: #E1E1E1;
}
tr.z-treerow-over-seld {
	background: #B7B7B7;
}
.z-tree-header-bg,
.z-dottree-header-bg,
.z-filetree-header-bg,
.z-vfiletree-header-bg {
	position:relative;
	margin-right: -11px;
	top: 0;
	height: 1px;
	font-size: 0;
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/head-bg.png')});
	margin-top: -1px;
}

<c:if test="${zk.ie < 8}">
.z-tree-header-bg,
.z-dottree-header-bg,
.z-filetree-header-bg,
.z-vfiletree-header-bg {
	display: none;
}
</c:if>

<%-- z-dottree --%>
div.z-dottree {
	background: #FFF;
	overflow: hidden;
	zoom: 1;
	border: 1px solid #CFCFCF;
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/column-bg.png')});
}
div.z-dottree-header, div.z-dottree-header tr, div.z-dottree-footer {
	border: 0; width: 100%;
}
div.z-dottree-header, div.z-dottree-footer {
	overflow: hidden;
}
div.z-dottree-header tr.z-treecols, div.z-tree-header tr.z-auxhead {
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/column-bg.png')});
}
div.z-dottree-header th {
	overflow: hidden; 
	white-space: nowrap;
	font-size: ${fontSizeM};
	font-weight: normal;
	border: 1px solid;
	border-color: #CFCFCF #CFCFCF #CFCFCF white;
	border-top: none;
	padding: 4px 10px 3px 10px;
}
div.z-dottree-body {
	background: white; border: 0; overflow: auto; width: 100%;
}
div.z-dottree-pgi-b {
	border-top: 1px solid #CFCFCF; overflow: hidden;
}
div.z-dottree-pgi-t {
	border-bottom: 1px solid #CFCFCF; overflow: hidden;
}

div.z-dottree-header tr.z-treecols,
div.z-dottree-header tr.z-auxhead {
	background: #FFF;
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/column-bg.png')});
}


div.z-dottree-header tr.z-treecols th:last-child, 
div.z-dottree div.z-dottree-header tr.z-auxhead th:last-child {
	border-right: none;
}
div.z-dottree-body td.z-treecell, div.z-dottree-footer td.z-treefooter {
	cursor: pointer;
	font-size: ${fontSizeM}; font-weight: normal; overflow: hidden;
	padding: 0 2px;
}
div.z-dottree-footer {
	background: #F9F9F9;
	border-top:1px solid #CFCFCF;
	color:#363636;
	padding: 2px 10px;
}
span.z-dottree-ico, span.z-dottree-line {
	width: 18px; min-height: 18px; height: 100%;
	background-repeat: no-repeat;
	display:-moz-inline-box; vertical-align:top;
	display:inline-block;
}
span.z-dottree-root-open, span.z-dottree-root-close {
	background-image: url(${c:encodeThemeURL('~./zul/img/tree/dot-toggle.gif')});
}
span.z-dottree-root-open {
	background-position: 0 0;
}
span.z-dottree-root-close {
	background-position: 0 -18px;
}
span.z-dottree-tee-open {
	background-image: url(${c:encodeThemeURL('~./zul/img/tree/tee-open.gif')});
}
span.z-dottree-tee-close {
	background-image: url(${c:encodeThemeURL('~./zul/img/tree/tee-close.gif')});
}
span.z-dottree-last-open {
	background-image: url(${c:encodeThemeURL('~./zul/img/tree/tee-last-open.gif')});
}
span.z-dottree-last-close {
	background-image: url(${c:encodeThemeURL('~./zul/img/tree/tee-last-close.gif')});
}
span.z-dottree-tee {
	background-image: url(${c:encodeThemeURL('~./zul/img/tree/tee.gif')});
}
span.z-dottree-vbar {
	background-image: url(${c:encodeThemeURL('~./zul/img/tree/tee-vbar.gif')});
}
span.z-dottree-last {
	background-image: url(${c:encodeThemeURL('~./zul/img/tree/tee-last.gif')});
}
span.z-dottree-spacer, span.z-dottree-firstspacer {
	background:none;
}
<%-- z-filetree --%>
div.z-filetree {
	background: #FFF; 
	overflow: hidden;
	zoom: 1;
	border: 1px solid #CFCFCF;
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/column-bg.png')});
}
div.z-filetree-header, div.z-filetree-header tr, div.z-filetree-footer {
	border: 0; width: 100%;
}
div.z-filetree-header, div.z-filetree-footer {
	overflow: hidden;
}
div.z-filetree-header tr.z-treecols, div.z-tree-header tr.z-auxhead  {
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/column-bg.png')});
}
div.z-filetree-header th.z-treecol, div.z-filetree-header th.z-auxheader {
	overflow: hidden; 
	white-space: nowrap;
	font-size: ${fontSizeM};
	font-weight: normal;
	border: 1px solid;
	border-color: #CFCFCF #CFCFCF #CFCFCF white;
	border-top: none;
	padding: 4px 10px 3px 10px;
}
div.z-filetree-body {
	background: white; border: 0; overflow: auto; width: 100%;
}
div.z-filetree-pgi-b {
	border-top: 1px solid #CFCFCF; overflow: hidden;
}
div.z-filetree-pgi-t {
	border-bottom: 1px solid #CFCFCF; overflow: hidden;
}
div.z-filetree-body td.z-treecell, div.z-filetree-footer td.z-treefooter {
	cursor: pointer; padding: 0 2px;
	font-size: ${fontSizeM}; font-weight: normal; overflow: hidden;
}
div.z-filetree-footer {
	background: #F9F9F9; 
	border-top:1px solid #CFCFCF;
	color:#363636;
	padding: 2px 10px;
}
span.z-filetree-line, span.z-filetree-ico, span.z-filetree-firstspacer {
	width: 18px; min-height: 18px; height: 100%;
	background-repeat: no-repeat;
	display:-moz-inline-box; vertical-align:top;
	display:inline-block;
}
span.z-filetree-ico,span.z-filetree-firstspacer {
	background-image: url(${c:encodeThemeURL('~./zul/img/tree/folder-toggle.gif')});
}
span.z-filetree-root-open, span.z-filetree-root-close,
span.z-filetree-root-open, span.z-filetree-tee-open, span.z-filetree-last-open {
	background-position: 0 0;
}
span.z-filetree-root-close, span.z-filetree-tee-close,
span.z-filetree-last-close, span.z-filetree-firstspacer {
	background-position: 0 -18px;
}
span.z-filetree-tee, span.z-filetree-last {
	background-image: url(${c:encodeThemeURL('~./zul/img/tree/entity.gif')});
}
span.z-filetree-vbar, span.z-filetree-spacer {
	background:none;
}
div.z-filetree-header tr.z-treecols, 
div.z-filetree-header tr.z-auxhead {
	background: #FFF;
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/column-bg.png')});
}
div.z-filetree-header tr.z-treecols th:last-child, 
div.z-filetree div.z-filetree-header tr.z-auxhead th:last-child {
	border-right: none;
}
<%-- z-vfiletree--%>
div.z-vfiletree {
	background: #FFF;
	overflow: hidden; 
	zoom: 1;
	border: 1px solid #CFCFCF;
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/column-bg.png')});
}
div.z-vfiletree-header, div.z-vfiletree-header tr, div.z-vfiletree-footer {
	border: 0; width: 100%;
}
div.z-vfiletree-header, div.z-vfiletree-footer {
	overflow: hidden;
}
div.z-vfiletree-header tr.z-treecols, div.z-tree-header tr.z-auxhead  {
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/column-bg.png')});
}
div.z-vfiletree-body {
	background: white; border: 0; overflow: auto; width: 100%;
}
div.z-vfiletree-pgi-b {
	border-top: 1px solid #CFCFCF; overflow: hidden;
}
div.z-vfiletree-pgi-t {
	border-bottom: 1px solid #CFCFCF; overflow: hidden;
}
div.z-vfiletree-body td.z-treecell, div.z-vfiletree-footer td.z-treefooter {
	cursor: pointer; padding: 0 2px;
	font-size: ${fontSizeM}; font-weight: normal; overflow: hidden;
}
div.z-vfiletree-footer {
	background: #F9F9F9; 
	background-color:#F9F9F9;
	border-top:1px solid #CFCFCF;
	color:#363636;
	padding: 2px 10px;
}
span.z-vfiletree-line, span.z-vfiletree-ico, span.z-vfiletree-firstspacer {
	width: 18px; min-height: 18px; height: 100%;
	background-repeat: no-repeat;
	display:-moz-inline-box; vertical-align:top;
	display:inline-block;
}
span.z-vfiletree-ico,span.z-vfiletree-firstspacer {
	background-image: url(${c:encodeThemeURL('~./zul/img/tree/vfolder-toggle.png')});
}
span.z-vfiletree-root-open, span.z-vfiletree-root-close,
span.z-vfiletree-root-open, span.z-vfiletree-tee-open, span.z-vfiletree-last-open {
	background-position: 0 0;
}
span.z-vfiletree-root-close, span.z-vfiletree-tee-close,
span.z-vfiletree-last-close, span.z-vfiletree-firstspace {
	background-position: 0 -18px;
}
span.z-vfiletree-tee, span.z-vfiletree-last {
	background-image: url(${c:encodeThemeURL('~./zul/img/tree/ventity.png')});
}
span.z-vfiletree-vbar, span.z-vfiletree-spacer {
	background:none;
}
div.z-vfiletree-header tr.z-treecols, 
div.z-vfiletree-header tr.z-auxhead {
	background: #FFF;
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/column-bg.png')});
}
div.z-vfiletree-header th.z-treecol,
div.z-vfiletree-header th.z-auxheader {
	overflow: hidden;
	border: 1px solid;
	white-space: nowrap;
	font-size: ${fontSizeM};
	font-weight: normal;
	border-color: #CFCFCF #CFCFCF #CFCFCF white;
	border-top: none;
	padding: 4px 10px 3px 10px;
}
div.z-vfiletree-header tr.z-treecols th:last-child, 
div.z-vfiletree div.z-vfiletree-header tr.z-auxhead th:last-child {
	border-right: none;
}

<%-- Autopaging --%>
.z-tree-autopaging .z-treecell-cnt,
.z-dottree-autopaging .z-treecell-cnt,
.z-filetree-autopaging .z-treecell-cnt,
.z-vfiletree-autopaging .z-treecell-cnt {
	height: 30px;
	overflow: hidden;
}

.z-treecell-cnt {
	line-height: 18px;<%-- Bug ZK-508 --%>
}
<%-- IE --%>
<c:if test="${zk.ie > 0}">
div.z-tree-header, div.z-dottree-header, div.z-filetree-header, div.z-vfiletree-header,
div.z-tree-footer, div.z-dottree-footer, div.z-filetree-footer, div.z-vfiletree-footer {
	position:relative; <%-- Bug 1712708 and 1926094 --%>
}
div.z-tree-header th.z-treecol, div.z-tree-header th.z-auxheader,
div.z-dottree-header th.z-treecol, div.z-dottree-header th.z-auxheader,
div.z-filetree-header th.z-treecol, div.z-filetree-header th.z-auxheader,
div.z-vfiletree-header th.z-treecol, div.z-vfiletree-header th.z-auxheader {
	text-overflow: ellipsis;
}
div.z-treecol-cnt {
	white-space: nowrap; <%-- Bug #1839960  --%>
}
div.z-treefooter-cnt, div.z-treecol-cnt,
<c:if test="${!(zk.ie >= 8)}">
div.z-treecell-cnt, 
</c:if>
div.z-treefooter-cnt,
div.z-treecell-cnt {
	width: 100%;
}
div.z-tree-body, div.z-dottree-body,
div.z-filetree-body, div.z-vfiletree-body {
	position: relative; <%-- Bug 1766244  --%>
}
<c:if test="${!(zk.ie >= 8)}">
tr.z-tree-faker, tr.z-dottree-faker,
tr.z-filetree-faker, tr.z-vfiletree-faker {
	position: absolute; top: -1000px; left: -1000px;<%-- fixed a white line for IE --%>
}
</c:if>
<c:if test="${zk.ie >= 8}">
.z-treecol {
	text-align: left;
}
</c:if>
span.z-tree-root-open, span.z-tree-root-close,
span.z-tree-tee-open, span.z-tree-tee-close,
span.z-tree-last-open, span.z-tree-last-close,
span.z-tree-tee, span.z-tree-vbar,
span.z-tree-last, span.z-tree-spacer,
span.z-dottree-root-open, span.z-dottree-root-close,
span.z-dottree-tee-open, span.z-dottree-tee-close,
span.z-dottree-last-open, span.z-dottree-last-close,
span.z-dottree-tee, span.z-dottree-vbar,
span.z-dottree-last, span.z-dottree-spacer,
span.z-filetree-root-open, span.z-filetree-root-close,
span.z-filetree-tee-open, span.z-filetree-tee-close,
span.z-filetree-last-open, span.z-filetree-last-close,
span.z-filetree-tee, span.z-filetree-vbar,
span.z-filetree-last, span.z-filetree-spacer,
span.z-vfiletree-root-open, span.z-vfiletree-root-close,
span.z-vfiletree-tee-open, span.z-vfiletree-tee-close,
span.z-vfiletree-last-open, span.z-vfiletree-last-close,
span.z-vfiletree-tee, span.z-vfiletree-vbar,
span.z-vfiletree-last, span.z-vfiletree-spacer {
	height: 18px;
}

<c:if test="${zk.ie == 6}">
div.z-tree, div.z-dottree, div.z-filetree, div.z-vfiletree {
	position:relative; <%-- Bug 1914215 and Bug 1914054 --%>
}
span.z-vfiletree-ico, span.z-vfiletree-firstspacer {
	background-image: url(${c:encodeThemeURL('~./zul/img/tree/vfolder-toggle.gif')});
}
span.z-vfiletree-tee, span.z-vfiletree-last {
	background-image: url(${c:encodeThemeURL('~./zul/img/tree/ventity.gif')});
}
span.z-tree-root-open, span.z-tree-tee-open, span.z-tree-last-open,
span.z-tree-root-close, span.z-tree-tee-close, span.z-tree-last-close {
	background-image: url(${c:encodeThemeURL('~./zul/img/tree/arrow-toggle.gif')});
}
</c:if>
</c:if>

<c:if test="${zk.ie < 8}">
.z-tree td.z-treecell,
.z-dottree td.z-treecell,
.z-filetree td.z-treecell,
.z-vfiletree td.z-treecell{
	border-color: #FFFFFF #FFFFFF #FFFFFF #FFFFFF;
}
.z-treerow-seld td.z-treecell {
	border-color: #E8F6FD #E8F6FD #E8F6FD #FFFFFF;
}
<%-- Bug ZK-1645: IE7 zoom problem --%>
.z-treecell-cnt {
	word-spacing: 0px;
}
</c:if>
.z-treerow-img {
	background:transparent no-repeat scroll center center;
	border:0;
	height: 13px;
	overflow: hidden;
	display:-moz-inline-box;
	vertical-align: top;
	display: inline-block;
	min-height: 13px;
	padding:0;
	vertical-align:top;
	width: 13px;
	margin: 2px;
}
.z-treerow-img-checkbox, .z-treerow-img-radio {
	background-image: url(${c:encodeThemeURL('~./zul/img/common/check-sprite.gif')});
	background-position: 0 0;
}
.z-treerow-img-radio {
	background-position: 0 -13px;
}
.z-treerow-over ${zk.ie == 6 ? "" : "> td > .z-treecell-cnt >"} .z-treerow-img-radio {
	background-position: -13px -13px;
}
.z-treerow-seld ${zk.ie == 6 ? "" : "> td > .z-treecell-cnt >"} .z-treerow-img-radio {
	background-position: -26px -13px;
}
.z-treerow-over-seld ${zk.ie == 6 ? "" : "> td > .z-treecell-cnt >"} .z-treerow-img-radio {
	background-position: -39px -13px;
}
.z-treerow-over ${zk.ie == 6 ? "" : "> td > .z-treecell-cnt >"} .z-treerow-img-checkbox {
	background-position: -13px 0;
}
.z-treerow-seld ${zk.ie == 6 ? "" : "> td > .z-treecell-cnt >"} .z-treerow-img-checkbox {
	background-position: -26px 0;
}
.z-treerow-over-seld ${zk.ie == 6 ? "" : "> td > .z-treecell-cnt >"} .z-treerow-img-checkbox {
	background-position: -39px 0;
}
.z-treerow-img-disd {
	opacity: .6;
	-moz-opacity: .6;
	filter: alpha(opacity=60);
}
<c:if test="${zk.opera > 0}">
tr.z-treerow-disd > td > .z-treecell-cnt > .z-treerow-img-checkbox,
tr.z-treerow-disd > td > .z-treecell-cnt > .z-treerow-img-radio {
	overflow: visible;<%-- Bug ZK-397 --%>
}
</c:if>