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
<title>FilmBase | 影院页面</title>
<style type="text/css">
/* 影片信息头部 */
#moviehd {
	width: 1900px;
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
  /* 影院排片 */
#cinemaChoose{
   margin:130px auto 0;
   width:1200px;
   height:1000px;
   /* background-color:yellow; */
}
.plan{
   width:1200px;
   height:76px;
   /* background-color:green; */ 
} 
.planTimeTitle{
   float:left;
   width:120px;
   height:56px;
   font-size:15px;
   text-align:right;
   padding-top:17px;
   /* background-color:yellow; */   
}
.planTime{
   float:right;
   width:1080px;
   height:76px;
   /* background-color:red; */   
}
.planBack{
   float:right;
   width:85px;
   height:76px;
   padding-top:17px;
   /* background-color:blue; */
}
.planTime ul{
   /* border:1px solid gray; */
   float:left;
   width:975px;
   text-algin:center;
   font-size:16px;
   color:gray;
   padding-top:17px;
   /*  background-color:green;  */
}
.planTime ul li{
   margin:20px;
   padding:4px;
   border-radius:15px;
   border:1px solid gray;
   display:inline;
}
.planTime ul li:hover{
   border:0px;
   background:#F03D37;
   color:white;
}
table {
			text-align: center;
		}
		th{
			background-color: silver;
		}
		.td1{
		   width:120px;
		   height:120px;
		}
table{
   text-align:center;
   width:1200px;
   border-radius:15px;
   /* box-shadow:0 0 8px gray; */
} 
table tr td{
   width:240px;
   height:85px;
}
.tdTitle{
   font-size:18px;
   height:60px;
   background:#EDEDED;
}
input[name="cinemaChoose"]{
   width:80px;
   height:30px;
   border-radius:15px;
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
			<img src="film/getFileImg.do?imgurl=${cinemaInfo.imgurl}" alt="影院图片" width="300" height="400" style="margin-top:10px;margin-bottom:10px;"/>
		</div>
		<div id="movieMsMa">
			<div id="movieMsg">
				<div class="movieMsgContext">
					<h3>${cinemaInfo.name }</h3>
					<p>${cinemaInfo.address }</p>
					<p>电话：${cinemaInfo.tell}</p><hr>
					<p style="color:green;font-size:18px;padding-top:45px;">影院服务</p>
					<ul>
					    <li>免费提供普通3D眼镜</li>
					    <li>1.3m以下儿童观看2D普通电影免票，每个成年人仅限带一名儿童。</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
  
  <!-- 选择影院  -->
     <div id="cinemaChoose">
     <table border="1">
          <tr class="trTitle"> 
             <td class="tdTitle"><strong>影片图片</strong></td>
             <td class="tdTitle"><strong>名称</strong></td>
             <td class="tdTitle"><strong>时长</strong></td>
             <td class="tdTitle"><strong>售价（元）</strong></td>
             <td class="tdTitle"><strong>选座购票</strong></td>
           </tr>
  		<c:forEach items="${movieHasCinema}" var="movie" >
  		<tr>
  			<td class="tdContent"><a target="blank" href="film/getMovieInfo.do?movieid=${movie.id }&currentPage=1&rows=5&flag=0">
  			                 <img width="120px" height="120px" src="film/getFileImg.do?imgurl=${movie.imgurl}"/></a></td>
  			<td class="tdContent">${movie.name }</td>
  			<td class="tdContent">${movie.duration}</td>
  			<td class="tdContent">${movie.price }</td>
  			<td class="tdContent">
  			     <c:if test="${loginUser != null }">
	                 <a href="film/cinemaPlan.do?cinemaid=${cinemaInfo.id}&movieid=${movie.id}"><input type="submit" name="cinemaChoose" value="选座购票"></a>
	             </c:if>
	             <c:if test="${loginUser == null }">
					 <a href='javascript:if(confirm("请先登录后再来购票哦")) location="user/login.jsp"'><input type="submit" name="cinemaChoose" value="选座购票"></a> 
				 </c:if>
            </td> 
  		</tr>
  	</c:forEach>
  	</table>
     </div>
	<%@ include file="/default/_foot.jsp"%>
</body>
</html>