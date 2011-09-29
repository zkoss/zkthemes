<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
.z-columnlayout,
.z-columnchildren,
.z-columnchildren-cnt,
.z-columnchildren-body,
.z-columnlayout-inner {
	overflow: hidden;
}
.z-columnchildren {
    float: left; padding: 0; margin: 0;
}
<c:if test="${c:isExplorer()}">
.z-columnlayout,
.z-columnchildren,
.z-columnchildren-body {
    zoom: 1;
}
</c:if>