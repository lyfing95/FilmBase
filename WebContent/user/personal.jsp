<%@ page language="java" import="java.util.*,com.lyf.filmbase.entity.*" pageEncoding="UTF-8" buffer="0kb"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<html>
<head>
	<base href="<%=basePath%>">
    <title>FilmBase | 个人设置</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="static/css/bootstrap.min.css"/>  
    <script type="text/javascript" src="static/js/jquery-1.4.2.js"></script>    
<style>
body{
    background-color:#464646;
    /* background-size:cover; */
   /*  background-attachment:fixed;  */
}
  #perstop{
   box-shadow: 0 0 8px #3C6EC5;
   margin:180px auto 5px;
   /* margin: 0 auto; */
   border-radius:8px;
   width:1200px;
   height:50px;
   background-color:#3C6EC5;
   } 
 #perstop p{
   text-align:center;
   /* vertical-align:middle; */
   padding-top:12px;
   font-size:20px;
   color:white;  
 }
 #pershd{
   margin:0 auto;
   width: 1200px;
   height:640px;
   border-radius:8px;
   /* box-shadow: 0 0 8px #3C6EC5; */  
   /* background-color:yellow; */ 
 }  
 .persleft{
   /* margin-top:305px; */
    /* top:800px; */ 
   float:left;
   width:220px;
   height:590px;
   border-radius:8px;
   box-shadow: 0 0 8px #3C6EC5;   
  }
 .persleft ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 220px;
    /* background-color: #f1f1f1; */ 
    background-color:#47464A;
}
.persleft li a {
    display: block;
    /* color: #000; */
    color: white; 
    padding: 8px 16px;
    text-decoration: none;
}
 
/* 鼠标移动到选项上修改背景颜色 */
.persleft ul li a:hover {
    background-color:#EAE8ED;
    color:black;
}
.persright{
   float:right;
   position:relative; 
   width:968px;
   height:590px;
   border-radius:8px;
   border-bottom:580px solid white;
   border-right:45px solid;
   box-shadow: 0 0 8px #3C6EC5; 
   background-color:#7C8ECB;
  }
</style>  
</head>
<body>
	<%@include file="/default/_head.jsp" %>
<div id="pageback">
<div id="perstop">
       <p>个人中心</p>
   </div>	
<div id="pershd" >
   <div class="persleft">
         <ul>
           <li><a href="user/orders.jsp"  target="persContent"><h4 align="center">我的订单</h4></a></li>
           <li><a href="user/information.jsp"  target="persContent"><h4 align="center">我的信息</h4></a></li>
           <li><a href="user/info-setting.jsp"  target="persContent"><h4 align="center">账号安全</h4></a></li>
         </ul> 
   </div>  
   <div class="persright">
         <iframe id="persright" src="" name="persContent" width="968px" height="590px" frameborder="0" scrolling="yes"></iframe> 
   </div>
</div>
</div>
    <%@include file="/default/_foot.jsp" %> 
</body>
<script type="text/javascript">
$(function(){
	var personalFlag = ${personalFlag};
	if(personalFlag=='2'){
		var url = "user/information.jsp";
	}else if(personalFlag=='3'){
		var url = "user/info-setting.jsp";
 	}else if(personalFlag=='1'){
 		var url = "user/orders.jsp";
    }
	$("#persright").attr("src",url);
    });   
</script>
</html>