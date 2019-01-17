<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
  <head>
  <script src="static/js/jquery-1.4.2.js"></script>
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
  	<script type="text/javascript">
function userWallet(){
	var mv=prompt("请输入充值金额:");
	 if(mv!=null && !isNaN(mv)){
		 document.getElementsByName('addwallet')[0].value = mv;
		alert("充值成功！");
		 return true;
	 }else{
		 alert("充值失败！");
		 return false;
	 } 
}
</script>
  </head>
  <body>
  	<h1>用户管理</h1>
<!-- 首页最新热映 影片设置 -->
<!--   	<h4><a style="color:blue">最新热映 </a></h4>
 --><!-- 当前最新电影 -->
  	<table align="center" bordercolor="black" border="1" width="80%" cellspacing="0px" cellpadding="5px">
  	  <tr>
  	    <th>Id</th>
  	    <th>用户名</th>
  	    <th>昵称</th>
  	    <th>性别</th>
  	    <th>年龄</th>
  	    <th>联系方式</th>
  	    <th>影币</th>
  	    <th>邮箱</th>
  	    <th colspan="4">操作</th>
  	</tr>
  	<c:forEach items="${allUser}" var="user">
  	  <tr>
  	     <td class="td1">${user.id}</td>
  	     <td class="td1">${user.username}</td>
  	     <td class="td1">${user.nickname}</td>
  	     <td class="td1">${user.gender}</td>
  	     <td class="td1">${user.age}</td>
  	     <td class="td1">${user.tell}</td>
  	     <td class="td1">${user.wallet}</td>
  	     <td class="td1">${user.email}</td>
  	     <td class="td4"><a href="limitUser.do?id=${user.id}">
  	                  <c:if test="${user.status==0}">禁言</c:if>
  	                  <c:if test="${user.status==1}">已禁言</c:if>
  	                     </a></td> 
  	     <td class="td4"><a href="relieveUser.do?id=${user.id}">解禁</a></td> 
  	     <td class="td4">
  	     <form action="addWallet.do" method="post" onsubmit="return userWallet()">
  	                 <input type="hidden" name="oldwallet" value="${user.wallet}">
					 <input type="hidden" name="userid" value="${user.id}">
					 <input type="hidden" name="addwallet" value="0">
					 <input type="submit" id="go" value="充值">
		</form>
  	     <%-- <a href="addWallet.do?userid=${user.id}&wallet=${user.wallet}">充值</a> --%>
  	     
  	     </td> 
	     <td class="td4"><a href="deleteUser.do?id=${user.id}">删除</a></td> 
  	  </tr>
  	</c:forEach>
  	</table>
  </body>
</html>
