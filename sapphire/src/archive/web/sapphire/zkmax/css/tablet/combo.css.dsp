<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>

<%-- Global Variable --%>
<c:set var="focusShadow" value="inset 1px 1px 1px rgba(210, 210, 210, 0.75)"/>

<%-- Combo widget --%>
.z-combobox,
.z-bandbox,
.z-datebox,
.z-timebox,
.z-spinner,
.z-doublespinner {
	border: ${Combo_Border};
	padding: ${Combo_Padding};
	margin: ${Combo_Margin};
	white-space: nowrap;
	font-family: ${Combo_FontFamily};
	font-size: ${Combo_FontSize};
	font-weight: ${Combo_FontWeight};
	display: -moz-inline-box;
	display: inline-block;
	background: ${Combo_Background};
	color: ${Combo_Color};
}

.z-combobox-inp,
.z-bandbox-inp,
.z-datebox-inp,
.z-timebox-inp,
.z-spinner-inp,
.z-doublespinner-inp {
	background: ${Combo_Input_Background};
	font-size: ${Combo_Input_FontSize};
	font-family: ${Combo_Input_FontFamily};
	font-weight: ${Combo_Input_FontWeight};
	padding: ${Combo_Input_Padding};
	border: ${Combo_Input_Border_Width} solid ${Combo_Input_Border_Color};
	border-right: ${Combo_Input_Border_Right_Width};
	height: ${Combo_Input_Height};
	margin: ${Combo_Input_Margin};
	${t:borderRadius(Combo_Input_Border_Radius_Size)};
	line-height: ${Combo_Input_LineHeight};
	${Combo_Input_Shadow};
	color: ${Combo_Input_Color};
}

.z-combobox-right-edge,
.z-bandbox-right-edge,
.z-datebox-right-edge,
.z-timebox-right-edge,
.z-spinner-right-edge,
.z-doublespinner-right-edge {
	border-right: ${Combo_Input_Border_Width} solid ${Combo_Input_Border_Color};
	${t:borderRadius(Combo_Border_Radius_Size)}
}
<c:set var="items" value="${c:split('combobox,bandbox,datebox,timebox', ',')}"/>
<c:forEach var="cmp" items="${items}" varStatus="counter">
	<c:set var="url" value="${c:encodeThemeURL(c:cat3('~./zkmax/img/tablet/inp/', cmp, '.png'))}"/>
.z-${cmp} .z-${cmp}-btn {
	background: transparent no-repeat center center;
	background-image: url(${url}),
			${Combo_Button_Background};
	vertical-align: top; 
	cursor: pointer; 
	width: 32px; 
	height: 30px;
	border: ${Combo_Button_Border_Width} solid ${Combo_Button_Border_Color};
	overflow: hidden;
	${t:borderRadius(Combo_Button_Border_Radius_Size)}
	display:-moz-inline-box;
	display:inline-block;	
}
.z-${cmp} .z-${cmp}-btn-over {
	border-color: ${Combo_Button_Hover_Border_Color};
	background-image: url(${url}),
			${Combo_Button_Hover_Background};
	${Combo_Button_Hover_Shadow};
}
.z-${cmp}-btn:active {
	border-color: ${Combo_Button_Active_Border_Color};
	background-image: url(${url}),
				${Combo_Button_Active_Background};
	${Combo_Button_Active_Shadow};
}
.z-${cmp}-disd .z-${cmp}-btn:active {
	border: ${Combo_Button_Border_Width} solid ${Combo_Button_Border_Color};
	background-image: url(${url}),
				${Combo_Button_Background};
	${Combo_Input_Shadow}
}
</c:forEach>

.z-spinner .z-spinner-btn,
.z-doublespinner .z-doublespinner-btn {
	border: ${Combo_Button_Border_Width} solid ${Combo_Button_Border_Color};
	border-left-width: 0px;
	vertical-align: top;
	width: 64px;
	height: 30px;
	overflow: hidden;
	${t:borderRadius(Combo_Button_Border_Radius_Size)}
	display:-moz-inline-box;
	display:inline-block;
}
.z-spinner .z-spinner-btn-upper,
.z-doublespinner .z-doublespinner-btn-upper,
.z-spinner .z-spinner-btn-lower,
.z-doublespinner .z-doublespinner-btn-lower {
	background: ${Combo_Button_Background};
	border-left: ${Combo_Button_Border_Width} solid ${Combo_Button_Border_Color};
	height: 32px;
	width: 31px;
	cursor: pointer;
	float: left;
}

<c:set var="items" value="${c:split('spinner,doublespinner', ',')}"/>
<c:forEach var="cmp" items="${items}">
.z-${cmp}-btn-clk .z-${cmp}-btn-up-clk,
.z-${cmp}-btn-clk .z-${cmp}-btn-down-clk {
	border-color: ${Combo_Button_Active_Border_Color};
	background: ${Combo_Button_Active_Background};
	${Combo_Button_Active_Shadow}
}
</c:forEach>
.z-spinner .z-spinner-btn-upper,
.z-doublespinner .z-doublespinner-btn-upper {
	float: right;
}

<c:set var="items" value="${c:split('spinner,doublespinner', ',')}"/>
<c:forEach var="cmp" items="${items}">
.z-${cmp} .z-${cmp}-btn-up-icon,
.z-${cmp} .z-${cmp}-btn-down-icon {
	background: transparent no-repeat center center;
	height: 30px;
	width: 32px;
	text-align: center;
}
.z-${cmp} .z-${cmp}-btn-up-icon:after,
.z-${cmp} .z-${cmp}-btn-down-icon:after {
	content: url(${G_PlusIcon});
	color: ${Combo_Button_After_Color};
	font-size: ${Combo_Button_After_FontSize};
	font-family: ${Combo_Button_After_FontFamily};
	font-weight: ${Combo_Button_After_FontWeight};
	position: relative;
	top: ${Combo_Button_Up_After_Top}px;
}
.z-${cmp} .z-${cmp}-btn-down-icon:after {
	content: url(${G_MinusIcon});
	top: ${Combo_Button_Down_After_Top}px;
}
.z-${cmp} .z-${cmp}-btn-up-icon:active:after {
	top: ${Combo_Button_Up_After_Top-1}px;
}
.z-${cmp} .z-${cmp}-btn-down-icon:active:after {
	top: ${Combo_Button_Down_After_Top}px;
}
</c:forEach>

.z-combobox-inp:focus,
.z-bandbox-inp:focus,
.z-datebox-inp:focus,
.z-timebox-inp:focus,
.z-spinner-inp:focus,
.z-doublespinner-inp:focus {
	${Combo_Input_Focus_Shadow}
	${Combo_Input_Focus_Background}
}

.z-combobox .z-combobox-text-invalid,
.z-bandbox .z-bandbox-text-invalid,
.z-datebox .z-datebox-text-invalid,
.z-timebox .z-timebox-text-invalid,
.z-spinner .z-spinner-text-invalid,
.z-doublespinner .z-doublespinner-text-invalid {
	background: ${Combo_Input_Error_Background};
	border-color: ${Combo_Input_Error_Border_Color};
	border-right-width: ${Combo_Input_Border_Width} !important;
	margin-right: -${Combo_Input_Border_Width};
}

<%-- disable --%>
.z-spinner-disd,
.z-doublespinner-disd,
.z-timebox-disd,
.z-datebox-disd,
.z-bandbox-disd,
.z-comboitem-disd,
.z-combobox-disd {
	opacity: ${Combo_Input_Disable_Opacity};
}
.z-spinner-disd, .z-spinner-disd *,
.z-doublespinner-disd, .z-doublespinner-disd *,
.z-timebox-disd, .z-timebox-disd *,
.z-datebox-disd, .z-datebox-disd *,
.z-bandbox-disd, .z-bandbox-disd *,
.z-comboitem-disd, .z-comboitem-disd *,
.z-combobox-disd, .z-combobox-disd * {
	cursor: default !important;
	color: ${Combo_Input_Disable_Color};
	background: ${Combo_Input_Disable_Background};
}
.z-comboitem-text-disd,
.z-spinner-text-disd,
.z-doublespinner-text-disd,
.z-timebox-text-disd,
.z-datebox-text-disd,
.z-bandbox-text-disd,
.z-combobox-text-disd {
	background: ${Combo_Input_Disable_Background};
}
.z-spinner-readonly,
.z-doublespinner-readonly,
.z-timebox-readonly,
.z-datebox-readonly,
.z-bandbox-readonly,
.z-combobox-readonly,
.z-spinner-readonly:focus,
.z-doublespinner-readonly:focus,
.z-timebox-readonly:focus,
.z-datebox-readonly:focus,
.z-bandbox-readonly:focus,
.z-combobox-readonly:focus {
	background: transparent repeat-x 0 0;
	background-color: ${Combo_Input_Readonly_Background};
	border-color: ${Combo_Input_Readonly_Border_Color};
	border-top-color: ${Combo_Input_Readonly_Border_Top_Color};
	border-right-width: 0;
	cursor: default;
	${Combo_Input_Shadow}
}
.z-combobox-real-readonly .z-combobox-right-edge,
.z-bandbox-real-readonly .z-bandbox-right-edge,
.z-datebox-real-readonly .z-datebox-right-edge,
.z-timebox-real-readonly .z-timebox-right-edge,
.z-spinner-real-readonly .z-spinner-right-edge,
.z-doublespinner-real-readonly .z-doublespinner-right-edge {
	border-right-width: ${Combo_Input_Border_Width} !important;
	${t:borderRadius(Combo_Border_Radius_Size)}
}

.z-spinner-real-readonly,
.z-doublespinner-real-readonly,
.z-timebox-real-readonly,
.z-datebox-real-readonly,
.z-bandbox-real-readonly,
.z-combobox-real-readonly {
	background-color: ${Combo_Input_Readonly_Background};
}

<%-- Inplace editing --%>
.z-combobox-inplace,
.z-bandbox-inplace,
.z-datebox-inplace,
.z-timebox-inplace,
.z-spinner-inplace,
.z-doublespinner-inplace {
	border: ${Combo_Inplace_Border};
	background: ${Combo_Inplace_Background};
	padding-top: ${Combo_Inplace_Padding};
	padding-bottom: ${Combo_Inplace_Padding};
}
.z-combobox-inplace .z-combobox-inp,
.z-bandbox-inplace .z-bandbox-inp,
.z-datebox-inplace .z-datebox-inp,
.z-timebox-inplace .z-timebox-inp,
.z-spinner-inplace .z-spinner-inp,
.z-doublespinner-inplace .z-doublespinner-inp {
	padding: ${Combo_Input_Inplace_Padding};
	border: ${Combo_Input_Inplace_Border};
	background: ${Combo_Input_Inplace_Background};
}
.z-combobox-inplace .z-combobox-btn,
.z-bandbox-inplace .z-bandbox-btn,
.z-datebox-inplace .z-datebox-btn,
.z-timebox-inplace .z-timebox-btn,
.z-spinner-inplace .z-spinner-btn,
.z-doublespinner-inplace .z-doublespinner-btn {
	display: none;
}

<%-- Comboitem --%>
.z-combobox-pp .z-comboitem-text, .z-combobox-pp .z-comboitem-btn {
	white-space: nowrap;
	font-size: ${Combo_Popup_FontSizeM};
	cursor: pointer;
}
.z-comboitem .z-comboitem-text {
	color: ${Combo_Popup_Color};
	${G_TextShadow}
}
.z-combobox-pp .z-comboitem-inner, .z-combobox-pp .z-comboitem-cnt {<%--description--%>
	color: ${Combo_Popup_Color};
	font-size: ${Combo_Popup_FontSizeS};
	padding-left: 6px;
}
.z-combobox-pp .z-comboitem, 
.z-combobox-pp .z-comboitem a, 
.z-combobox-pp .z-comboitem a:visited {
	font-size: ${Combo_Popup_Anchor_FontSize}; 
	font-weight: ${Combo_Popup_Anchor_FontWeight}; 
	color: ${Combo_Popup_Anchor_Color};
	text-decoration: none;
}
.z-combobox-pp .z-comboitem-seld {
	${Comboitem_Selected_Background};
}
.z-combobox-pp .z-comboitem-over-seld {
	${Comboitem_Selected_Background};
}
.z-comboitem .z-comboitem-img {
	width: 1px;
}

.z-combobox-pp,
.z-bandbox-pp,
.z-datebox-pp,
.z-timebox-pp {
	display: block;
	position: absolute;
	background: ${Combo_Popup_Background};
	border: ${Combo_Popup_Border_Width} solid ${Combo_Popup_Border_Color};
	padding: ${Combo_Popup_Padding};
	font-family: ${Combo_Popup_FontFamily};
	font-weight: ${Combo_Popup_FontWeight};
	font-size: ${Combo_Popup_FontSizeM};
	overflow: hidden;
}

.z-bandbox-pp {
	overflow: auto;
	${Combo_Popup_Shadow};
}

.z-combobox-pp {
	${Combobox_Popup_Background}
}

<%-- Shadow --%>
.z-combobox-shadow, .z-bandbox-shadow, .z-datebox-shadow {
	${t:borderRadius(Combo_Border_Radius_Size)};
	${Combo_Popup_Shadow};
}
<%-- Timebox wheel --%>
.z-timebox-wheel-cave {
	position: relative;
	padding: 0 2px;
}
.z-timebox-wheel-body {
	${t:box('box-orient', 'horizontal')}
	width: 100%;
}
.z-timebox-wheel-time {
	${t:box('box-orient', 'horizontal')}
  	width: 50%;
	position: relative;
	background: ${Timebox_Wheeltime_Background};
	${t:borderRadius(Combo_Border_Radius_Size)}
}
.z-timebox-pp .z-timebox-wheel-body {
	margin: ${Timebox_Wheeltime_Margin};
}
.z-timebox-wheel-line {
	position: absolute;
	top: 50%;
	height: 0;
	width: 100%;
	border-top: ${Timebox_Wheelline_Border_Top};
	border-bottom: ${Timebox_Wheelline_Border_Bottom};
	z-index: 1;
}
.z-timebox-wheel-list {
	${t:applyCSS3('box-flex', '1')}
	margin: ${Timebox_Wheellist_Margin};
	overflow: hidden;
	position: relative;
	color: ${Timebox_Wheellist_Color};
	background: ${Timebox_Wheellist_Background};
	height: 210px;
}
.z-timebox-wheel-list ul {
	list-style: none;
	margin: 0;
	padding: 0;
	position: relative;
	z-index: 2;
	width: 100%;
}
.z-timebox-wheel-list li {
	list-style: none;
	margin: 0;
	padding: 0 5px;
	display: block;
	text-align: center;
	font-size: 40px;
	white-space: nowrap;
	${Timebox_Wheellist_Text_Shadow}
	opacity: .3;
	width: 100%;
	height: 70px;
	line-height: 70px;
}
li.z-timebox-wheel-list-seld {
	opacity: 1;
}
.z-timebox-wheel-footer {
	clear: both;
	padding: 5px 0;
	height: 50px;
}
.z-timebox-wheel-button {
	width: 45%;
	font-size: 30px;
	font-weight: bold;
	padding: ${Button_Padding};
	margin: ${Button_Margin};
	border: ${Button_Border_Width} solid ${Button_Border_Color};
	${Button_Border_Radius};
	${Button_Background};
	${Button_Text_Shadow};
	color: ${Button_Color};
}
.z-timebox-wheel-button:hover {
	border-color: ${Button_Hover_Border_Color};
	${Button_Hover_Background};
	${Button_Hover_Shadow};
}
.z-timebox-wheel-button:focus {
	border-color: ${G_Background_Focus_Border_Color};
	${Button_Focus_Background};
	${Button_Focus_Shadow};
}
.z-timebox-wheel-button:active {
	border-color: ${Button_Active_Border_Color};
	${Button_Active_Background};
	${Button_Active_Shadow};
}
.z-timebox-wheel-left {
	float: left;
}
.z-timebox-wheel-right {
	float: right;
}
<%-- iPhone --%>
@media only screen
	and (min-device-width : 320px) 
	and (max-device-width : 480px) {
	.z-timebox-wheel-list {
		margin: 0 1px 0 0;
		height: 120px;
	}
	.z-timebox-wheel-list li {
		padding: 0;
		font-size: 20px;
		height: 40px;
		line-height: 40px;
	}
	.z-timebox-wheel-button {
		font-size: 22px;
	}
	.z-timebox-wheel-footer {
		height: 35px;
	}
}
<%-- Android --%>
@media only screen
	and (min-device-width : 480px) 
	and (max-device-width : 720px) {
	.z-timebox-wheel-list {
		margin: 0 1px 0 0;
		height: 150px;
	}
	.z-timebox-wheel-list li {
		padding: 0;
		font-size: 24px;
		height: 50px;
		line-height: 50px;
	}
	.z-timebox-wheel-button {
		font-size: 26px;
	}
	.z-timebox-wheel-footer {
		height: 40px;
	}
}
