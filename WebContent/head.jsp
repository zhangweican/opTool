<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="lwy" uri="http://www.leweiyou.com/tags" %>

<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<!--<meta http-equiv="Cache-Control" content="no-store"/> -->
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate"/>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="expires" content="0"/> 

	
<c:set var="cxt" value="${pageContext.request.contextPath}"></c:set>
<c:set var="cxt" value="${cxt eq '/' ? '' : cxt }" />
<c:set var="basePath" >${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${cxt}/</c:set>
<c:set var="httpBasePath" >${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}</c:set>
<!-- 全局根目录定义js变量 -->
<script type="text/javascript">var cxt = '${cxt}';</script>
