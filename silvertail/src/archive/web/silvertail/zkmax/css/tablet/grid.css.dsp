<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>

div.z-grid {
	overflow: hidden;
	background: ${Mesh_Background};
	border: ${Mesh_Border_Width} solid ${Mesh_Border_Color};
}

div.z-grid-header, div.z-grid-header tr, div.z-grid-footer {
	border: 0; width: 100%;
}
div.z-grid-header, div.z-grid-footer {
	overflow: hidden;
}
div.z-grid,
div.z-grid-header tr.z-columns,
div.z-grid-header tr.z-auxhead {
	${Mesh_Head_Background};
}

div.z-grid-header th.z-column, div.z-grid-header th.z-auxheader {
	overflow: hidden; 
	border: ${Mesh_Head_Border};
	white-space: nowrap;
	color: ${Mesh_Head_Color};
	border-left-color: ${Mesh_Head_Border_Left_Color};
	border-top: ${Mesh_Head_Border_Top};
	padding: ${Mesh_Head_Padding};
}
div.z-grid-body {
	background: ${Mesh_Background};
	border: 0;
	overflow: auto;
	width: 100%;
	position: relative;
}
tbody.z-grid-empty-body td{
   	font-family: ${Mesh_Body_Empty_FontFamily};
    font-size: ${Mesh_Body_Empty_FontSize};
    font-weight: ${Mesh_Body_Empty_FontWeight};
    color: ${Mesh_Body_Empty_Color};
    font-style: italic;
    text-align: center;
}
div.z-grid-pgi-b {
	border-top: ${Mesh_Paging_Border_Top};
	overflow: hidden;
}
div.z-grid-pgi-t {
	border-bottom: ${Mesh_Paging_Border_Bottom};
	overflow: hidden;
}

div.z-footer-cnt, div.z-row-cnt, div.z-group-cnt, div.z-groupfoot-cnt, div.z-column-cnt {
	border: 0; margin: 0; padding: 0;
	font-family: ${Mesh_FontFamily};
	font-size: ${Mesh_FontSize};
	font-weight: ${Mesh_FontWeight};
	color: ${Mesh_Color};
}
div.z-footer-cnt, div.z-column-cnt{
	overflow: hidden;
	cursor: default;
}
.z-word-wrap div.z-row-cnt,
.z-word-wrap div.z-group-cnt,
.z-word-wrap div.z-groupfoot-cnt,
.z-word-wrap div.z-footer-cnt, .z-word-wrap div.z-column-cnt {
	word-wrap: break-word;
}
<%-- faker uses only --%>
tr.z-grid-faker, tr.z-grid-faker th, tr.z-grid-faker div {
	height: 0 !important;
	border-top: 0 !important; border-right : 0 !important;border-bottom: 0 !important;border-left: 0 !important;
	padding-top: 0 !important;	padding-right: 0 !important; padding-bottom: 0 !important;padding-left: 0 !important;
	margin-top: 0 !important; margin-right : 0 !important;margin-bottom: 0 !important;margin-left: 0 !important;
	font-size: ${Mesh_FontSize} !important;
} <%-- these above css cannot be overrided--%>
.z-cell, td.z-row-inner, td.z-groupfoot-inner {
	padding: 0; 
	overflow: hidden;
}
div.z-column-cnt, div.z-row-cnt {
	font-family: ${fontFamilyC};
	font-weight: bold;
	color: #636363;
}

div.z-column-cnt, div.z-grid-header div.z-auxheader-cnt {
	font-weight: ${Mesh_Head_Content_FontWeight};
	padding: ${Mesh_Head_Content_Padding};
}
.z-columns-menu-grouping .z-menuitem-img {
	background-image: url(${Mesh_Menu_Grouping_Icon});
}
.z-columns-menu-asc .z-menuitem-img {
	background-image: url(${Mesh_Menu_Asc_Icon});
}
.z-columns-menu-dsc .z-menuitem-img {
	background-image: url(${Mesh_Menu_Dsc_Icon});
}
.z-columns-menu-ungrouping .z-menuitem-img {
	background-image: url(${Mesh_Menu_Ungrouping_Icon});
}

<%-- Group --%>
tr.z-group {
	${Mesh_Group_Background};
}
td.z-group-inner {
	border-bottom: ${Mesh_Group_Border_Bottom};
	border-top: ${Mesh_Group_Border_Top};
	padding: ${Mesh_Group_Padding};
}
.z-group-inner .z-group-cnt .z-label, .z-group-inner .z-group-cnt {
	color: ${Mesh_Group_Cell_Color};
	padding: ${Mesh_Group_Cell_Padding};
	width: auto;
	font-weight: ${Mesh_Group_Cell_FontWeight};
	font-size: ${Mesh_Group_Cell_FontSize};
	font-family: ${Mesh_Group_Cell_FontFamily};
}
<%-- Group foot --%>
.z-groupfoot {
	${Mesh_Groupfoot_Background};
}
td.z-groupfoot-inner {
	padding: ${Mesh_Groupfoot_Padding};
}
div.z-grid-footer {
	border-top: ${Mesh_Foot_Border_Top};
	background: ${Mesh_Foot_Background};
}
td.z-footer {
	padding: ${Mesh_Foot_Padding};
}
div.z-grid-header .z-column-sort div.z-column-cnt {
	cursor: pointer;
	padding: ${Mesh_Head_Sort_Content_Padding};
	font-weight: bold;
}
.z-column-sort-img {
	position: absolute;
	float: left;
	left: 50%;
	font-size: 0;
	margin-left: auto;
    margin-right: auto;
}
.z-column-sort .z-column-sort-img {
	margin-top:-5px;
	width: 8px;
	height: 5px;
}
.z-column-sort-asc .z-column-sort-img,
.z-column-sort-dsc .z-column-sort-img {
	background-position: 0 0;
    background-repeat: no-repeat;
	background-image: url(${Mesh_Head_Sort_Icon});
}
.z-column-sort-dsc .z-column-sort-img {
	background-position: 0 -5px;
}
.z-grid-header-bg {
	position:relative;
	margin-right: -11px;
	top: 0;
	height: 1px;
	font-size: 0;	
	background: ${Mesh_Border_Color};
	margin-top: -1px;
}
div.z-grid-header th.z-column-over,
div.z-grid-header th.z-auxheader-over {
	${Mesh_Head_Sort_Hover_Background};
}
div.z-footer-cnt, div.z-row-cnt, div.z-group-cnt, div.z-groupfoot-cnt, div.z-column-cnt,
.z-group-inner .z-group-cnt .z-label, .z-group-inner .z-group-cnt,
.z-groupfoot-inner .z-groupfoot-cnt .z-label, .z-groupfoot-inner .z-groupfoot-cnt,
.z-auxhead .z-auxheader-cnt {
	font-size: ${Mesh_Group_Cell_FontSize};
	line-height: 17px;
}
.z-group-inner .z-group-cnt .z-label,
.z-group-inner .z-group-cnt,
div.z-footer-cnt {
	line-height: 22px;
}
.z-groupfoot-inner .z-groupfoot-cnt .z-label,
.z-groupfoot-inner .z-groupfoot-cnt {
	line-height: 24px;
}
div.z-row-cnt {
	line-height: 20px;
}
<%-- ZK Column's menu --%>
.z-column .z-column-cnt {
	position: relative;
}
.z-column-btn {
	position: absolute;
	z-index: 15;
	cursor: pointer;
	top: 0;
	right: 0;
	width: 23px;
	border-left: 1px solid ${Mesh_Head_Button_Border_Color};
	padding-left: 4px;
	height: 100%;
	display: block;
	background: none;
	min-height: 20px;
}
.z-column-btn:after {
	content:'';
	position: absolute;
	width: 0;
	height: 0;
	right: 7px;
	top: 12px;
	border-width: ${Mesh_Head_Button_After_Border_Width};
	border-style: solid;
	border-color: ${Mesh_Head_Button_After_Border_Color} transparent transparent transparent;
}
.z-column-over .z-column-btn, .z-column-visi .z-column-btn {
	display: block;
}
.z-group-img {
	width: 24px;
	min-height: 24px;
	height: 100%;
	margin: ${Mesh_Group_Icon_Margin};
	display:-moz-inline-box;
	vertical-align: top;
	display: inline-block;
	background-image: url(${Mesh_Group_Icon});
	background-repeat: no-repeat;
	vertical-align: top;
	cursor: pointer;
	border: 0;
}
.z-group-img-open {
	background-position: 0 -23px;
}
.z-group-img-close {
	background-position: 0 0;
}
div.z-grid-header tr.z-columns th:last-child,
div.z-grid-header tr.z-auxhead th:last-child {
	border-right: none;
}

tr.z-row td.z-row-inner,
tr.z-row .z-cell {
	padding: ${Mesh_Cell_Padding};
}
tr.z-row td.z-row-inner,
tr.z-row .z-cell,
td.z-groupfoot-inner {
	border: ${Mesh_Cell_Border};
	border-left-color: ${Mesh_Cell_Border_Left_Color};
}
tr.z-grid-odd td.z-row-inner,
tr.z-grid-odd .z-cell {
	background: ${Mesh_Row_Odd_Background};
	border: 1px solid ${Mesh_Row_Odd_Background};
	border-left-color: #FFFFFF;
}
tr.z-grid-odd td.z-row-inner,
tr.z-grid-odd .z-cell,
tr.z-grid-odd {
	background: ${Mesh_Row_Odd_Background};
}

<%-- Bug ZK-1234: Nested grids does not properly display alternating odd/even rows --%>
tr.z-grid-odd tr:not(.z-grid-odd) td.z-row-inner {
	background-color: ${Mesh_Background};
}

tr.z-row-over > td.z-row-inner {
	border-top: ${Mesh_Row_Hover_Border_Top};
	border-bottom: ${Mesh_Row_Hover_Border_Bottom};
}
tr.z-row-over > td.z-row-inner, tr.z-row-over > .z-cell {
	${Mesh_Row_Hover_Background};
}
<%-- Autopaging --%>
.z-grid-autopaging .z-row-cnt {
	height: 30px;
	overflow: hidden;
}
.z-grid-footer .z-footer {
	overflow: hidden; <%-- B50-ZK-410: Bug on footer labels applied to a grid --%>
}
<%-- Detail --%>
.z-detail {
	height: 100%;
	width: 32px;
	padding: 0!important;
	overflow: hidden;
	white-space: nowrap;
}
.z-detail .z-detail-img {
	height: 24px;
	width: 24px;
	margin: 0 auto;
	${t:applyCSS3('box-sizing', 'border-box')}
	${Detail_Icon_Background};
	cursor: pointer;
	border: ${Mesh_Border_Width} solid ${Mesh_Border_Color};
	${Detail_Icon_Border_Radius};
}
.z-detail .z-detail-img:after {
	content: url(${Detail_Icon_Plus});
	color: ${Detail_Icon_Color};
	font: 28px "Open Sans",Arial;
	position: relative;
	top: 6px;
	left: 6px;
}
.z-detail.z-detail-expd .z-detail-img:after {
	content: url(${Detail_Icon_Minus});
	top: 10px;
	left: 6px;
}
.z-detail .z-detail-img:active {
	border-color: ${Detail_Icon_Active_Border_Color};
	${Detail_Icon_Active_Background};
	${Detail_Icon_Active_Shadow};
}

tr.z-row .z-detail-outer {
	${Detail_Row_Background};
	border: ${Detail_Row_Border};
	border-color: ${Detail_Row_Border_Color};
	border-top: none;
	vertical-align: top;
	padding: ${Detail_Row_Padding};
	width: 32px;
}