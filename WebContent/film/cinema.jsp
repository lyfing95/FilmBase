<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>FilmBase | 影院页面</title>
<style type="text/css">
/* 影片信息头部 */
#moviehd {
	width: 1903px;
	height: 550px;
	background-color: #523C73;
}

.movieImg {
	float: left;
	margin-top: 200px;
	margin-left: 400px;
	width: 300px;
	height: 400px;
	box-shadow: 0 15px 8px gray;
	background-color: white;
}

#movieMsMa {
	float: right;
	margin-top: 200px;
	margin-right: 600px;
	width: 555px;
	height: 350px;
	/* background-color: green; */
}

#movieMsg {
	float: left;
	width: 265px;
	height: 350px;
	background-color:#523C73;
}
.movieMsgContext{
    width:265px;
    height:170px;
    color:white;
    /* background-color:yellow; */
}
button[name="movieMark"] {
    border:none;
	margin-top: 35px;
	color: white;
	width: 140px;
	height: 35px;
	border-radius: 3px;
	background-color:#756189;
}

.toMovieBuy {
	margin-top: 15px;
	padding-top: 10px;
	width: 265px;
	height: 45px;
	text-align: center;
	border-radius: 5px;
	background-color: #DF2D2D;
}

.toMovieBuy a {
	color: white;
	font-size: 18px;
}

.toMovieBuy a:hover {
	color: white;
	text-decoration: none;
	font-size: 21px;
}

.movieMark {
	float: right;
	margin-top: 170px;
	margin-right: 0px;
	color:white;
	width: 170px;
	height: 180px;
	/* background-color: black; */
}
  /* 选择影院 */
#cinemaChoose{
   margin:130px auto 0;
   width:1200px;
   height:1000px;
   /* background-color:yellow; */
} 
table{
   width:1200px;
} 
table td{
   height:45px;
}
.tdCinema{
   padding-top:15px;
   font-size:18px;
}
.tdAddr{
   padding-bottom:15px;
   color:gray;
}
.tdChoose{
   text-align:center;
   width:120px;
}
input[name="cinemaChoose"]{
   width:80px;
   height:35px;
   border-radius:18px;
   color:white;
   border:0px;
   background-color:red;
}
input[name="cinemaChoose"]:hover{
   background-color:#ED3B31;
}
</style>
</head>
<body>
	<%@ include file="/default/_head.jsp"%>
	<div id="moviehd">
		<div class="movieImg">
			<img src="film/getFileImg.do?imgurl=${movie.imgurl}" alt="碟中碟6" width="300" height="400" />
		</div>
		<div id="movieMsMa">
			<div id="movieMsg">
				<div class="movieMsgContext">
					<h3>${movie.name }</h3>
					<p>Hello, Mrs. Money</p>
					<p>喜剧</p>
					<p>中国大陆 / ${movie.duration}分钟</p>
					<p>2018-09-30 08:00大陆上映</p>
				</div>
				<button type="button" name="movieMark">@评分</button>
				<div class="toMovieBuy">
					<a href="film/getMovieInfo.do?movieid=${movie.id}&currentPage=1&rows=10&flag=0">查看更多电影详情</a>
				</div> 
			</div>
			<div class="movieMark">
			 <p>用户评分</p>
			 <h3 style="color:yellow">${movie.mark }</h3>
			 <p>累计票房</p>
			 <h3>1.69亿</h3>
            </div>
		</div>
	</div>
  
  <!-- 选择影院  -->
      <div id="cinemaChoose">
         <h3 style="color:#339BD5">影院列表</h3><hr>
         <c:forEach items="${cinemaHasMovie}" var="cinema">
         <table border="0">
           <tr> 
             <td class="tdCinema">${cinema.name }</td>
             <td class="tdChoose" rowspan="2"><span style="color:red;font-size:20px">￥45</span>起</td>
             <td class="tdChoose" rowspan="2">
	             <c:if test="${loginUser != null }">
	                 <a href="film/cinemaPlan.do?cinemaid=${cinema.id}&movieid=${movie.id}"><input type="submit" name="cinemaChoose" value="选座购票"></a>
	             </c:if>
	             <c:if test="${loginUser == null }">
					 <a href='javascript:if(confirm("请先登录后再来购票哦")) location="user/login.jsp"'><input type="submit" name="cinemaChoose" value="选座购票"></a> 
				 </c:if>
			 </td>
		   </tr>
           <tr>
             <td class="tdAddr">${cinema.address }</td>
           </tr>
         </table><hr>
         </c:forEach>
     </div>
	<%@ include file="/default/_foot.jsp"%>
</body>
</html>