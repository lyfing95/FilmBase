<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:if test="${reviewFlag==1}">
    <%
	response.sendRedirect(request.getContextPath()+"/film/reviewFlag.jsp");
	%>
</c:if> --%>

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
<script src="static/js/jquery-1.4.2.js"></script>


<title>FilmBase | 影片信息页面</title>
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

.movieMsMa {
	float: right;
	margin-top: 200px;
	margin-right: 600px;
	width: 555px;
	height: 350px;
	/* background-color: green; */
}

.movieMsg {
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
input[id="movieMark"] {
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
/* 影片信息内容 */
#moviePage {
	margin: 100px auto 0;
	width: 1200px;
	height: 1600px;
	/* background-color: gray; */
}
.movieContent{
    float:left;
    width: 770px;
	height: 1600px;
	/* background-color: red; */
}
.movieNews{
    float: right;
	width: 320px;
	height: 600px;
	/* background-color:yellow; */
}
.movieDescribe{
    width: 770px;
	height: 700px;
	/* background-color: green; */ 
}
.jj{
    width: 770px;
	height: 200px;
	/* background-color:yellow; */
}
.tj{
    width: 770px;
	height: 420px;
	/* background-color:red; */  
}
.movieReview {
    margin-top:20px;
	width: 770px;
	height: 850px;
    /* background-color: blue; */  
} 
#tbDiscuss{
    width:770px;
}
#tbReview{
    width:770px;
}
.tdImg{
    width:30px;
    height:30px;
    border-radius:50%;
    overflow:hidden;
}
.tdName{
    padding-left:10px;
    width:580px;
    height:50px;
}
.tdDiscuss{
    width:50px;
}
.tdSub{
    padding-left:600px;
    height:50px;
}
input[name="subDiscuss"]{
   color:#4388F0;
   background-color:white;
   border:none;
}
input[name="subReview"]{
   width:75px;
   height:30px;
   background-color:#4388F0;
   color:white;
   border-radius:5px;
}
</style>
<script type="text/javascript">
     function loginUserCheck(){
    	  var user =document.getElementsByName("userid")[0].value;
    	  if(user == null || user == ""){
    		  var a =confirm("请登录后再来评论哦");
    		  if(a==true){
    		  window.location.href="user/login.jsp";}else{window.location.href="film/movie.jsp"}
    		  return false;
    	  }
    	  /* var userStatus = ${loginUser.status};
    	  if(userStatus==1){
    		 alert("您由于违反社区相关规定已被禁止评论，其他功能不受影响，详情请资讯客服。");
  	    	   return false;
  	       } */
    	  var contents =document.getElementsByName("contents")[0].value;
    	  if (contents.trim() == "" || contents.trim()==null) {
    		  alert("输入不能为空！");
     		 return false;  
    	  }
    }   
     function limit(){
    	 alert("您由于违反社区相关规定已被禁止评论，其他功能不受影响，详情请资讯客服。");
     }
     function markHint(){
    	 var user =document.getElementsByName("userid")[0].value;
    	    if(user == null || user == ""){
    		  var a =confirm("请登录后再来评分");
    		  if(a==true){
    		  window.location.href="user/login.jsp";}else{window.location.href="film/movie.jsp"}
    		   return false;
    		}
    	 if(<%=session.getAttribute("markMsg")%>!=1){
    		 alert("您已经对这部电影评过分了，感谢您的参与~");
    		 return false;
    	} 
    	 var mv=prompt("请输入您对此电影的评分【1-10】");/* ^(\d|10)(\.\d)?$  /^([1-9](\\.\\d)?)|(10)$)*/
    	 if(!isNaN(mv) && mv>0 && mv<=10){
    		 document.getElementsByName('mark')[0].value = mv
    		 alert("感谢您对本网站的支持！");
    		 return true;
    	 }else{
    		 alert("您的输入与要求不符，评分失败，谢谢您的参与~");
    		 return false;
    	 }
    	 /* while(isNaN(mv)){
	    	 prompt("请输入您对此电影的评分【1-10】","请输入正确的数字！");
	    	  alert("欢迎您下次参与~~");
	    	  break;
	     }  */ 
	  /* var a = document.getElementsByName('mark')[0].value = mv; 
   	  if(a == null || a==""){
   		return false;
	   }else{
		   return true;
	   }
	     alert("感谢您对本网站的支持！"); */
	 }
</script>
</head>
<body>
	<%@ include file="/default/_head.jsp"%>
	<div id="moviehd">
		<div class="movieImg">
			<img src="film/getFileImg.do?imgurl=${movie.imgurl}" alt="电影图片" width="300" height="400" />
		</div>
		<div class="movieMsMa">
			<div class="movieMsg">
				<div class="movieMsgContext">
					<h3>${movie.name}</h3>
					<p>Hello, Mrs. Money</p>
					<p>喜剧</p>
					<p>中国大陆 / 115分钟</p>
					<p>2018-09-30 08:00大陆上映</p>
				</div>
				<form action="film/mark.do" method="post" onsubmit="return markHint()">
					 <input type="hidden" name="mark" value="0">
					 <input type="hidden" name="userid" value="${loginUser.id}">
					 <input type="hidden" name="movieid" value="${movie.id}">
					 <input type="submit" id="movieMark" value="点击这里->@评分">
				</form>
				<div class="toMovieBuy">
				    <c:if test="${loginUser != null}">
					<a href="film/CinemaHasMovie.do?id=${movie.id }" align:center>立即特惠购票</a>
					</c:if>
					<c:if test="${loginUser == null }">
					<a href='javascript:if(confirm("请先登录后再来购票哦")) location="user/login.jsp"' align:center>立即特惠购票</a>
					</c:if>
				</div>
			</div>
			<div class="movieMark">
			 <p>用户评分</p>
			 <h3 style="color:yellow">${movie.mark}</h3>
			 <p>累计票房</p>
			 <h3>1.69亿</h3>
            </div>
		</div>
	</div>
	<div id="moviePage">
	    <div class="movieContent">
		       <div class="movieDescribe">
		              <div class="jj">
		                <h3 style="color:#339BD5">剧情简介</h3><hr>
		                <p>${movie.contents}</p>
			          </div>
			          <div class="tj">
			            <h3 style="color:#339BD5">图集</h3><hr> 
			            <img src="film/getFileImg.do?imgurl=${movie.imgurl}" alt="影片图集" width="200" height="300" />
			               <%-- src="<c:url value='static/img/movie/${movie.id}.jpg?'/>" --%>
				      </div>
				</div>
				<!-- 评论 -->
				<div class="movieReview">
				    <a name="reviewFlag"><h3 style="color:#339BD5">热门短评</h3></a><hr>
				    <table id="tbDiscuss" border="0">
				   <c:if test="${page.totalPage>0}">
                    <c:forEach items="${page.objectList}" var="review"> 
				          <tr>
					        <td class="tdImg">
					            <c:if test="${review.profilehead!= null}"> 
		                          <img src="film/getFileImg.do?imgurl=${review.profilehead}" alt="" width="45" height="45"> 
		                        </c:if> 
		                        <c:if test="${review.profilehead== null}">
			                      <img src="static/img/default_head.jpg" alt="" width="45" height="45">
			                    </c:if> 
					         </td>
					        <td class="tdName">${review.nickname}&nbsp;&nbsp;&nbsp;&nbsp;
					            <fmt:formatDate value="${review.time}" pattern="yyyy-MM-dd HH:mm"/>
					        </td>  
					      </tr>
					      <tr>
					        <td></td>
					        <td class="tdDiscuss"><h4>${review.contents}</h4></td> 
					      </tr>
					      <tr>
					</c:forEach>
					</c:if> 
					 <!-- <td class="tdSub" colspan="2"><input type="submit" name="subDiscuss" value="回复"/></td> -->
					      </tr>
					 </table>
					 <hr>    
		<!-- 分页 -->
			      <div class="pager">
				  <span><strong>【${page.currentPage}/${page.totalPage}】</strong></span>
				         <!-- 第一页情形 -->
						  <c:if test="${page.currentPage eq 1}">
						    <a href="film/getMovieInfo.do?currentPage=2&rows=5&movieid=${movie.id}&flag=1"><strong>下一页&nbsp;&nbsp;&nbsp;</strong></a>
						  	<a href="film/getMovieInfo.do?currentPage=${page.totalPage}&rows=5&movieid=${movie.id}&flag=1"><strong>&nbsp;&nbsp;&nbsp;尾页</strong></a>
						  </c:if>
						  <!-- 非第一页也非最后一页-->
						  <c:if test="${page.currentPage>1 and page.currentPage<page.totalPage}">
						  	<a href="film/getMovieInfo.do?currentPage=1&rows=5&movieid=${movie.id}&flag=1"><strong>&nbsp;&nbsp;&nbsp;首页</strong></a>
						  	<a href="film/getMovieInfo.do?currentPage=${page.currentPage-1}&rows=5&movieid=${movie.id}&flag=1"><strong>上一页</strong></a>
						  	<a href="film/getMovieInfo.do?currentPage=${page.currentPage+1 }&rows=5&movieid=${movie.id}&flag=1"><strong>下一页</strong></a>
						  	<a href="film/getMovieInfo.do?currentPage=${page.totalPage}&rows=5&movieid=${movie.id}&flag=1"><strong>&nbsp;&nbsp;&nbsp;尾页</strong></a>
						  </c:if>
						  <!-- 最后一页情形 -->
						  <c:if test="${page.currentPage==page.totalPage}">
						  	<a href="film/getMovieInfo.do?currentPage=1&rows=5&movieid=${movie.id}&flag=1">首页</a>
						  	<a href="film/getMovieInfo.do?currentPage=${page.currentPage-1}&rows=5&movieid=${movie.id}&flag=1">上一页</a>
						  </c:if>
					</div>	
		<!-- 分页结束 -->
		<c:if test="${requestScope.size<=0}">
			    <p>还没有用户评论，快来抢沙发吧!</p>
	    </c:if>	
				  
					       
				<form id="formRev" action="film/review.do" method="post" onsubmit="return loginUserCheck()">
					  <table id="tbReview" border="0"> 
					     <input type= "hidden" name="userid" value="${loginUser.id}">  
					     <input type= "hidden" name="movieid" value="${movie.id}">  
					     <tr>
					        <td class="tdImg">
					          <c:if test="${loginUser!= null}">
					           <img src="film/getFileImg.do?imgurl=${loginUser.profilehead}" alt="" width="45" height="45">
					          </c:if>
					          <c:if test="${loginUser == null}">
					           <img src="static/img/default_head.jpg" alt="" width="45" height="45">
					          </c:if>
					        </td>
					        <td class="tdName">
					          <c:if test="${loginUser == null }">
					           <a href="user/login.jsp"><span style="color:red">未登录！</span></a>
					          </c:if>
					           <c:if test="${loginUser != null}">
					           <span>${loginUser.nickname.trim()==""?loginUser.username:loginUser.nickname}</span>
					          </c:if>
					        </td>    <%-- ${loginUser.nickName.trim()==""?loginUser.userName:loginUser.nickName } --%>
					      </tr>
					      <tr>
					        <td></td>
					        <td class="tdDiscuss">
					           <textarea rows="6" cols="99" id="contents" name="contents" placeholder="快来说说你的看法吧"></textArea>
					        </td>
					      </tr>
					      <tr>
					        <td class="tdSub" colspan="2">
					        <!-- <input type="submit" name="subReview" value="发表"/> -->
					        <c:if test="${loginUser == null }"><input type="submit" name="subReview" value="发表"/></c:if>
					        <c:if test="${loginUser.status==0}"><input type="submit" name="subReview" value="发表"/></c:if>
					        <c:if test="${loginUser.status==1}"><input type="button" name="subReview" value="禁言中.." onclick="limit()"/></c:if> 
					        </td>
					      </tr>
				      </table>
			    </form>
				</div>
		 </div>
		<div class="movieNews">
		   <span><a style="color: #EF4238;font-size:18px;">&nbsp;&nbsp;独家资讯</a> </span>
			<hr>
			<c:forEach items = "${newsList}" var="news">
			<p><a href="film/newsInfo.do?id=${news.id}&newsFlag=1" style="color:black">${news.head}</a></p>
		    </c:forEach>
		   <hr><span style="margin-left:270px;"> <a href="film/newsInfo.do?newsFlag=0">查看全部>></a></span>
	    </div>
	</div>
	<%@ include file="/default/_foot.jsp"%>
</body>
<script type="text/javascript">
	
</script>
</html>