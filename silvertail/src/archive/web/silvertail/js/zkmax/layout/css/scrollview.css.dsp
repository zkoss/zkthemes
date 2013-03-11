<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>

.z-scrollview {
	overflow: hidden;
	position: relative;
	white-space: nowrap;
}
.z-scrollview-container-hor,
.z-scrollview-container-ver {
	${t:applyCSS3('transition-duration', '0')}
	${t:applyCSS3('transform-origin', '0 0')}
	${t:applyCSS3('transition-timing-function', 'cubic-bezier(0.33, 0.66, 0.66, 1)')}
	${t:applyCSS3('transition-delay', '0')}
	${t:transform('translate3d(0, 0, 0)')}
}
.z-scrollview-container-hor {
	height: 100%;
}
.z-scrollview-container-ver {
	width: 100%;
}
.z-scrollview-content-hor,
.z-scrollview-content-ver {
	position: relative;
	zoom: 1;
}
.z-scrollview-content-hor {
	display: inline-block;
	vertical-align: top;
}
.z-scrollview-ver-bar,
.z-scrollview-hor-bar {
	position: absolute;
	z-index: 100;
	pointer-events: none;
	${t:applyCSS3('transition-property', 'opacity')}
	${t:applyCSS3('transition-duration', '350ms')}
	<c:if test="${zk.android > 0}">
	${t:applyCSS3('transition-duration', '0')}
	</c:if>
	opacity: 0;
	overflow: hidden;
}
.z-scrollview-ver-bar {
	width: 7px;
	bottom: 2px;
	top: 2px;
	right: 1px;
}
.z-scrollview-hor-bar {
	height: 7px;
	bottom: 1px;
	left: 2px;
	right: 2px;
}
.z-scrollview-ver-bar-cave,
.z-scrollview-hor-bar-cave {
	position: absolute;
	z-index: 100;
	background: rgba(0, 0, 0, 0.5);
	border: 1px solid rgba(255, 255, 255, 0.9);
	${t:applyCSS3('background-clip', 'padding-box')}
	${t:applyCSS3('box-sizing', 'border-box')}
	${t:borderRadius('3px')}
	pointer-events: none;
	${t:applyCSS3('transition-timing-function', 'cubic-bezier(0.33, 0.66, 0.66, 1)')}
	${t:applyCSS3('transition-duration', '0')}
	${t:transform('translate3d(0, 0, 0)')}
}
.z-scrollview-ver-bar-cave {
	width: 100%;
}
.z-scrollview-hor-bar-cave {
	height: 100%;
}
.z-scrollview-load {
	display: none;
	position: absolute;
	vertical-align : middle;
	text-align: center;
	width: 100%;
	height: 100%;
}
.z-scrollview-load-left,
.z-scrollview-load-right,
.z-scrollview-load-up,
.z-scrollview-load-down {
	width: 32px;
	height: 32px;
	position: absolute;
	z-index: 999;
}
.z-scrollview-load-up {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/layout/load-up.png')});
}
.z-scrollview-load-down {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/layout/load-down.png')});
}
.z-scrollview-load-left {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/layout/load-left.png')});
}
.z-scrollview-load-right {
	background-image: url(${c:encodeThemeURL('~./zkmax/img/tablet/layout/load-right.png')});
}
