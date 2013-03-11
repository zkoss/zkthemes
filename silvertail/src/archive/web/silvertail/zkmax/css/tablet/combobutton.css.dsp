<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>

.z-combobutton {
	font-family: ${fontFamilyT};
	font-size: ${fontSizeXS};
	font-weight: normal;
	padding: 5px 26px 5px 15px;
	margin: 1px 1px 0 0;
	line-height: 20px;
	border: 1px solid ${G_Background_Border_Color};
	${t:borderRadius(G_Background_Button_Border_Radius)}
	${t:gradient(G_Background_Button_Gradient_Direction, G_Background)}
	${G_TextShadow}
	position: relative;
}
.z-combobutton:hover {
	border-color: ${G_Background_Hover_Border_Color};
	${t:gradient(G_Background_Button_Gradient_Direction, G_Background_Hover)}
}
.z-combobutton:active {
	border-top-color: ${G_Background_Active_Border_Color_TL};
	border-left-color: ${G_Background_Active_Border_Color_TL};
	border-bottom-color: ${G_Background_Active_Border_Color_BR};
	border-right-color: ${G_Background_Active_Border_Color_BR};
	
	${t:gradient(G_Background_Button_Gradient_Direction, G_Background_Active)}
	${t:boxShadow(G_Background_Active_Shadow)}
}
.z-combobutton:before {
	content: url(${G_EmptyIcon});
	width: 1px;
	height: 100%;
	top: 0;
	right: 26px;
	position: absolute;
	background: #CFCFCF;
}
.z-combobutton:after {
	content:'';
	width: 0;
	height: 0;
	top: 12px;
	right: -18px;
	position: relative;
	border-width: 6px;
	border-style: solid;
	border-color: #363636 transparent transparent transparent;
}