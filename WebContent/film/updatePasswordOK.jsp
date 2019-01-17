<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<base href="<%=basePath%>">
<title>跳转中转页面</title>
<head>
<script type="text/javascript">
		 onload=function(){
			 parent.location.href='film/ticketInfo.jsp'
		/* 	setInterval(go, 1000);
		};
		var x=0; //利用了全局变量来执行
		function go(){
		    x--;
			if(x>0){
			document.getElementById("sp").innerHTML=x;  //每次设置的x的值都不一样了。
			}else{
			parent.location.href='film/ticketInfo.jsp'
			} */
		} 
</script>
<body>
xxxxx
<h1  style="text-align:center">
<span style="color:red;">修改成功,<span id="sp" >3</span>秒后请重新登录</span>
</h1>
</body>
</html>