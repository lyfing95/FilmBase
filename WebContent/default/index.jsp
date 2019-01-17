<%@ page language="java" import="java.util.*,com.lyf.filmbase.entity.*"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:if test="${indexFlag == null}"> 
 <%-- <jsp:forward page="film/indexMovie.do"/>  --%>
 <%
 response.sendRedirect(request.getContextPath()+"/film/indexMovie.do");
%> 
</c:if>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- 导图滚动 -->
<link rel="stylesheet" type="text/css"
	href="static/css/index_head.base.css">
<link rel="stylesheet" type="text/css"
	href="static/css/index_head.home.css">
<script type="text/javascript" src="static/js/index_head.jquery.min.js"></script>
<script type="text/javascript" src="static/js/index_head.banner.js"></script>
<script type="text/javascript" src="static/js/index_head.ad.js"></script>
<title>FilmBase | 首页</title>
<style>
/* 内容框架样式 */
#head {
	position: absolute;
	/* margin: 0 auto; */
	top: 107px;
	width: 1903px;
	height: 500px;
	/* background:yellow; */
}

#page {
	/* width: 1350px; */
	width: 1903px;
	/* height: 2200px; */
	height: 2400px;
	margin: 0 auto;
}

.moviepage1 {
	position: absolute;
	/* top: 640px; */
	top: 700px;
	left: 300px;
	width: 920px;
	height: 750px;
	/* background-color:blue;  */
}

.news1 {
	position: absolute;
	top: 700px;
	left: 1280px;
	width: 342px;
	height: 750px;
    /* background-color: green;  */
}

.moviepage2 {
	position: absolute;
	/* top: 1430px; */
	top: 1550px;
	left: 300px;
	width: 920px;
	height: 750px;
	 /* background-color: yellow; */ 
}

.news2 {
	position: absolute;
	top: 1550px;
	left: 1280px;
	width: 342px;
	height: 750px;
	/* background-color: red; */
}
/* 内容填充样式 */
.movie {
	padding: 6px 10px;
	float: left;
	width: 25%;
	height: 350px;
}

.imgArea {
	border: 1px solid #ccc;
	box-shadow: 0 0 3px gray;
}

.imgArea:hover {
	border: 1px solid #777;
}

.setImg {
	width: 207px;
	height: 295px;
	/* background-color:red; */
}

.imgArea img {
	width: 100%;
	height: 295px;;
}

.desc {
	float: left;
	padding-top: 15px;
	padding-left: 15px;
	font-size: 16px;
	color: #339BD5;
}

.buy {
	float: right;
	padding-top: 15px;
	padding-right: 15px;
}

.buy a {
	font-size: 16px;
	color: #CB2121;
}

.buy a:hover {
	color: red;
	font-size: 17px;
	text-decoration: none;
}
/* *{
    box-sizing: border-box;
}
 @media only screen and (max-width: 700px){
    .responsive {
        width: 49.99999%;
        margin: 6px 0;
    }
}
@media only screen and (max-width: 500px){
    .responsive {
        width: 100%;
    }
}  
.clearfix:after {
    content: "";
    display: table;
    clear: both;
} */
*
/
</style>
<body>

	<%@include file="/default/_head.jsp"%>

	<!-- 导图 -->
	<div id="head">
		<!-- <div style="height:100px;"></div> -->
		<div class="aui-content-max">
			<div class="aui-small-ad">
				<div class="example2">
					<ul>
						<li><img src="static/img/index.head.ad1.jpg" alt=""
							width="1895" height="500"></li>
						<li><img src="static/img/index.head.ad2.jpg" alt=""
							width="1895" height="500"></li>
						<li><img src="static/img/index.head.ad3.jpg" alt=""
							width="1895" height="500"></li>
					</ul>
					<ol>
						<li></li>
						<li></li>
						<li></li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!-- 内容 -->
	<div id="page">
		<div class="moviepage1">
			<span><a style="color: #EF4238;font-size:25px;">&nbsp;&nbsp;最新热映</a> </span>
			<span style="margin-left:700px;"> <a href="film/moviePage.do?currentPage=1&rows=10">查看全部>></a></span>
			<hr>
		    <c:forEach items="${newestMovie}" var="movie">
			<div class="movie">
				<div class="imgArea">
					<!-- 1463*2048 -->
					<div class="setImg">
						<a target="blank" href="film/getMovieInfo.do?movieid=${movie.id }&currentPage=1&rows=5&flag=0"><img
							name="movieImg" src="film/getFileImg.do?imgurl=${movie.imgurl}" alt="影片图片" /></a>
					</div>
					<div class="desc">${movie.name}</div>
					<div class="buy">
					  <c:if test="${loginUser != null }">
						<a href="film/CinemaHasMovie.do?id=${movie.id }">立即购票</a>
					  </c:if>
					  <c:if test="${loginUser == null }">
					   <a href='javascript:if(confirm("请先登录后再来购票哦")) location="user/login.jsp"'>立即购票</a> 
					   <!-- <a href="user/login.jsp" onclick="return confirm("请先登录后再来购票哦")">立即购票</a>  -->
					   </c:if>
					</div>
				</div>
			</div>
            </c:forEach> 
        </div> 
		<!-- 资讯 -->
		<div class="news1">
		   <span><a style="color: #EF4238;font-size:18px;">&nbsp;&nbsp;独家资讯</a> </span>
			<hr>
			<c:forEach items = "${newsList}" var="news">
			<p><a href="film/newsInfo.do?id=${news.id}&newsFlag=1" style="color:black">${news.head}</a></p>
		    </c:forEach>
		   <hr><span style="margin-left:270px;"> <a href="film/newsInfo.do?newsFlag=0">查看全部>></a></span>
		</div>
		<!-- 热门影片 -->
		<div class="moviepage2">
			<!-- <a name="hotMovie"><h3>热门影片</h3></a> -->
			<span><a style="color: #EF4238;font-size:25px;">&nbsp;&nbsp;热门影片</a> </span>
			<span style="margin-left:700px;"> <a href="film/moviePage.do?currentPage=1&rows=10">查看全部>></a></span>
			<hr>
		 <c:forEach items="${hotMovie}" var="movie">
			<div class="movie">
				<div class="imgArea">
					<!-- 1463*2048 -->
					<div class="setImg">
						<a target="blank" href="film/getMovieInfo.do?movieid=${movie.id }&currentPage=1&rows=10&flag=0"><img
							name="movieImg" src="film/getFileImg.do?imgurl=${movie.imgurl}" alt="影片图片" /></a>
					</div>
					<div class="desc">${movie.name}</div>
					<div class="buy">
					  <c:if test="${loginUser != null }">
						<a href="film/CinemaHasMovie.do?id=${movie.id }">立即购票</a>
					  </c:if>
					  <c:if test="${loginUser == null }">
					   <a href='javascript:if(confirm("请先登录后再来购票哦")) location="user/login.jsp"'>立即购票</a> 
					   <!-- <a href="user/login.jsp" onclick="return confirm("请先登录后再来购票哦")">立即购票</a>  -->
					   </c:if>
					</div>
				</div>
			</div>
		</c:forEach> 
		</div>
		<!-- 排行榜 -->
		<div class="news2">
			<!-- <a name="movieRank"><h4>影视排行榜</h4></a> -->
			<span><a style="color: #EF4238;font-size:18px;">&nbsp;&nbsp;影视排行榜&nbsp;&nbsp;(前10名)</a> </span><hr>
			<table border="0">
			<c:forEach items="${markList}" var="movie" begin="0" end="9" varStatus="status">
			  <tr>
			    <td>${requestScope.offset+status.index+1}&nbsp;.&nbsp;&nbsp;${movie.name}</td>
			    <td>----------------------------------</td>
			    <td ><span style="font-family:Arial;font-weight:800;font-size:22px;font-style:italic;color:#FFB400;">${movie.mark}</span>&nbsp;&nbsp;分</td>
			  </tr>
			 </c:forEach>
			</table>
			<%-- <c:forEach items="${markList}" var="movie" begin="0" end="9" varStatus="status">
			<p style ="text-align:left;"><span style="font-family:Arial;font-weight:800;font-size:22px;font-style:italic;color:#FFB400;">${movie.mark}&nbsp;&nbsp;</span>分&nbsp;&nbsp;----------------------------------&nbsp;&nbsp;${movie.name}</p>
			</c:forEach> --%>
			<hr><span style="margin-left:270px;"> <a href="film/mark.jsp">查看全部>></a></span>
			
		</div>
	</div>
	<%--  <%
	   request.getRequestDispatcher("/_foot.jsp").include(request, response);
	 %> --%>
	<%@include file="/default/_foot.jsp"%>
</body>
<script type="text/javascript">
   /* 弹窗样式 */
/* window.confirm = function(txt) {   
   var div = document.createElement("DIV");
     shield.style.position = "absolute"; 
     shield.style.background = "#333";   
     shield.style.textAlign = "center";   
     shield.style.zIndex = "9999999";

} */
	/* 设置图片大小 */
	/*  function setImg(w,h){
	 var imgList=${movieImg};
	 for(var i=0;i<imgList.length;i++){
	 if(imgList[i].w>w || imgList[i].h>h){
	 imgList[i].w=w;
	 imgList[i].h=h;
	 }
	 }
	 }
	 setImg(300,400);  */
	/* 导图滚动 */
	var intDiff = parseInt(600000);//倒计时总秒数量
	function timer(intDiff) {
		window.setInterval(function() {
			var day = 0, hour = 0, minute = 0, second = 0;//时间默认值
			if (intDiff > 0) {
				day = Math.floor(intDiff / (60 * 60 * 24));
				hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
				minute = Math.floor(intDiff / 60) - (day * 24 * 60)
						- (hour * 60);
				second = Math.floor(intDiff) - (day * 24 * 60 * 60)
						- (hour * 60 * 60) - (minute * 60);
			}
			if (minute <= 9)
				minute = '0' + minute;
			if (second <= 9)
				second = '0' + second;
			$('#hour_show').html('<s id="h"></s>' + hour + '时');
			$('#minute_show').html('<s></s>' + minute + '分');
			$('#second_show').html('<s></s>' + second + '秒');
			intDiff--;
		}, 1000);
	}
	$(function() {
		timer(intDiff);
	});
	//ad自动滚动
	$(function() {
		$(".example2").luara({
			width : "1895",
			height : "500",
			interval : 3500,
			selected : "seleted",
			deriction : "left"
		});
	});
</script>
</html>


<!-- <li>
						<a href="#"><img src="images/movie/a1.jpg" /></a>
						<h3><a href="#">烈日灼心</a></h3>
						<div class="score"><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star2.png" /><span>7.9</span></div>
						<input type="button" name="buy" class="buy-btn"  value="选座购票" onclick="javascrtpt:window.location.href='login.jsp'" /> 
					</li>
					<li>
						<a href="#"><img src="images/movie/a2.jpg" /></a>
						<h3><a href="#">终结者：创世纪</a></h3>
						<div class="score"><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star4.png" /><img src="images/star2.png" /><span>6.9</span></div>
						<input type="button" name="buy" class="buy-btn" value="选座购票" onclick="javascrtpt:window.location.href='seat.jsp'"/>
					</li>
					<li> -->