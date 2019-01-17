<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>_left</title>
		<meta charset="utf-8"/>
		<style type="text/css">
			/* css样式 */
			body{
				background-color: #B7B2B2;
				font-family: "微软雅黑";
				font-size: 14px;
			}
			body,div{
				margin: 0px;
				padding:0px;
			}
			div#menu_bar{
				font-size: 20px;
				color:#FFFFFF;
			}
			div#menu_bar div{
				border-top: 1px solid #cccccc;
				padding: 5px 0;
				text-indent: 15px;
				letter-spacing: 3px;
			}
			div#menu_bar div:last-child{
				border-bottom: 1px solid #cccccc;
			}
			div#menu_bar div:hover{
				background-color: #797981;
			}
			div#menu_bar div a{
				font-size: 20px;
				color:#FFFFFF;
				text-decoration: none;
			}
		</style>
	</head>
	<body margin="0">
		<div id="menu_bar">
		
			<!-- <div><a href="manageAddMovie.jsp" target="rightFrame">> 新增影片</a></div> -->
			<!-- <div><a href="manageAddCinema.jsp" target="rightFrame">> 上线影院</a></div> -->
			<div><a href="backendIndexMovie.do" target="rightFrame">> 首页管理</a></div>
			<div><a href="backendGetAllMovie.do" target="rightFrame">> 影视管理</a></div>
			<div><a href="backendGetAllCinema.do" target="rightFrame">> 影院管理</a></div>
			<div><a href="backendGetAllUser.do" target="rightFrame">> 用户管理</a></div>
			<div><a href='javascript:if(confirm("确定注销账号吗？")) location="backendLogout.do"' target="rightFrame">><!-- <a href="backendLogout.do" target="rightFrame">> --> 注销账号</a></div>
			<!-- <div><a href="../default/index.jsp" target="_top">> 注销账号</a></div> -->
			<!-- <div><a href="#" >> 订单管理</a></div>
			<div><a href="#" >> 榜单</a></div> -->
		</div>		
	</body>
</html>
