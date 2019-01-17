<%@ page language="java" import="java.util.*,com.lyf.filmbase.entity.*" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>FilmBase | 账号安全页面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
    <script type="text/javascript" src="static/js/jquery-1.4.2.js"></script>
<style>
body{
	font-family: "微软雅黑";
}
form{
	width: 850px;
	height:500px;
	margin: 0 auto;
    /* background-color:yellow; */ 
}
h4{
	width: 300px;
	color: #990000;
    margin: 20px 0 0 30px; 
}
table{
    margin-top:40px;
	margin-left:60px;
	width:650px;
	height:150px; 
}	
td{
    padding-top: 10px;
}
.td1{
    width:40px;
    height:10px;
	font-size: 16px;
	text-align: right;
	}
.td2{
    width:250px;
}
input{
    border-radius:4px;
    margin-left:10px;
	border: 1px solid #cccccc;
	width: 320px;
	height: 35px;
}
input[name="submit"]{
   margin-left:170px;
   width:95px;
   height:40px;
   background-color:#4388F0;
   color:white;
}
</style>
<script type="text/javascript">
  	   
 function checkPsw(name,value){
	    var flag = true;
	    flag = this.checkNull("passwordOld","请输入原密码！") && flag;
	    flag = this.checkNull("password","请输入新密码！") && flag;
	    flag = this.checkNull("passwordNew2","请输入确认密码！") && flag;
	    flag = this.checkPswEq("password","确认密码错误!") && flag;
	    return flag;
	    };
	    
	  function checkNull(name,msg){
		  var psw = $("input[name='"+name+"']").val();
		   if($.trim(psw) ==""){
			   this.setMsg(name,msg);
			   return false;
		   }else{
			   this.setMsg(name,"");
			   return true;
		   }
		};
	   function setMsg(name,msg){
		   $("input[name='"+name+"']").nextAll("span").html(msg).css("color","red");
	   };
	  function checkPswEq(name,msg){
		   var passwordNew = $("input[name='" + name + "']").val();
		   var passwordNew2 = $("input[name='"+name+"New2']").val();
		   if ($.trim(passwordNew) != "" && $.trim(passwordNew2) != "") {
				if (passwordNew != passwordNew2) { 
		          setMsg(name+"New2",msg);
			      return false;
		       }else{
			      setMsg(name+"New2","");
			      return true;
		       }
		   }
	  } 
	/* $.ajax({
	   type : "post",
	   url : "passwordcheck.do",
	   data : {
		   "username" : username,
		   "password" : password,
	   },
	   async : true, //异步刷新
	   dataType: "text", //返回数据类型
	   success: function(data){
		   
	   },
	   error : function(data){
		  alert("出错"+data);
		  
	   },
   }); */
	 
      $(document).ready(function(){
          var msg = ${pswSucMsg};
          if(msg !=null){
	          /* if(msg == '1'){
	        	  alert("密码输入错误！");
	          }else */ 
	          if(msg =='2'){
	        	 alert("密码修改成功！请重新登录~");
	        	 parent.location.href="user/login.jsp";
	          }
          }
     }); 
     
</script>   
</head>
<body> 
         <!-- 修改密码  -->
  <form action="user/updateUserPsw.do" onSubmit="return checkPsw()">
    <input type="hidden" name="id" value="${loginUser.id }"/>
   <h4>修改密码</h4><hr>
   <table border="0">
     <tr>
       <td class="td1">原密码</td>
       <td class="td2"><input type="password" name="passwordOld"/><span style="color:red;font-family:STkaiti;">${updateUserPswMsg}</span></td>
     </tr>
     <tr>
       <td class="td1">新密码</td>
       <td class="td2"><input type="password" name="password"/><span></span></td>
     </tr>
     <tr>
       <td class="td1">确认密码</td>
       <td class="td2"><input type="password" name="passwordNew2"/><span></span></td> 
      </tr> 
     <tr>
       <td class="td2" colspan="2"><input type="submit" name="submit" value="确认修改"/></td>
     </tr>
     </table>
     </form>
</body>
</html>