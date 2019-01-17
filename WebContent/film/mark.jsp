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
    background-color:#FEC832; 
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
    margin-top:120px;
    width:1200px;
    height:2965px;   /* 一行305 */
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
   width:120px;
   height:145;
   /* background-color: red; */
}
.tdMovieMsg1{
   padding-top:70px;
   width:600px;
   height:90px;
   font-size:25px;
}
.tdMovieMsg2{
   height:30px;
}
.tdMovieMsg3{
   padding-bottom:85px;
   height:90px;
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
           <div class="listTitle"><span style="color:white">影视排行榜</span><hr></div>
   </div>
  <div class="listContent">
     <h4 style="color:#339BD5;text-align:center">排行榜规则：将影视库中热映影片，按照评分从高到低排列取前20名。</h4><hr>
         <c:forEach items="${markList}" var="movie" begin="0" end="20" varStatus="status">
         <table border="0">
           <tr> 
             <td class="tdRankImg"  rowspan="5">
               <div class="rankImg">${requestScope.offset+status.index+1}</div>
             </td>
             <td class="tdMovieImg" rowspan="5">
                <a target="blank" href="film/getMovieInfo.do?movieid=${movie.id }&currentPage=1&rows=5&flag=0">
                <img src="film/getFileImg.do?imgurl=${movie.imgurl}" alt="影视图片" width="120" height="145"/></a></td>
             <td class="tdMovieMsg1">${movie.name}</td>
             <td class="tdRank" rowspan="5">${movie.mark}</td> 
           </tr>
           <!-- <tr>
             <td class="tdMovieMsg2">主演：张双兵,鲁园,许薇  207  295</td>
           </tr> -->
           <tr>
             <td class="tdMovieMsg3">电影时长：${movie.duration}分钟</td>
           </tr>
         </table><hr>
     </c:forEach>
  </div>
  <%@include file="/default/_foot.jsp" %>
</body>
</html>