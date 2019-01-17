<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
  <head>
  	<style type="text/css">
  		body{
  			text-align: center;
  		}
		table {
			text-align: center;
		}
		th{
			background-color: #467CC6;
			color:white;
		}
		.td1{
		   
		}
		.td2{
		
		}
		.td3{
		
		}
		.td4{
		
		}
		input[id="go"]{
		   width:75px;
		   height:30px;
		   background-color:#4388F0;
		   color:white;
		   border-radius:5px;
         }
  	</style>
  </head>
  <body>
  	<h1>首页管理</h1>
<!-- 首页最新热映 影片设置 -->
  	<h4><a style="color:blue">最新热映 </a></h4>
<!-- 当前最新电影 -->
  	<table align="center" bordercolor="black" border="1" width="80%" cellspacing="0px" cellpadding="5px">
  	  <tr>
  	    <th>当前最新电影</th>
  	    <th colspan="1">操作</th>
  	</tr>
  	<c:forEach items="${newestMovie}" var="movie">
  	  <tr>
  	     <td class="td1">${movie.name}</td>
	     <td class="td4"><a href="backendIndexMovieDel.do?movieid=${movie.id}">删除</a></td> 
  	  </tr>
  	</c:forEach>
  	</table>
<!-- 更新最新电影 -->
<form action="backendUpdateIndexNewest.do" method="post">
    <table align="center" bordercolor="black" border="1" width="30%" cellspacing="0px" cellpadding="5px" style="margin-top:70px;margin-bottom:40px;">
  	<tr>
  	    <th>更新最新电影</th> 
  		<th colspan="1">操作</th>
  	</tr><%-- ${backendUpdateMsg} --%>
  	<tr>
	       <td class="td1">
	          <select name="selectMovie">
              <c:forEach items="${allMovie}" var="movie" >
				<option value="${movie.id }">${movie.name }</option>
			  </c:forEach>
				</select>
		  </td>
		    <td class="td4"><input id="go" type="submit" value="确定"></td> 
	</tr>
  	</table>
  	<span style="color:red">${backendUpdateMsg}</span>
</form>  	
  	
<!-- 首页热门影片设置 -->
  	<hr><h4><a style="color:blue;top:50px;">热门影片 </a></h4>
<!-- 当前热门电影 -->
  	<table align="center" bordercolor="black" border="1" width="80%" cellspacing="0px" cellpadding="5px">
  	<tr>
  		<th>当前热门电影</th>
  		<th colspan="1">操作</th>
  	</tr>
	<c:forEach items="${hotMovie}" var="movie">
	<tr>
	       <td class="td1">${movie.name}</td>
	       <td class="td4"><a href="backendIndexMovieDel.do?movieid=${movie.id}">删除</a></td> 
	</tr>
	</c:forEach>
  	</table>
<!-- 更新热门电影 -->
<form action="backendUpdateIndexHot.do" method="post">
  	<table align="center" bordercolor="black" border="1" width="30%" cellspacing="0px" cellpadding="5px" style="margin-top:70px;margin-bottom:40px;">
  	<tr>
  	    <th>更新热门电影</th>
  		<th colspan="1">操作</th>
  	</tr>
  	
	<tr>
	       <td class="td1">
	           <select name="selectMovie">
              <c:forEach items="${allMovie}" var="movie">
				<option value="${movie.id}">${movie.name }</option>
			  </c:forEach>
				</select>
		  </td>
		    <td class="td4"><input id="go" type="submit" value="确定"></td> 
  	</tr>
  	</table>
  	<span style="color:red">${backendUpdateMsg}</span>
</form> 	
  	
<!-- 首页影视资讯编辑 -->
  	<hr><h4><a style="color:blue">影视资讯 </a></h4>
<!-- 当前资讯 -->
  	<table align="center" bordercolor="black" border="1" width="80%" cellspacing="0px" cellpadding="5px">
  	<tr>
  		<th>当前资讯</th>
  		<th>作者</th>
  		<th colspan="1">操作</th>
  		
	</tr>
	<c:forEach items = "${newsList}" var="news">
	<tr>
	      <td class="td1">${news.head}</td>
	      <td class="td1">${news.author}</td>
		  <td class="td4"><a href="deleteNews.do?id=${news.id}">删除</a></td> 
  	</tr>
  	</c:forEach>	
  	<!-- <tr>
  	  <td colspan="4"><a href="#">新增</a></td>
  	</tr> -->
  	</table>
<!-- 更新资讯 -->
    <form action="insertNews.do" method="post">
  	<table align="center" bordercolor="black" border="1" width="50%" cellspacing="0px" cellpadding="5px" style="margin-top:70px;margin-bottom:40px;">
  	<tr>
  	    <th>更新资讯</th>
  		<th colspan="1">操作</th>
  	</tr>
  	
	<tr>
	       <td class="td1">
	       <form action="" method="post">
	           新闻标题： <input type="text" name="head">
	                   作者：<input type="text" name="author"><br>
  			 内容：  <textarea name="contents" rows="10" cols="80"></textarea><br>
  			编辑时间:&nbsp;&nbsp;&nbsp;<span id="clock"></span>
		  </form>
		  </td>
		    <td class="td4"><input id="go" type="submit" value="发表"></td> 
  	</tr>
  	</table>
  	</form>
  </body>
  
<script type="text/javascript">
function realSysTime(clock){
var now=new Date(); //创建Date对象
var year=now.getFullYear(); //获取年份
var month=now.getMonth(); //获取月份
var date=now.getDate(); //获取日期
var day=now.getDay(); //获取星期
var hour=now.getHours(); //获取小时
var minu=now.getMinutes(); //获取分钟
var sec=now.getSeconds(); //获取秒钟
month=month+1;
var arr_week=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
var week=arr_week[day]; //获取中文的星期
var time=year+"年"+month+"月"+date+"日 "+week+" "+hour+":"+minu+":"+sec; //组合系统时间
clock.innerHTML=time; //显示系统时间
}
window.onload=function(){
window.setInterval("realSysTime(clock)",1000); //实时获取并显示系统时间
}
</script> 
</html>
