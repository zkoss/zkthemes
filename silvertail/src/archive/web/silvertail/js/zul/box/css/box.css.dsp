<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<c:if test="${zk.ie == 8}"> <%-- IE 8 has extra padding 1px on td element by default --%>
td {
	padding: 0px;
}
</c:if>
td.z-hbox-sep,
tr.z-vbox-sep {
	padding: 0; 
	margin: 0;
}
td.z-hbox-sep {
	width: 0.3em;
}
tr.z-vbox-sep {
	height: 0.3em;
}

<%-- Splitter --%>
.z-splitter-ver-btn-t,
.z-splitter-ver-btn-b,
.z-splitter-hor-btn-l,
.z-splitter-hor-btn-r,
.z-splitter-hor,
.z-splitter-ver,
.z-splitter-os-ver-btn-t,
.z-splitter-os-ver-btn-b,
.z-splitter-os-hor-btn-l,
.z-splitter-os-hor-btn-r,
.z-splitter-os-hor,
.z-splitter-os-ver,
.z-splitter-os-hor-ns,
.z-splitter-os-ver-ns {
	font-size: 0;
}
.z-splitter-hor span,
.z-splitter-ver span,
.z-splitter-ver-btn-t,
.z-splitter-ver-btn-b,
.z-splitter-hor-btn-l,
.z-splitter-hor-btn-r,
.z-splitter-os-ver-btn-t,
.z-splitter-os-ver-btn-b,
.z-splitter-os-hor-btn-l,
.z-splitter-os-hor-btn-r {
	display: -moz-inline-box;
	vertical-align: top;<%-- vertical-align: make it looks same in diff browsers --%>
	display: inline-block;
	cursor: pointer;
}
.z-splitter-hor-outer,
.z-splitter-os-hor-outer {
	background: transparent repeat-y top right;
	background-image: url(${c:encodeThemeURL('~./zul/img/splt/splt-h-ns.png')});
}
.z-splitter-os-hor-outer {
	background-image: url(${c:encodeThemeURL('~./zul/img/splt/splt-h-os.gif')});
}
.z-splitter-ver-outer .z-splitter-ver-outer-td,
.z-splitter-os-ver-outer .z-splitter-os-ver-outer-td {
 	background: transparent repeat-x bottom left;
	background-image: url(${c:encodeThemeURL('~./zul/img/splt/splt-v-ns.png')});
}
.z-splitter-os-ver-outer .z-splitter-os-ver-outer-td {
	background-image: url(${c:encodeThemeURL('~./zul/img/splt/splt-v-os.gif')});
}
.z-splitter-hor {
	background: transparent no-repeat center left;
	background-image: url(${c:encodeThemeURL('~./zul/img/splt/splt-h.png')});
	max-width: 6px; width: 6px;
}
.z-splitter-hor,
.z-splitter-os-hor {
	cursor: e-resize;
}
.z-splitter-hor-outer,
.z-splitter-os-hor,
.z-splitter-os-hor-ns,
.z-splitter-os-hor-outer {
	max-width: 8px; width: 8px;
	<c:if test="${zk.ie >= 8}">
		padding:0px;
	</c:if>
}
.z-splitter-ver {
	background: transparent no-repeat top center;
	background-image: url(${c:encodeThemeURL('~./zul/img/splt/splt-v.png')});
	max-height: 6px; height: 6px;
	border-width: 1px 0;
}
.z-splitter-ver,
.z-splitter-os-ver {
	cursor: s-resize;
}

.z-splitter-os-ver,
.z-splitter-os-ver-ns,
.z-splitter-ver-outer .z-splitter-ver-outer-td,
.z-splitter-os-ver-outer .z-splitter-os-ver-outer-td {
	max-height: 8px; height: 8px;
}
.z-splitter-hor-ns,
.z-splitter-ver-ns {
	background-image: none; background-position: none;
}
.z-splitter-hor-ns,
.z-splitter-ver-ns,
.z-splitter-os-hor-ns,
.z-splitter-os-ver-ns {
	cursor: default;
}
.z-splitter-ver-btn-t:hover,
.z-splitter-ver-btn-b:hover,
.z-splitter-hor-btn-l:hover,
.z-splitter-hor-btn-r:hover,
.z-splitter-os-ver-btn-t:hover,
.z-splitter-os-ver-btn-b:hover,
.z-splitter-os-hor-btn-l:hover,
.z-splitter-os-hor-btn-r:hover {
	opacity: 1;
}
.z-splitter-ver-btn-t,
.z-splitter-ver-btn-b,
.z-splitter-hor-btn-l,
.z-splitter-hor-btn-r,
.z-splitter-os-ver-btn-t,
.z-splitter-os-ver-btn-b,
.z-splitter-os-hor-btn-l,
.z-splitter-os-hor-btn-r  {
	filter: alpha(opacity=50);  <%-- IE --%>
	opacity: 0.5;  <%-- Moz + FF --%>
	background-repeat: no-repeat;
}
.z-splitter-ver-btn-visi, .z-splitter-hor-btn-visi {
	filter: alpha(opacity=100) !important;  <%-- IE --%>
}
.z-splitter-hor-btn-l,
.z-splitter-hor-btn-r,
.z-splitter-os-hor-btn-l,
.z-splitter-os-hor-btn-r {
	min-height: 50px; height: 50px;
}
.z-splitter-hor-btn-l,
.z-splitter-hor-btn-r {
	width: 6px;
	background-image: url(${c:encodeThemeURL('~./zul/img/splt/colps-l.png')});
}
.z-splitter-hor-btn-r {
	background-image: url(${c:encodeThemeURL('~./zul/img/splt/colps-r.png')});
}
.z-splitter-ver-btn-t,
.z-splitter-ver-btn-b {
	width: 50px; min-height: 6px; height: 6px;
	background-image: url(${c:encodeThemeURL('~./zul/img/splt/colps-t.png')});
}
.z-splitter-ver-btn-b {
	background-image: url(${c:encodeThemeURL('~./zul/img/splt/colps-b.png')});
}
.z-splitter-os-hor-btn-l,
.z-splitter-os-hor-btn-r {
	width: 8px;
	background-image: url(${c:encodeThemeURL('~./zul/img/splt/colps-l-os.gif')});
}
.z-splitter-os-hor-btn-r {
	background-image: url(${c:encodeThemeURL('~./zul/img/splt/colps-r-os.gif')});
}
.z-splitter-os-ver-btn-t,
.z-splitter-os-ver-btn-b {
	width: 50px; min-height: 8px; height: 8px;
	background-image: url(${c:encodeThemeURL('~./zul/img/splt/colps-t-os.gif')});
}
.z-splitter-os-ver-btn-b {
	background-image: url(${c:encodeThemeURL('~./zul/img/splt/colps-b-os.gif')});
}
<c:if test="${zk.ie == 6}">
.z-splitter-ver-btn-l, 
.z-splitter-hor-btn-l {
	background-image: url(${c:encodeThemeURL('~./zul/img/splt/colps-l.gif')});
}
.z-splitter-ver-btn-r, 
.z-splitter-hor-btn-r {
	background-image: url(${c:encodeThemeURL('~./zul/img/splt/colps-r.gif')});
}
.z-splitter-ver-btn-t, 
.z-splitter-hor-btn-t {
	background-image: url(${c:encodeThemeURL('~./zul/img/splt/colps-t.gif')});
}
.z-splitter-ver-btn-b, 
.z-splitter-hor-btn-b {
	background-image: url(${c:encodeThemeURL('~./zul/img/splt/colps-b.gif')});
}
</c:if>
<c:if test="${zk.gecko > 0}">
div.z-splitter-hor, div.z-splitter-ver, 
div.z-splitter-os-hor, div.z-splitter-os-ver {
	-moz-user-select: none;
}
</c:if>

.z-splitter-hor-outer,
.z-splitter-ver {
	border: 1px solid #C5C5C5;
}
.z-splitter-hor-outer {
	border-width: 0 1px;
	max-width: 6px;
	width: 6px;
}
