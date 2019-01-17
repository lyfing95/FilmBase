<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FilmBase | 订单详情页面</title>
<style type="text/css">
  /* 确认订单 */
#ticketPage{
  width:1200px;
  height:550px;
  margin:180px auto 0;
  /* background-color:gray; */
}
.ticketKeep{
  width:1200px;
  height:80px;
  padding:30px 0 0 50px;
  border-radius:8px;
  font-size:18px;
  background-color:#D8D883;
}
table{
  margin-top:0px;
  text-align:center;
  font-size:18px;
  width:1200px;
  height:180px;
  box-shadow:0 0 8px #E3E3E3;
}
table .trHd{
  background-color:#D1D1A5;
}
.ticketConfirm{
  text-align:right;
  font-size:16px;
  margin-top:70px;
  width:1200px;
  height:150px;
  border-radius:8px;
  /* background-color:red; */
}
.backToSeat{
  margin:20px 0 0 750px;
}
.ticketConfirmSub{
  width:200px;
  height:45px;
  color:white;
  text-align:center;
  padding-top:10px;
  margin:20px 0 0 1000px;
  border-radius:20px;
  background-color:#ED3B31;
}
.ticketConfirmSub:hover{
  font-size:17px;
  background-color:red;
}
</style>
</head>
<body>
	<%@ include file="/default/_head.jsp"%>
<!-- 订单详情 -->
     <div id="ticketPage">
        <div class="ticketKeep">
            <a style="font-size:26px;color:red">订单详情</a> 
         </div>
        <table border="0">
          <tr><td colspan="4" style="font-size:15px;">订单编号： ${ordersDetails.id}</td></tr>
          <tr class="trHd">
            <td>影片</td>
            <td>语言</td>
            <td>观看时间</td>
            <td>影院</td>
            <td>影厅</td>
            <td>座位</td>
            <td>付款金额</td>
            <td>下单时间</td>
          </tr>
          <tr>
            <td>  ${ordersDetails.mname}  </td>
            <td>  ${ordersDetails.language}  </td>
            <td style="color:red"> ${ordersDetails.date}<br> ${ordersDetails.starttime}--${ordersDetails.endtime} </td>
            <td> ${ordersDetails.cname} </td>
            <td> ${ordersDetails.hall}  &nbsp;&nbsp;&nbsp;<br>
            <td>
                     
               <c:forEach items ="${ordersSeat}" var="seat">
                 ${seat.seatx}排${seat.seaty}座&nbsp;&nbsp;<br>
              </c:forEach>  
            </td>
            <td>${ordersDetails.payment}元（${ordersDetails.number}张）</td>
            <td><fmt:formatDate value="${ordersDetails.time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
          </tr>
        </table>
        <div class="ticketConfirm">
           <a href="user/personal.jsp" style="text-decoration:none"><div class="ticketConfirmSub">返回</div></a>
        </div>
      </div>
	<%@ include file="/default/_foot.jsp"%>
</body>
</html>