<%@ page language="java" import="java.util.*,com.lyf.filmbase.entity.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html>
<html>
    <head>
      <title>fileBase后台登录页面</title>
	  <meta http-equiv="content-type" content="text/html;charset=utf-8">
	  <!-- login-css 
	  <link href="static/source/css/login.css" rel='stylesheet' type='text/css' />
      <script src="static/plugins/jquery/jquery-2.1.4.min.js"></script>
      <script src="static/plugins/layer/layer.js"></script>
  -->
	  <link rel="stylesheet" href="static/source/css/admin_login.css">
    </head>
	<body>
	   <h1>欢迎登录FileBase后台管理系统</h1>
	   <form action="#" method="post">
	      <table>
	         <tr>
	           <td class="td_txt">用户名：</td>
	           <td><input type="text" name="username"></td>
	         </tr>
	         <tr>
	           <td class="td_txt">密码：</td>
	           <td><input type="text" name="password"></td>
	         </tr>
	          <tr>
	           <td class="td_txt">验证码：</td>
	           <td><input type="text" name="valistr">
	               <img alt="验证图片" src="static/source/img/login_yzm.jpg"></td>
	         </tr>
	         <tr>
	           <td class="td_sub" colspan="2" class="tds">
						<input type="submit" value="登录"/>
					</td>
	         </tr>
	      </table>
	   </form>
<script>
  function checkLoginForm(){
    var username = $('#username').val();
    var password = $('#password').val();
    if(isNull(username) && isNull(password)){
      $('#submit').attr('value','请输入账号和密码!!!').css('background','red');
      return false;
    }
    if(isNull(username)){
      $('#submit').attr('value','请输入账号!!!').css('background','red');
      return false;
    }
    if(isNull(password)){
      $('#submit').attr('value','请输入密码!!!').css('background','red');
      return false;
    }
    else{
      $('#submit').attr('value','Logining~');
      return true;
    }
  }

  function isNull(input){
    if(input == null || input == '' || input == undefined){
      return true;
    }
    else{
      return false;
    }
  }
</script>
</body>
</html>
	</body>
</html>