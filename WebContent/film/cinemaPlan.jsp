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
table{
   text-align:center;
   width:1200px;
   border-radius:8px;
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
			<img src="film/getFileImg.do?imgurl=${cinema.imgurl}" alt="影院图片" width="300" height="400" />
		</div>
		<div id="movieMsMa">
			<div id="movieMsg">
				<div class="movieMsgContext">
					<h3>${cinema.name }</h3>
					<p>${cinema.address }</p>
					<p>电话：${cinema.tell}</p><hr>
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
         <h3 style="color:#339BD5"><h3>${movie.name }&nbsp;&nbsp;&nbsp;<a style="color:#F0AA05;font-size:30px">7.9</a>&nbsp;<a style="color:#F0AA05;font-size:15px">分</a></h3>
         <p style="color:#339BD5">时长：<a style="color:#339BD5">${movie.duration }</a>分钟<hr>
         <div class="plan">
          <div class="planTimeTitle">观影时间：</div>
          <div class="planTime">
           <ul>
             <!-- <li><input type="submit" name="cinemaChoose" value="">今天</li> -->
             <c:forEach items="${watchPlanDate}" var="watchplan" begin='0' end='2'>
             <a href="film/watchDateForPlan.do?date=${watchplan.date}&movieid=${movie.id}"><li>${watchplan.date}</li></a>
             </c:forEach>
           </ul>
           <div class="planBack"><a href="film/cinema.jsp" style="text-decoration:none">返回影院</a></div>
         </div>
         </div>
         
         <table border="0">
          <tr class="trTitle"> 
             <td class="tdTitle"><strong>放映日期</strong></td>
             <td class="tdTitle"><strong>放映时间</strong></td>
             <td class="tdTitle"><strong>语言版本</strong></td>
             <td class="tdTitle"><strong>放映厅</strong></td>
             <td class="tdTitle"><strong>售价（元）</strong></td>
             <td class="tdTitle"><strong>选座购票</strong></td>
           </tr>
           <c:forEach items="${watchPlanInfo}" var="watchplan">
           <tr class="trContent">
             <td class="tdContent">${watchplan.date }</td>
             <td class="tdContent"><span style="font-size:18px">
                <fmt:formatDate value="${watchplan.starttime}" pattern="HH:mm"/>&nbsp;&nbsp;--&nbsp;&nbsp;
                <fmt:formatDate value="${watchplan.endtime}" pattern="HH:mm"/></span></td>
             <td class="tdContent">${watchplan.language }</td>
             <td class="tdContent">${watchplan.hall }</td>
             <td class="tdContent">￥<span style="color:red;font-size:20px">${watchplan.price }</span></td>
             <td class="tdContent">
                <c:if test="${loginUser != null}">
                  <a href="film/cinemaSelectPlan.do?id=${watchplan.id}"><input type="submit" name="cinemaChoose" value="选座购票"></a>
                </c:if>
                <c:if test="${loginUser == null}">
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