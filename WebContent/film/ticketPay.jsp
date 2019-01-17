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
<!-- <script src="static/js/orderTime.js"></script> -->
<title>FilmBase | 支付页面</title>
<style type="text/css">
  /* 支付 */
#payPage{
  width:1200px;
  height:540px;
  margin:180px auto 0;
  /* background-color:gray; */ 
}
.payKeep{
  width:1200px;
  height:80px;
  padding:20px 0 0 50px;
  border-radius:8px;
  font-size:18px;
  background-color:#E3E3E3;
}
table{
  margin-top:0px;
  font-size:18px;
  width:1200px;
  height:350px;
  box-shadow:0 0 20px #D6D66F;
  background-color:#E3E3E3;
}
.td1{
  padding-left:20px;
  height:50px;
}
.td2{
  padding-left:20px;
  height:50px;
  background-color:#D1D1A5;
}
.td3{
  padding:0 0 50px 50px;
  height:120px;
}
.td4{
 text-align:right;
 padding:0 35px 0 0;
 height:70px;
}
.td5{
 text-align:right;
 padding-right:35px;
 padding-bottom:50px;
 height:120px;
} 
input[name="paySub"]{
  margin-top:0px;
  border:0px;
  width:130px;
  height:45px;
  color:white;
  text-align:center;
  padding-top:5px;
  /* margin-left:1060px; */
  border-radius:20px;
  background-color:#F79706;
}
input[name="paySub"]:hover{
  font-size:17px;
  background-color:red;
}
</style>
<!-- <script type="text/javascript">
   $(function(){
	   var pay = ${loginUser.wallet} - ${orders.payment};
	   if(pay<0){
	   alert("账户余额不足！");
	   }else{
		   return pay;
	   }
   });
</script> -->
</head>
<body>
	<%@ include file="/default/_head.jsp"%>
<!-- 确认订单  -->
     <div id="payPage">
        <div class="payKeep">
                          请在 <span class="orderM" style="font-size:26px;color:red">15</span>分钟<a class="orderS"style="font-size:26px;color:red">00</a>秒 内完成支付, 超时订单会自动取消
        </div>
        <table border="0">
          <tr><td class="td1" colspan="4" style="font-size:15px;">订单编号:${ordersInfo.id}</td></tr>
          <tr>
            <td class="td2">选择支付工具：</td>
          </tr>
          <tr>
            <td  class="td3"><input type="radio" id="checkPay" name="choosePay" value="">&nbsp;&nbsp;影币支付</td>
         </tr>
         <tr>
            <td  class="td4">应付金额：<a style="font-size:23px;color:red">￥<a style="font-size:38px;color:red">${ordersInfo.payment}</a><br/></td>
         </tr>
         <tr>
            <td  class="td5">
	           <a href="film/ticketConfirm.jsp" style="text-decoration:none">返回查看&nbsp;&nbsp;&nbsp;&nbsp;</a>
	           <a href="film/pay.do?payment=${ordersInfo.payment}&wallet=${loginUser.wallet}&ordersid=${ordersInfo.id}" style="text-decoration:none">
	                <input type="button" onclick="return checkPay()" name="paySub" value="付款"></a>
            </td>
         </tr>
       </table>
     </div>
	<%@ include file="/default/_foot.jsp"%>
</body>
<script type="text/javascript">
 function checkPay(){
	 var obj2=document.getElementsByName("choosePay");
	 for(var i=0;i<obj2.length;i++){ 
		 if(obj2[i].checked==true){ 
			 temp=1; 
			 break; 
			 }else{ 
		     temp=0; 
			 } 
		 } 
	 if(temp==0){
		 alert("请选择支付方式");
	    return false;
	 }
	 var wallet = ${loginUser.wallet};
	 var payment = ${ordersInfo.payment};
	 var pay = wallet - payment;
	 /* parseInt(wallet)-parseInt(payment) */
	 if(pay<0){
		 alert("您的余额不足！");
		 return false;
	 }
}
var setTimer = null;
var chazhi = 0;
//差值计算
//例子(模拟)
chazhi = 900000; 
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
 /* var orderStatus = alert("付款时间已过，请重新下单~");
   window.location.href="film/orderFail.do?id=${ordersInfo.id}"; */
  
  
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