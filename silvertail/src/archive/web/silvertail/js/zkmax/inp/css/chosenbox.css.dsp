<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>

.z-chosenbox {
	display:-moz-inline-box;
	display: inline-block;
	overflow: hidden;
	<c:if test="${zk.ie < 8}">
		zoom: 1;
		display: inline;
	</c:if>
	background-color: #FFFFFF;
	border: 1px solid #E6E6E6;
	border-top-color: #B2B2B2;
}
.z-chosenbox-focus {
	border: 1px solid #999999;
	border-top-color: #8D8D8D;
}
.z-chosenbox-sel-item {
	display: inline-block;
	vertical-align: middle;
	white-space: nowrap;
	<c:if test="${zk.ie < 8}">
		display: inline;
		zoom: 1;
	</c:if>
	border-radius: 3px;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	margin: 1px;
	background: #EEEEEE;
	border: 1px solid #B2B2B2;
	color: #333333;
	font-size: ${fontSizeM};
	font-family: ${fontFamilyC};
	font-style: normal;
	cursor: pointer;
}
.z-chosenbox-sel-item-cnt {
	display: inline-block;
	<c:if test="${zk.ie < 8}">
		display: inline;
	</c:if>
	float: left;
	padding: 0 1px 0 3px;
	height: 15px;
	font-size: ${fontSizeM};
	font-family: ${fontFamilyC};
}
.z-chosenbox-sel-item-focus {
	background: #DDDDDD;
	border-color: #8D8D8D;
}
.z-chosenbox-del-btn {
	display: inline-block;
	<c:if test="${zk.ie < 8}">
		display: inline;
		zoom: 1;
	</c:if>
	float: left;
	margin: 2px;
	margin-left: 1px;
	width: 11px;
	height: 11px;
	font-size: 1px;
	border-radius: 2px;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
}
.z-chosenbox-del-btn:hover {
	background: #8D8D8D;
}
.z-chosenbox-del-btn:hover .z-chosenbox-del-btn-icon {
	background-position: right center;
}
.z-chosenbox-del-btn-icon {
	height: 100%;
	background: url(${c:encodeURL('~./zkmax/img/inp/chosenbox-del-btn.png')}) 0 center no-repeat;
	<c:if test="${zk.ie < 8}">
		background-image: url(${c:encodeURL('~./zkmax/img/inp/chosenbox-del-btn.gif')});
	</c:if>
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
	<c:if test="${zk.ie < 8}">
		display: inline;
	</c:if>
	background: transparent !important;
	border: 0 !important;
	outline: 0;
	box-shadow: none;
	-moz-box-shadow: none;
	-webkit-box-shadow: none;
	
	padding: 2px;
	width: 30px;
	height: 15px;
	color: #333333;
	font-size: ${fontSizeM};
	font-family: ${fontFamilyC};
}
.z-chosenbox-txcnt {
	display: none;
	font-size: ${fontSizeM};
	font-family: ${fontFamilyC};
	white-space: nowrap;
}
.z-chosenbox-pp {
	position: absolute;
	background-color: #FFFFFF;
	border: 1px solid #888888;
	font-family: ${fontFamilyC};
	font-size: ${fontSizeM};
	font-weight: normal;
	margin: 0;
	overflow: auto;
	padding: 2px;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.35);
	-moz-box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.35);
	-webkit-box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.35);
	border-radius: 3px;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
}

.z-chosenbox-pp-hidden {
	display: none;
}
.z-chosenbox-option {
	cursor: pointer;
	padding: 1px 5px;
}
.z-chosenbox-option-over {
	background-color: #E1E1E1;
}
.z-chosenbox-empty {
	padding: 1px 5px;
	font-style: italic;
	color: #888888;
}
.z-chosenbox-empty-creatable {
	cursor: pointer;
	background-color: #D3EFFA;
	color: #333333;
}