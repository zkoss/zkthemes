<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
.z-fisheye,
.z-fisheye-text,
.z-fisheye-img {
	position: absolute;
}
.z-fisheye {
	z-index: 2;
}
.z-fisheye-text {
	font-size: ${fontSizeM}; font-weight: normal;
	font-family: ${fontFamilyC}; background-color: #eee; border: 2px solid #666;
	padding: 2px; text-align: center; display: none;
}
.z-fisheye-img {
	border: 0px; width: 100%; height: 100%;
}
.z-fisheyebar-inner {
	position: relative;
}
