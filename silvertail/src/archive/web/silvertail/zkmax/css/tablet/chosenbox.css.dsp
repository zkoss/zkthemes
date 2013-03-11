<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>

.z-chosenbox {
	display:-moz-inline-box;
	display: inline-block;
	overflow: hidden;
	background-color: #FFFFFF;
	border: 1px solid #E6E6E6;
	border-top-color: #B2B2B2;
	min-height: 30px;
}
.z-chosenbox-focus {
	border: 1px solid #D5EAFD;
	border-top-color: #94B9DA;
}
.z-chosenbox-sel-item {
	display: inline-block;
	white-space: nowrap;
	${t:borderRadius(G_Background_Button_Border_Radius)}
	margin: 1px 1px 2px 1px;
	padding: 1px 0;
	background: #E6EEF2;
	border: 1px solid #B2B2B2;
	cursor: pointer;
}
.z-chosenbox-sel-item-cnt {
	display: inline-block;
	float: left;
	padding: 2px 2px 2px 3px;
	color: ${G_Font_Color2};
	font-size: ${fontSizeXS};
	font-family: ${fontFamilyC};
	font-style: normal;
	line-height: 18px;
}
.z-chosenbox-sel-item-focus {
	background: #CEE6F2;
	border-color: #94B9DA;
}
.z-chosenbox-del-btn {
	display: inline-block;
	float: left;
	margin: 2px;
	margin-left: 1px;
	width: 16px;
	height: 16px;
	font-size: 1px;
	${t:borderRadius('2px')}
}
.z-chosenbox-del-btn:hover {
	background: #94B9DA;
}
.z-chosenbox-del-btn-icon {
	height: 100%;
	background: url(${G_CloseIcon}) center center no-repeat;
}
.z-chosenbox-disd {
	opacity: .6;
	-moz-opacity: .6;
	filter: alpha(opacity=60);
	background: #F0F0F0;
}
.z-chosenbox-disd .z-chosenbox-sel-item {
	cursor: default !important;
}
.z-chosenbox-disd .z-chosenbox-sel-item-cnt {
	padding-right: 3px !important;
}
.z-chosenbox-disd .z-chosenbox-del-btn {
	display: none !important;
}
.z-chosenbox-inp {
	display: inline-block;
	background: transparent !important;
	border: 0 !important;
	vertical-align: bottom;
	outline: 0;
	${t:boxShadow('none')}
	
	padding: 2px;
	width: 30px;
	min-height: 22px;
	color: ${G_Font_Color2};
	font-size: ${fontSizeXS};
	font-family: ${fontFamilyC};
}
.z-chosenbox-txcnt {
	display: none;
	font-size: ${fontSizeXS};
	font-family: ${fontFamilyC};
	white-space: nowrap;
}

.z-chosenbox-pp {
	position: absolute;
	background-color: #FFFFFF;
	border: 1px solid #888888;
	font-family: ${fontFamilyC};
	font-size: ${fontSizeS};
	font-weight: normal;
	margin: 0;
	overflow: auto;
	padding: 2px;
	${t:gradient(G_Background_Gradient_Direction, '#d3d3d3 0%;#e5e5e5 10%;#f2f2f2 25%;#ffffff 50%;#f2f2f2 75%; #e5e5e5 90%;#d3d3d3 100%')}
	${t:boxShadow('1px 1px 3px rgba(0, 0, 0, 0.35)')}
	${t:borderRadius(G_Background_Button_Border_Radius)}
	${G_TextShadow}
}

.z-chosenbox-pp-hidden {
	display: none;
}
.z-chosenbox-option {
	cursor: pointer;
	padding: 0 15px;
	font-size: ${fontSizeM};
}
.z-chosenbox-option-over {
	${t:gradient(G_Background_Button_Gradient_Direction, '#f1fafe 0%; #d4f1fc 100%')}
	${t:borderRadius(G_Background_Button_Border_Radius)}
}
.z-chosenbox-empty {
	padding: 1px 5px;
	font-style: italic;
	color: ${G_Font_Color4};
}
.z-chosenbox-empty-creatable {
	cursor: pointer;
	background-color: #D3EFFA;
	color: ${G_Font_Color2};
	padding-top: 2px;
	padding-left: 19px;
	background: url(${c:encodeThemeURL('~./zkmax/img/inp/plus-btn.png')}) 1px 1px no-repeat;
}