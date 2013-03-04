<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>
<%-- Horizontal style --%>
.z-slider-sphere-hor,
.z-slider-hor {
	background-image: none;
	height: 32px;
	margin-right: 0;
}
.z-slider-sphere-hor-center,
.z-slider-hor-center {
	${t:gradient(G_Background_Gradient_Direction, 'rgba(157,157,157,0.5) 0%; rgba(130,140,149,0.5) 13%; rgba(215,215,215,0.5) 100%')}
	${t:borderRadius('5px')}
	height: 10px;
	top: 15px;
	width: 100%;
	line-height: 0;
	margin-right: 7px;
	position: relative;
	cursor: pointer;
}
.z-slider-sphere-hor-btn,
.z-slider-hor-btn,
.z-slider-ver-btn,
.z-slider-sphere-ver-btn {
	width: 32px;
	height: 32px;
	${t:applyCSS3('box-sizing', 'border-box')}
	border: 1px solid ${G_Background_Border_Color};
	${t:borderRadius(G_Background_Button_Border_Radius)}
	${t:gradient(G_Background_Button_Gradient_Direction, "#FFFFFF 0%; #FEFEFE 50%; #EFEFEF 100%")}
	position: absolute;
	top: -11px;
	left: 0;
	cursor: pointer;
}
.z-slider-sphere-hor-btn,
.z-slider-sphere-ver-btn {
	${t:borderRadius("15px")}	
}
.z-slider-sphere-hor-btn:active,
.z-slider-sphere-ver-btn:active,
.z-slider-hor-btn:active,
.z-slider-ver-btn:active {
	border-top-color: ${G_Background_Active_Border_Color_TL};
	border-left-color: ${G_Background_Active_Border_Color_TL};
	border-bottom-color: ${G_Background_Active_Border_Color_BR};
	border-right-color: ${G_Background_Active_Border_Color_BR};
	
	${t:gradient(G_Background_Button_Gradient_Direction, G_Background_Active)}
}
<%-- Vertical style --%>
.z-slider-sphere-ver,
.z-slider-ver {
	background-image: none;
	width: 32px;
	margin-bottom: 7px;
	line-height: 0;
	font-size: 0;
}
.z-slider-sphere-ver-center,
.z-slider-ver-center {
	${t:gradient('hor', 'rgba(157,157,157,0.5) 0%; rgba(130,140,149,0.5) 13%; rgba(215,215,215,0.5) 100%')}
	${t:borderRadius('5px')}
	height: 100%;
	left: 15px;
	width: 10px;
	font-size: 0;
	margin-bottom: 7px;
	position: relative;
}

.z-slider-sphere-ver-btn,
.z-slider-ver-btn {
	bottom: 0;
	left: -11px;
}
.z-slider-pp {
	font-family: ${fontFamilyC};
	font-size: ${fontSizeM};
	font-weight: normal;
	${t:borderRadius('3px')}
	${G_TexxtShadow}
	${t:boxShadow('0 0 10px rgba(0, 0, 0, 0.35)')}
	padding: 2px;
}
.z-slider-pp:before {
	content:"";
	position: absolute;
	width: 0;
	height: 0;
	border-width: 5px;
	border-style: solid;
	border-color: transparent;
	margin: 2px 0 0 -12px;
}
.z-slider-ver-pp.z-slider-pp:before {
	border-right-color: #FFFFFF;
}
.z-slider-hor-pp.z-slider-pp:before {
	border-bottom-color: #FFFFFF;
	margin: -12px 0 0 1px;
}