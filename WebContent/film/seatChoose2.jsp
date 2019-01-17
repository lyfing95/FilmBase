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
<!-- seat-style -->
<link rel="stylesheet" href="static/css/seat_jquery.seat-charts.css">
<link rel="stylesheet" href="static/css/seat_style.css">
<script src="static/js/seat_jquery-1.11.0.min.js"></script>
<script src="static/js/seat_jquery.nicescroll.js"></script>
<script src="static/js/seat_jquery.seat-charts.js"></script>
<script src="static/js/seat_scripts.js"></script>
<script src="static/js/seat_jquery.seat-charts.min.js"></script>

<title>FilmBase | 影院页面</title>
<style type="text/css">
/* 影片信息头部 */
#moviehd {
	width: 1903px;
	height: 150px;
	background-color: #523C73;
}

.cinemaMsg {
	margin: 0 auto;
	margin-top: 100px;
	padding-top: 20px;
	width: 1200px;
	height: 150px;
	color: white;
	/* background-color: red; */
}

.cinemaMsg h3 {
	
}
/* 选座 */
</style>
</head>
<body>
	<%@ include file="/default/_head.jsp"%>
	<div id="moviehd">
		<div class="cinemaMsg">
			<h3>${cinema.name }</h3>
			<hr>
			<p>${cinema.address }&nbsp;&nbsp;&nbsp;&nbsp;电话：${cinema.tell }</p>
		</div>
	</div>

	<!-- 选座  -->
	<!-- <div class="content"> -->
	<div class="seatChoose">
		<h3 style="color: #339BD5; font-family: STZhongsong;">座位预定</h3>
		<hr>
		<div class="main">
			<h3>${watchplan.hall}</h3>
			<div class="demo">
				<div id="seat-map">
					<div class="front">屏幕</div>
				</div>
				<div class="booking-details">
					<ul class="book-left">
						<li>影片</li>
						<li>影厅</li>
						<li>版本</li>
						<li>场次</li>
						<li>票价</li>
						<hr>
					</ul>
					<ul class="book-right">
						<li>: ${movie.name}</li>
						<li>: ${watchplan.hall}</li>
						<li>: ${watchplan.language}</li>
						<li style="color: red">: ${watchplan.date},
							${watchplan.starttime}</li>
						<li>: ￥${watchplan.price}/张</li>
						<hr>
					</ul>
					<ul class="book-left">
						<li>座位 :&nbsp;&nbsp;&nbsp;<a
							style="color: red; font-size: 12px">(一次最多购买4张票)</a></li>
					</ul>
					<div class="clear"></div>
					<ul id="selected-seats" class="scrollbar scrollbar1" name="cart"></ul>
					<div id="legend"></div> 
					<hr>
					<ul class="book-left">
						<li>票数 :</li>
						<li>总价</li>
					</ul>
					<ul class="book-right">
						<li>: <span id="counter" name="count">0</span></li>
						<li style="color: red">: <b><i>¥</i><span id="total"
								name="total">0</span></b></li>
					</ul>
					<c:if test="${loginUser != null}">
						<a href="film/seatChoose.do" style="text-decoration: none"><button
								class="checkout-button">确认选座</button></a>
					</c:if>
					<c:if test="${loginUser == null}">
						<a
							href='javascript:if(confirm("请先登录后再来购票哦")) location="user/login.jsp"'><button
								class="checkout-button">确认选座</button></a>
					</c:if>
					<a href="film/cinemaPlan.jsp" style="text-decoration: none">返回重新选择</a>
				</div>
				<div style="clear: both"></div>
			</div>

			<script type="text/javascript">
				/* 设置属性 */
				var price = $
				{
					watchplan.price
				}; /* 设置价格 */
				$(document)
						.ready(
								function() {
									var $cart = $('#selected-seats'), /* 所选座位 */
									$counter = $('#counter'), /* 票数 */
									$total = $('#total'); /* 总价 */
									var sc = $('#seat-map')
											.seatCharts(
													{  /* 座位图 */
														map : [ 'aaaaaaaaaa',
																'aaaaaaaaaa',
																'__________',
																'aaaaaaaa__',
																'aaaaaaaaaa',
																'aaaaaaaaaa',
																'aaaaaaaaaa',
																'aaaaaaaaaa',
																'aaaaaaaaaa',
																'__aaaaaa__' 
															  ],
														naming : {
															top : false,
															getLabel : function(
																	character,
																	row, column) {
																return column;
															}
														},
														/* 设置座位状态 */
														legend : {
															node : $('#legend'),
															items : [
																	[
																			'a',
																			'available',
																			'可选' ],
																	[
																			'a',
																			'unavailable',
																			'已售' ],
																	[
																			'a',
																			'selected',
																			'选中' ] ]
														},
														/* 实现选座 */
														click : function() {
															if (this.status() == 'available') {
																/* $('<li>排'+(this.settings.row+1)+'座'+this.settings.label+'</li>') */
																$(
																		'<li>'
																				+ (this.settings.row + 1)
																				+ '排 '
																				+ this.settings.label
																				+ '座</li>')
																		.attr(
																				'id',
																				'cart-item-'
																						+ this.settings.id)
																		.data(
																				'seatId',
																				this.settings.id)
																		.appendTo(
																				$cart);

																$counter
																		.text(sc
																				.find('selected').length + 1);
																$total
																		.text(recalculateTotal(sc)
																				+ price);

																return 'selected';
															} else if (this
																	.status() == 'selected') {
																/* 选中后更新座位数 */
																$counter
																		.text(sc
																				.find('selected').length - 1);
																/* 选中后更新总价 */
																$total
																		.text(recalculateTotal(sc)
																				- price);
																/* 删除可选 */
																$(
																		'#cart-item-'
																				+ this.settings.id)
																		.remove();
																return 'available';
															} else if (this
																	.status() == 'unavailable') { /* 已售 */
																return 'unavailable';
															} else {
																return this
																		.style();
															}
														}
													});
									/* 已售座位 */
									sc.get(
											[ '1_2', '4_4', '4_5', '6_6','6_7', '8_5', '8_6', '8_7','8_8', '10_1', '10_2' ])
											.status('unavailable');

								});
				/* 总价 */
				function recalculateTotal(sc) {
					var total = 0;
					sc.find('selected').each(function() {
						total += price;
					});
					return total;
				}
			</script>
		</div>
	</div>

	<%@ include file="/default/_foot.jsp"%>
</body>
</html>