<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>

div.z-tree {
	background: ${Mesh_Background};
	overflow: hidden; 
	border: ${Mesh_Border_Width} solid ${Mesh_Border_Color};
}
div.z-tree,
div.z-tree-header tr.z-treecols,
div.z-tree-header tr.z-auxhead {
	${Mesh_Head_Background};
}

div.z-tree-header th.z-treecol, div.z-tree-header th.z-auxheader {
	overflow: hidden; 
	border: ${Mesh_Head_Border};
	white-space: nowrap;
	color: ${Mesh_Head_Color};
	border-left-color: ${Mesh_Head_Border_Left_Color};
	border-top: ${Mesh_Head_Border_Top};
	padding: ${Mesh_Head_Padding};
}
div.z-tree-body, div.z-dottree-body, div.z-filetree-body, div.z-vfiletree-body {
	background: ${Mesh_Background};
	border: 0;
	overflow: auto;
	width: 100%;
	position: relative;
}
div.z-tree-pgi-b {
	border-top: ${Mesh_Paging_Border_Top};
	overflow: hidden;
}
div.z-tree-pgi-t {
	border-bottom: ${Mesh_Paging_Border_Bottom};
	overflow: hidden;
}
div.z-tree-body td.z-treecell, div.z-tree-footer td.z-treefooter {
	cursor: pointer;
	padding: ${Mesh_Body_Padding};
	font-weight: ${Mesh_FontWeight};
	overflow: hidden;
}
div.z-tree-footer {
	border-top: ${Mesh_Foot_Border_Top};
	background: ${Mesh_Foot_Background};
}
tr.z-tree-faker, tr.z-tree-faker th, tr.z-tree-faker div,
tr.z-dottree-faker, tr.z-dottree-faker th, tr.z-dottree-faker div,
tr.z-filetree-faker, tr.z-filetree-faker th, tr.z-filetree-faker div,
tr.z-vfiletree-faker, tr.z-vfiletree-faker th, tr.z-vfiletree-faker div {
	border-top: 0 !important; border-right : 0 !important;border-bottom: 0 !important;border-left: 0 !important;
	padding-top: 0 !important;	padding-right: 0 !important; padding-bottom: 0 !important;padding-left: 0 !important;
	margin-top: 0 !important; margin-right : 0 !important;margin-bottom: 0 !important;margin-left: 0 !important;
	height: 0 !important;
	font-size: ${Mesh_FontSize} !important;
} <%-- these above css cannot be overrided--%>

div.z-tree-header, div.z-tree-header tr, div.z-tree-footer {
	border: 0; width: 100%;
}
div.z-tree-header, div.z-tree-footer {
	overflow: hidden;
}

<%-- ZK Treecol's sorting --%>
div.z-tree-header th.z-treecol-sort div.z-treecol-cnt {
	cursor: pointer;
	padding: ${Mesh_Head_Sort_Content_Padding};
	font-weight: bold;
}
.z-treecol-sort-img {
	position: absolute;
	float: left;
	left: 50%;
	font-size: 0;
	margin-left: auto;
    margin-right: auto;
}
.z-treecol-sort .z-treecol-sort-img {
	margin-top: -5px;
	width: 8px;
	height: 5px;
}
.z-treecol-sort-asc .z-treecol-sort-img,
.z-treecol-sort-dsc .z-treecol-sort-img {
	background-position: 0 0;
    background-repeat: no-repeat;
	background-image: url(${Mesh_Head_Sort_Icon});
}
.z-treecol-sort-dsc .z-treecol-sort-img {
	background-position: 0 -5px;
}
div.z-tree-header th.z-treecol-sort div.z-treecol-cnt,
div.z-tree-header th.z-treecol-sort-asc div.z-treecol-cnt,
div.z-tree-header th.z-treecol-sort-dsc div.z-treecol-cnt {
	background-image: none;
}
div.z-tree-header th.z-treecol-sort-over {
	${Mesh_Head_Sort_Hover_Background};
}
div.z-treefooter-cnt, div.z-treecell-cnt, div.z-treecol-cnt,
.z-auxhead .z-auxheader-cnt {
	font-size: ${Mesh_Group_Cell_FontSize};
	line-height: 16px;
}
div.z-treefooter-cnt, div.z-treecell-cnt {
	line-height: 26px;
}

<%-- Treerow --%>
tr.z-treerow, tr.z-treerow a, tr.z-treerow a:visited {
	font-size: ${Mesh_Anchor_FontSize};
	font-family: ${Mesh_Anchor_FontFamily};
	font-weight: ${Mesh_Anchor_FontWeight};
	color: ${Mesh_Anchor_Color};
	text-decoration: none;
}
tr.z-treerow a:hover {
	text-decoration: underline;
}
tr.z-treerow-disd *, td.z-treecell-disd * {
	color: ${Mesh_Row_Disable_Color} !important;
	cursor: default !important;
}
tr.z-treerow-disd a:visited, tr.z-treerow-disd a:hover,
td.z-treecell-disd a:visited, td.z-treecell-disd a:hover {
	text-decoration: none !important;
	cursor: default !important;
	color: ${Mesh_Anchor_Disable_Border_Color} !important;
}
tr.z-treerow-seld {
	${Mesh_Row_Selected_Background};
}
tr.z-treerow-over > td.z-treecell {
	border-top: ${Mesh_Row_Hover_Border_Top};
	border-bottom: ${Mesh_Row_Hover_Border_Bottom};
}
tr.z-treerow-over {
	${Mesh_Row_Hover_Background};
}
.z-tree-header-bg {
	position:relative;
	margin-right: -11px;
	top: 0;
	height: 1px;
	font-size: 0;
	background: ${Mesh_Border_Color};
	margin-top: -1px;
}
<%-- tree icons --%>
span.z-tree-ico, span.z-tree-line, span.checkmark-spacer {
	width: 26px; height: 26px;
	display: -moz-inline-box; vertical-align:top;
	display: inline-block;
}
span.z-tree-ico {
	background-repeat: no-repeat;
}
span.z-tree-root-open, span.z-tree-tee-open, span.z-tree-last-open,
span.z-tree-root-close, span.z-tree-tee-close, span.z-tree-last-close {
	background-image: url(${Tree_Icon_Background});
}
span.z-tree-root-open, span.z-tree-tee-open, span.z-tree-last-open {
	background-position: 0 -26px;
}
span.z-tree-root-close, span.z-tree-tee-close, span.z-tree-last-close {
	background-position: 0 0;
}
.z-treerow-ico-over span.z-tree-root-open, 
.z-treerow-ico-over span.z-tree-tee-open,
.z-treerow-ico-over span.z-tree-last-open {
	background-position: -26px -26px;
}
.z-treerow-ico-over span.z-tree-root-close,
.z-treerow-ico-over span.z-tree-tee-close,
.z-treerow-ico-over span.z-tree-last-close {
	background-position: -26px 0;
}
.z-treerow-img {
	background:transparent no-repeat scroll center center;
	border:0;
	height: 13px;
	overflow: hidden;
	display: -moz-inline-box;
	vertical-align: top;
	display: inline-block;
	min-height: 13px;
	padding:0;
	vertical-align:top;
	width: 13px;
	margin: 4px 3px 3px 3px;	
}

div.z-tree-header tr.z-treecols th:last-child, 
div.z-tree div.z-tree-header tr.z-auxhead th:last-child {
	border-right: none;
}

div.z-tree-footer td.z-treefooter {
	color: ${Mesh_Foot_Color};
	padding: 2px 10px;
}

<%-- Treecol, Treefooter, and Treecell--%>
div.z-treecol-cnt {
	position: relative;
}
td.z-treecell {
	border: ${Mesh_Cell_Border};
	border-left-color: ${Mesh_Cell_Border_Left_Color};
}
div.z-tree-body .z-treecell-cnt {
	padding: ${Tree_Cell_Padding};
}
div.z-treefooter-cnt, div.z-treecell-cnt, div.z-treecol-cnt {
	border: 0; margin: 0; padding: 0;
	font-family: ${Mesh_FontFamily};
	font-size: ${Mesh_FontSize};
	font-weight: ${Mesh_FontWeight};
	color: ${Mesh_Color};
}
div.z-treefooter-cnt, div.z-treecol-cnt {
	overflow: hidden;
	cursor: default;
}
div.z-treecol-cnt, div.z-tree-header div.z-auxheader-cnt {
	font-weight: ${Mesh_Head_Content_FontWeight};
	padding: ${Mesh_Head_Content_Padding};
}
.z-word-wrap div.z-treecell-cnt, .z-word-wrap div.z-treefooter-cnt,
	.z-word-wrap div.z-treecol-cnt {
	word-wrap: break-word;
}
<%-- Checkbox and Radio --%>
.z-treerow-img-checkbox, .z-treerow-img-radio {
	margin: 0;
	width: 22px;
	height: 22px;
	${Mesh_Checkmark_Background};
	border: ${Mesh_Checkmark_Border};
	position: relative;
	top: 1px;
	background-position: 0 0 !important;
}
.z-treerow-img-radio {
	${t:borderRadius(Mesh_Checkmark_Radio_Border_Radius)};
}
.z-treerow-seld > td > .z-treecell-cnt > .z-treerow-img-checkbox {
	background-image: ${Mesh_Checkmark_Checkbox_Selected_Background};
}
.z-treerow:not(.z-treerow-disd) .z-treerow-img-checkbox:active {
	${Mesh_Checkmark_Checkbox_Active_Background};
	${Mesh_Checkmark_Checkbox_Active_Shadow};
}
.z-treerow-seld:not(.z-treerow-disd) > td > .z-treecell-cnt > .z-treerow-img-checkbox:active  {
	background-image: ${Mesh_Checkmark_Checkbox_Selected_Active_Background};
}

.z-treerow-seld > td > .z-treecell-cnt > .z-treerow-img-radio {
	${Mesh_Checkmark_Radio_Selected_Background};
	background-size: contain;
	background-position: 0 0;
}
.z-treerow-seld > td > .z-treecell-cnt > .z-treerow-img-radio:after {
	content:'';
	width: 0;
	height: 0;
	top: 6px;
	left: 6px;
	${t:borderRadius(Mesh_Checkmark_Radio_Border_Radius)};
	position: absolute;
	border: ${Mesh_Checkmark_Radio_After_Border};
}
.z-treerow:not(.z-treerow-disd) .z-treerow-img-radio:active {
	${Mesh_Checkmark_Radio_Active_Background};
	${Mesh_Checkmark_Radio_Active_Shadow};
}
.z-treerow-seld:not(.z-treerow-disd) > td > .z-treecell-cnt > .z-treerow-img-radio:active {
	${Mesh_Checkmark_Radio_Selected_Active_Background};
}