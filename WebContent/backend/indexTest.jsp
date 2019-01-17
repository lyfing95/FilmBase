<%@ page language="java" import="java.util.*,com.lyf.filmbase.entity.*"
	pageEncoding="UTF-8"%>
<%-- <jsp:forward page="film/indexMovie.do"/> --%>
<%-- <%
 response.sendRedirect(request.getContextPath()+"/film/indexMovie.do");
%> --%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="static/js/jquery-1.4.2.js"></script>
<base href="<%=basePath%>">
<title>FilmBase | 首页测试</title>

</head>
<body onload="load()"><button onclick="test()">xxx</button>
</body>
<script type="text/javascript">
function load(){
	  parent.location.href="default/index.jsp";
   }
 </script>
</html>