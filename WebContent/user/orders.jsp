<%@ page language="java" import="java.util.*,com.lyf.filmbase.entity.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<script src="static/js/jquery-1.4.2.js"></script>
<title>FilmBase | 订单</title>
<style type="text/css">
body{
	font-family: "微软雅黑";
}
form{
	width: 850px;
	height:550px;
	margin:0 0 0 25px;
	/* background-color:yellow; */  
}
h4{
	width: 300px;
	color: #990000;
    margin: 20px 0 0 30px; 
}
table{
   margin-top:20px;
   margin-left:0px;
   width:860px;
   text-align:center;
   
}
tr{
   border:0px;
}
td{
   height:36px;
   border:1px solid #D3D3C9;
}
.td1{
   text-align:left;
   padding-left:10px;
}
input[name="refund"]{
   height:24px;
   width:80px;
   border:0px;
   border-radius:5px;
   color:white;
   background-color:#E21918;
}
input[name="refund"]:hover{
   background-color:#D67434;
}
</style>
</head>
<body>
  <form>
   <h4>订单管理</h4><hr>
  <table class="ordtab" border="1" cellspacing="0" frame=void>
        <tr>
          <td width="320">订单信息</td>
          <td>数量</td><!-- 单价/ -->
          <td>实付款</td>
          <td>状态</td>
          <td>操作</td>
        </tr>
        <!-- <tr>
          <td class="td1">影院：xxxxxxxxxxxxxxxxxxxx<br>下单时间：</td>
           <td>￥<br>张</td>
          <td>￥</td>
          <td>未支付</td>
          <td><a href="user/ticketPay.jsp"><input type="submit" name="refund" value="去支付"/></a></td>
        </tr> -->
        <c:forEach items="${allOrders}" var="allOrders">
        <tr>
          <td class="td1"> 影院：  ${allOrders.cname} <br>    
                                                          下单时间： <fmt:formatDate value="${allOrders.time}" pattern="yyy-MM-dd HH:mm:ss"/>
          </td>
          <td>￥  ${allOrders.wprice}<br> ${allOrders.number}张</td>
          <td>￥${allOrders.payment}</td>
          <td>订票成功</td>
          <td><input type="hidden" name="getOrdersId" value="${allOrders.id}">
             <input type="button" name="refund" value="查看" onclick="toFunction()"/>
               
          </td>
        </tr>
        </c:forEach>
     </table>
   </form> 
   <script type="text/javascript">
         function toFunction(){
        	 var ordersid =$("input[name='getOrdersId']").val(); 
        	 parent.location.href="film/ticketInfo.do?id="+ordersid; 
         }
   </script> 
</body>
</html>