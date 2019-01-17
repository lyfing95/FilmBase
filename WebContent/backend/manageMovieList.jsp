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
		   width:120px;
		   height:120px;
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
  	<h1>影视管理</h1>
  	<span><a href="manageAddMovie.jsp">新增影片</a></span>
  	<hr>
  	<table align="center" bordercolor="black" border="1" width="90%" cellspacing="0px" cellpadding="5px">
  	<tr>
  		<th>影片图片</th>
  		<th>ID</th>
  		<th>名称</th>
		<th>时长</th>
		<th>单价</th>
		<th>影片简介</th>
		<th colspan="2">操作</th>
  	</tr>
  	<c:forEach items="${allMovie}" var="movie" >
  		<tr>
  			<td class="td1"><img width="120px" height="120px" src="../film/getFileImg.do?imgurl=${movie.imgurl}"/></td>
  			<td class="td2">${movie.id}</td>
  			<td class="td2">${movie.name }</td>
  			<td class="td2">${movie.duration}</td>
  			<td class="td2">${movie.price }</td>
  			<td class="td3">${movie.contents }</td>
  			<td class="td4"><a href="backendGetMovie.do?movieid=${movie.id }">更新</a></td> 
  			<td class="td4"><a href="backendMovieDel.do?movieid=${movie.id}">删除</a></td> 
  			
  		</tr>
  	</c:forEach>
  	</table>
  </body>
</html>
