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

<title>FilmBase | 影片列表页面</title>
<style type="text/css">
 .listHd{
    margin:0 auto;
    width:1903px;
    height:230px;
    background-color:#9DB9AA;
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
    margin-top:40px;
    width:1200px;
    height:1965px;   /* 一行305 */
    /* background-color:yellow; */
 }
  /* 影院列表 */
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
  <%@include file="/default/_head.jsp" %>
  <div class="listHd">
           <div class="listTitle"><span style="color:white">影院列表</span><hr></div>
   </div>
 <div class="listContent">
   <div id="cinemaChoose">
     <!-- 所有影院 -->
     <c:forEach items ="${allCinema }" var="cinema">
         <table border="0">
           <tr> 
             <td class="tdCinema">${cinema.name}</td>
             <td class="tdChoose" rowspan="2"><span style="color:red;font-size:20px">￥45</span>起</td>
             <td class="tdChoose" rowspan="2"><a href="film/movieForCinema.do?cinemaid=${cinema.id}"><input type="submit" name="cinemaChoose" value="选座购票"></a></td>
           </tr>
           <tr>
             <td class="tdAddr">${cinema.address }</td>
           </tr>
         </table><hr>
      </c:forEach>
      
       <!-- 影院搜索 -->
     <c:forEach items ="${cinemaSearch }"  var="cinema">
         <table border="0">
           <tr> 
             <td class="tdCinema">${cinema.name}</td>
             <td class="tdChoose" rowspan="2"><span style="color:red;font-size:20px">￥45</span>起</td>
             <td class="tdChoose" rowspan="2"><a href="film/movieForCinema.do?cinemaid=${cinema.id}"><input type="submit" name="cinemaChoose" value="选座购票"></a></td>
           </tr>
           <tr>
             <td class="tdAddr">${cinema.address }</td>
           </tr>
         </table><hr>
      </c:forEach>
      
      
     </div>
  </div>
  
  <%@include file="/default/_foot.jsp" %>
</body>
</html>