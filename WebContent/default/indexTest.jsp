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

<base href="<%=basePath%>">
<title>FilmBase | 首页测试</title>
</head>
<body>
   
   <a href="film/ticketInfo.do?id=20181089">mmmmmmm</a>
</body>
</html>