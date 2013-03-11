<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>

<%-- 3D --%>
.z-groupbox-3d {
	margin: 0;
	overflow: hidden;
	padding: 0;
}

.z-groupbox-3d-header {
	background:transparent repeat-x 0 0;
	background-image: url(${c:encodeThemeURL('~./zul/img/layout/groupbox-hm.png')});
	overflow: hidden;
	border: 1px solid #C5C5C5;
	${t:gradient(G_Background_Gradient_Direction, G_Background)}
	line-height: 38px;
	font-family: ${fontFamilyT};
	font-size: ${fontSizeS};
	font-weight: bold;
	padding: 4px 5px;
	cursor: pointer;
	color: ${G_Font_Color2};
	${G_TextShadow}
}
.z-groupbox-3d-readonly {
	cursor: default;
}
.z-groupbox-3d-cnt {<%-- content of 3d groupbox-new2 --%>
	border: 1px solid #C5C5C5;
	padding: 5px;
}