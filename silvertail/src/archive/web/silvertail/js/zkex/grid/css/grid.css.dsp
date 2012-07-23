<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
.z-detail {
	height: 100%;
	width: 18px;
	padding: 0!important;
	overflow: hidden;
	white-space: nowrap;
}
.z-detail .z-detail-img {
	cursor:pointer;
	width: 100%;
	height: 18px;
	background: transparent no-repeat 2px 3px;
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/row-expand.png')}); 
}
.z-detail.z-detail-expd .z-detail-img {
	background-position: -14px 3px;
}

tr.z-row .z-detail-outer {
	background: #F8F8F8 repeat-y left;
	border-top: none;
	border-left: 1px solid white;
	border-right: 1px solid #C0C0C0;
	border-bottom: 1px solid #D0D0D0;
	vertical-align: top;
	background-image: url(${c:encodeThemeURL('~./zul/img/grid/detail-bg.png')});
	padding:10px;
	width: 18px;
}
<c:if test="${zk.safari > 0 && empty zk.chrome}"><%-- Bug for B50-ZK-299.zul for Chrome --%>
tr.z-row .z-detail-outer {
	width: 38px;
}
</c:if>