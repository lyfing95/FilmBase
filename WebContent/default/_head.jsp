 <%@ page language="java" import="java.util.*,com.lyf.filmbase.entity.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="static/css/bootstrap.min.css"/> 
<link rel="stylesheet" href="static/css/_head.css"/>
<script type="text/javascript"></script>
	<!-- 顶部 -->
	
	<div id="divhd">
		<div class="logol">
			<img src="static/img/bg/logo.png" alt="logo" width="87" height="85"/>
		</div>
		<h2>影视基地</h2>
        <div class="hdlogin">
		<%-- 获取用户登录信息显示在首页登录区
		<%      Session session = request.getSession(false);
	         if(session = null && session.getAttribute("username")=null){  %>
		        <a href="#">登录</a>|<a href="#">注册</a>
		<%}else{ %>
		         欢迎，<% request.getSession().getAttribute("nickname") %>
		<%}%> 
		--%>
		<c:if test="${loginUser != null }">   <%-- <c:if test="${not (empty sessionScope.loginUser)}" var="flag" scope="page"> --%>
		   <div class="headImg">
		       <c:if test="${loginUser.profilehead!= null}"> 
		     <img src="film/getFileImg.do?imgurl=${loginUser.profilehead}" alt="" width="45" height="45"> 
		      </c:if> 
		      <c:if test="${loginUser.profilehead== null}">
			 <img src="static/img/default_head.jpg" alt="" width="45" height="45">
			</c:if> 
		   </div>
		   <div class="dropdown">
		    <span id="getUserArea" value="">
		        <h4>&nbsp;&nbsp;&nbsp;${loginUser.nickname.trim()==""?loginUser.username:loginUser.nickname}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4>
		    </span>
		   <div class="dropdown-content">
		     <ul>
		        <p>个人中心<p>
		        <li><h5><a href="film/personalOrders.do">我的订单</a></h5></li>
		        <li><h5><a href="user/selectUserInfo.do">我的信息</a></h5></li>
		        <li><h5><a href="user/intoUserPsw.do">账号安全</a></h5></li>
		        <li><h5><a href='javascript:if(confirm("确定退出账号吗?")) location="user/logout.do"'>退出登录</a></h5></li>
		     </ul>
		    </div>
		    </div>
		    <!-- <button type="button" click="logout()">退出</button> -->
		    <!-- <div class="exit">
		    <h4 style="color:#F0F0F0">&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="user/logout.do" style="color:#C6C6C6">退出</a></h4>
		    </div> -->
		    </c:if>
		    
		   <c:if test="${loginUser == null }">   <%-- <c:if test="${!flag}> --%>
		    <div class="loginsub">
		      <a href="user/login.jsp" style="">登录</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			  <a href="user/regist.jsp" style="font-size:20px;font-family:STkaiti">注册</a>
			</div>
			</c:if>
		</div>
		<div class="hdmenu">
			<ul>
				<li><a href="default/index.jsp">首页</a></li>
				<li><a href="film/moviePage.do?currentPage=1&rows=10">热门影片</a></li>
				<li><a href="film/newsInfo.do?newsFlag=0">独家资讯</a></li>
				<li><a href="film/getAllCinema.do">影院</a></li>
				<li><a href="film/mark.jsp">排行榜</a></li>
				<!-- <li><a href="default/#movieRank">排行榜</a></li> -->
			</ul>
		</div>
		<div class="hdsearch">
		<form action="film/filmSearch.do" method="post">
		  <input type="text" name="searchText" id="name" value="" required placeholder="影视、资讯、影人、影院..."/> 
		  <input type="submit" name="searchBtn" value="搜索" />
	    </form>
		</div>
	</div>
	
