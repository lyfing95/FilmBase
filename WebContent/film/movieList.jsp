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


<title>FilmBase | 影片列表页面</title>
<style type="text/css">
 .listHd{
    /* margin:0 auto; */
    width:1903px;
    height:230px;
    background-color:#5FB7CD; 
  }
 .listTitle{
    margin:0 auto;
    width:1200px;
    height:220px;
    padding-top:160px;
    font-size:25px;
    font-family:STzhongsong;
   /* background-color:red; */ 
 }
 .searchMsg{
    width:1200px;
    margin:0 auto;
    padding-top:60px;
    height:100px;
    font-size:25px;
    text-align:center;
   /*  background-color:green; */ 
 }
 .listContent{
    margin:0 auto;
    margin-top:0px;
    width:1200px;
    height:725px;   /* 一行305 */
    /* background-color:yellow; */ 
 }
 /* 影视列表 */
 .movie {
	padding: 6px 10px;
	margin-left:17px;
	float: left;
	width: 18%;
	height: 350px;
	/* background-color:red; */
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
.pager{
  width:1903px;
  height:26px;
  /* background-color:blue; */ 
 }
</style>
</head>
<body>
<%@include file="/default/_head.jsp" %>
  <div class="listHd">
           <div class="listTitle"><span style="color:white">影视列表</span><hr></div>
   </div>
   <div class="searchMsg"><span>${searchMsg }</span></div>
   <div class="listContent">
            <!-- 所有影片 -->
            <c:if test="${page.totalPage>0}">
             <c:forEach items ="${page.objectList}" var="movie">
            <div class="movie">
				<div class="imgArea">
					<div class="setImg">
						<a target="blank" href="film/getMovieInfo.do?movieid=${movie.id }&currentPage=1&rows=10&flag=0"><img
							name="movieImg" src="film/getFileImg.do?imgurl=${movie.imgurl}" alt="影片图片" /></a>
					</div>
					<div class="desc">${movie.name }</div>
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
			</c:if>
			<!--  影片搜索-->
		      <c:if test="${movieSearch != null }">  
			<c:forEach items="${movieSearch }"  var="movie">
			<div class="movie">
				<div class="imgArea">
					<div class="setImg">
						<a target="blank" href="film/getMovieInfo.do?id=01"><img
							name="movieImg" src="film/getFileImg.do?imgurl=${movie.imgurl}" alt="影片图片" /></a>
					</div>
					<div class="desc">${movie.name }</div>
					<div class="buy">
					  <c:if test="${loginUser != null }">
						<a href="film/cinema.jsp">立即购票</a>
					  </c:if>
					  <c:if test="${loginUser == null }">
					   <a href='javascript:if(confirm("请先登录后再来购票哦")) location="user/login.jsp"'>立即购票</a> 
					   <!-- <a href="user/login.jsp" onclick="return confirm("请先登录后再来购票哦")">立即购票</a>  -->
					   </c:if>
					</div>
				</div>
			</div>
			 </c:forEach>
              </c:if>  
       
   </div>
    <!-- 分页 -->
			      <div class="pager">
				  <span><strong>【${page.currentPage}/${page.totalPage}】</strong></span>
				         <!-- 第一页情形 -->
						  <c:if test="${page.currentPage eq 1}">
						    <a href="film/moviePage.do?currentPage=2&rows=10"><strong>下一页&nbsp;&nbsp;&nbsp;</strong></a>
						  	<a href="film/moviePage.do?currentPage=${page.totalPage}&rows=10"><strong>&nbsp;&nbsp;&nbsp;尾页</strong></a>
						  </c:if>
						  <!-- 非第一页也非最后一页-->
						  <c:if test="${page.currentPage>1 and page.currentPage<page.totalPage}">
						  	<a href="film/moviePage.do?currentPage=1&rows=10"><strong>&nbsp;&nbsp;&nbsp;首页</strong></a>
						  	<a href="film/moviePage.do?currentPage=${page.currentPage-1}&rows=10"><strong>上一页</strong></a>
						  	<a href="film/moviePage.do?currentPage=${page.currentPage+1 }&rows=10"><strong>下一页</strong></a>
						  	<a href="film/moviePage.do?currentPage=${page.totalPage}&rows=10"><strong>&nbsp;&nbsp;&nbsp;尾页</strong></a>
						  </c:if>
						  <!-- 最后一页情形 -->
						  <c:if test="${page.currentPage==page.totalPage}">
						  	<a href="film/moviePage.do?currentPage=1&rows=10">首页</a>
						  	<a href="film/moviePage.do?currentPage=${page.currentPage-1}&rows=10">上一页</a>
						  </c:if>
					</div>	
		<!-- 分页结束 -->
		<c:if test="${requestScope.size<=0}">
			    没有符合条件的数据,请更换查询条件
	    </c:if>
<%@include file="/default/_foot.jsp" %>
</body>
</html>