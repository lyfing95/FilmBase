<%@ page language="java" import="java.util.*,com.lyf.filmbase.entity.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="<%=basePath%>">
    <title>FilmBase | 个人信息页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<script src="static/js/jquery-1.4.2.js"></script>
<style>
body{
	font-family: "微软雅黑";
}
form{
	width: 850px;
	height:620px;
	margin: 0 auto;
	/* background-color:yellow; */ 
}
h4{
	width: 300px;
	color: #990000;
    margin: 20px 0 0 30px; 
}
table{
	margin: 0 auto;
	width:750px;
	height:380px; 
}
td{
    padding-top: 10px;
}
.td1{
    width:60px;
    height:10px;
	font-size: 16px;
	text-align: right;
	}
.td2{
    width:520px;
}
.td2plus{
    width:520px;
    height:160px;
}
input{
    border-radius:4px;
    margin-left:10px;
	border: 0px solid #cccccc;
	width: 320px;
	height: 35px;
	background-color:#E8EAED;
}
.td2s input{
    border-radius:4px;
    margin-left:10px;
    border: 1px solid #cccccc;
	width: 50px;
	height: 35px;
}
.td2s input[name="gender"]{
	width: 0px;
	height: 0px;
}
input[name="submit"]{
   width:95px;
   height:40px;
   background-color:#4388F0;
   color:white;
}
input[name="replacehdImg"]{
   color:red;
}
.td3 img{  
   border:1px solid gray; 
   border-radius:50%;
   overflow:hidden;
}
/* .td3 input[name="replacehdImg"]{
   width:60px;
   height:20px;
   background-color:white;
 } */
 .td3 input[name="profilehead"]{
   width:150px;
   height:25px;
   background-color:white;
 }
</style>  
<script type="text/javascript">
  var formObj = {
   updateUserInfo : function(){
	   var msg = "${successMsg}";
	   if(msg =="信息已更新！"){
		   alert(msg);
	   }  
	},
  
  }; 
   
  /* $.ajax({
	   type : "post",
	   url : "user/updateUserInfo.do",
	   data : {
		   var successMsg = "${successMsg}";
		   var errorMsg ="${errorMsg}";
	   },
	   async : true, //异步刷新
	   dataType: "text", //返回数据类型
	   success: function("2"){
		   alert("信息已更新！");
	   },
	   error : function(errorMsg){
		  alert(errorMsg);
		},
 });  */
    //文档就绪事件
    /* $(function(){
    	$("#f").submit(function(){
    		window.setInterval(function(){    			  			 
    				//启动一个周期性计时器
    				 var inter=window.clearInterval(inter);
    				//获取ajax请求，获取上传进度
    				var url="user/updateUserImgInfo.do";
    				$.get(url,function(result){
    					$("#in_div").width(result);
    					if(result=="100.0%"){
    						window.clearInterval(inter);
    					}
    				});    			 
    		 },200);
    	});    	
    }); */
    //图片回显
    function changImg(e){  
    	for (var i = 0; i < e.target.files.length; i++) {  
            var file = e.target.files.item(i);  
            if (!(/^image\/.*$/i.test(file.type))) {  
                continue; //不是图片 就跳出这一次循环  
            }  
            //实例化FileReader API  
            var freader = new FileReader();  
            freader.readAsDataURL(file);  
             freader.onload = function(e) {  
            	$('#myhead').attr("src",e.target.result); 
             };
        }
    }

/*  基于js实现周期性计时器setInterval(函数，时间)---每隔时间调用一次函数 */
 /*   var updateTime;
 var inter=window.setInterval(function(){
	 if(){
		 window.clearInterval(inter);
	 }
 },1000); */
 
</script> 
</head>
<body>
   <!-- 头像  用户名 昵称 性别 年龄 手机 邮箱 影币 简介  -->
   <form id="f" action="user/updateUserInfo.do" method="post"  enctype="multipart/form-data"
      onSubmit="return formObj.updateUserInfo()">
     <input type="hidden" name="upType" value="userUpdate"/>
     <input type="hidden" name="id" value="${loginUser.id }"/>
   <h4>基本信息</h4><hr>
   <table border="0">
     <tr>
       <td class="td1">用户名</td>
       <td class="td2"><input type="text" name="username" value="${loginUser.username }" disabled="true"/></td>  
       <td class="td3" rowspan="3" align="center">
          <img id="myhead"  src="film/getFileImg.do?imgurl=${loginUser.profilehead}"  alt="暂无头像"  width="100" height="100"><br/>
       <%-- <c:if test="${loginUser.profilhead != null}"><img src="film/getFileImg.do?imgurl=${loginUser.profilhead}" alt="头像" width="100" height="100"></c:if> 
       <c:if test="${loginUser.profilhead == null}"><img src="static/img/default_head.jpg" alt="头像" width="100" height="100"></c:if>     --%>     
                     <!-- <a style="font-size:12px;color:#E05A5A;">修改头像</a> --><input type="file" name="profilehead"  onchange="changImg(event)" accept="image/*"/>
       </td>
     </tr>
     <tr>
       <td class="td1">昵称</td>
       <td class="td2"><input type="text" name="nickname" value="${loginUser.nickname}" /></td>
     </tr>
     <tr>
       <td class="td1">性别</td>
       <td class="td2s">
          <c:if test="${loginUser.gender==null}">
          &nbsp;&nbsp;&nbsp;&nbsp;男
          <input type="radio" name="gender" value="male">
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;女
           <input type="radio" name="gender" value="female">
          </c:if>
          <c:if test="${loginUser.gender eq 'male'}">
          &nbsp;&nbsp;&nbsp;&nbsp;男
          <input type="radio" name="gender" value="male" checked="checked">
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;女
           <input type="radio" name="gender" value="female">
          </c:if>
           <c:if test="${loginUser.gender eq 'female'}">
             &nbsp;&nbsp;&nbsp;&nbsp;男
           <input type="radio" name="gender" value="male">
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;女
           <input type="radio" name="gender" value="female" checked="checked">
           </c:if>
        </td>  
      </tr>
     <tr>
       <td class="td1">年龄</td>
       <td class="td2"><input type="text" name="age" value="${loginUser.age }"/></td>
     </tr>
     <tr>
       <td class="td1">邮箱</td>
       <td class="td2"><input type="text" name="email" value="${loginUser.email }"/></td>
     </tr>
     <tr>
       <td class="td1">手机</td>
       <td class="td2"><input type="text" name="tell" value="${loginUser.tell }"/></td>
     </tr>
     <tr>
       <td class="td1">影币</td>
       <td class="td2"><input type="text" name="wollet" value="${loginUser.wallet }" disabled="true"/></td>
     </tr>
     <tr>
       <td class="td1">简介</td>
       <td class="td2plus"><textarea rows="6" cols="60" name="profile" placeholder="写下你想说的话...">${loginUser.profile}</textarea>
     </tr>
     <tr>
       <td colspan="2" align="center"><input type="submit" name="submit" value="确认提交"/></td>
     </tr>
   </table>
  </form>   
 </body>
</html>
