<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="static/js/jquery-1.4.2.js"></script>
<title>FilmBase | 订单确认页面</title>
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
  height:130px;
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
<!-- 确认订单  -->
     <div id="ticketPage">
        <div class="ticketKeep">
                          请在<span class="orderM" style="font-size:26px;color:red">15</span> 分钟<span class="orderS" style="font-size:26px;color:red">59</span>秒内完成订单确认<br/>
            <a style="color:#339BD5">超时订单会自动取消，如遇支付问题，请联系客服：18235445172</a>
        </div>
        <table border="0">
          <tr><td colspan="4" style="font-size:15px;"><a style="color:red">注意</a>：请仔细核对场次信息，出票后将<a style="color:#FAAF00">无法退票和改签</a></td></tr>
          <tr class="trHd">
            <td>影片</td>
            <td>时间</td>
            <td>影院</td>
            <td>座位</td>
          </tr>
          <tr>
            <td>${movie.name}</td>
            <td style="color:red">${watchplan.date} ${watchplan.starttime}</td>
            <td>${cinema.name}</td>
            <td>${watchplan.hall} &nbsp;&nbsp;&nbsp;
              <c:forEach items ="${seatList}" var="seat">
                 ${seat.seatx}排${seat.seaty}座&nbsp;&nbsp;
              </c:forEach> 
            </td>
          </tr>
        </table>
        <div class="ticketConfirm">
                        ${ordersInfo.id}实际支付：<a style="font-size:23px;color:red">￥<a style="font-size:38px;color:red">${ordersInfo.payment}</a><br/>
           <div class="backToSeat"><a href="film/seatChoose.jsp" style="text-decoration:none">返回重新选座</a></div>
           <a href="film/ticketPay.jsp" style="text-decoration:none"><div class="ticketConfirmSub">确认订单</div></a>
        </div>
      </div>
	<%@ include file="/default/_foot.jsp"%>
</body>
<script type="text/javascript">
var setTimer = null;
var chazhi = 0;
//差值计算
//例子(模拟)
/*chazhi = 900000;*/
chazhi = 10000;
//真实时间(注意月份需减掉1，否则时间会计算错误)
//chazhi = (new Date(year,month-1,day,hour,minute,second)) - (new Date()); //计算剩余的毫秒数
//chazhi = (new Date(2018,8-1,6,6,6,6)) - (new Date());
/* chazhi = 0 * 86400000;*/
//执行函数部分
countFunc(chazhi);
setTimer = setInterval(function() {
chazhi = chazhi - 1000;
countFunc(chazhi);
}, 1000);
function countFunc(leftTime) {
if(leftTime >= 0) {
 var days = parseInt(leftTime / 1000 / 60 / 60 / 24, 10); //计算剩余的天数 
 var hours = parseInt(leftTime / 1000 / 60 / 60 % 24, 10); //计算剩余的小时 
var minutes = parseInt(leftTime / 1000 / 60 % 60, 10); //计算剩余的分钟 
 var seconds = parseInt(leftTime / 1000 % 60, 10); //计算剩余的秒数 
 days = checkTime(days);
 hours = checkTime(hours);
 minutes = checkTime(minutes);
 seconds = checkTime(seconds);
 $(".orderD").html(days);
 $(".orderH").html(hours);
 $(".orderM").html(minutes);
 $(".orderS").html(seconds);
} else {
 clearInterval(setTimer);
 $(".orderD").html("00");
 $(".orderH").html("00");
 $(".orderM").html("00");
 $(".orderS").html("00");
 var orderStatus = alert("订单确认时间已过，请重新下单~");
   window.location.href="film/orderFail.do?id=${ordersInfo.id}";
  
  
}
}
function checkTime(i) { //将0-9的数字前面加上0，例1变为01 
if(i < 10) {
 i = "0" + i;
}
return i;
}
</script>
</html>