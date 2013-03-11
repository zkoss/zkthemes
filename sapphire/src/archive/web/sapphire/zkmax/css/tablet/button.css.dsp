<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>

.z-button {
	font-family: ${Button_FontFamily};
	font-size: ${Button_FontSize};
	font-weight: ${Button_FontWeight};
	padding: ${Button_Padding};
	margin: ${Button_Margin};
	line-height: ${Button_LineHeight};
	border: ${Button_Border_Width} solid ${Button_Border_Color};
	${Button_Border_Radius};
	${Button_Background};
	${Button_Text_Shadow};
	color: ${Button_Color};
}
.z-button:hover {
	border-color: ${Button_Hover_Border_Color};
	${Button_Hover_Background};
	${Button_Hover_Shadow};
}
.z-button:focus {
	border-color: ${G_Background_Focus_Border_Color};
	${Button_Focus_Background};
	${Button_Focus_Shadow};
}
.z-button:active {
	border-color: ${Button_Active_Border_Color};
	${Button_Active_Background};
	${Button_Active_Shadow};
}
.z-button:disabled,
.z-button:disabled:hover,
.z-button:disabled:focus,
.z-button:disabled:active {
	color: gray;
	opacity: .6;
	border: ${Button_Border_Width} solid ${Button_Border_Color};
	${Button_Background};
	${t:boxShadow('none')};
}