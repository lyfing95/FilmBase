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
  	<h1>排片管理</h1>
  	<a style="color:blue">北京翰林影院 </a> 
  	<hr>
  	<table align="center" bordercolor="black" border="1" width="90%" cellspacing="0px" cellpadding="5px">
  	<tr>
  		<th>电影名称</th>
  		<th>开始时间</th>
  		<th>结束时间</th>
		<th>语言</th>
		<th>影厅</th>
		<th>价格</th>
		<th colspan="3">操作</th>
	</tr>
	<tr>
  			<td class="td1"><input type="text" name="name" value="理查"></td>
  			<td class="td2"><input type="text" name="name" value="12.00"></td>
  			<td class="td2"><input type="text" name="name" value="14.00"></td>
  			<td class="td2"><input type="text" name="name" value="3d"></td>
  			<td class="td2"><input type="text" name="name" value="2t"></td>
  			<td class="td2"><input type="text" name="name" value="65"></td>
  			<td class="td4"><a href="#">上线</a></td> 
  			<td class="td4"><a href="">删除</a></td> 
  		</tr>
	 <tr>
	    <td colspan="8"><button>新增</button></td>
	 </tr>
	
  	<%-- <c:forEach items="${allCinema}" var="cinema" >
  		<tr>
  			<td class="td1"><img width="120px" height="120px" src="../film/getFileImg.do?imgurl=${cinema.imgurl}"/></td>
  			<td class="td2">${cinema.id}</td>
  			<td class="td2">${cinema.name }</td>
  			<td class="td2">${cinema.address}</td>
  			<td class="td2">${cinema.tell }</td>
  			<td class="td4"><a href="#">上线</a></td> 
  			<td class="td4"><a href="">删除</a></td> 
  		</tr>
  	</c:forEach> --%>
  	</table>
  </body>
</html>
