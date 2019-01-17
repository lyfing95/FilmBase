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
  	<!-- <script type="text/javascript" src="static/js/jquery-1.4.2.js"></script>
  	<script type="text/javascript">
  	   function changeNum(inp,pid){
			var pnum=inp.value;
			// 发送一个AJAX请求给服务器，修改商品数量
			var url="${app}/ManageUpdatePnumServlet";
			var data={"pid":pid,"pnum":pnum};
			$.post(url,data,function(result){
				alert(result);
			});
		} -->
  	
  	</script>
  </head>
  <body>
  	<h1>影院管理</h1>
  	<a href="manageAddCinema.jsp">上线影院</a>
  	<hr>
  	<table align="center" bordercolor="black" border="1" width="90%" cellspacing="0px" cellpadding="5px">
  	<tr>
  		<th>影院图片</th>
  		<th>ID</th>
  		<th>名称</th>
		<th>地址</th>
		<th>联系方式</th>
		<th colspan="2">操作</th>
	</tr>
  	<c:forEach items="${allCinema}" var="cinema" >
  		<tr>
  			<td class="td1"><img width="120px" height="120px" src="../film/getFileImg.do?imgurl=${cinema.imgurl}"/></td>
  			<td class="td2">${cinema.id}</td>
  			<td class="td2">${cinema.name }</td>
  			<td class="td2">${cinema.address}</td>
  			<td class="td2">${cinema.tell }</td>
  			<td class="td4"><a href="backendGetCinema.do?cinemaid=${cinema.id}">更新</a></td>
  			 <!-- <td class="td4"><a href="manageCinemaPlan.jsp"><button style="background-color:#B4CDE6" onclick="plan()">排片</button> --><!-- </a> --></td>
  			<td class="td4"><a href="backendCinemaDel.do?cinemaid=${cinema.id}">删除</a></td> 
  		</tr>
  	</c:forEach>
  	</table>
  </body>
  <script type="text/javascript">
    function plan(){
    	alert("请联系影院上传最新排片计划...");
    }
  </script>
</html>
