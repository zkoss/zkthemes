<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
.z-portallayout,
.z-portalchildren,
.z-portalchildren-cnt,
.z-portalchildren-body,
.z-portallayout-inner {
	overflow: hidden;
}
.z-portalchildren {
    float: left; padding: 0; margin: 0;
}
<c:if test="${c:isExplorer()}">
.z-portallayout,
.z-portalchildren,
.z-portalchildren-body {
	zoom: 1;
}
</c:if>