<%@page import="java.net.URLDecoder"%>
<%@ page language="java" import="java.util.*,com.lyf.filmbase.entity.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="static/js/jquery-1.4.2.js"></script>
<title>FilmBase | 登录页面</title>
<style>
/* body{
  background-image: url(static/img/bg/login.jpg);
  background-repeat:no-repeat; 
  
 background-size:cover;  
} */
#loginpage {
	/* width:1900px;
   height:900px; */
	width: 100%;
	height: 900px;
	/* background-color:blue;  */
	position: fixed;
}
/* .head {
	height: 20%;
	/* background-color:red; 
} */
/* .hd {
	position: absolute;
	left: 30%;
	top: 10%;
} */
.content {
	height: 60%;
    /* background-color:yellow; */ 
}
.left {
	position: absolute;
	width: 70%;
	height: 88%;
	/* background-color:gray;  */ 
}
.right {
	position: absolute;
	top:20%;
	right:;
	left: 65%;
	width: 43%;
	height: 58%;
	/* background-color:green;  */
}
/* 登录样式 */
#login{
	margin-top: 13%;
	box-shadow: 0 0 8px gray;
	width: 350px;
	height: 348px;
	/*  background-color:gray; */
}
h3 {
	text-align: center;
	margin-bottom:50px;
}
.key {
	text-align: left;
	padding: 4%;
}
input[name="valistr"] {
	width: 13%;
}
input[name="valistr"]+img {
	vertical-align: middle;
}
.loginbtn input[type="submit"] {
	margin-bottom: 5%;
	width: 350px;
	height: 45px;
	color: white;
	font-size:19px;
	font-weight: bolder;
	background-color: red;
	border-radius: 5px;
}
</style>
</head>
<body>
    <!--  //记住用户名 -->
    <%
       Cookie[] cs = request.getCookies();
       Cookie findU = null;
       if(cs!=null){
    	   for(Cookie c:cs){
    		   if("remname".equals(c.getName())){
    			   findU=c;
    			   break;
    		   }
    	   }
       }
       String username="";
       if(findU!=null){
    	   username=URLDecoder.decode(findU.getValue(),"utf-8");
       }
    %>
	<div id="loginpage">
		<div class="head">
			<img src="">
			<div class="hd">
				<h1></h1>
			</div>
		</div>
		<div class="content">
			<div class="left">
               <img src="static/img/bg/login.jpg" width=100% height=100%> 
			</div>
			<div class="right">
				<div id="login" style="background-color:white;">
					<h3>账号登录</h3>
					<form id="login-form" action="user/login.do" method="post" 
					onSubmit="return formObj.checkLoginForm()">
					    <div style="text-align:center"><span id="loginMsg" style="color:red;text-align:center;font-family:STkaiti;">${loginMsg==null?"":loginMsg}</span></div>
						<div class="key">
							用户名：<input type="text" id="username" name="username" /><span id="loginMsg" style="color:red;font-family:STkaiti;"></span>
						</div>
						<div class="key">
							密&nbsp;&nbsp;&nbsp;码：<input type="password" id="password" name="password"/><span id="loginMsg" style="color:red;font-family:STkaiti;"></span>
						</div>
						<div class="key">
						     验证码：<input type="text" name="valistr"/> <img id="valiImage" alt=""
								src="user/valistr.do"><span id="loginMsg" style="color:red;text-align:center;font-family:STkaiti;">${loginValiMsg}</span>
						</div>
						<!-- <div class="key">
						   <input type="checkbox" name="remname" value="true"/>记住用户名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						   <input type="checkbox" name="autologin" value="true"/>自动登录
						</div> -->
						  <div class="loginbtn" style="float:left;width:100%;">
							          <input type="submit" id="submit" value= "登录" /><br/>
							     </div> 
							      还没有账号？免费<a href="user/regist.jsp" >注册</a>  
						</form> 
				   </div> 
            </div>
    
    <div class="foot" align="center">
      <!--  Copyright 2018 by YUFENG.L<br/> -->
    </div>
    </div>
 </div> 
</body>
<script type="text/javascript">
     //登录验证
    /*  function checkLogin(){
    	 var username,password,valistr,text;
    	 username = document.getElementById("username").value;
    	 password = document.getElementById("password").value;
    	 valistr = document.getElementById("valistr").value;
    	 if(username == null||username==""){
    		 text = "请输入账号和密码!";
    		 document.getElementById("remind").innerHTML = text;
    		 return false;
    	 }else{
    		 text = "正在登录...";
    		 document.getElementById("remind").innerHTML = text;
    	 }
     }  */
    var formObj = {
    		"checkLoginForm" : function(){
    			var flag = true;
    			flag=this.checkNull("username","请输入用户名") && flag;
    			flag=this.checkNull("password","请输入密码") && flag;
    			flag=this.checkNull("valistr", "验证码不能为空") && flag;
    			  return flag;
               /*  $("input[id='submit']").$("value").html("正在登录..."); */
             },
    		  "checkNull":function(name,msg){
    			  //""为拼接
    			  var value = $("input[name='"+name+"']").val();
    			  if ($.trim(value) == "") {
            		 this.setMsg(name,msg);
            		 return false;
            	 }else{
            		 this.setMsg(name,"");
            		 return true;
            	 }
            	},
             "setMsg":function(name,msg){
            	$("input[name='"+name+"']").nextAll("span").html(msg).css("color","red"); 
             },
     };
       $(function(){
    	   //点击下一项取消上次输入错误提示
    	    $("input[name='"+name+"']").blur(function(){
    	    	$("span[id='loginMsg']").html("");
    	    }); 
    	    $("input[name='username']").blur(function(){formObj.checkNull("username","请输入用户名");});
        	$("input[name='password']").blur(function(){formObj.checkNull("password","请输入密码");});
            $("#valiImage").click(function(){
        	   var timeStr = new Date().getTime();
        	   var url = "user/valistr.do?time="+timeStr;
        	   $("#valiImage").attr("src",url);
           }); 
      });   
</script>
</html>