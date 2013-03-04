<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>
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
.z-splitter-hor,
.z-splitter-ver {
	position: relative;
	background: transparent;
	${t:applyCSS3('box-sizing', 'border-box')};
	display: -moz-inline-box;
	vertical-align: top;<%-- vertical-align: make it looks same in diff browsers --%>
	display: inline-block;
	border: 1px solid #D2D2D2;
	border-width: 0 1px;
	${t:gradient('hor', '#FCFCFC 0%; #F0F0F0 100%')}
	cursor: e-resize;
}
.z-splitter-hor {
	max-width: 8px; width: 8px;
}
.z-splitter-ver {
	border-width: 1px 0;
	max-height: 8px; height: 8px;
	cursor: s-resize;
	${t:gradient('ver', '#FCFCFC 0%; #F0F0F0 100%')}
}
.z-splitter-ver-outer {
	max-height: 8px;
	height: 8px;
	border: 0;
}
.z-splitter-hor-outer {
	border: 0;
	max-width: 8px;
	width: 8px;
}
.z-splitter-ver-btn-t,
.z-splitter-ver-btn-b,
.z-splitter-hor-btn-l,
.z-splitter-hor-btn-r {
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
.z-splitter-hor-btn-l,
.z-splitter-hor-btn-r {	
	${t:gradient('hor', G_Background)}
}

.z-splitter-ver-btn-t:active,
.z-splitter-ver-btn-b:active,
.z-splitter-hor-btn-l:active,
.z-splitter-hor-btn-r:active {
	${t:gradient('ver', G_Background_Active)}
	${t:boxShadow(G_Background_Active_Shadow)}
}
.z-splitter-hor-btn-l:active,
.z-splitter-hor-btn-r:active {
	${t:gradient('hor', G_Background_Active)}
}

.z-splitter-ver-btn-t:after,
.z-splitter-ver-btn-b:after,
.z-splitter-hor-btn-l:after,
.z-splitter-hor-btn-r:after {
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

.z-splitter-hor-btn-l:after {
	border-right-color: #959595;
}
.z-splitter-hor-btn-r:after {
	left: 6px;
	border-left-color: #959595;	
}

.z-splitter-ver-btn-t:after {
	top: 3px;
	left: 12px;
	border-bottom-color: #959595;
}

.z-splitter-ver-btn-b:after {
	top: 6px;
	left: 12px;
	border-top-color: #959595;
}
.z-splitter-hor-btn-l,
.z-splitter-hor-btn-r {
	width: 16px;
	min-height: 32px;
	height: 32px;
	left: -5px;
}
.z-splitter-ver-btn-t,
.z-splitter-ver-btn-b {
	min-height: 16px;
	height: 16px;
	width: 32px;
	top: -5px;
}