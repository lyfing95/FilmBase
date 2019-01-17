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
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>FilmBase | 排行榜页面</title>
<style type="text/css">
 .listHd{
    margin:0 auto;
    width:1903px;
    height:230px;
    background-color:#811719; 
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
 .listContent{
    margin:0 auto;
    margin-top:80px;
    width:1200px;
    height:1965px;   /* 一行305 */
    /* background-color:yellow; */ 
 }
  /* 排行榜 */ 
table{
   width:1200px;
} 
.tdRankImg{
   width:90px;
   padding-top:15px;
 }
.rankImg{
   width:55px;
   height:55px;
   color:white;
   padding-top:5px;
   font-size:30px;
   font-style:italic;
   text-align:center;
   background-color:#FFB400;
 }
.tdMovieImg{
   width:220px;
   height:295px;
}
.tdMovieMsg1{
   padding-top:70px;
   width:600px;
   height:120px;
   font-size:25px;
}
.tdMovieMsg2{
   height:30px;
}
.tdMovieMsg3{
   padding-bottom:85px;
   height:120px;
   color:gray;
}
.tdRank{
   width:85px;
   color:#FFB400;
   font-size:70px;
   font-family:Arial;
   font-weight:800;
   font-style:italic;
}
  
 </style>
 </head>
<body>
  <%@include file="/default/_head.jsp" %>
  <div class="listHd">
           <div class="listTitle"><span style="color:white">新闻资讯</span><hr></div>
   </div>
  <div class="listContent">
   <c:if test="${newsFlag==0}">
            <c:forEach items = "${newsList}" var="news" varStatus="status">
			<p><a href="film/newsInfo.do?id=${news.id}&newsFlag=1" style="color:black;font-size:20px"><span style="color:#811719">${requestScope.offset+status.index+1}<Strong>.</Strong></span>&nbsp;&nbsp;&nbsp;${news.head}</a></p>
		    </c:forEach>
	</c:if>
    <c:if test="${newsFlag==1}">
     <h1 style="text-align:center"><Strong>${news.head}</Strong></h1><hr>
     <h4 style="text-align:right">作者：&nbsp;&nbsp;${news.author}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${news.time}</h4>
      <p>${news.contents}</p>
    </c:if>  
      
   </div>
  <%@include file="/default/_foot.jsp" %>
</body>
</html>