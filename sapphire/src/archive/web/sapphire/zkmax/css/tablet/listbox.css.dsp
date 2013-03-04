<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>

div.z-listbox {
	overflow: hidden;
	background: ${Mesh_Background};
	border: ${Mesh_Border_Width} solid ${Mesh_Border_Color};
}

div.z-listbox-header, div.z-listbox-header tr, div.z-listbox-footer {
	border: 0; width: 100%;
}
div.z-listbox-header, div.z-listbox-footer {
	overflow: hidden;
}
div.z-listbox,
div.z-listbox-header tr.z-listhead,
div.z-listbox-header tr.z-auxhead {
	${Mesh_Head_Background};
}

div.z-listbox-header th.z-listheader, div.z-listbox-header th.z-auxheader {
	overflow: hidden; 
	border: ${Mesh_Head_Border};
	white-space: nowrap;
	color: ${Mesh_Head_Color};
	border-left-color: ${Mesh_Head_Border_Left_Color};
	border-top: ${Mesh_Head_Border_Top};
	padding: ${Mesh_Head_Padding};
}
div.z-listbox-body {
	background: ${Mesh_Background};
	border: 0;
	overflow: auto;
	width: 100%;
	position: relative;
}
tbody.z-listbox-empty-body td{
   	font-family: ${Mesh_Body_Empty_FontFamily};
    font-size: ${Mesh_Body_Empty_FontSize};
    font-weight: ${Mesh_Body_Empty_FontWeight};
    color: ${Mesh_Body_Empty_Color};
    font-style: italic;
    text-align: center;
}
div.z-listbox-pgi-b {
	border-top: ${Mesh_Paging_Border_Top};
	overflow: hidden;
}
div.z-listbox-pgi-t {
	border-bottom: ${Mesh_Paging_Border_Bottom};
	overflow: hidden;
}
div.z-listbox-body .z-listcell, div.z-listbox-footer .z-listfooter {
	cursor: pointer;
	padding: ${Mesh_Body_Padding};
	font-weight: ${Mesh_FontWeight};
	overflow: hidden;
}
div.z-listbox-body .z-listgroupfoot-inner,
div.z-listbox-body .z-listgroup-inner {
	cursor: default;
}
div.z-listbox-footer {
	border-top: ${Mesh_Foot_Border_Top};
	background: ${Mesh_Foot_Background};
}
tr.z-listfoot td.z-listfooter {
	padding: ${Mesh_Foot_Padding};
}
div.z-listfooter-cnt, div.z-listheader-cnt {
	overflow: hidden;
	cursor: default;
}
div.z-listheader-cnt {
	position: relative;
}
.z-word-wrap div.z-listcell-cnt, .z-word-wrap div.z-listfooter-cnt,
	.z-word-wrap div.z-listheader-cnt {
	word-wrap: break-word;
}
div.z-listfooter-cnt, div.z-listcell-cnt, div.z-listheader-cnt {
	border: 0; margin: 0; padding: 0;
	font-family: ${Mesh_FontFamily};
	font-size: ${Mesh_FontSize};
	font-weight: ${Mesh_FontWeight};
	color: ${Mesh_Color};
}
<%-- faker uses only --%>
tr.z-listbox-faker, tr.z-listbox-faker th, tr.z-listbox-faker div {
	height: 0 !important;
	border-top: 0 !important; border-right : 0 !important;border-bottom: 0 !important;border-left: 0 !important;
	padding-top: 0 !important;	padding-right: 0 !important; padding-bottom: 0 !important;padding-left: 0 !important;
	margin-top: 0 !important; margin-right : 0 !important;margin-bottom: 0 !important;margin-left: 0 !important;
	font-size: ${Mesh_FontSize} !important;
	<%-- these above css cannot be overrided--%>
}
tr.z-listitem, tr.z-listitem a, tr.z-listitem a:visited {
	font-size: ${Mesh_Anchor_FontSize};
	font-family: ${Mesh_Anchor_FontFamily};
	font-weight: ${Mesh_Anchor_FontWeight};
	color: ${Mesh_Anchor_Color};
	text-decoration: none;
}
tr.z-listitem a:hover {
	text-decoration: underline;
}
tr.z-listbox-odd {
	background: ${Mesh_Row_Odd_Background};
}
tr.z-listitem-disd *, td.z-listcell-disd * {
	color: ${Mesh_Row_Disable_Color} !important;
	cursor: default !important;
}
tr.z-listitem-disd a:visited, tr.z-listitem-disd a:hover,
td.z-listcell-disd a:visited, td.z-listcell-disd a:hover {
	text-decoration: none !important;
	cursor: default !important;
	color: ${Mesh_Anchor_Disable_Border_Color} !important;
}

tr.z-listitem-over > td.z-listcell {
	border-top: ${Mesh_Row_Hover_Border_Top};
	border-bottom: ${Mesh_Row_Hover_Border_Bottom};
}
tr.z-listitem-over {
	${Mesh_Row_Hover_Background};
}
<%-- ZK Listhead's menu --%>
.z-listheader .z-listheader-cnt {
	position: relative;
}

.z-listhead-menu-grouping .z-menuitem-img {
	background-image: url(${Mesh_Menu_Grouping_Icon});
}
.z-listhead-menu-asc .z-menuitem-img {
	background-image: url(${Mesh_Menu_Asc_Icon});
}
.z-listhead-menu-dsc .z-menuitem-img {
	background-image: url(${Mesh_Menu_Dsc_Icon});
}
.z-listhead-menu-ungrouping .z-menuitem-img {
	background-image: url(${Mesh_Menu_Ungrouping_Icon});
}
div.z-listbox-header th.z-listheader-sort div.z-listheader-cnt {
	cursor: pointer;
	padding: ${Mesh_Head_Sort_Content_Padding};
	font-weight: bold;
}
.z-listheader-sort-img {
	position: absolute;
	float: left;
	left: 50%;
	font-size: 0;
	margin-left: auto;
    margin-right: auto;
}

.z-listheader-sort .z-listheader-sort-img {
	margin-top: -5px;
	width: 8px;
	height: 5px;
}
.z-listheader-sort-asc .z-listheader-sort-img,
.z-listheader-sort-dsc .z-listheader-sort-img {
	background-position: 0 0;
    background-repeat: no-repeat;
	background-image: url(${Mesh_Head_Sort_Icon});
}
.z-listheader-sort-dsc .z-listheader-sort-img {
	background-position: 0 -5px;
}

div.z-listbox-header th.z-listheader-sort div.z-listheader-cnt,
div.z-listbox-header th.z-listheader-sort-asc div.z-listheader-cnt,
div.z-listbox-header th.z-listheader-sort-dsc div.z-listheader-cnt {
	background-image: none;
}
<%-- Autopaging --%>
.z-listbox-autopaging .z-listcell-cnt {
	height: 30px;
	overflow: hidden;
}

div.z-listbox-header th.z-listheader-sort-over {
	${Mesh_Head_Sort_Hover_Background};
}
tr.z-listitem-seld {
	${Mesh_Row_Selected_Background};
}

<%-- Listgroup --%>
tr.z-listgroup {
	${Mesh_Group_Background};
}
tr.z-listgroup-seld {
	${Mesh_Group_Selected_Background};
}
tr.z-listgroup td.z-listgroup-inner {
	border-bottom: ${Mesh_Group_Border_Bottom};
	border-top: ${Mesh_Group_Border_Top};
	padding: ${Mesh_Group_Padding};
}
tr.z-listgroup td.z-listgroup-inner.z-listcell-checkmark {
	padding: 1px 3px;
}
.z-listgroup .z-listcell-checkmark .z-listgroup-img-checkbox {
	margin-right: 2px;
}
td.z-listgroup-inner div.z-listcell-cnt {
	color: ${Mesh_Group_Cell_Color};
	padding: ${Mesh_Group_Cell_Padding};
	width: auto;
	font-weight: ${Mesh_Group_Cell_FontWeight};
	font-size: ${Mesh_Group_Cell_FontSize};
	font-family: ${Mesh_Group_Cell_FontFamily};
}

div.z-listfooter-cnt, div.z-listcell-cnt, div.z-listheader-cnt,
td.z-listgroup-inner div.z-listcell-cnt,
td.z-listgroupfoot-inner div.z-listcell-cnt,
.z-auxhead .z-auxheader-cnt  {
	font-size: ${Mesh_Group_Cell_FontSize};
	line-height: 17px;
}

td.z-listgroup-inner div.z-listcell-cnt,
div.z-listfooter-cnt {
	line-height: 22px;
}
td.z-listgroupfoot-inner div.z-listcell-cnt {
	line-height: 24px;
}
div.z-listcell-cnt {
	line-height: 20px;
}
.z-listheader-btn {
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
.z-listheader-btn:after {
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
.z-listheader-sort-over .z-listheader-btn, .z-listheader-visi .z-listheader-btn {
	display: block;
}
.z-listgroup-img {
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
.z-listgroup-img-open {
	background-position: 0 -23px;
}
.z-listgroup-img-close {
	background-position: 0 0;
}
<%-- Listgroupfoot --%>
.z-listgroupfoot {
	${Mesh_Groupfoot_Background};
}
td.z-listgroupfoot-inner div.z-listcell-cnt {
	color: ${Mesh_Groupfoot_Cell_Color};
	font-weight: ${Mesh_Groupfoot_Cell_FontWeight};
	font-size: ${Mesh_Groupfoot_Cell_FontSize};
	font-family: ${Mesh_Groupfoot_Cell_FontFamily};
}
tr.z-listgroupfoot td.z-listgroupfoot-inner {
	padding: ${Mesh_Groupfoot_Padding};
}
td.z-listgroupfoot-inner {
	border-top-color: ${Mesh_Groupfoot_Border_Top_Color};
}
div.z-listbox-header tr.z-auxhead th:last-child, 
div.z-listbox-header tr.z-listhead th:last-child {
	border-right: none;
}

div.z-listheader-cnt, div.z-listbox-header div.z-auxheader-cnt {
	font-weight: ${Mesh_Head_Content_FontWeight};
	padding: ${Mesh_Head_Content_Padding};
}

td.z-listcell {
	border: ${Mesh_Cell_Border};
	border-left-color: ${Mesh_Cell_Border_Left_Color};
}

div.z-listbox-body .z-listcell {
	padding: ${Mesh_Cell_Padding};
}

div.z-listbox-footer .z-listfooter {
	color: ${Mesh_Foot_Color};
	background: ${Mesh_Foot_Background};
}

.z-listbox-header-bg {
	position:relative;
	margin-right: -11px;
	top: 0;
	height: 1px;
	font-size: 0;	
	background: ${Mesh_Border_Color};
	margin-top: -1px;
}

<%-- Checkbox and Radio --%>
.z-listitem-img,
.z-listheader-img,
.z-listgroup-img-checkbox,
.z-listgroup-img-radio,
.z-listgroupfoot-img {
	background:transparent no-repeat scroll center center;
	border:0;
	height: 13px;
	overflow: hidden;
	display:-moz-inline-box;
	vertical-align: top;
	display: inline-block;
	min-height: 13px;
	padding:0;
	vertical-align:top;
	width: 13px;
	margin: 2px;
}
.z-listheader-checkmark .z-listheader-cnt {
	padding-top: 2px;
	padding-bottom: 2px;
	line-height: 26px;
}
div.z-listbox-body .z-listcell-checkmark {
	padding-top: 2px;
	padding-bottom: 2px;
}
.z-listcell-checkmark .z-overflow-hidden {
	overflow: visible;
}
.z-listcell-checkmark .z-listcell-cnt {
	line-height: 26px;
}
.z-listheader-img,
.z-listgroup-img-checkbox,
.z-listgroup-img-radio,
.z-listitem-img-checkbox,
.z-listitem-img-radio {
	margin: 0;
	width: 22px;
	height: 22px;
	${Mesh_Checkmark_Background};
	border: ${Mesh_Checkmark_Border};
	position: relative;
	top: 1px;
	background-position: 0 0 !important;
}
.z-listitem-img-radio,
.z-listgroup-img-radio {
	${t:borderRadius(Mesh_Checkmark_Radio_Border_Radius)};
}
.z-listitem-seld > td > .z-listcell-cnt > .z-listitem-img-checkbox,
.z-listgroup-seld > td > .z-listcell-cnt > .z-listgroup-img-checkbox,
.z-listheader-img-seld.z-listheader-img {
	background-image: ${Mesh_Checkmark_Checkbox_Selected_Background};
}
.z-listitem:not(.z-listitem-disd) .z-listitem-img-checkbox:active,
.z-listgroup(.z-listgroup-disd) .z-listgroup-img-checkbox:active,
.z-listheader-img:active {
	${Mesh_Checkmark_Checkbox_Active_Background};
	${Mesh_Checkmark_Checkbox_Active_Shadow};
}
.z-listitem-seld:not(.z-listitem-disd) > td > .z-listcell-cnt > .z-listitem-img-checkbox:active,
.z-listgroup-seld:not(.z-listgroup-disd) > td > .z-listcell-cnt > .z-listgroup-img-checkbox:active,
.z-listheader-img-seld.z-listheader-img:active {
	background-image: ${Mesh_Checkmark_Checkbox_Selected_Active_Background};
}

.z-listitem-seld > td > .z-listcell-cnt > .z-listitem-img-radio,
.z-listgroup-seld > td > .z-listcell-cnt > .z-listgroup-img-radio {
	${Mesh_Checkmark_Radio_Selected_Background};
	background-size: contain;
	background-position: 0 0;
}
.z-listitem-seld > td > .z-listcell-cnt > .z-listitem-img-radio:after,
.z-listgroup-seld > td > .z-listcell-cnt > .z-listgroup-img-radio:after {
	content:'';
	width: 0;
	height: 0;
	top: 6px;
	left: 6px;
	${t:borderRadius(Mesh_Checkmark_Radio_Border_Radius)};
	position: absolute;
	border: ${Mesh_Checkmark_Radio_After_Border};
}
.z-listitem:not(.z-listitem-disd) .z-listitem-img-radio:active,
.z-listgroup:not(.z-listgroup-disd) .z-listgroup-img-radio:active {
	${Mesh_Checkmark_Radio_Active_Background};
	${Mesh_Checkmark_Radio_Active_Shadow};
}
.z-listitem-seld:not(.z-listitem-disd) > td > .z-listcell-cnt > .z-listitem-img-radio:active,
.z-listgroup-seld:not(.z-listgroup-disd) > td > .z-listcell-cnt > .z-listgroup-img-radio:active {
	${Mesh_Checkmark_Radio_Selected_Active_Background};
}