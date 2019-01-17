<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- seat-style -->
<link rel="stylesheet" href="static/css/seat_jquery.seat-charts.css">
<link rel="stylesheet" href="static/css/seat_style.css">
<script src="static/js/seat_jquery-1.11.0.min.js"></script>
<script src="static/js/seat_jquery.nicescroll.js"></script>
<script src="static/js/seat_jquery.seat-charts.js"></script>
<script src="static/js/seat_scripts.js"></script>
<script src="static/js/seat_jquery.seat-charts.min.js"></script>
<script src="static/js/json2.js"></script>
<script src="static/js/jquery-1.4.2.js"></script>
<title>FilmBase | 影院页面</title>
<style type="text/css">
/* 影片信息头部 */
#moviehd {
	width: 1903px;
	height: 150px;
	background-color: #523C73;
}
.cinemaMsg{
    margin:0 auto;
    margin-top:100px;
    padding-top:20px;
    width:1200px;
    height:150px;
    color:white;
    /* background-color: red; */
}
.cinemaMsg h3{
    
}
  /* 选座 */

</style>
</head>
<body>
	<%@ include file="/default/_head.jsp"%>
	<div id="moviehd">
		<div class="cinemaMsg">
					<h3>${cinema.name }</h3><hr>
					<p>${cinema.address }     &nbsp;&nbsp;&nbsp;&nbsp;电话：${cinema.tell }</p>
					<c:forEach items="${selectedSeat}" var="seat">
					   <span>"${seat.seatx}_</span>
					   <span>${seat.seaty}"</span>  ^^
					   <input type="hidden" name="selectedSeatx" value="${seat.seatx}">
					   <input type="hidden" name="selectedSeaty" value="${seat.seaty}">
					</c:forEach>
					<input type="hidden" id="seatAll">
		</div>
	</div>
  
  <!-- 选座  -->
    <!-- <div class="content"> -->
     <div class="seatChoose">
	  <h3 style="color: #339BD5;font-family:STZhongsong;">座位预定</h3><hr>
	<div class="main">
		<h3>${watchplan.hall}</h3>
		<div class="demo">
			<div id="seat-map">
				<div class="front">屏幕</div>					
			</div>
			<div class="booking-details">
				<ul class="book-left">
					<li>影片 </li>
					<li>影厅 </li>
					<li>版本 </li>
					<li>场次 </li>
					<li>票价</li><hr>
				</ul>
				<ul class="book-right">
					<li>: ${movie.name}</li>
					<li>: ${watchplan.hall}</li>
					<li>: ${watchplan.language}</li>
					<li style="color:red">: ${watchplan.date}, ${watchplan.starttime}</li>
					<li>: ￥${watchplan.price}/张</li><hr>
				</ul>
				<ul class="book-left">
				  <li>座位 :&nbsp;&nbsp;&nbsp;<a style="color:red;font-size:12px">(一次最多购买4张票)</a></li>
				</ul>
				<div class="clear"></div>
				<ul id="selected-seats" class="scrollbar scrollbar1"></ul>
				<div id="legend"></div><hr>
				<ul class="book-left">
				  <li>票数 :</li>
				  <li>总价</li>
				</ul>
				<ul class="book-right">
				  <li>: <span id="counter" name="count">0</span></li>
				  <li style="color:red">: <b><i>¥</i>
				  <span id="total">0</span> 
				  </b></li>
				</ul>
				  <c:if test="${loginUser != null}">
				      <button class="checkout-button" onclick="submitTo()">确认选座</button>       
				  </c:if>
				  <c:if test="${loginUser == null}">
				     <a href='javascript:if(confirm("请先登录后再来购票哦")) location="user/login.jsp"'><button class="checkout-button">确认选座</button></a>
				  </c:if> 
				    <a href="film/cinemaPlan.jsp" style="text-decoration:none">返回重新选择</a>
			</div>
		   <div style="clear:both"></div>
	    </div>
            <!-- !!格式不能乱 -->
			<script type="text/javascript">
			//设置属性
				    var price = ${watchplan.price};  //设置价格
				$(document).ready(function() {
					var $cart = $('#selected-seats'), //所选座位
					    $counter = $('#counter'),  //票数
					    $total = $('#total');   //总价
					    $seatx = $('#seatx'),
						$seaty = $('#seaty'); 
					var sc = $('#seat-map').seatCharts({  //座位图
						map: [  
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa'
						],
						naming : {
							top : false,
							getLabel : function (character, row, column) {
								return column;
							}
						},
						 //设置座位状态
						legend : { 
							node : $('#legend'),
							items : [
								[ 'a', 'available',   '可选' ],
								[ 'a', 'unavailable', '已售'],
								[ 'a', 'selected', '选中']
							]					
						},
						
		       //实现选座
						click: function () {   
							if (this.status() == 'available') { 
								 $('<li>'+(this.settings.row+1)+'排 '+this.settings.label+'座_</li>')  
									.attr('id', 'cart-item-'+this.settings.id)
									.data('seatId', this.settings.id)
									.appendTo($cart); 
								$counter.text(sc.find('selected').length+1);
								$total.text(recalculateTotal(sc)+price);
								$seatx.text(this.settings.row+1);
								$seaty.text(this.settings.label);
								return 'selected';
							} else if (this.status() == 'selected') { 
									//撤选后更新座位数
									$counter.text(sc.find('selected').length-1);
									//撤选后更新总价
									$total.text(recalculateTotal(sc)-price);
									//撤选后删除已选状态
									$('#cart-item-'+this.settings.id).remove();
									//返回可选状态
									return 'available';
							} else if (this.status() == 'unavailable') { //已售
								return 'unavailable';
							} else {
								return this.style();
							}
						}
					});
				//已售座位
				        
					      var selectedList = new Array();
					      var selectedList2 = new Array();
					      selectedList = '<%=session.getAttribute("selectedSeat")%>'; 
					      
					       var selectedList2 = selectedList.replace(/\./g,'"');
					       var selectedList3 = selectedList2.replace(/\[|]/g,'');
					       /* sc.get("['"+selectedList3+"]'").status('unavailable'); */ 
					           sc.get(["1_2","4_4"]).status('unavailable');    
				});   
					      
					       /* var node = document.getElementById("seatAll");
					       node.value = selectedList2;
					       var selectedList3 = document.getElementById("seatAll").value;
					       alert(selectedList3); */
					       /* while(selectedList.indexOf('.')>=0){
					    	   selectedList = selectedList.replace(".","'");
					       } */
					        
					         /* for(var i=0;i<selectedList.length;i++){
					    	    seatx=selectedList[i];
					    	    alert(seatx);
					    	} */  
					    /* var selectedList2 = new Object(); */
					   /* alert(JSON.stringify(selectedList2));
					   
				      sc.get(JSON.stringify(selectedList2)).status('unavailable'); */
				      /* alert(sc1);
				     sc1; */
					/* sc.get(["5_10", "6_10", "10_8", "10_7", "9_10"]).status('unavailable'); */
				
				     
				
				//总价
				function recalculateTotal(sc) {
					var total = 0;
					sc.find('selected').each(function () {
						total += price;
					});
					return total;
				}
				
				function submitTo(){
					var total = document.getElementById("total").innerText; 
					var count = document.getElementById("counter").innerText;
					var cart = document.getElementById("selected-seats").innerText;
					var seats = cart.replace(/[^0-9]/ig,"_");
					var userid = ${loginUser.id };
					var watchid = ${watchplan.id};
				    $.ajax({
						async:"false",
						url:"film/seatChoose.do",
						type:"get",
						data:{"total":total,"count":count,"seats":seats,"userid":userid,"watchid":watchid},
						dataType:"text",
						success:function(data){
						    var thisOrdersid ;
							location.href='film/ticketConfirm.do?seatid=${loginUser.id}';  
							/* if(data != ""){
							    location.href='film/ticketConfirm.jsp'; 
							}else{
								alert("请选择座位号！");
							} */
						},
						error:function(){
							alert("请重新选择座位号！");
						} 
					});  
				}
				function seat(cart){
					$.each([],function(cart){
				    	document.write("unavailable+','");
				    })
				}
			</script>
	</div>
	</div>

	<%@ include file="/default/_foot.jsp"%>
</body>
</html>