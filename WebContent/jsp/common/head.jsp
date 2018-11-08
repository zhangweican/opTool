<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="lwy" uri="http://www.leweiyou.com/tags" %>

<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>

<title>Test</title>
	
<c:set var="cxt" value="${pageContext.request.contextPath}"></c:set>
<c:set var="cxt" value="${cxt eq '/' ? '' : cxt }" />
<c:set var="basePath" >${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${cxt}/</c:set>
<!-- 全局根目录定义js变量 -->
<script type="text/javascript">var cxt = '${cxt}';</script>

<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="${cxt}/plugins/assets/css/bootstrap.css" />
<link rel="stylesheet" href="${cxt}/plugins/assets/css/font-awesome.css" />

<!-- page specific plugin styles -->

<!-- text fonts -->
<link rel="stylesheet" href="${cxt}/plugins/assets/css/ace-fonts.css" />

<!-- ace styles -->
<link rel="stylesheet" href="${cxt}/plugins/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

<!--[if lte IE 9]>
	<link rel="stylesheet" href="${cxt}/plugins/assets/css/ace-part2.css" class="ace-main-stylesheet" />
<![endif]-->

<!--[if lte IE 9]>
  <link rel="stylesheet" href="${cxt}/plugins/assets/css/ace-ie.css" />
<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->
<script src="${cxt}/plugins/assets/js/ace-extra.js"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
<script src="${cxt}/plugins/assets/js/html5shiv.js"></script>
<script src="${cxt}/plugins/assets/js/respond.js"></script>
<![endif]-->

<!-- basic scripts -->

<!--[if !IE]> -->
<script type="text/javascript">
	window.jQuery || document.write("<script src='${cxt}/plugins/assets/js/jquery.js'>"+"<"+"/script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${cxt}/plugins/assets/js/jquery1x.js'>"+"<"+"/script>");
</script>
<![endif]-->
<script type="text/javascript">
	if('ontouchstart' in document.documentElement) document.write("<script src='${cxt}/plugins/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
</script>
<script src="${cxt}/plugins/assets/js/bootstrap.js"></script>

<!-- page specific plugin scripts -->

<!--[if lte IE 8]>
  <script src="${cxt}/plugins/assets/js/excanvas.js"></script>
<![endif]-->
<script src="${cxt}/plugins/assets/js/jquery-ui.custom.js"></script>
<script src="${cxt}/plugins/assets/js/jquery.ui.touch-punch.js"></script>
<script src="${cxt}/plugins/assets/js/jquery.easypiechart.js"></script>
<script src="${cxt}/plugins/assets/js/jquery.sparkline.js"></script>
<script src="${cxt}/plugins/assets/js/flot/jquery.flot.js"></script>
<script src="${cxt}/plugins/assets/js/flot/jquery.flot.pie.js"></script>
<script src="${cxt}/plugins/assets/js/flot/jquery.flot.resize.js"></script>

<!-- ace scripts -->
<script src="${cxt}/plugins/assets/js/ace/elements.scroller.js"></script>
<script src="${cxt}/plugins/assets/js/ace/elements.colorpicker.js"></script>
<script src="${cxt}/plugins/assets/js/ace/elements.fileinput.js"></script>
<script src="${cxt}/plugins/assets/js/ace/elements.typeahead.js"></script>
<script src="${cxt}/plugins/assets/js/ace/elements.wysiwyg.js"></script>
<script src="${cxt}/plugins/assets/js/ace/elements.spinner.js"></script>
<script src="${cxt}/plugins/assets/js/ace/elements.treeview.js"></script>
<script src="${cxt}/plugins/assets/js/ace/elements.wizard.js"></script>
<script src="${cxt}/plugins/assets/js/ace/elements.aside.js"></script>
<script src="${cxt}/plugins/assets/js/ace/ace.js"></script>
<script src="${cxt}/plugins/assets/js/ace/ace.ajax-content.js"></script>
<script src="${cxt}/plugins/assets/js/ace/ace.touch-drag.js"></script>
<script src="${cxt}/plugins/assets/js/ace/ace.sidebar.js"></script>
<script src="${cxt}/plugins/assets/js/ace/ace.sidebar-scroll-1.js"></script>
<script src="${cxt}/plugins/assets/js/ace/ace.submenu-hover.js"></script>
<script src="${cxt}/plugins/assets/js/ace/ace.widget-box.js"></script>
<script src="${cxt}/plugins/assets/js/ace/ace.settings.js"></script>
<script src="${cxt}/plugins/assets/js/ace/ace.settings-rtl.js"></script>
<script src="${cxt}/plugins/assets/js/ace/ace.settings-skin.js"></script>
<script src="${cxt}/plugins/assets/js/ace/ace.widget-on-reload.js"></script>
<script src="${cxt}/plugins/assets/js/ace/ace.searchbox-autocomplete.js"></script>
